Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCFdt-0004uM-RB
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 06:55:35 -0400
Date: Tue, 28 Sep 2004 11:55:23 +0100
From: Ben Dooks <ben@fluff.org.uk>
To: "lp4u@inwind.it" <lp4u@inwind.it>
Message-ID: <20040928105523.GC22627@home.fluff.org>
References: <I4QXWY$DC028C17BCE4F7375CD8E760DCF56467@libero.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <I4QXWY$DC028C17BCE4F7375CD8E760DCF56467@libero.it>
Sender: Ben Dooks <ben@fluff.org>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Nand detect
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 28, 2004 at 12:17:22PM +0200, lp4u@inwind.it wrote:
> Hi,
> 
> I've a s3c24210 board with BAST architecture, with 2 NAND on board.
> I've compiling the kernel 2.6.9-rc2 after patched it with:
> - patch-2.6.9-rc2-bk11
> - dm9k-rc2.patch
> - patchin (mtd 2004/09/19)
> - nand_multi1.diff

the next release should be in mtd, and we will be able to do
away with the nand_multi1.diff

[snip] 

> Bad eraseblock 3946 at 0x03da8000
> No NAND device found!!!
> s3c2410-nand: registered device sets:
> s3c2410-nand: set 0, SmartMedia:error 1 

> s3c2410-nand: set 1, chip0:ok:
> Creating 3 MTD partitions on "NAND 64MiB 3,3V 8-bit":
> 0x00000000-0x00004000 : "Boot Agent"
> mtd: Giving out device 0 to Boot Agent
> 0x00004000-0x00400000 : "/boot"
> mtd: Giving out device 1 to /boot
> 0x00400000-0x04000000 : "user"
> mtd: Giving out device 2 to user
> s3c2410-nand: set 2, chip1:ok:
> Creating 3 MTD partitions on "NAND 64MiB 3,3V 8-bit":
> 0x00000000-0x00004000 : "Boot Agent"
> mtd: Giving out device 3 to Boot Agent
> 0x00004000-0x00400000 : "/boot" 

> mtd: Giving out device 4 to /boot
> 0x00400000-0x04000000 : "user"
> mtd: Giving out device 5 to user
> s3c2410-nand: set 3, chip2:error 1
> 
> I don't get work with the NAND, why?

> MTD detect 5 devices, I've only 2 NAND. Why, occurs that?

each mtd device node is 1 partition, not one chip. 

> The proc/ is empty, there aren't device, why?

/proc is for information, not device nodes.

> Must I work with /dev/mtdN or /dev/mtdblockN?

/dev/mtdX and /dev/mtdblockN are the proper devices to
use for accessing the NAND partitions

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
