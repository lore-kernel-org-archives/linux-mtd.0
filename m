Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ApkoS-00061x-Nb
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2004 09:01:12 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HSR008PSD1EP1@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sun, 08 Feb 2004 10:00:51 +0100 (MET)
Date: Sun, 08 Feb 2004 09:58:58 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <200402080113.36039.joshua@joshuawise.com>
To: Joshua Wise <joshua@joshuawise.com>, linux-mtd@lists.infradead.org
Message-id: <200402080958.58584.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <200402080113.36039.joshua@joshuawise.com>
Subject: Re: JFFS2 NAND support - Mount failure on "good" filesystem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 08 February 2004 07:13, Joshua Wise wrote:
> Hi all,
>
> I am trying to get NAND flash working on the ipaq h1910.
>
> <7>jffs2_get_sb(): dev_name "/dev/mtdblock/1"
> <7>jffs2_get_sb(): path_lookup() returned 0, inode c9f411c0
> <7>jffs2_get_sb_mtd(): New superblock for device 1 ("h1910 NAND Flash")
> <7>JFFS2 using software ECC
> <7>Allocating readbuf of 16384 bytes
> <7>jffs2_scan_eraseblock(): Scanning block at 0x0
> <4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00000000, fail
> count:175 <5>JFFS2: Erase block at 0x00000000 is not formatted. It will be
> erased <7>jffs2_scan_eraseblock(): Scanning block at 0x4000
> <4>jffs2_check_nand_cleanmarker(): Block marked as failed at 00004000, fail
> count:0 <5>JFFS2: Erase block at 0x00004000 is not formatted. It will be

Seems like you managed to corrupt the OOB area, as all your blocks are marked 
as bad. Your programming algorithm has to take care of the OOB data !
There are some slightly outdated docs on linux-mtd.infradead.org

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
