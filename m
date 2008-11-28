Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L6C1f-0003Tu-O3
	for linux-mtd@lists.infradead.org; Fri, 28 Nov 2008 22:41:28 +0000
Subject: Re: [PATCH 6/6] [MTD-UTILS] nandwrite: Add Support for Reading
	from Standard Input
From: "Schlaegl Manfred jun." <manfred.schlaegl@gmx.at>
To: Ladislav Michl <ladis@linux-mips.org>
In-Reply-To: <20081120225022.GA3260@michl.2n.cz>
References: <20080908161418.GA7185@michl.2n.cz>
	<C4EAA2B4.118A3%gerickson@nuovations.com>
	<20081120225022.GA3260@michl.2n.cz>
Content-Type: text/plain
Date: Fri, 28 Nov 2008 23:40:30 +0100
Message-Id: <1227912030.4322.33.camel@lisa.alm.archives.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	Grant Erickson <gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, den 20.11.2008, 23:50 +0100 schrieb Ladislav Michl: 
> On Mon, Sep 08, 2008 at 09:36:52AM -0700, Grant Erickson wrote:
> > On 9/8/08 9:14 AM, Ladislav Michl wrote:
> > > - code uses lseek. Obviously, you cannot seek on pipe.
> > 
> > True enough. The patch avoids the lseek to determine input file size;
> > however, did not address the 'markbad' recovery lseek case.
> > 
> > Short-term proposal: like 'writeoob', disable 'markbad' support when reading
> > from standard input and condition the whole 'markbad' logic on not reading
> > from standard input.
> 
> It is not about marking bad blocks. Nandwrite will end with unrecoverable
> error on first failed write and that is not acceptable in production
> environment.

On our productive Systems(automatic system-update) we wrote own code
with special security options:
The Image is written whole, without marking blocks bad, also if
write-errors occure, the number of errors will counted and as result we
deliver a "failed", with the number of write errors. Based on the number
of errors, we're able to react in diffent ways. For example: 
 * to many bad-blocks: heavy error -> abort, because of hardware error
 * to many bad-blocks: image doesn't fit -> abort
 * "block got bad" error -> rewrite with marking blocks bad (if new
errors occure -> repeat procedure)
But this is only reliable, if we there is an file-image.

So I think, one option is to do this by an command-line option:
"--makebad", or something. (see below)

> [snip]
> 
> > > PS: It is remotely possible that one day I do it myself, but I'm
> > > notoriously slow on doing things I do not urgently need.
> 
> Well, it took less than three months. Not so bad :-)
all day work sucks... *g*
> 
> And it turned out to be imposible to fix it properly without solving
> following issue first.
> MEMSETOOBSEL ioctl used to implement these options
>   -a, --autoplace     Use auto oob layout
>   -j, --jffs2         Force jffs2 oob layout (legacy support)
>   -y, --yaffs         Force yaffs oob layout (legacy support)
>   -f, --forcelegacy   Force legacy support on autoplacement-enabled mtd device
>   -n, --noecc         Write without ecc
> was removed more than two years ago and found its way into 2.6.18-rc1. See
> http://lists.infradead.org/pipermail/linux-mtd-cvs/2006-May/005514.html
> 
> I hope legacy support can be safely removed (please raise your voice now)
> which leaves only --noecc for implementation. Possible scenarios are:
> 1. Image does not contain OOB data
>    Read whole eraseblock to buffer and write it to flash
> 2. Image contains OOB data (--oob is given)
>    Set MTDFILEMODE to MTD_MODE_RAW, read whole eraseblock
>    (data:oob:data:oob...) into buffer and write it to flash
> 3. Image does not contain OOB data and --noecc is given
>    Set MTDFILEMODE to MTD_MODE_RAW, read whole eraseblock,
>    insert 0xff into OOB after each writeblock, write into
>    flash
> 4. Image contains OOB data and --noecc is given
>    ???

I think, the --noecc option only makes sense, if --oob ist not given. 
The oob-option is, logically seen, more than a simply change in
handling, because we practically write to an abstract device.

> 
> As I have never need writing images with OOB I'd like to ask for help
> how should be case 3 and 4 handled.
I used --oob for testing:
* to write a raw-image from physical(target) to nandsim(host) for
analysis (powerdown, etc.)
* generate bad-blocks on nand-devices for testing 

Ideas:
 --oob or --raw: writes unmodified data+oob (data:oob:data:oob, ...)
(raw-mode), if not given, write data, with autogenerated
ecc(abstract-mode). 
 --markbad: 
   * given: mark blocks with write errros as bad and perform write on
next block (caution: image-size)
   * not given: 
     * write image at whole and count errors -> result
     * or, abort on first error
 
The main issue I see, is the size of the device. Nobody is able to
predict the size of the destination device.

> 
> Thanks,
> 	ladis
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
best regards
	Manfred
