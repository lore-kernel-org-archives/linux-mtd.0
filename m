Received: from florence.buici.com ([206.124.142.26] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AsPXl-000079-KT
	for linux-mtd@lists.infradead.org; Sun, 15 Feb 2004 16:54:57 +0000
Date: Sun, 15 Feb 2004 08:54:55 -0800
From: Marc Singer <elf@buici.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20040215165455.GA31480@buici.com>
References: <20040215095325.GA27531@buici.com>
	<1076843296.4484.2.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1076843296.4484.2.camel@imladris.demon.co.uk>
cc: linux-mtd@lists.infradead.org
Subject: Re: Can 256K erase blocks work with JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 15, 2004 at 11:08:16AM +0000, David Woodhouse wrote:
> On Sun, 2004-02-15 at 01:53 -0800, Marc Singer wrote:
> > When creating the jffs2 filesystem, if I set the erase block size to
> > 256 then the filesystem created is twice the size of my total flash
> > capacity--can't use it.  The default of 64 produces a modest
> > filesystem of 5MB.
> 
> 256 would be a problem. 256KiB would be fine. Precisely what did you
> tell mkfs.jffs2, and what version of mkfs.jffs2 is it? Only recent
> versions will _assume_ you're lying if you tell it 256 bytes, and
> silently assume 256KiB instead.

I see.  The help isn't clear about what SIZE means.

  elf@florence ~...coastal/arm > mkfs.jffs2 -v
  mkfs.jffs2 revision 1.19

This version appears to have the code that understands that 256 means
KiB.

And, it still produces an image that is substantially larger that the
source data as well as being larger than the total available flash.

  elf@florence ~...coastal/arm > mkfs.jffs2 -e 256kb -r root -o toucan.jffs
  elf@florence ~...coastal/arm > ls -l toucan.jffs
  -rw-rw-r--    1 elf      elf      18640820 Feb 15 08:52 toucan.jffs
  elf@florence ~...coastal/arm > du -s root
  5432    root
