Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98648C27C52
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 17:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJ3ExbAsPtDIiRe7ZSIwp3QQtwe4gXzhMCDfMVlRTqw=; b=v724E6d1iroTbV
	E89eZEbcMAk+RxRk9DyCNHTMxUCZSUcooUKb2CBiUg7PBkd9mv4+Nnzfn8Zp+wpqatpgd97suW9Js
	GOksFok1VhmbpqXucG0A0xkVIxEr2IiE7yCBow9x5lnN28aKvwJPbFZFM6XrCGgrsptpTburgoepZ
	Vww8iE3WwxVIZz1t9k50glWcgZb7XVSc1zC0nezRfv9cfL8v6lIAC/pIjSoiTwtDahizgSpzQjiF0
	+odiJ8SZBFZG4y4VyxiEMDpPpJyacJ/qF7Fe62TjRp9HlKChuoLpyeMo0zsyeqc0boKmi4YK7MRfC
	SHeEXlBNdollmGXG0V2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFH1E-0000000AmYD-0Mu6;
	Thu, 06 Jun 2024 17:35:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFH1B-0000000AmXU-3s1N
	for linux-mtd@bombadil.infradead.org;
	Thu, 06 Jun 2024 17:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CUuCxid6NILsuNvzm9Fa8Mpc8mnuooImrZQ0s/si8+0=; b=vkgQUxYJqrqHzin18vhLDhkJ4H
	ilT/zVt61XIUsvBynMz7krPwu25lG6zLlrCsxZvKUpFQbCDXoRikrR5c/z9bZujcGMMKRCyRZHAnm
	aOCZkG9ZPgiC9pEG5AdWPuV7TNF4kBkN0gBIuuz3gtZ+kEM4Jlg4jKZ8PcFZDu1F97NCHXUkoM9fq
	G9jxOP+kzL38dz958BjMfTjffpoKOE6wiaRNDfSgLHxmfMVK/Jr8YQgvGWxMiTReRqCbbXAhLro7m
	QM8R7Gb3aesRaReb25mxzd+28DG5iVzeGzbBNvCYHoxv3PTCLfhmrm3ivibSipfady1tf8np1so72
	YCIui8kQ==;
Received: from www530.your-server.de ([188.40.30.78])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFH18-00000001g0h-3dur
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 17:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CUuCxid6NILsuNvzm9Fa8Mpc8mnuooImrZQ0s/si8+0=; b=YIMRUiFyJNP4LtyC2Zz0njPusb
	6MUnjSmeRNscKJwJrMmBrHRnpon1Cgz7Cn8KEwkebwcL1vh5gf2G3j9pMGGega55FToZdPeziCvCh
	obDd33IkMMavputh8MWl4EMDapomp6o/mdoRY8migmuwuSuFi3TSLW+21zyK+/9JhynVgd7y2Mk8d
	862AkSqVarEEmGYP3/pY0h4Nx3HCzk4vaX9NHTR5dafRvWav361qPlMPsGkVpfQbB0tPcITvYj20P
	zD8pMoz4+L9YFsQ7KR4bofFRUMhHidUAoSlT5JRNg+g1cr9Au/ITNxNg437EZmxe0N8DttoDHPS+e
	DhiVlRaA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sFH15-0004DR-6T; Thu, 06 Jun 2024 19:35:07 +0200
Received: from [80.62.117.184] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sFH11-00019h-1M;
	Thu, 06 Jun 2024 19:35:07 +0200
From: Esben Haabendal <esben@geanix.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Miquel Raynal" <miquel.raynal@bootlin.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  "Rasmus Villemoes"
 <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH] mtd: spi-nor: macronix: workaround for device id re-use
In-Reply-To: <D1SZA4ZDM06P.CJC0EQ9ULA04@kernel.org> (Michael Walle's message
	of "Thu, 06 Jun 2024 15:45:20 +0200")
References: <20240524-macronix-mx25l3205d-fixups-v1-1-ee152e56afb3@geanix.com>
	<D1Q7BU6PJ356.1CTXPUZE8U6XX@kernel.org>
	<8513a828-6669-4bf3-91d3-799771866f32@linaro.org>
	<D1SZA4ZDM06P.CJC0EQ9ULA04@kernel.org>
