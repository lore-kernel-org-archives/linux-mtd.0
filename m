Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vnuA-0004v5-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 20:41:42 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vnu9-0004uz-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 20:41:41 +0000
Message-ID: <384EC2D3.C8106AAD@danielind.com>
Date: Wed, 08 Dec 1999 14:42:59 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: [Fwd: Power Down]
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Bob Canup wrote:
> 
> Watch dogs are generally there to catch the problem of a run-away
> machine - this ought to be a very rare occurrence.
> 
> According to Vipin's statistics about 1 in 250 random power failures
> during writes to a DOC2000...

Actually it was a m-systems IDE2000 (1.3") IDE flash hard drive. NOT the
DOC2000! Just making that clear.


>...results in a bad sector on the device. Since
> you are required to run the chip in RW mode the only way I see to avoid
> the problem is a UPS on the front end - with signaling to indicate power
> failure so that an ordered shutdown could occur.
> 
> As far as the problem of a bad sector which he discussed I have not seen
> any solutions other than the erase and start over one he originally came
> up with - which for the reasons he discussed - is unacceptable.
> 
> The first step toward solving a problem is understanding exactly what
> the problem is. My theory is that if you interrupt a sector write while
> it is in progress the data and the error checking code don't match -
> thus you get a bad sector. Any other theories?
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
