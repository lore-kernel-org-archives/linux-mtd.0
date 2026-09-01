Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743AAC624C6
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2026 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQqEy/XkUQ7sli0Z34hXY6pqJJUk6fsJxBWRDpPOsak=; b=e2AbK/MN2S3TMP
	zNHbRKtnYTCmJk6AFkJAHBHFbnDGPhuGbDBcKM1ijpCsJKtHpIezjLQA9uuDSXrw6wLL2aply3bu9
	ByEZ9+WlHx9/iodSKKEpnq9MavhO5BxNAj4tNzrmSynesRYHC7brMZC9bNdb71SqcGoit7HjaD5qY
	OQKibLgr7NMWDloP7tPnfkDT3xIaEsO7523+IUgHOqEQwfy2OKMP6b5haH56ku+YdCMNBvxrjUurx
	O38h3VmPI78VRInA+EpMi24IhKiHZZg6zMPkEfbXmAdB80GBfVP0gEbgkPzFi4V2lWm6I0TH8MCBC
	tcrJOzRZNGDBPILhmyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JvE-0000000BIDy-0xdm;
	Tue, 01 Sep 2026 08:32:48 +0000
Received: from mail-106103.protonmail.ch ([79.135.106.103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JvC-0000000BID9-0D9k
	for linux-mtd@lists.infradead.org;
	Tue, 01 Sep 2026 08:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1788251561; x=1788510761;
	bh=xgTF6OOdZLsOJV9Zkr8Cucyb3bnKLcpcMmZZ/a9pfGI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dlhQQQYyE4J8sBkpX3O1xawfVra45O6/AVoyRqm2XdZwy4V/796N28nvFNFmrV5yJ
	 QEyJpvBZgjfQpbhnSM+ZBkqJDLgr/zO6Fieas+z85AYQ6N/8Mqf12X+9SBPjY0ZWez
	 h8rbC0QveUo/PSiGBPJ7/SJHLaxE2zpdVZMU5K1fS/oLruYzq2JDB1IIe3nSdwSaDT
	 CEhS1irMGHV6eZACoqyS/nmk+hZWBqKOkpztL5KdCKm9GN3F4hXBmdyWSfDIJuUh0h
	 W66Wn9yPWxvkqH41m0eUpvVpIjYHVcYZFW32wAalm7PR+5vJZtR6+AbX/PMN3qLxXw
	 PiBR7ns/a7RvA==
Date: Tue, 01 Sep 2026 08:32:33 +0000
To: Michael Walle <mwalle@kernel.org>
From: Tobias Jakobsen <tjakobsen84@protonmail.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: allow the platform to supply write protection state
Message-ID: <bwwdwkT-nZT9pant-Nb_0PF8R531C5F2gDKrs-rZvW7MG1LHPf-MGmBH5YOSWTBnvZkRl4cPfXSzukcHaxoUZE1Ow0zvIfFCaOqYESzLjZE=@protonmail.com>
In-Reply-To: <DL34U80UW849.3OYQBBTN7GRJ8@kernel.org>
References: <20260831-spi-nor-platform-lock-v2-0-6cc75b909241@protonmail.com> <20260831-spi-nor-platform-lock-v2-1-6cc75b909241@protonmail.com> <DL34U80UW849.3OYQBBTN7GRJ8@kernel.org>
Feedback-ID: 214933398:user:proton
X-Pm-Message-ID: adc3d59a08d785e63a22d8267bdc0c554b4af630
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_013246_246371_72FCF8BB 
X-CRM114-Status: GOOD (  20.86  )
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


Hello!

On Monday, 31 August 2026 at 14:37, Michael Walle <mwalle@kernel.org> wrote:
> > +static int spi_nor_platform_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
> > +{
> > +	struct flash_platform_data *data = dev_get_platdata(nor->dev);
> > +
> > +	return data->is_locked(nor->spimem->spi, ofs, len);
> > +}
> > +
> > +static const struct spi_nor_locking_ops spi_nor_platform_locking_ops = {
> > +	.lock = spi_nor_platform_lock,
> > +	.unlock = spi_nor_platform_unlock,
> > +	.is_locked = spi_nor_platform_is_locked,
> > +};
> 
> If we can't unlock the flash, what's it's use then? Can't we just
> clear the HAS_LOCK if there is an intel-spi driver?

Clearing HAS_LOCK would replace a wrong answer with no answer
(-EOPNOTSUPP). That is an improvement, but it discards information the
kernel already has, since spi-intel reads the protected range registers
at probe anyway for the MTD_WRITEABLE masking in
intel_spi_fill_partition(). Userspace is then left parsing the Intel
specific sysfs attributes to find out, which is the platform specific
special casing this series is trying to remove the need for.

If I understood correctly MEMISLOCKED is a query rather than a control.
"check if chip is locked" with no qualifier restricting it to the
chip's own block protection bits. On PCH protected machines the answer it
gives is wrong: the region is protected and it reports otherwise.

spi-nor cannot tell which controller it sits behind,
so suppressing HAS_LOCK needs the same channel through
flash_platform_data; only the payload changes.

The reason it is a callback rather than a flag is that the answer is per
range. On the machine I tested, PR0 covers 0x860000-0xffffff of a 16M
chip:

  query 0x860000 + 0x7a0000   -> locked
  query 0x0      + 0x1000000  -> not locked
  query 0x0      + 0x10000    -> not locked

A boolean would have to claim the whole device is locked, which is wrong
for everything below 0x860000.

That said, if you would rather have the simpler suppression, I am happy
to do that instead.

> >  	/*
> > -	 * NOR protection support. When locking_ops are not provided, we pick
> > -	 * the default ones.
> > +	 * NOR protection support. Platform enforced protection is preferred
> > +	 * over the chip's own, as the chip is not necessarily aware of it.
> > +	 * When locking_ops are not provided, we pick the default ones.
> >  	 */
> 
> This doesn't work, does it? What if a flash already provide locking
> ops?

You are right, it does not. The vendor late_init hooks run before this
(core.c 3063 and 3072), so atmel.c and sst.c have already set
params->locking_ops by then and the platform query is skipped. A chip
with its own locking ops behind an Intel PCH would still report the
chip's answer.

I will fix that in v3 by having the platform ops take precedence
unconditionally rather than only filling in when nothing else has.
Let me know how you'd like to proceed regarding HAS_LOCK clearing.

Regards,
Tobias.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
