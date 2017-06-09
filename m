Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJ9je-0008Fs-L1
 for linux-mtd@lists.infradead.org; Fri, 09 Jun 2017 02:33:16 +0000
Received: by mail-pf0-x244.google.com with SMTP id u1so7049113pfg.1
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jun 2017 19:32:54 -0700 (PDT)
Date: Thu, 8 Jun 2017 19:32:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Andrea Adami <andrea.adami@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: sharpsl: add sharpslpart MTD partition parser
Message-ID: <20170609023251.GN102137@google.com>
References: <1492287078-22369-1-git-send-email-andrea.adami@gmail.com>
 <1492287078-22369-2-git-send-email-andrea.adami@gmail.com>
 <d9ef9878-932c-955a-5ba6-c0f0ec03731c@gmail.com>
 <20170417164412.3dc5b457@bbrezillon>
 <CAAQYJAsOJy=SCpBxvrQvfPt6LJ=FjAxDw2gr=5s-vT+8xM-DPQ@mail.gmail.com>
 <20170418113556.54e25231@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170418113556.54e25231@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris and Andrea,

Sorry I didn't thoroughly read through this earlier discussion before
reviewing the later versions. I also don't want to rehash old
disagreements. But I had a few questions.

On Tue, Apr 18, 2017 at 11:35:56AM +0200, Boris Brezillon wrote:
> On Tue, 18 Apr 2017 10:58:02 +0200
> Andrea Adami <andrea.adami@gmail.com> wrote:
> > On Mon, Apr 17, 2017 at 4:44 PM, Boris Brezillon <
> > boris.brezillon@free-electrons.com> wrote:
> > > I'll try to document myself on the on-flash format of the FTL and
> > > partition table before giving a definitive opinion, but I have the
> > > feeling this ancient FTL is not 100% safe, and by accepting an old
> > > (maybe unreliable?) FTL we are setting a precedent, and refusing other
> > > (broken) proprietary/vendor FTLs will be almost impossible after that.

IIUC, drivers/mtd/*ftl*.c shows several FTLs in the kernel... And I'll
admit I've basically never reviewed them. I don't think they've really
created much precedent either...except that I'm bringing them up right
now ;) and possibly that no good alternatives have been developed,
except for UBI (and IMO, UBI doesn't necessarily apply in all the same
situations that some "boot partitions" might; you have to bootstrap
*somewhere*).

...

> > > On Sun, 16 Apr 2017 18:07:47 +0200
> > > Marek Vasut <marek.vasut@gmail.com> wrote:
> > >  
> > >> On 04/15/2017 10:11 PM, Andrea Adami wrote:  
> > >> > The Sharp SL Series (Zaurus) PXA handhelds have 16/64/128M of NAND  
> > flash
> > >> > and share the same layout of the first 7M partition, managed by Sharp  
> > FTL.
> > >> >
> > >> > The purpose of this self-contained patch is to add a common parser and
> > >> > remove the hardcoded sizes in the board files (these devices are not  
> > yet
> > >> > converted to devicetree).
> > >> > Users will have benefits because the mtdparts= tag will not be  
> > necessary
> > >> > anymore and they will be free to repartition the little sized flash.
> > >> >
> > >> > The obsolete bootloader can not pass the partitioning info to modern
> > >> > kernels anymore so it has to be read from flash at known logical  
> > addresses.
> > >> > (see http://www.h5.dion.ne.jp/~rimemoon/zaurus/memo_006.htm )  

...

> > This is done with a special kernel (linux-kexecboot) embedding the minimal
> > cpio and acting as 2nd stage bootloader.
> > It passes the mtdparts found in cmdline and does the extra trick of reading
> > it from mtd1 for zaurus.
> > You can even customize the cmdline in /boot/boot.cfg and hack the mtdparts
> > there.
> > 
> > Neverthless, what you don't seem to understand is that I cannot force
> > people to use kexecboot or to customize cmdline parts as I like...
> > I do just build kernels and images for testing...I maintain the OE build
> > infrastructure, not one distro.
> 
> Well, you can say "if you want to use a mainline kernel, stop using
> this sharp FTL+partition-table and start using a 2nd stage
> bootloader like kexecboot". What do they use right now to boot a new
> kernel (newer than the 2.4 one)?

IIUC, that doesn't get anybody to "stop using the FTL"; it just gets
them to stop parsing it in the kernel. They would still be parsing it in
userspace, just to generate new parameters for the kexec'd kernel? Seems
like a lot of bloat for zero gain.

...

> > > Just going through all these details to say that, IMO, we should only
> > > consider inclusion of this feature if we think it's safe, because I
> > > think all that is done here can be done from user-space.

Wait, why is "it can be done from user-space" relevant to safety? The
end solution isn't any better, just because you layer user-space in
between to do the parsing job. Or am I misunderstanding?

> > Read only is safe.
> 
> This is a lie.

I don't see where you've disproved the claim of safety. The following
all seems to be a non sequitur.

But my understanding (about the "safety" question) is that this whole
FTL construct is:
(a) required by the bootloader and
(b) not touched outside the bootloader, except (mostly, barring the
advanced tooling that people use infrequently, for installation?) read
only in a parser like this proposed one

(Please correct me if I'm wrong.)

I don't think we can reasonably disallow (a); it's often difficult or
impossible to replace bootloaders.

If (b) is true, then I don't see why this is a *huge* issue. Yes,
read-only NAND is technically not immune to unreliability issues like
read disturb, but judging by the lifetime of these products (they're
still being used, with out-of-tree parsing, no?) it can't have been too
bad.

And about technical details: based on my review of what we're parsing
here, the most worrisome part is that the logical mapping of the FTL is
stored in OOB. But this all is of the same (or older?) era as JFFS2, so
that's also not highly unusual. And it does at least have several
(non-ECC) means of error detection (storing redundant versions of the
FTL mapping within the same page; a parity check on the mapping offsets;
and multiple copies of the partition table), though I'm not sure how
well it will hold up for error *correction*.

So, I'm not super happy with the format, and I wouldn't suggest it on
any new products (esp. considering that NAND has only gotten more
unreliable in the meantime), but I don't think it's as bad as you seem
to think.

> AFAIU, you have all the necessary tools to update the
> partition table from user-space, so even if you only have read-only
> support in the kernel, one can corrupt it from userspace, and the
> kernel may not be able to recover from this corruption.

How is this any different from, e.g., GPT on block devices? Just because
user space can clobber the partition table doesn't mean we don't allow
GPT.

Or are you implying issues with read disturb and the like?

> Honestly, if we want to support this FTL+partition-table-format in the
> kernel, I'd recommend that we add RW support, otherwise you'll keep
> having those external tools.

I don't understand that point, and I don't think Andrea did either.

Brian
