Received: from smtp.hotbox.ru ([80.68.244.50])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19AurU-0003P6-Eb
	for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2003 17:55:16 +0100
Message-ID: <000d01c30f39$3a05d880$1a00a8c0@itc.intrinsyc.com>
From: "Alex Samoutin" <samoutin@hotbox.ru>
To: "Thayne Harbaugh" <tharbaugh@lnxi.com>
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
	<20030423204440.258661528E@desire.actrix.co.nz>
	<000d01c30a8e$ebd08150$1a00a8c0@itc.intrinsyc.com>
	<20030425130134.GC27144@wohnheim.fh-wedel.de>
	<000701c30b79$539ecbd0$1a00a8c0@itc.intrinsyc.com>
	<1051312243.1172.388.camel@tubarao>
Date: Wed, 30 Apr 2003 09:54:48 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1251"
Content-Transfer-Encoding: 8bit
cc: tglx@linutronix.de
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

Hi Thayne,



>I'm jumping in because I have some chips that appear to be broken - they

>occasionally drop operations (erase/write)



>  When a command is

>"dropped" it seems to always succeed when sent a second time (don't have

>any examples that failed on the second try).  I'm interested because

>your situation seems to be related.  Is the problem that the chip

>sometimes ignores a command?  Does your retry fix things?





Yes I had absolutely the same problem. Some times first write command was
ignored, but second always successful. However I have no problem with erase
operations, only write some times was ignored.



(For Thomas) It’s not a bad H/W or incorrect timing. I’ve played with timing
and result was the same. Also I have 5 boards with Toshiba NAND chip and 2
of them are working fine without retry, but other 3 need retry for normal
operation.



Alex.
