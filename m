Received: from ti-out-0910.google.com ([209.85.142.187])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M5czT-0003aN-VA
	for linux-mtd@lists.infradead.org; Sun, 17 May 2009 09:49:15 +0000
Received: by ti-out-0910.google.com with SMTP id b8so324389tic.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 May 2009 02:49:03 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 17 May 2009 15:19:03 +0530
Message-ID: <a29be8140905170249v18e4f13eg5430f3e44280fe30@mail.gmail.com>
Subject: linux kernel can not find m25p80 mtdparts
From: Bharat Bhushan <bharat.76@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Everyone,

I am naive as far as linux kernel interface with MTD devices. I face
difficulty on MIPS based board having M25P80. Bootloader is u-boot.
When linux boots, I pass the command-line argument as:

Kernel command line:
mtdpart=m25p80:256k(boot),64k(boot_config),64k(board_config),2048k(kernel),4096k(filesystem)
root=/dev/mtdpart rootfstype=squashfs,yaffg
And Error I get is :

    VFS: Cannot open root device "mtdpart" or unknown-block(0,0)
    Please append a correct "root=" boot option; here are the
available partitions:
    Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)

Some questions in above command-line I have:

1. Does kernel recognize m25p80 by same name. How can I check where it
is mapped in kernel. Then only mtdpart makes sense: I think so? I
expected it to be at 0xbf040000. I do not know in kernel where to find
this mapping. I tried drivers/mtd/ for chips specifics, but could not
make out much.
2. When cmdline say root=/dev/mtdpart, do `mtdpart' should be defined
in kernel somewhere?

Can someone please explain, which all part of kernel I need to look into.

Regards,
Bharat
