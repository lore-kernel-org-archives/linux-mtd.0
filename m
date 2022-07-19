Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AE2C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jul 2022 07:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BNfeOCGMBzHTIg31gb0v7RJjdmpdQKJ4BzCz/3j/AA=; b=D7Qs5pcGFkmDiAlnLkTEWTQdFp
	SiSMolx5s3AZjM3yMuq3IkMM36B6yd7JL2Enqi6XCvRaFgd8uxnIO9rTOg2bQ62Q4jvlCDvpzmXQg
	sKoL0IsZIxpgcuMT3ryyBlIHA9Emoy4BZEc9819mCt4xzWNeS9wgeoIuW1u0OZHpHkFdgrA9it+vn
	WyrIUv6wj8qJSh68VDiyXp+riLZ1lNyU0j1o4JYpSIEKmm2XMtcmPLLZKYgPLAn41OmRap8ilxEat
	oLbI7/nurfuvNM/zZ6b6lUzX9ec9hl8bc7bGFdgn8Oi0Dj71oeH0/fk3eyQ9vWYxp15VACppsCVM6
	B3MeDpfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDi6r-0066yf-7V; Tue, 19 Jul 2022 07:57:37 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDi6n-0066wB-9r
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2022 07:57:35 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 36B0B221D4;
	Tue, 19 Jul 2022 09:57:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658217451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QN1+cOUealxzJ82/ApZPg7+rBCRm/zOrfFuK3gYV4x0=;
	b=B78JOIFk4aAxZ3zSgwdndiA9ITHhOTLkmsZi0MRvXTIu4e2f3U+K4LDD0x9iJbCeY6hhza
	cGPGZmuVC3pvtHkJp8HmPamrLfthwioZ/sshUpfGP2wg13Akl8h3mIYhs86RXUnWKHYkrY
	CmjRuMMw2wkEp5pjXziqXbXjDSz9xpE=
MIME-Version: 1.0
Date: Tue, 19 Jul 2022 09:57:31 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
In-Reply-To: <7365146d-b001-2a14-014d-62a6b19f4381@microchip.com>
References: <20220510140232.3519184-1-michael@walle.cc>
 <20220510140232.3519184-2-michael@walle.cc>
 <160ddac1-6d0a-c922-1380-09e7823a285e@microchip.com>
 <02125e047cfbf347d81811224be3141e@walle.cc>
 <7365146d-b001-2a14-014d-62a6b19f4381@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <1a1b1bf3f8ea7a27afb6e85e0ecabbbc@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_005733_535962_95431F10 
X-CRM114-Status: GOOD (  22.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-07-19 09:33, schrieb Tudor.Ambarus@microchip.com:
> On 7/19/22 10:07, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Am 2022-07-19 07:57, schrieb Tudor.Ambarus@microchip.com:
>>> On 5/10/22 17:02, Michael Walle wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you 
>>>> know
>>>> the content is safe
>>>> 
>>>> Up until now, flashes were defined by specifying the JEDEC ID, the
>>>> sector size and the number of sectors. This can be read by parsing 
>>>> the
>>>> SFDP, we don't have to specify it. Thus provide a new macro 
>>>> SNOR_ID3()
>>>> which just takes the JEDEC ID and implicitly set .parse_sfdp = true.
>>>> All
>>>> new flashes which have SFDP should use this macro.
>>> 
>>> I like the idea, but you need to refine it a bit.
>>> Your assumptions are true only for flashes that are compliant with 
>>> SFDP
>>> revB or
>>> later because params->page_size is initialized by querying BFPT DWORD
>>> 11. I think it would be good to specify this in the comment section.
>> 
>> Sure.
>> 
>>> Also, I think you introduce
>>> a bug in spi_nor_select_erase() when 
>>> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>>> is not
>>> selected. wanted_size will be zero, will you select an invalid erase
>>> type?
>> 
>> You mean to squeeze [1] into this one? If so, sure.
>> 
>> -michael
>> 
>> [1]
>> https://lore.kernel.org/linux-mtd/20220716000643.3541839-1-quic_jaehyoo@quicinc.com/
> 
> No, these are orthogonal. If you keep wanted_size to zero, then
> spi_nor_select_uniform_erase() will return NULL, doesn't it?

No, have a look at the second condition

if (!erase && tested_erase->size)
   erase = ..

So it will return the first non-empty slot. Thus it will
only return NULL if all the slots are empty (given the
fix is included).

Actually, I'd have expected that to mask out an erase
type, you clear the corresponding bit in uniform_erase_type,
in which case the for loop in spi_nor_select_uniform_erase()
would have just worked. But apparently there are two differnt
mechanism here to mark an entry as unused, either the size
is zero or the bit is not set. But that is a topic for another
patch.

-michael

> Maybe to adapt the code to something like
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 21cefe2864ba..dd6cd852d1ef 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2148,7 +2148,7 @@ static int spi_nor_select_erase(struct spi_nor 
> *nor)
>         struct spi_nor_erase_map *map = &nor->params->erase_map;
>         const struct spi_nor_erase_type *erase = NULL;
>         struct mtd_info *mtd = &nor->mtd;
> -       u32 wanted_size = nor->info->sector_size;
> +       u32 wanted_size = nor->params->sector_size;
> 
> and fill nor->params->sector_size even when no SFDP
> 
> Also, params->size = (u64)info->sector_size * info->n_sectors; from
> spi_nor_init_default_params() becomes superfluous. I would check
> the fields that I don't initialize in flash_info with SNOR_ID3
> and check how I can mitigate their absence throughout the code.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
