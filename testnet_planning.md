# **Testnet Planning**

## **Disclaimer**

Everything is subject to change and as close as possible to the realities of testnets that take place in various projects, so at this stage you will learn many useful things in practice**.** Pay attention to the discord validator announcement channel for announcements. We are testing open source beta software. Expect something to break. If the documentation is not enough or you find some kind of bug, make a PR.

## **Overview**

- 3 Phases
- Governance proposals
    - Enable Transfers
- Rewards: `To keep the competitive process going, we see the validators with the most points and they will be rewarded`
- Schedule: `02.05.2023 - 19.05.2023`
- For the Genesis and Celebrate sections please sign a transaction for each of the tasks and provide the txHash in a PR.

## **Phase - 1: Start chain (max 30 points)**

- GenTx Validator Address Submission : `02.05.2023 - 04.05.2023 13:00 UTC`. Up to `70% of the flow`  will be accepted.

 `25 Points = 25 000 atom for successful wallet submissions.`

- Network start time:  `05.09.2023 15:30 UTC`

`20 Points = 20 000 atom for set up post genesis validators.`

- Provide peer

`5 points =  5000 atom for everyone who provides a peer.`

---

## **Phase - 2: Governance (max 30 points)**

Lead validator team will create a governance proposal on `10.05.2023 13:00 UTC`, to update the transfer parameter. You will need to study the proposals, find the correct one and vote.

In order to find correct proposal you will need to run query command using your network client binary (`gaiad` in our case). Please issue following command `gaiad query gov proposals`, and find proposal with `title:` ”Vote for me friend”.

**New to governance module?** Read [this](https://docs.cosmos.network/main/modules/gov)

**Update Schedule:**

- Proposal: `Vote for me friend`
- Voting Period: `10.05.2023 13:00 UTC - 12.05.2023 13:00 UTC`

**What should validators do?**

- Review the parameter change proposal and cast your vote before voting period endtime.

`25 Points = 25 000 atom for successful vote.`

**Bonus challenge**

- Make a detailed thread on Twitter about incorrect props, what number you missed, what does it mean and make a PR to the appropriate directory. [Tweet directory](https://github.com/Distributed-Validators-Synctems/school-testnet-3/tree/master/tweet)

`5 points =  5000 atom for everyone who provides a PR url Twitter thread.`

---

## P**hase-3: Transactions (max 30 points)**

- Send 1atom to DVS validator

`5 points =  5000 atom for everyone who do this task.`

- Delegate some DVS to others and redelegate to DVS validator

`10 points =  10000 atom for everyone who do this task.`

- Claim reward \ commision and redelegate to DVS validator

`5 points =  5000 atom for everyone do this task.`

- Tweet url linked in a memo (Come up with something cool to say about DVS Validator School and experience in Testnet)

`5 points =  5000 atom for everyone who provides a peer.`

- Tweet url linked in a memo (Leave your detailed feedback in a thread (from 3 tweets) about the School of Validators. With mark @synctems @POSTHUMAN_DVS @vbloher. The review must be valid, not just praise. This will be used as a starting point for your twitter accounts and student feedback.)

`5 points =  5000 atom for everyone who do this task.`

📌 Participants need to raise a PR with the details onto `transactions` directory in this repo

- Time: `12.05.2023 - 15.05.2023` (Only the txs in this time period are considered to be valid)

---

## **Bonus Challenges**

- Uptime :
    - uptime >= 90%
    - 80% <= uptime >= 90%
    - 70% ≤ uptime ≥ 80%

`20 points =  20000 atom for everyone who have 90+% uptime`
`10 points =  10000 atom for everyone who have 80-90% uptime`
`5 points =  5000 atom for everyone who have 70-80% uptime`

- Never jailed validator :

`20 points =  20000 atom.`

- Top - 10 teams/individuals will receive points each for their contributions for the community. technical docs, helping/resolving community issues, etc.

`max 10 points =  10000 atom.`

- Send one transaction to two addresses at once and provide txHash

`max 5 points =  5000 atom.`

## **NOTE:**

Validator School is committed to building a strong community. Therefore, the testnet is built in such a way as to cover the most common tasks and situations that you will encounter as a validator.

In addition to this, in order to involve and encourage active members of the Validator School, those participants who score the most points will receive an additional delegation in the main network from DVS.

In addition to this, you will have passed the first testnet, which will be documented on github and twitter (provided that you complete all the testnet tasks) and this will give you a starting point in working with these services and simplify the development of your portfolio.
