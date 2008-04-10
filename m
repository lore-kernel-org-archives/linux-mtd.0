Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JjpeR-0000aW-Ve
	for linux-mtd@lists.infradead.org; Thu, 10 Apr 2008 05:48:48 +0000
Date: Thu, 10 Apr 2008 07:48:29 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: bhsong@augustatek.com
Subject: Re: bug report about nand flash id table and the way to identify chips
In-Reply-To: <42335.10.1.16.2.1207804422.squirrel@mailbj.augustatek.com>
Message-ID: <alpine.LFD.1.10.0804100741460.3225@apollo.tec.linutronix.de>
References: <20080409194417.1EA9872AED@usa.augustatek.com>
	<001501c89ac6$019bd0d0$7d10010a@desktopsz32>
	<42335.10.1.16.2.1207804422.squirrel@mailbj.augustatek.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: cfan@augustatek.com, linux-mtd@lists.infradead.org,
	chenjiang@augustatek.com, pfeng@augustatek.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 10 Apr 2008, bhsong@augustatek.com wrote:
> Dear all&Thomas,
> There is a bug in the way to identify nand chips.
> At the array nand_flash_ids[]  of nand_ids.c, there is a line like that:
>  {"NAND 4MiB 3,3V 8-bit",        0xd5, 512, 4, 0x2000, 0},

and the line above is guarded by:

#ifdef CONFIG_MTD_NAND_MUSEUM_IDS

which is default off.

>From Kconfig:

config MTD_NAND_MUSEUM_IDS
        bool "Enable chip ids for obsolete ancient NAND devices"
        depends on MTD_NAND
        default n
        help
          Enable this option only when your board has first generation
          NAND chips (page size 256 byte, erase size 4-8KiB). The IDs
          of these chips were reused by later, larger chips.            

So there is no bug at all.

Thanks,
	tglx
