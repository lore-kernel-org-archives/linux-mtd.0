Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E75BC52D7C
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 14:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPdVEvyj3MiQXjOJ9Xo4xT7bxmi+yLEFfpumF3Gtuio=; b=Yo1de0HyNP9R7V
	uBbQ1LiM1v2Ac33KusiFa9cn7lndoO2iEIQkPCW1FTI38npJIXz1pwm7c8qikAKBn6X/qVdMnVDKk
	ztQy48al9NF4bhq0tU0gvWIm6PxGT8nBhVTje9s/pNpSw0YQACvU/mEF7lmQpv3HHVnDv5isLpaR9
	/d9i6BoLDIwZMSnVKUwW4WJDngfXMrlI+NATqAHavgNfuaIXCYZF3gi92hEy558NNyCLBz4s/jlPZ
	dBgDeadQ56RyhON8bRQwT80f4kAkbFLlB1w1nrhN15HPrEo7QfihavNs4/4+ui2w1530AIac47aTJ
	XL9mH8cauG++t62SrC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWIz-00000000dPT-2SIx;
	Mon, 12 Aug 2024 14:45:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWIw-00000000dNq-1gVm
	for linux-mtd@lists.infradead.org;
	Mon, 12 Aug 2024 14:45:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC385612D5;
	Mon, 12 Aug 2024 14:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18100C32782;
	Mon, 12 Aug 2024 14:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723473948;
	bh=WnV0Uspi16IHonX08wdWD+YLO3AeDpfJBCsb8N7KDM0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QWgTjLtiKLHueE1ON3w2Yd3Icg5B0723o51jaQf5d8A57ETidHPPPC9i/H6HKKazl
	 z/8VrCYFr2BzOYQgaiNT9AO03rHsUKr6mtRX25DM/tznWQD8EUKNT0SKidGHs1be+o
	 EJzLkD0JhKUfRAkGVF8dkJwdWWdvMhAMXOn6WxHTCVr87TP5EjxcQlk9zhJXJBlww0
	 P/+9Lkq2buVSyPagr9HM0/WUsDvKFXMiQqDe2nU9ce4X7rA1brL6Klw7kSmaTeRlkS
	 BDAoVvxL3PrQ9XhJYIf1r6Mv0KtrrVjBxIfNi0h7DwC8VOZxoG1qNcXc0Egpim3c9N
	 ZgWmf9b8xvXAQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Tudor Ambarus"
 <tudor.ambarus@linaro.org>,  "Miquel Raynal" <miquel.raynal@bootlin.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: winbond: add Zetta ZD25Q128C support
In-Reply-To: <D3E0BKGQIZ9R.1ULZZ93E18VGM@kernel.org> (Michael Walle's message
	of "Mon, 12 Aug 2024 16:36:11 +0200")
References: <20240804221535.291923-1-mwalle@kernel.org>
	<mafs0v805zwlv.fsf@kernel.org> <D3E0BKGQIZ9R.1ULZZ93E18VGM@kernel.org>
Date: Mon, 12 Aug 2024 16:45:45 +0200
Message-ID: <mafs0r0atztnq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_074550_592805_E7A36C85 
X-CRM114-Status: GOOD (  23.52  )
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

On Mon, Aug 12 2024, Michael Walle wrote:

> Hi,
>
>> > Zetta normally uses BAh as its vendor ID. But for the ZD25Q128C they
>> > took the one from Winbond and messed up the size parameters in SFDP.
>> > Most functions seem compatible with the W25Q128, we just have to fix up
>> > the size.
>> >
>> > Link: http://www.zettadevice.com/upload/file/20150821/DS_Zetta_25Q128_RevA.pdf
>> > Link: https://www.lcsc.com/datasheet/lcsc_datasheet_2312081757_Zetta-ZD25Q128CSIGT_C19626875.pdf
>> > Signed-off-by: Michael Walle <mwalle@kernel.org>
>> > ---
>> [...]
>> > diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
>> > index e065e4fd42a3..9f7ce5763e71 100644
>> > --- a/drivers/mtd/spi-nor/winbond.c
>> > +++ b/drivers/mtd/spi-nor/winbond.c
>> > @@ -17,6 +17,31 @@
>> >  		   SPI_MEM_OP_NO_DUMMY,					\
>> >  		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
>> >  
>> > +static int
>> > +w25q128_post_bfpt_fixups(struct spi_nor *nor,
>> > +			 const struct sfdp_parameter_header *bfpt_header,
>> > +			 const struct sfdp_bfpt *bfpt)
>> > +{
>> > +	/*
>> > +	 * Zetta ZD25Q128C is a clone of the Winbond device. But the encoded
>> > +	 * size is really wrong. It seems that they confused Mbit with MiB.
>> > +	 * Thus the flash is discovered as a 2MiB device.
>> > +	 */
>> > +	if (bfpt_header->major == SFDP_JESD216_MAJOR &&
>> > +	    bfpt_header->minor == SFDP_JESD216_MINOR &&
>> > +	    nor->params->size == SZ_2M &&
>> > +	    nor->params->erase_map.regions[0].size == SZ_2M) {
>> > +		nor->params->size = SZ_16M;
>> > +		nor->params->erase_map.regions[0].size = SZ_16M;
>> > +	}
>>
>> Since the size is 16 MiB for both Zetta and Winbond, why do you have
>> these conditions here? Why not just do it unconditionally? What
>> situation do you want to protect against?
>
> Two things, I want to make sure, the values I'll overwrite (which
> were set indirectly by the SFDP data I check here) are really the
> "before" value I expect them to be. And secondly, I want to
> fingerprint the SFDP as accurately as possible. I mean you wouldn't
> need the SFDP version either. Think of a preparation for a possible
> .match() callback in zetta.c. That would probably look like this,
> i.e. check the flash id and these four conditions.

Hmm, I see. I personally find doing it unconditional a bit easier to
grok but this is fine too I think.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

> What are your concerns?

None. I was mostly curious why you did it this way.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
