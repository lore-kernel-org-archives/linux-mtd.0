Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372F4C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Nov 2022 11:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRuRjAaDjRkhGcwXhAQWcH1/Fz2s1/JzDHWExPSZ79M=; b=wGFaX/rMpXFjdI
	dNVOr9VXTO1cOeDMxNMyoY4mspk6873bUPGICZJRLEFPjB4+ZFni3hyYlZnCUBmEcD6ct2CtSKhvs
	B5duLe1m8szH9jkKuYcFeWQQeZRpZO6KXrfTVUFt4Ni5jMsNEsP0OCfOgeOjVIrXmNvrmSojIdibN
	mvzrJ94RapDTLIEONulK/iSm7Q/Pzxg8TH4/Xb0lVYhC0wLZeASDaDpzmjtmS5iK2kRt2DHw/o8k1
	NNIDX4Gd84rKsmCeEsiMcj3iCLhLxMbT+1m3rw6THOaDIwZC4S/JO8gSGJ4liCFD5wZoUYfSOCHk5
	Y3P7Mlg6MtbkFd4kcKcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osjRs-00D2y1-VR; Wed, 09 Nov 2022 11:40:52 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osjRq-00D2xW-SG
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2022 11:40:52 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1osjRQ-0007kT-Bq; Wed, 09 Nov 2022 12:40:24 +0100
Date: Wed, 9 Nov 2022 11:40:21 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Matthew Wilcox <willy@infradead.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 3/5] partitions/efi: add support for uImage.FIT
 sub-partitions
Message-ID: <Y2uRpY8QVZMZlMCo@makrotopia.org>
References: <Y2rgVIbtuDsySzBr@makrotopia.org>
 <CAMj1kXG3UWUP-inYHNibJyuJfQwGzfQH8QvJqBNHZgyLc1a+6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXG3UWUP-inYHNibJyuJfQwGzfQH8QvJqBNHZgyLc1a+6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_034050_919925_FA0812FE 
X-CRM114-Status: GOOD (  32.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 09, 2022 at 10:13:48AM +0100, Ard Biesheuvel wrote:
> On Wed, 9 Nov 2022 at 00:05, Daniel Golle <daniel@makrotopia.org> wrote:
> >
> > Add new GUID allowing to parse uImage.FIT stored in a GPT partition
> > and map filesystem sub-image as sub-partitions.
> >
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> I'm not sure I follow the logic here.
> 
> You are adding uImage.FIT support as a pseudo-partition type right?

Yes, exactly.

> And the only partition driver that supports it is GPT?

Support for uImage.FIT subvolumes is added only for GPT partitions for
now. Being the most flexible/modern partition table type I don't think
anything else is actually relevant for new designs.

In other patches in the series following this one I also want to allow
enabling scanning for partitions on mtdblock and ubiblock devices.

On embedded devices with raw NOR or NAND storage those can then be used
to directly store a uImage.FIT and the FIT partition parsers is then
used on that whole block device, mapping the filesystem sub-image(s)
as mtdblockXpY or ubiblockXpY.

> 
> Does that mean that all the other types would need a similar change to
> be able to detect these subvolumes?

If you wanted to support uImage.FIT subvolumes inside other types of
partitions, then yes, this would have to be implemented for those as
well.

I've also written a (not very clean) implementation of that for MBR
partitions, it is needed e.g. on MT7623 because one cannot use GPT on
the block device used for booting with that SoC as the BootROM expects
to load the preloader exactly from where GPT would be located...
I wasn't planning on submitting that upstream though.

And other than for GPT and MBR, I don't think implementing detection of
uImage.FIT subvolumes makes any sense (but maybe I got something wrong
here or didn't fully understand your question).

> 
> > ---
> >  block/partitions/efi.c | 9 +++++++++
> >  block/partitions/efi.h | 3 +++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/block/partitions/efi.c b/block/partitions/efi.c
> > index 5e9be13a56a8..bf87893eabe4 100644
> > --- a/block/partitions/efi.c
> > +++ b/block/partitions/efi.c
> > @@ -716,6 +716,9 @@ int efi_partition(struct parsed_partitions *state)
> >         gpt_entry *ptes = NULL;
> >         u32 i;
> >         unsigned ssz = queue_logical_block_size(state->disk->queue) / 512;
> > +#ifdef CONFIG_FIT_PARTITION
> > +       u32 extra_slot = 65;
> > +#endif
> >
> >         if (!find_valid_gpt(state, &gpt, &ptes) || !gpt || !ptes) {
> >                 kfree(gpt);
> > @@ -749,6 +752,12 @@ int efi_partition(struct parsed_partitions *state)
> >                                 ARRAY_SIZE(ptes[i].partition_name));
> >                 utf16_le_to_7bit(ptes[i].partition_name, label_max, info->volname);
> >                 state->parts[i + 1].has_info = true;
> > +               /* If this is a U-Boot FIT volume it may have subpartitions */
> > +#ifdef CONFIG_FIT_PARTITION
> > +               if (!efi_guidcmp(ptes[i].partition_type_guid, PARTITION_LINUX_FIT_GUID))
> > +                       (void) parse_fit_partitions(state, start * ssz, size * ssz,
> > +                                                   &extra_slot, 127, 1);
> > +#endif
> >         }
> >         kfree(ptes);
> >         kfree(gpt);
> > diff --git a/block/partitions/efi.h b/block/partitions/efi.h
> > index 84b9f36b9e47..06c11f6ae398 100644
> > --- a/block/partitions/efi.h
> > +++ b/block/partitions/efi.h
> > @@ -51,6 +51,9 @@
> >  #define PARTITION_LINUX_LVM_GUID \
> >      EFI_GUID( 0xe6d6d379, 0xf507, 0x44c2, \
> >                0xa2, 0x3c, 0x23, 0x8f, 0x2a, 0x3d, 0xf9, 0x28)
> > +#define PARTITION_LINUX_FIT_GUID \
> > +    EFI_GUID( 0xcae9be83, 0xb15f, 0x49cc, \
> > +              0x86, 0x3f, 0x08, 0x1b, 0x74, 0x4a, 0x2d, 0x93)
> >
> >  typedef struct _gpt_header {
> >         __le64 signature;
> > --
> > 2.38.1
> >

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
