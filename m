Received: from florence.buici.com ([206.124.142.26] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17qNmV-0003UI-00
	for <linux-mtd@lists.infradead.org>; Sun, 15 Sep 2002 02:00:59 +0100
Date: Sat, 14 Sep 2002 18:00:56 -0700
From: Marc Singer <elf@buici.com>
To: Erich Schubert <erich@debian.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: recommended Filesystem for DoC?
Message-ID: <20020915010056.GA916@buici.com>
References: <20020914235138.GA28771@bombadil.xmldesign.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20020914235138.GA28771@bombadil.xmldesign.de>
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

On Sun, Sep 15, 2002 at 01:51:39AM +0200, Erich Schubert wrote:
> I'm preparing a thin client employing a 8 MB M-Systems DoC.
> My current system is at 6 MB uncompressed, but i'd like to add some
> local fonts, and lpd and a sound server, so i'd like to use some
> compression.
> I was thinking about setting up the static part using a cramfs;
> but i need some files on the flash to be writeable
> (configuration files such as IP address, X11 server address etc.)

I've been looking into something similar.  Presently, I use ext3
because I have enough space space for a 1M journal.  However, I don't
recommend this.  I've been considering using cloop (KNOPPIX) because
it doesn't require a ramdisk and then installing JFFS as the root
filesystem.  This means that the static part is always compressed and
mounted at boot time.

> I've seen these two JFFS file systems; but actually i don't need much
> journalling (after all i don't change the config too often ;)
> and JFFS seems to be designed for the other flash type.
> Should i use an ext2 filesystem then?

Ext2 can get you in trouble.  You might be able to minimize your
exposure by guaranteeing that the fs is sync'd after performing a
write.

> I was thinking about mounting a cramfs ro as root, a tmpfs in some other
> dir for automatic files (such as xserver output) and the actual
> filesytem on the device in /writefs.
> On that i should then store the kernel and the cramfs-initrd?

I don't think you can put the kernel in the initrd.  After all, the
kernel *reads* the initrd.  Instead, the kernel goes into the root
filesystem (lilo/grub style) or in an MSDOS partition (syslinux
style).


>  any recommendations for the system?  grub or lilo? (right now i'm
> using grub to boot the system off a small partition ~8 MB) any good
> howto for installing the bootloader?

I stopped using lilo because it is a little too complex and because it
doesn't handle serial consoles as well as syslinux.  I'd have used
grub, but it crashes on my hardware.  IMHO, grub is the most
attractive because it has the best feature set.


> 
> Gruss,
> Erich Schubert
> -- 
>         erich@(mucl.de|debian.org)        --        GPG Key ID: 4B3A135C
>           Go away or i'll replace you with a very small shell script.
>             Ein Freund ist ein Geschenk, das man sich selbst macht.
>                Humor sollte immmer dabeisein, auch bei Problemen.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
