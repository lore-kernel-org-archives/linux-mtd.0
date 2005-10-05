Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EN7gp-0008GT-T4
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2005 07:46:19 -0400
Received: from dslc-082-082-156-022.pools.arcor-ip.net ([82.82.156.22]:41207
	helo=zappa) by mail.ku-gbr.de with esmtpa (Exim 4.50 #1 (Debian))
	id 1EN7ia-00028s-60
	for <linux-mtd@lists.infradead.org>; Wed, 05 Oct 2005 13:45:52 +0200
Received: from konsti by zappa with local (Exim 3.36 #1 (Debian))
	id 1EN7hv-00087J-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Oct 2005 13:45:11 +0200
Date: Wed, 5 Oct 2005 13:45:11 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20051005114511.GB31190@zappa>
References: <F92C2EFE7C3BA745855BF7036E1F3F9A01376415@NNSMSX401>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F92C2EFE7C3BA745855BF7036E1F3F9A01376415@NNSMSX401>
Subject: Re: XIP fails on kernels  2.6.12 and higher
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Korolev, Alexey <alexey.korolev@intel.com> [Thu, Sep 22, 2005 at 08:08:39PM +0400]:

> Linux version 2.6.13.2 (root@localhost.localdomain) (gcc version 3.4.3)
> #7 Thu S
> ep 22 19:51:25 MSD 2005
> CPU: XScale-PXA270 [69054114] revision 4 (ARMv5TE)
> Machine: Intel HCDDBBVA0 Development Platform (aka Mainstone)
> Memory policy: ECC disabled, Data cache writeback
> Run Mode clock: 208.00MHz (*16)
> Turbo Mode clock: 416.00MHz (*2.0, active)
> Memory clock: 104.00MHz (/2)
> System bus clock: 104.00MHz
> CPU0: D VIVT undefined 5 cache
> CPU0: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
> CPU0: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
> Built 1 zonelists
> Kernel command line: console=ttyS1,115200 mem=64M
> mtdparts=phys_mapped_flash:512
> k(blob)ro,2m(kernel)ro,16m(root),10m(vol1) rootfstype=jffs2 root=31:02
> ro
> PID hash table entries: 512 (order: 9, 8192 bytes)
> Console: colour dummy device 80x30
> Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
> Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
> Unhandled fault: imprecise external abort (0x406) at 0x00000000


My 2.6.13 breaks near the same location:

Linux version 2.6.13-imx1 (konsti@synertronixx3) (gcc version 3.3.5) #58 Wed Oct 5 11:38:26 CEST 2005
CPU: ARM920Tid(wb) [41129200] revision 0 (ARMv4T)
Machine: synertronixx scb9328
Memory policy: ECC disabled, Data cache writeback
CPU0: D VIVT write-back cache
CPU0: I cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
CPU0: D cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
Built 1 zonelists
Kernel command line: console=ttySMX0,115200n8 root=/dev/mtdblock3 rootfstype=jffs2 mtdparts=scb9328_flash:128k(U-boot)ro,128k(U-boot_env),2m(kernel),5m(root),-(fs) board=evb9328
evb9328 board found
scb9328_init_irq
PID hash table entries: 128 (order: 7, 2048 bytes)
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)

K
