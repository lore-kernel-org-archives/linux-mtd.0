Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eS2J-000368-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 03:40:16 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: "Alex Samoutin" <samoutin@hotbox.ru>,
	<linux-mtd@lists.infradead.org>
Subject: Re: NAND subsector writing problem
Date: Fri, 31 Jan 2003 17:01:05 +1300
References: <007801c2c7fc$5834da60$1a00a8c0@itc.intrinsyc.com> <20030130210325.0F2BB405E@tiger.actrix.co.nz> <004701c2c8ce$107caea0$1a00a8c0@itc.intrinsyc.com>
In-Reply-To: <004701c2c8ce$107caea0$1a00a8c0@itc.intrinsyc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20030131041111.5DE53151BD@dragon.actrix.co.nz>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Alex

I assume you're using the TC58128AFT since there is no TC5818AFT.

I don't spend time in the mtd, only in YAFFS, but I can think of a few things 
to look at. No doubt other people can think of more things...

When I first looked at the NAND mtd a long time back I noticed that the 
verify did not always work properly on NAND, giving false errors. This I 
tracked down to a difference between NOR and NAND.  In NOR, a write fails if 
try to overwrite a zero with a one bit. In NAND, the operation does not fail 
even though the bit does not change.

ie.

Say you start with 12FF56.
If you write FF34FF
You now have 123456.
The NAND part will say the write was OK.
The verify might fail since FF34FF != 123456.

Thus, problems might arise if the page is not clean.

I've never used nandtest.c, so I am unsure as to whether it is expected to 
work with verify enabled.

It might be worth double-checking your chip commanding/handling (especially 
the address handling) to ensure that you're doing the right things for this 
part. It seems possible to me that there might be some address aliasing issue 
going on.

Perhaps you can hack nandtest to check that the page is empty before you 
write to it, then read it back in the case of a failure and look at what you 
got back.

I'm sorry I can't speak to the JFFS2 questions  as I only understand the 
YAFFS file system.

-- Charles
