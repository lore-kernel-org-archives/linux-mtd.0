Received: from mailout08.sul.t-online.com ([194.25.134.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17qWrT-00064w-00
	for <linux-mtd@lists.infradead.org>; Sun, 15 Sep 2002 11:42:43 +0100
Date: Sun, 15 Sep 2002 12:41:55 +0200
From: Erich Schubert <erich@debian.org>
To: Marc Singer <elf@buici.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: recommended Filesystem for DoC?
Message-ID: <20020915104155.GB7894@bombadil.xmldesign.de>
References: <20020914235138.GA28771@bombadil.xmldesign.de> <20020915010056.GA916@buici.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020915010056.GA916@buici.com>
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

> Ext2 can get you in trouble.  You might be able to minimize your
> exposure by guaranteeing that the fs is sync'd after performing a
> write.

Why is ext3 better here?
I was planning to have my ext2 read-only unless i need to change
something; then remount,rw; change the settings; remount,ro...

> > I was thinking about mounting a cramfs ro as root, a tmpfs in some other
> > dir for automatic files (such as xserver output) and the actual
> > filesytem on the device in /writefs.
> > On that i should then store the kernel and the cramfs-initrd?
> 
> I don't think you can put the kernel in the initrd.  After all, the
> kernel *reads* the initrd.  Instead, the kernel goes into the root
> filesystem (lilo/grub style) or in an MSDOS partition (syslinux
> style).

you misunderstood what i said. I said i put a ext2 there containing the
kernel, the cramfs and the file i need to be able to change easily.

> I stopped using lilo because it is a little too complex and because it
> doesn't handle serial consoles as well as syslinux.  I'd have used
> grub, but it crashes on my hardware.  IMHO, grub is the most
> attractive because it has the best feature set.

i don't need serial consoles; the machine is a X11 terminal - that makes
no sense without a real screen and keyboard ;)

Gruss,
Erich Schubert
-- 
        erich@(mucl.de|debian.org)        --        GPG Key ID: 4B3A135C
     A man doesn't know what he knows until he knows what he doesn't know.
        Die kürzeste Verbindung zwischen zwei Menschen ist ein Lächeln.
    Für jedes Problem gibt es eine Lösung, die einfach, klar und falsch ist.
