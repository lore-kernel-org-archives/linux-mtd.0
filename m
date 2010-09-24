Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz3xY-0001ay-JG
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 08:48:49 +0000
Received: by fxm4 with SMTP id 4so2039563fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 01:48:47 -0700 (PDT)
Subject: Re: linux equivalent of u-boot's "nand scrub" (erasing blocks even
	when OOB says "bad")
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <AANLkTinFYHz9Ncw9NWPgQoAM=8H7S9J11Gaybsrov1AT@mail.gmail.com>
References: <AANLkTikrEq1hJEttX=DkMWYaLsJnW+QWGRaL2eygZ8uZ@mail.gmail.com>
	<AANLkTinHKU1BfmtZyEKFwUVFJz9YoPr93D7tP6jqXeJE@mail.gmail.com>
	<1284278043.1783.10.camel@brekeke>
	<201009220343.33025.vapier.adi@gmail.com>
	<1285244894.29268.104.camel@localhost>
	<AANLkTinFYHz9Ncw9NWPgQoAM=8H7S9J11Gaybsrov1AT@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Sep 2010 11:47:06 +0300
Message-ID: <1285318026.29268.162.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-09-23 at 15:55 -0400, Mike Frysinger wrote:
> On Thu, Sep 23, 2010 at 08:28, Artem Bityutskiy wrote:
> > On Wed, 2010-09-22 at 03:43 -0400, Mike Frysinger wrote:
> >> here's a POC that works for me.  with a simple tweak to `flash_eraseall`, i
> >> can now recover my mtd devices with funky OOB layouts.
> >>
> >> ive only extended MEMERASE64 as i believe the non-64 variants are EOL ?  or
> >> should i also extend the 32bit interface as well ?
> >
> > We need something consistent. This patch will just erase the bad
> > eraseblock. This will not mark it as good in the BBT (neither in-ram nor
> > on-flash). If the erasure succeeds, the block will still be marked as
> > bad in BBT, but after reboot, if the BBT is not on-flash, it will be
> > treated as good eraseblock, because scanning will not find the bad block
> > marker anymore. If the BBT is on-flash, it'll stay bad. This is
> > inconsistent.
> 
> i dont think the current BBT API supports marking bad blocks as good ?
>  if it does, could you highlight it for me ?

No, unfortunately, it'd require some work with ancient code - not very
easy task, IMO.

> >> +struct erase_info_user64_flags {
> >> +     __u64 start;
> >> +     __u64 length;
> >> +     __u32 flags;
> >> +};
> >
> > I think it needs to have som more room for possible future extentions.
> > Also, good tone for ioctls is to make them to be multiple of 64-bit -
> > less pain in mixed 32/64 bit setups.
> >
> > Please, add some
> >
> > u8 padding[12]
> >
> > field and add a comment that this has to be zero, and may be used in
> > future.
> >
> > Then in future we may extend ioctls and add more fields.
> 
> well, the idea i have with flags is that we carve one bit out to mean
> "extend".  so if in the future we wanted to extend the struct, we set
> that flag and the kernel knows that userspace wants the larger
> version.  that gives you a way of extending things indefinitely at the
> cost of 1 bit.

I think this is not fast-path and it does not hurt to have extra fields
just in case someone else needs them in future.

Also, make sure size of this structure is multiple of 8, not 4.

> which also means i should probably carve that bit out now and have the
> kernel return an error when it is set today.

I think no, you should ignore them.  But you should write a comment that
userspace has to zero them, this is kind of part of API. Then when new
flags are added, old kernels will not fail, but ignore them.

But yes, this will work only if userspace follows the API.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
