Received: from co203.xi-lite.net ([149.6.83.203])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6MWh-0007wA-Pf
	for linux-mtd@lists.infradead.org; Tue, 19 May 2009 10:26:34 +0000
Message-ID: <4A128947.9090708@parrot.com>
Date: Tue, 19 May 2009 12:26:15 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Bharat Bhushan <bharat.76@gmail.com>
Subject: Re: linux kernel can not find m25p80 mtdparts
References: <a29be8140905170249v18e4f13eg5430f3e44280fe30@mail.gmail.com>
In-Reply-To: <a29be8140905170249v18e4f13eg5430f3e44280fe30@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bharat Bhushan a écrit :
> Hi Everyone,
> 
> I am naive as far as linux kernel interface with MTD devices. I face
> difficulty on MIPS based board having M25P80. Bootloader is u-boot.
> When linux boots, I pass the command-line argument as:
> 
> Kernel command line:
> mtdpart=m25p80:256k(boot),64k(boot_config),64k(board_config),2048k(kernel),4096k(filesystem)
> root=/dev/mtdpart rootfstype=squashfs,yaffg
> And Error I get is :
> 
>     VFS: Cannot open root device "mtdpart" or unknown-block(0,0)
>     Please append a correct "root=" boot option; here are the
> available partitions:
>     Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(0,0)
> 
> Some questions in above command-line I have:
> 
> 1. Does kernel recognize m25p80 by same name. How can I check where it
> is mapped in kernel. Then only mtdpart makes sense: I think so? I
> expected it to be at 0xbf040000. I do not know in kernel where to find
> this mapping. I tried drivers/mtd/ for chips specifics, but could not
> make out much.
> 2. When cmdline say root=/dev/mtdpart, do `mtdpart' should be defined
> in kernel somewhere?
> 
> Can someone please explain, which all part of kernel I need to look into.
> 

What's your spi driver ?
