Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gMLl-0005YY-I8
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jul 2003 11:32:29 +0100
Mime-Version: 1.0
Message-Id: <a05200f06bb48072d78a5@[130.161.115.44]>
In-Reply-To: <20030726002315.8FA634083@blood.actrix.co.nz>
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>
 <20030726002315.8FA634083@blood.actrix.co.nz>
Date: Sat, 26 Jul 2003 12:32:19 +0200
To: manningc2@actrix.gen.nz
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
cc: linux-mtd@lists.infradead.org
Subject: Re: Handling multiple NAND chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At 12:27 +1200 26-07-2003, Charles Manning wrote:
>One thing to watch out for: some NAND chips have very high pin capacitance
>and a fan-out of 8 might get a bit freaky.

The Toshiba TH58100s I'm using have 20pf pin capacitance. On a fully 
populated board (8 chips) this increases the access time by 5-10ns. 
I'm not too worried about this -- the main purpose for this design is 
solid state data recording, which is already limited by program/erase 
time.

Thanks for reminding me, though; I need to increase the processor's 
access time to these memory regions.

>You'll need quite a bit of RAM for holding various data structures. :-).

I have 160MB, will that do for a 1GB yaffs mount ?

By the way, does yaffs have inherent limitations wrt file system size 
I should worry about ?

JDB
-- 
LART. 250 MIPS under one Watt. Free hardware design files.
http://www.lart.tudelft.nl/
