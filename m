Received: from ex.2n.cz ([213.29.92.11])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L3ILv-0003Xg-5j
	for linux-mtd@lists.infradead.org; Thu, 20 Nov 2008 22:50:23 +0000
Date: Thu, 20 Nov 2008 23:50:22 +0100
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 6/6] [MTD-UTILS] nandwrite: Add Support for Reading from
	Standard Input
Message-ID: <20081120225022.GA3260@michl.2n.cz>
References: <20080908161418.GA7185@michl.2n.cz>
	<C4EAA2B4.118A3%gerickson@nuovations.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <C4EAA2B4.118A3%gerickson@nuovations.com>
From: Ladislav Michl <ladis@linux-mips.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Grant Erickson <gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 08, 2008 at 09:36:52AM -0700, Grant Erickson wrote:
> On 9/8/08 9:14 AM, Ladislav Michl wrote:
> > - code uses lseek. Obviously, you cannot seek on pipe.
> 
> True enough. The patch avoids the lseek to determine input file size;
> however, did not address the 'markbad' recovery lseek case.
> 
> Short-term proposal: like 'writeoob', disable 'markbad' support when reading
> from standard input and condition the whole 'markbad' logic on not reading
> from standard input.

It is not about marking bad blocks. Nandwrite will end with unrecoverable
error on first failed write and that is not acceptable in production
environment.

[snip]

> > PS: It is remotely possible that one day I do it myself, but I'm
> > notoriously slow on doing things I do not urgently need.

Well, it took less than three months. Not so bad :-)

And it turned out to be imposible to fix it properly without solving
following issue first.
MEMSETOOBSEL ioctl used to implement these options
  -a, --autoplace     Use auto oob layout
  -j, --jffs2         Force jffs2 oob layout (legacy support)
  -y, --yaffs         Force yaffs oob layout (legacy support)
  -f, --forcelegacy   Force legacy support on autoplacement-enabled mtd device
  -n, --noecc         Write without ecc
was removed more than two years ago and found its way into 2.6.18-rc1. See
http://lists.infradead.org/pipermail/linux-mtd-cvs/2006-May/005514.html

I hope legacy support can be safely removed (please raise your voice now)
which leaves only --noecc for implementation. Possible scenarios are:
1. Image does not contain OOB data
   Read whole eraseblock to buffer and write it to flash
2. Image contains OOB data (--oob is given)
   Set MTDFILEMODE to MTD_MODE_RAW, read whole eraseblock
   (data:oob:data:oob...) into buffer and write it to flash
3. Image does not contain OOB data and --noecc is given
   Set MTDFILEMODE to MTD_MODE_RAW, read whole eraseblock,
   insert 0xff into OOB after each writeblock, write into
   flash
4. Image contains OOB data and --noecc is given
   ???

As I have never need writing images with OOB I'd like to ask for help
how should be case 3 and 4 handled.

Thanks,
	ladis
