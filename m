Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vS0B-0003x0-00
	for mtd-list@infradead.org; Tue, 07 Dec 1999 21:18:27 +0000
Received: from [209.184.180.169] (helo=bob.faxtel.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vS0A-0003wu-00
	for mtd@imladris.mvhi.com; Tue, 07 Dec 1999 21:18:26 +0000
Message-ID: <384D79DC.8D142064@go2fax.com>
Date: Tue, 07 Dec 1999 15:19:24 -0600
From: Bob Canup <rcanup@go2fax.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: Re:Power Down
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Watch dogs are generally there to catch the problem of a run-away
machine - this ought to be a very rare occurrence.

According to Vipin's statistics about 1 in 250 random power failures
during writes to a DOC2000 results in a bad sector on the device. Since
you are required to run the chip in RW mode the only way I see to avoid
the problem is a UPS on the front end - with signaling to indicate power
failure so that an ordered shutdown could occur.

As far as the problem of a bad sector which he discussed I have not seen
any solutions other than the erase and start over one he originally came
up with - which for the reasons he discussed - is unacceptable.

The first step toward solving a problem is understanding exactly what
the problem is. My theory is that if you interrupt a sector write while
it is in progress the data and the error checking code don't match -
thus you get a bad sector. Any other theories?





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
