Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 199MlU-0005Pw-4F
	for <linux-mtd@lists.infradead.org>; Sat, 26 Apr 2003 11:18:40 +0100
Date: Sat, 26 Apr 2003 12:18:40 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Alex Samoutin <samoutin@hotbox.ru>
Message-ID: <20030426101840.GA31391@wohnheim.fh-wedel.de>
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
	<20030423204440.258661528E@desire.actrix.co.nz>
	<000d01c30a8e$ebd08150$1a00a8c0@itc.intrinsyc.com>
	<20030425130134.GC27144@wohnheim.fh-wedel.de>
	<000701c30b79$539ecbd0$1a00a8c0@itc.intrinsyc.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000701c30b79$539ecbd0$1a00a8c0@itc.intrinsyc.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: David Woodhouse <dwmw2@infradead.org>
cc: Thomas Gleixner <tglx@linutronix.de>
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

On Fri, 25 April 2003 15:23:36 -0700, Alex Samoutin wrote:
>
> This is diff file for drivers/mtd/nand.c

Thanks!

> (I made to many changes to create a patch)

Does that mean you cannot "diff -u"? I looked briefly at checking your
changes in, but the non-uniform format means a lot more work.

David, Thomas, any objections against Alex' changes?

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