Date: Thu, 06 Jun 2024 19:35:06 +0200
Message-ID: <87msny9dpx.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27298/Thu Jun  6 10:30:08 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_183515_200011_1C014901 
X-CRM114-Status: GOOD (  21.60  )
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

"Michael Walle" <mwalle@kernel.org> writes:

>> >> + */
>> >> +static int
>> >> +mx25l3205d_late_init(struct spi_nor *nor)
>> >> +{
>> >> +	struct spi_nor_flash_parameter *params = nor->params;
>> >> +
>> >> +	/*                          DREAD  2READ  QREAD  4READ
>> >> +	 *                          1-1-2  1-2-2  1-1-4  1-4-4
>> >> +	 * Before SFDP parse          1      0      1      0
>> >> +	 * 3206e after SFDP parse     1      0      0      0
>> >> +	 * 3233f after SFDP parse     1      1      1      1
>> >> +	 * 3205d after this func      0      1      0      0
>> >> +	 */
>> >> +	if ((params->hwcaps.mask & SNOR_HWCAPS_READ_1_1_4) &&
>> >> +	    !(params->hwcaps.mask & SNOR_HWCAPS_READ_1_4_4)) {
>> >> +		/* Should be MX25L3205D */
>> >> +		params->hwcaps.mask &= ~SNOR_HWCAPS_READ_1_1_2;
>> >> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
>> >> +					  0, 0, 0, 0);
>> >> +		params->hwcaps.mask &= ~SNOR_HWCAPS_READ_1_1_4;
>> >> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_4],
>> >> +					  0, 0, 0, 0);
>> >> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_2_2;
>> >> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_2_2],
>> >> +					  0, 4, SPINOR_OP_READ_1_2_2,
>> >> +					  SNOR_PROTO_1_2_2);
>> >> +	}
>> >> +
>> >> +	return 0;
>> >> +}
>> >> +
>> >> +static const struct spi_nor_fixups mx25l3205d_fixups = {
>> >> +	.late_init = mx25l3205d_late_init,
>> >> +};
>> >> +
>> >>  static int
>> >>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>> >>  			    const struct sfdp_parameter_header *bfpt_header,
>> >> @@ -61,7 +118,8 @@ static const struct flash_info macronix_nor_parts[] = {
>> >>  		.id = SNOR_ID(0xc2, 0x20, 0x16),
>> >>  		.name = "mx25l3205d",
>> >>  		.size = SZ_4M,
>> >> -		.no_sfdp_flags = SECT_4K,
>> >> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>> >> +		.fixups = &mx25l3205d_fixups
>> >>  	}, {
>> >>  		.id = SNOR_ID(0xc2, 0x20, 0x17),
>> >>  		.name = "mx25l6405d",
>> >>
>>
>> If all support 1-1-2, (seems MX25L3205D doesn't), then we may have a
>> change to don't update the core.
>>
>> Frankly I don't care too much about what happens in the manufacturer
>> drivers, but I do care about the core and to not extend it with . This
>> patch is not too heavy to be unmaintainable and shows clear where the
>> problem is, we can keep this as well.
>
> It's a horrible hack. For example I'm working on a patch to clean up
> the spi_nor_set_read_settings() handling. So just throwing any code
> into vendor drivers doesn't make it any better in terms of
> maintainability. I'd need to touch all the code anyway. In fact it
> makes it even worse, because it looks like the manufacturer drivers
> are just a dumping ground for bad things. Thus, I'd really have it
> handled in a correct way inside the core.
>
> Also, this is not device specific. Let there be two different
> flashes with the same ID, but one support SFDP and one doesn't.
> Right now, you have to have any of the magic flags (dual, quad,
> etc) set to trigger an SFDP parsing. If the flash without SFDP
> doesn't support any of these, like in this case, we are screwed.
> Hence we might need such a flag also for other flashes.

Also, it is not very obvious that you can trigger SFDP parsing by
setting these dual/quad bits.  Having an explicit flag to cause this
behvaiour would be much better IMHO.

>> Other option that I'd like you to consider is whether we just remove
>> support for MX25L3205D, thus the entry altogether, and instead rely on
>> SFDP to set everything.
>
> Well, this will break boards with this flash :) And we don't know if
> there are any.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
