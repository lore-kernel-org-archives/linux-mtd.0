Received: from jerusalem.magic.fr ([195.154.101.82])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CGq3-0003VJ-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 09:26:19 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by jerusalem.magic.fr (8.9.0/8.9.0) with ESMTP id KAA24372
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 10:31:50 +0200 (CEST)
Message-ID: <3B2F0D7C.AEB02B3E@inventel.fr>
Date: Tue, 19 Jun 2001 10:29:48 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: use of low level driver
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

I am a little confused about the use of low level functions provided by
different drivers.
I got the mtd stuff work on my board with amd std non cfi flashes. In
amd_flash.c

int __init amd_flash_init(void)
{
	register_mtd_chip_driver(&amd_flash_chipdrv);
	return 0;
}

allows me to call : do_map_probe("amd_flash",...)

But, if I want to call do_map_probe("cfi" or "cfi_intel",...), I need to
have registered the corresponding mtd chip driver. But when it is part
of the kernel (not a module), "mod_init_t cfi_intelext_init(void)" is
not called in kernel initialisation ? (correct?)

Is it correct to replace it with

int __init cfi_intelext_init(void)
{
	register_mtd_chip_driver(&cfi_intelext_chipdrv);
	return 0;
}

and
mod_init_t cfi_probe_init(void) by
int __init cfi_probe_init(void)


so that I will be able to call do_map_probe("cfi_intel" or "cfi",...) in
kernel initialisation ?

otherwise, what happend is that kmod is looking for module in the
filesystem ; but at that point, no root fs is mounted.

Xavier
