Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vPjy-0003rP-00
	for mtd-list@infradead.org; Tue, 07 Dec 1999 18:53:34 +0000
Received: from [209.184.180.169] (helo=bob.faxtel.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vPjx-0003rJ-00
	for mtd@imladris.mvhi.com; Tue, 07 Dec 1999 18:53:33 +0000
Message-ID: <384D57E5.A687913@go2fax.com>
Date: Tue, 07 Dec 1999 12:54:29 -0600
From: Bob Canup <rcanup@go2fax.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: Data Reliability
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Is Vipin correct that there is a problem if there is a power loss when
writing to flash in embedded systems? Yes, no question.

There are 2 main ways of handling any problem. 1. Fix the problem once
it occurs. 2. Avoid the problem in the first place.

I have already given two ways to avoid the problem: use the flash in
Read Only mode, or have a power supply which signals impending power
loss and holds itself up long enough to allow an ordered shut down.

It has been my experience that it is generally better to avoid problems
than to attempt to fix them after they have occurred. Sometimes this is
not possible. For example: hard drives have to have ECC built into them
because it is virtually impossible to keep from having read errors.

I don't see any practical ways of fixing the problem of trashed flash
chips once it occurs. Does anyone else have any other suggestions as to
how to either avoid the problem or fix it once it happens?




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
