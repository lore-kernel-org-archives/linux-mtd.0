Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MC6n5-0003JI-6M
	for linux-mtd@lists.infradead.org; Thu, 04 Jun 2009 06:51:13 +0000
Date: Thu, 4 Jun 2009 08:50:57 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: joy c <cjjoy1980@gmail.com>
Subject: Re: jffs2 debug messages
In-Reply-To: <442a305e0906030924n72d99b9ao97b64d80e2667763@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0906040850170.12786@lnxricardw.se.axis.com>
References: <442a305e0906030924n72d99b9ao97b64d80e2667763@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 3 Jun 2009, joy c wrote:

> HI all,
>
> While trying to mount my mtd partition I am getting the below messages.
> Once mounted everything seems to be working fine but not sure what these
> messages mean.  Are these just the debug messages which I can
> ignore,or something
> which I need to look into.
>
> I am using kernel 2.6.14 and Nand Flash.
>
> mount -t jffs2 /dev/mtdblock10 /mnt/flash
>
> jffs2: Erase block size too small (128KiB). Using virtual blocks size
> (256KiB) instead
> cpu0: jiffies: 4294953713, hrtime: 16378092427, 503 ms without calling
> schedule() since scheduler requested
> Call trace:
> [c001fbfc] scheduler_tick+0x15c/0x4cc
> [c0032108] update_process_times+0x88/0x15c
> [c0005180] timer_interrupt+0x180/0x2b8
> [c0002ef0] ret_from_except+0x0/0x18
> [c0198904] nand_read_buf+0x1c/0x34

To me it looks like something is taking an inordinate amount of time to=20
execute in nand_read_buf. Looks fishy I would say.

> [c018a1fc] part_read_oob+0xbc/0xe0
> [c0129b50] jffs2_check_nand_cleanmarker+0xa8/0x1a0
> [c0120d6c] jffs2_scan_medium+0x37c/0x1970
> [c01249d0] jffs2_do_mount_fs+0x1c8/0x76c
> [c012740c] jffs2_do_fill_super+0x168/0x2e0
> [c0127938] jffs2_get_sb_mtd+0xfc/0x1cc
> [c0127bc0] jffs2_get_sb+0x148/0x1e8
> [c0081e5c] do_kern_mount+0x5c/0x128
> [c009b3e4] do_mount+0x458/0x6b8
> [c009bae0] sys_mount+0xd4/0x124
> cpu0: jiffies: 4294953714, hrtime: 16429105507, 765 ms between
> scheduler_tick() calls
> cpu0: jiffies: 4294954050, hrtime: 16467914765, 1851 ms since
> scheduler requested

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
