Received: from eris.discordia.ch ([212.55.212.99])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14xb7Q-00039S-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 May 2001 22:03:37 +0100
Date: Wed, 9 May 2001 23:03:52 +0200
From: Peter Keel <killer@discordia.ch>
To: linux-mtd@lists.infradead.org
Cc: Heiko Fiergolla <krabat@arcormail.de>
Subject: Re: Read Flash-Dumps
Message-ID: <20010509230352.A11999@discordia.ch>
References: <20010509190106.A10693@discordia.ch> <0105091818050L.10317@frumious.unidec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <0105091818050L.10317@frumious.unidec.co.uk>; from john@frumious.unidec.co.uk on Wed, May 09, 2001 at 06:18:05PM +0100
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

* on the Wed, May 09, 2001 at 06:18:05PM +0100, dr john halewood was blubbering:
> On Wednesday 09 May 2001 18:01, Peter Keel wrote:
> >
> > So how do I do a loopack-mount of the files? I tried several
> > filesystems, but that doesn't seem to work. Also, nftl doesn't
> > even appear in /proc/filesystems.
> >
> IIRC the igel box uses minix filesystems mounted on top of the NFTL so you 
> don't access the flash layer directly. (It also uses the M-Systems proprietry 
> driver, which isn't suprising as Igel wrote it)

Wrapup. 

Its Flash has the following structure:
/dev/fla contains the whole flash. In the following order:
    00000000-000003FF	something which "file" identifies as 
			linux-kernel. contains a valid partition-table, 1kB. 
    00000400-000020FB	The bootloader. It can decompress the compressed
			part of the filesystems. ca. 8kb. 
    000020FC-000043FF	Empty. 0x00, ca. 8kb. Seems to belong to
			the bootloader. 
    00004400-000103FF	Writeable area. is 48 kb. filesystem unknown
			but looks primitive. two utilities (each 7kb) 
			in /bin know how to handle that. 
    00010400...		Compressed and readonly. Contains:
	/dev/igf1	/-filesystem. ext2, 20 MB
	/dev/igf2	/usr-filesystem, ext2
	/dev/igf3	/usr3-filesystem, ext2
	/dev/igf4	(possibly)
    looks like it's realised with some kind of a loop-mount
    filesystem (probably called cromfs) which decompresses on 
    the fly. I tried with cramfs, but either this isn't the same
    or more likely, I haven't found the right start of the file.

Cheers
Peter
(Doh, 15kbit executable, seems possible with objdump...)
