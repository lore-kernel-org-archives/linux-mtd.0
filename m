Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vnsB-0004uE-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 20:39:39 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vnsA-0004u8-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 20:39:38 +0000
Message-ID: <384EC258.7D6900C1@danielind.com>
Date: Wed, 08 Dec 1999 14:40:56 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: [Fwd: Data Reliability]
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Bob Canup wrote:
> 
> Is Vipin correct that there is a problem if there is a power loss when
> writing to flash in embedded systems? Yes, no question.
> 
> There are 2 main ways of handling any problem. 1. Fix the problem once
> it occurs. 2. Avoid the problem in the first place.
> 
> I have already given two ways to avoid the problem: use the flash in
> Read Only mode, or have a power supply which signals impending power
> loss and holds itself up long enough to allow an ordered shut down.
> 
> It has been my experience that it is generally better to avoid problems
> than to attempt to fix them after they have occurred. Sometimes this is
> not possible. For example: hard drives have to have ECC built into them
> because it is virtually impossible to keep from having read errors.
> 
> I don't see any practical ways of fixing the problem of trashed flash
> chips once it occurs. Does anyone else have any other suggestions as to
> how to either avoid the problem or fix it once it happens?

Why are you giving up even before we are getting started on any possible
solutions?  There are solutions. I'm sure that they will come out here.
I would like people who have experience designing the MTD software
(David?, others?) to chip in to this discussion.

> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
