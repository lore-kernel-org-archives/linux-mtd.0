Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1992pa-0002a1-8R
	for <linux-mtd@lists.infradead.org>; Fri, 25 Apr 2003 14:01:34 +0100
Date: Fri, 25 Apr 2003 15:01:34 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Alex Samoutin <samoutin@hotbox.ru>
Message-ID: <20030425130134.GC27144@wohnheim.fh-wedel.de>
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
	<20030423204440.258661528E@desire.actrix.co.nz>
	<000d01c30a8e$ebd08150$1a00a8c0@itc.intrinsyc.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000d01c30a8e$ebd08150$1a00a8c0@itc.intrinsyc.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 24 April 2003 11:25:43 -0700, Alex Samoutin wrote:
> 
> It is nothing wrong with JFFS2 itself. It was a low level problem.  For
> example we have empty flash with 100 erase blocks. We wrote File1 and
> occupied blocks 0-39. Then we deleted this file and start writing File2.
> This new file will be written to blocks 40-79. And now we have two processes
> working.. Process one (GC) is erasing block 0-39, process 2 is writing new
> file to blocks 40-79. Both of them are working at the same time (at least in
> case of JFFS2). I sow it. From blocks point of view all Ok. One set of
> blocks is erasing and absolutely different set of block is writing. But we
> have only one NAND chip. When we want to write something to NAND we have to
> send writing command, then provide some command parameters (like address)
> and then send data itself. And if locking mechanism doesn't work properly we
> can get situation when , for example, one process send command to write and
> then second process start sending something to chip which will be
> interpreted as address for writing but this address will be incorrect, of
> cause. As I mentioned NAND driver (nand.c) has lock mechanism to prevent
> this situation. But it doesn't work in my case. I don't know why - the code
> look Ok. A added some additional locks and it solved this problem.

Ah, sorry for me misinterpreting you original post. I thought, you had
found a problem in yaffs.

Do you have a patch for this? Even if it is ugly and slow, correct
code is better than broken one.

Jörn

-- 
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens
