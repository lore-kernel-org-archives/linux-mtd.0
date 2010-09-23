Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oykw3-0001H6-F9
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 12:30:00 +0000
Received: by bwz19 with SMTP id 19so1588917bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 05:29:58 -0700 (PDT)
Subject: Re: linux equivalent of u-boot's "nand scrub" (erasing blocks even
	when OOB says "bad")
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <201009220343.33025.vapier.adi@gmail.com>
References: <AANLkTikrEq1hJEttX=DkMWYaLsJnW+QWGRaL2eygZ8uZ@mail.gmail.com>
	<AANLkTinHKU1BfmtZyEKFwUVFJz9YoPr93D7tP6jqXeJE@mail.gmail.com>
	<1284278043.1783.10.camel@brekeke>
	<201009220343.33025.vapier.adi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Sep 2010 15:28:14 +0300
Message-ID: <1285244894.29268.104.camel@localhost>
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

On Wed, 2010-09-22 at 03:43 -0400, Mike Frysinger wrote:
> On Sunday, September 12, 2010 03:54:03 Artem Bityutskiy wrote:
> > On Sun, 2010-09-12 at 00:03 -0400, Mike Frysinger wrote:
> > > On Sat, Sep 11, 2010 at 02:32, Artem Bityutskiy wrote:
> > > > It will be confusing if the same word is used in MTD for "unmarking"
> > > > eraseblocks. How about: 'force erase' or 'bad erase' ?
> > > 
> > > that makes it sound like an option to the existing MEMERASE operation.
> > > 
> > >  so i guess what if we just do that -- extend the erase_info_user
> > > 
> > > structure to contain a flags field and add a MEMERASE2 that works with
> > > the larger structure ?  for now we'd only have one option (FORCE), but
> > > it makes it easy to extend in the future.
> > 
> > Ohh, this was so stupid of me to not ask people to add extra fields to
> > 'struct erase_info_user64' which was introduced relatively recently... I
> > always add extra fields to ioctl data structures...
> > 
> > But yeah, what you say sounds ok to me.
> 
> here's a POC that works for me.  with a simple tweak to `flash_eraseall`, i
> can now recover my mtd devices with funky OOB layouts.
> 
> ive only extended MEMERASE64 as i believe the non-64 variants are EOL ?  or
> should i also extend the 32bit interface as well ?

We need something consistent. This patch will just erase the bad
eraseblock. This will not mark it as good in the BBT (neither in-ram nor
on-flash). If the erasure succeeds, the block will still be marked as
bad in BBT, but after reboot, if the BBT is not on-flash, it will be
treated as good eraseblock, because scanning will not find the bad block
marker anymore. If the BBT is on-flash, it'll stay bad. This is
inconsistent.

> +struct erase_info_user64_flags {
> +	__u64 start;
> +	__u64 length;
> +	__u32 flags;
> +};

I think it needs to have som more room for possible future extentions.
Also, good tone for ioctls is to make them to be multiple of 64-bit -
less pain in mixed 32/64 bit setups.

Please, add some

u8 padding[12]

field and add a comment that this has to be zero, and may be used in
future.

Then in future we may extend ioctls and add more fields.

> +#define MEMERASE64_FLAGS	_IOW('M', 23, struct erase_info_user64_flags)

I do not like the name. We may add something else, not just flags later.
May be MEMERASE64_EXTENDED ?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
