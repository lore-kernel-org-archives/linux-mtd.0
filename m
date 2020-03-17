Return-Path: <SRS0=BLjR=5C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8C0C10F29
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2020 11:36:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B19620714
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2020 11:36:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uC76zDye";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kCTQ8ewU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B19620714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x26aqXSt314A6jkpYYW9QQH/XRT2zjJiz6wZy+0noso=; b=uC76zDyeOlIDLV
	Z5/aEnx8tiTxawtbhj6NQfILuiyahahcmMRSdqvHINkJKNE1UftSsLVz1GnFbC0Vfh6oQh4ko6PrM
	1cCd4OIzZqrjI8ouaTH631xaNUIHJ0NjdUyPELGM7YSaZG+ygOvXU1sNuyLH5sOEPhe2rWIIa9Rkk
	viN94ceClUK+mw3abS3rynjssmi7lEijakbKL7ER81VeeTVEgiPcGMqCxJ75wbCZ4IlA4/v1OJ5NI
	2H3K+Mr0Vz3fNIO0C0MJThcU60FZSUFADFfNFBpq1PTta1J7XFcba4Cli00uvcS0RRZ9IpPQR5M6f
	5CaCVf14wNUs6Yc+btPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEAW3-0005Pa-16; Tue, 17 Mar 2020 11:36:11 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEAVz-0005Ox-46
 for linux-mtd@lists.infradead.org; Tue, 17 Mar 2020 11:36:09 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200317113603epoutp0370cf6ddc2c14fe29f759c33f7f73e72b~9FEygLtfl1911419114epoutp03l
 for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2020 11:36:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200317113603epoutp0370cf6ddc2c14fe29f759c33f7f73e72b~9FEygLtfl1911419114epoutp03l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584444963;
 bh=ZM25DDXa04cFS+QQ6x0MYoVuP14Lw2E4XZNe44lGGmo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=kCTQ8ewUlGKKj6s7XiiMhP10O4NdFaxZffOgTZNjobq0nF7Sy6YVV//3lZZzQhwqJ
 yC5GnLqdV3DeWWXGCx05sPXvLpDtUCxXVM6xcLVKRorRyCaR4CAj62ALEx2wr7UXzT
 WBR/BaM10k3bY2kVcEMYkYBfFEXNrEpfHuoUchp8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200317113602epcas1p1683517562681553e2f8ecafee43ca468~9FEx0MFrz1064110641epcas1p1u;
 Tue, 17 Mar 2020 11:36:02 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.163]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48hWMN1TDFzMqYkY; Tue, 17 Mar
 2020 11:36:00 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 30.61.04074.026B07E5; Tue, 17 Mar 2020 20:36:00 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200317113559epcas1p40a489b959e71b33e2302820e1558ea94~9FEvK-3JE2931129311epcas1p4X;
 Tue, 17 Mar 2020 11:35:59 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200317113559epsmtrp253e080735ff65d9b48a1eedb715a0a01~9FEvKJhWF2004520045epsmtrp2g;
 Tue, 17 Mar 2020 11:35:59 +0000 (GMT)
X-AuditID: b6c32a39-58bff70000000fea-7a-5e70b620cdc9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F0.3A.04024.F16B07E5; Tue, 17 Mar 2020 20:35:59 +0900 (KST)
Received: from asdf (unknown [10.88.100.192]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200317113559epsmtip20a702001c932e919861a6c744c19c452~9FEu8OpCJ1695616956epsmtip2S;
 Tue, 17 Mar 2020 11:35:59 +0000 (GMT)
Message-ID: <f63aebbd17eba621e0cd6852743cc0b282dbdefd.camel@samsung.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: add 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: Michael Walle <michael@walle.cc>
Date: Tue, 17 Mar 2020 20:35:59 +0900
In-Reply-To: <b3e7a00fb5014efefc7214e12883deb77e3ae02f.camel@samsung.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SWUwTYRDO3227i7FmLR4jPljXI4ACLaW4HhBE0iyCkeiL0aS4aTdA7LF2
 WyMaIxqCBgXpgwdVFAQ0NlFAsVKVqJigIioxhsMDlBofjNQDFQlBbLs1+vbN/N8338z8Q2DK
 8/IYosjq4OxW1kzJp0m99+OSElRe3qD+PkzQfb0vED15JiChhwcmZPStgxdweuRxM05/bcig
 p558wTNwxud+gzP+mhacudawn3n9qxExla0exDzovyFh7raXyvPwreY1hRxr4uwqzmq0mYqs
 BWlUzub8dfm6VLUmQbOSXkGprKyFS6OycvMS9EXmYD+UahdrdgZTeawgUEnpa+w2p4NTFdoE
 RxrF8SYzr1HziQJrEZzWgkSjzbJKo1Yn64LM7eZCz6txxHu37B4ca5SUoNHV5SiKADIFXGer
 pSGsJNsQ+Kf05WhaEH9D0DnYIxGDnwiu9/bhfxVVVeW4+NCO4OGBASQGwwhaTh8I11KQDHwY
 OikL4eggPvXsXVgtJ+Ohf+JqOD+LXAz+0Z6wGCO7ENy74w6SCEJKLoH66rkhThSZDd114xHn
 5TDSVSkNURTkTJhsiw6lMXIB3Bg5g4XKAOmXw7Gy+zKRnwUljZ1SEUfDxwetkToxMBpol4tY
 AN8lFy6KSxEMX2yIkLQQGLmMhcwwMg6abiaJ6YXgm6hBovEMCPw4KgtRgFTA4TKlSKHg09vS
 iC1Aj78i0g4DQ8/H5eKuPBKoezmKqpDK/W8c93/juP8Z1yLMg+ZwvGAp4AQNr/v/g6+i8H3G
 r2xDnU9zOxBJIGq6gmjmDUoZu0sotnQgIDBqlqJ+p82gVJjY4j2c3ZZvd5o5oQPpgrt2YTGz
 jbbgtVsd+RpdslarpVNSV6TqtNRcxfE+s0FJFrAObgfH8Zz9r05CRMWUIA+urFncmtM32WzY
 mFK5715i58Shflf6fP2nzLGWn/6K9/MeKeqSTRd8uT3V+qzYo/imyZN7i0/sceUYfQPTj/De
 zM/W7zNuX9ryO3tw/VheU3UgVvIo8936qUBFrRGH7Cv1U86M3ZuWXl4k1x++fa7Fwq4t23Br
 rHuO17ct1pW+jJIKhawmHrML7B+DUAjMtQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsWy7bCSvK78toI4g6Wr5S2uX7vCaPF3zjsm
 i0c3f7Na7G5axm7x9vQGdouPSxws/p/9wO7A7rFz1l12j8dzN7J7bF5S73Hnx1JGj74tqxg9
 jt/YzuRxYG8LWwB7FJdNSmpOZllqkb5dAlfGqts/GQu2RVTc+76UqYHxs3UXIyeHhICJxIQJ
 XexdjFwcQgK7GSUerjjBBJGQkHi08wtLFyMHkC0scfhwMUTNA0aJE5POsIHU8Ap4SDy7P50V
 xBYGsmecf8gOYrMJaEnc+L0JLC4ioCLx+PMFRpBmZoFTjBK7t+9gBhnKIqAqsXimOEgNp4Cn
 xJmFP6GOWMckcWbJXLBBzAKaEq3bf7NDHKQj8fZUH9hBvAKCEn93CEOUyEtsfzuHeQKj4Cwk
 HbMQqmYhqVrAyLyKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4KrQ0dzBeXhJ/iFGA
 g1GJhzdhU0GcEGtiWXFl7iFGCQ5mJRHexYX5cUK8KYmVValF+fFFpTmpxYcYpTlYlMR5n+Yd
 ixQSSE8sSc1OTS1ILYLJMnFwSjUwBotu+3gwPZu1ZbZWwdcjPfoTj3IL9q6ptZH/y1K0+6Vo
 +zxd5vzGI8tCM88pm8lWzd/6wNfU6or92v3sjXo5XRv3HjiU9W+j+rnDYV1f1+4Wm8f2uiJT
 7OmGlrUnpiWK/50S7eDo+WvzirQ5IZv9tR51115YUNX74rRD1D6xtefS6plrLi+5qcRSnJFo
 qMVcVJwIABg1E/KGAgAA
X-CMS-MailID: 20200317113559epcas1p40a489b959e71b33e2302820e1558ea94
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200304110833epcas1p42958d6dce0081afabfdd4200258eddb8
References: <20200304110800.20658-1-js07.lee@samsung.com>
 <CGME20200304110833epcas1p42958d6dce0081afabfdd4200258eddb8@epcas1p4.samsung.com>
 <20200304110800.20658-2-js07.lee@samsung.com>
 <ab18ece8973dbf89448d2070a78ff50b@walle.cc>
 <b3e7a00fb5014efefc7214e12883deb77e3ae02f.camel@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_043607_588073_F7093986 
X-CRM114-Status: GOOD (  38.70  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 chenxiang <chenxiang66@hisilicon.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Micahel

On Tue, 2020-03-17 at 20:00 +0900, Jungseung Lee wrote:
> Hi, Michael,
> 
> On Fri, 2020-03-13 at 17:24 +0100, Michael Walle wrote:
> > Hi Jungseung,
> > 
> > sorry for the late review.
> > 
> 
> Not at all. thanks for your review.
> 
> > Am 2020-03-04 12:07, schrieb Jungseung Lee:
> > > Currently, we are supporting block protection only for
> > > flash chips with 3 block protection bits in the SR register.
> > > This patch enables block protection support for flashes with
> > > 4 block protection bits(bp0-3).
> > > 
> > > Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> > > ---
> > >  drivers/mtd/spi-nor/spi-nor.c | 82
> > > ++++++++++++++++++++++++++++++++---
> > >  include/linux/mtd/spi-nor.h   |  4 ++
> > >  2 files changed, 79 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/spi-nor/spi-nor.c 
> > > b/drivers/mtd/spi-nor/spi-nor.c
> > > index c58c27552a74..31a2106e529a 100644
> > > --- a/drivers/mtd/spi-nor/spi-nor.c
> > > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > > @@ -238,6 +238,14 @@ struct flash_info {
> > >  					 * status register. Must be
> > > used with
> > >  					 * SPI_NOR_HAS_TB.
> > >  					 */
> > > +#define SPI_NOR_4BIT_BP		BIT(17)	/*
> > > +					 * Flash SR has 4 bit fields
> > > (BP0-3)
> > > +					 * for block protection.
> > > +					 */
> > > +#define SPI_NOR_BP3_SR_BIT6	BIT(18)	/*
> > > +					 * BP3 is bit 6 of status
> > > register.
> > > +					 * Must be used with
> > > SPI_NOR_4BIT_BP.
> > > +					 */
> > > 
> > >  	/* Part specific fixup hooks. */
> > >  	const struct spi_nor_fixups *fixups;
> > > @@ -1786,7 +1794,16 @@ static int spi_nor_erase(struct mtd_info
> > > *mtd,
> > > struct erase_info *instr)
> > > 
> > >  static u8 spi_nor_get_bp_mask(struct spi_nor *nor)
> > >  {
> > > -	return SR_BP2 | SR_BP1 | SR_BP0;
> > > +	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> > > +
> > 
> > can we just use the SR_BP3 eg:
> > 
> > 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> > 	if (nor->flags & SNOR_F_HAS_4BIT_BP)
> > 		mask |= SR_BP3;
> > 	return mask;
> > 
> > 
> 
> I'd prefer this one too if we can, but there are some places to need
> the real mask value. It is also used in other places such as
> spi_nor_sr_lock/unlock.
> 
> > > +	if (nor->flags & SNOR_F_HAS_4BIT_BP) {
> > > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> > > +			mask = mask | SR_BP3_BIT6;
> > > +		else
> > > +			mask = mask | SR_BP3_BIT5;
> > > +	}
> > > +
> > > +	return mask;
> > >  }
> > > 
> > >  static u8 spi_nor_get_tb_mask(struct spi_nor *nor)
> > > @@ -1797,12 +1814,26 @@ static u8 spi_nor_get_tb_mask(struct
> > > spi_nor 
> > > *nor)
> > >  		return SR_TB_BIT5;
> > >  }
> > > 
> > > +static u8 stm_get_bpval_from_sr(struct spi_nor *nor, u8 sr) {
> > > +	u8 mask = spi_nor_get_bp_mask(nor);
> > > +	u8 bp = sr & mask;
> > > +
> > > +	if (bp & SR_BP3_BIT6)
> > > +		bp = (bp & ~BIT(6)) | BIT(5);
> > > +
> > > +	bp = bp >> SR_BP_SHIFT;
> > > +
> > > +	return bp;
> > > +}
> > 
> > Don't convert this. It makes the code really hard to read. See
> > below.
> > 
> > > +
> > >  static int stm_get_min_prot_length(struct spi_nor *nor)
> > >  {
> > >  	int bp_slots, bp_slots_needed;
> > > -	u8 mask = spi_nor_get_bp_mask(nor);
> > > 
> > > -	bp_slots = (mask >> SR_BP_SHIFT) + 1;
> > 
> > Then just keep this.
> > 
> > > +	if (nor->flags & SNOR_F_HAS_4BIT_BP)
> > > +		bp_slots = 1 << 4;
> > > +	else
> > > +		bp_slots = 1 << 3;
> > > 
> > >  	/* Reserved one for "protect none" and one for "protect all".
> > > */
> > >  	bp_slots = bp_slots - 2;
> > > @@ -1821,9 +1852,8 @@ static void stm_get_locked_range(struct
> > > spi_nor
> > > *nor, u8 sr, loff_t *ofs,
> > >  {
> > >  	struct mtd_info *mtd = &nor->mtd;
> > >  	int min_prot_len;
> > > -	u8 mask = spi_nor_get_bp_mask(nor);
> > >  	u8 tb_mask = spi_nor_get_tb_mask(nor);
> > > -	u8 bp = (sr & mask) >> SR_BP_SHIFT;
> > > +	u8 bp = stm_get_bpval_from_sr(nor, sr);
> > 
> > also this.
> > 

hmm, it looks like we still need some convertion here to get the exact
bp value.

Thanks,

> > > 
> > >  	if (!bp) {
> > >  		/* No protection */
> > > @@ -1881,7 +1911,7 @@ static int stm_is_unlocked_sr(struct
> > > spi_nor
> > > *nor, loff_t ofs, uint64_t len,
> > > 
> > >  /*
> > >   * Lock a region of the flash. Compatible with ST Micro and
> > > similar 
> > > flash.
> > > - * Supports the block protection bits BP{0,1,2} in the status
> > > register
> > > + * Supports the block protection bits BP{0,1,2}/BP{0,1,2,3} in
> > > the
> > > status register
> > >   * (SR). Does not support these features found in newer SR
> > > bitfields:
> > >   *   - SEC: sector/block protect - only handle SEC=0 (block
> > > protect)
> > >   *   - CMP: complement protect - only support CMP=0 (range is
> > > not 
> > > complemented)
> > > @@ -1889,7 +1919,7 @@ static int stm_is_unlocked_sr(struct
> > > spi_nor
> > > *nor, loff_t ofs, uint64_t len,
> > >   * Support for the following is provided conditionally for some
> > > flash:
> > >   *   - TB: top/bottom protect
> > >   *
> > > - * Sample table portion for 8MB flash (Winbond w25q64fw):
> > > + * Sample table portion for 8MB flash (Winbond w25q64fw / BP0-
> > > 2):
> > >   *
> > >   *   SEC  |  TB   |  BP2  |  BP1  |  BP0  |  Prot Length  |
> > > Protected 
> > > Portion
> > >   *  
> > > -----------------------------------------------------------------
> > > ---------
> > > @@ -1909,6 +1939,32 @@ static int stm_is_unlocked_sr(struct
> > > spi_nor
> > > *nor, loff_t ofs, uint64_t len,
> > >   *    0   |   1   |   1   |   0   |   1   |  2 MB         |
> > > Lower
> > > 1/4
> > >   *    0   |   1   |   1   |   1   |   0   |  4 MB         |
> > > Lower
> > > 1/2
> > >   *
> > > + * Sample table portion for 64MB flash (Micron n25q512ax3 / BP0-
> > > 3):
> > > + *
> > > + *   TB   |  BP3  |  BP2  |  BP1  |  BP0  |  Prot Length  |
> > > Protected 
> > > Portion
> > > + *  
> > > -----------------------------------------------------------------
> > > ---------
> > > + *    0   |   0   |   0   |   0   |   0   |  NONE         | NONE
> > > + *    0   |   0   |   0   |   0   |   1   |   64 KB       |
> > > Upper 
> > > 1/1024
> > > + *    0   |   0   |   0   |   1   |   0   |  128 KB       |
> > > Upper 
> > > 1/512
> > > + *    0   |   0   |   0   |   1   |   1   |  256 KB       |
> > > Upper 
> > > 1/256
> > > + *   ...
> > > + *    0   |   1   |   0   |   0   |   1   |  16 MB        |
> > > Upper
> > > 1/4
> > > + *    0   |   1   |   0   |   1   |   0   |  32 MB        |
> > > Upper
> > > 1/2
> > > + *    0   |   1   |   0   |   1   |   1   |  64 MB        | ALL
> > > + *    0   |   1   |   1   |   0   |   0   |  64 MB        | ALL
> > > + *   ...
> > > + *  
> > > ------|-------|-------|-------|-------|---------------|----------
> > > ---------
> > > + *    1   |   0   |   0   |   0   |   0   |   NONE        | NONE
> > > + *    1   |   0   |   0   |   0   |   1   |   64 KB       |
> > > Lower 
> > > 1/1024
> > > + *    1   |   0   |   0   |   1   |   0   |  128 KB       |
> > > Lower 
> > > 1/512
> > > + *    1   |   0   |   0   |   1   |   1   |  256 KB       |
> > > Lower 
> > > 1/256
> > > + *   ...
> > > + *    1   |   1   |   0   |   0   |   1   |  16 MB        |
> > > Lower
> > > 1/4
> > > + *    1   |   1   |   0   |   1   |   0   |  32 MB        |
> > > Lower
> > > 1/2
> > > + *    1   |   1   |   0   |   1   |   1   |  64 MB        | ALL
> > > + *    1   |   1   |   1   |   0   |   0   |  64 MB        | ALL
> > > + *   ...
> > > + *
> > >   * Returns negative on errors, 0 on success.
> > >   */
> > >  static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t
> > > len)
> > > @@ -1960,6 +2016,9 @@ static int stm_lock(struct spi_nor *nor,
> > > loff_t
> > > ofs, uint64_t len)
> > >  		min_prot_len = stm_get_min_prot_length(nor);
> > >  		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
> > >  		val = pow << SR_BP_SHIFT;
> > > +
> > > +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> > > +			val = (val & ~BIT(5)) | BIT(6);
> > 
> > .. and the use just the following here:
> > 
> > if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
> > 	val = (val & ~SR_BP3) | SR_BP3_BIT6;
> > 
> > Ie. just use the "normal case" where all BP bits are next to each
> > other
> > and then fixup the resulting value and shift the SR3 bit if
> > necessary.
> > This will be much easier to read.
> > 
> 
> Yes, I agree. It would be better to minimize this kind of conversion
> in
> one place.
> 
> > >  	}
> > > 
> > >  	if (val & ~mask)
> > > @@ -2042,6 +2101,9 @@ static int stm_unlock(struct spi_nor *nor,
> > > loff_t ofs, uint64_t len)
> > >  		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
> > >  		val = pow << SR_BP_SHIFT;
> > > 
> > > +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> > > +			val = (val & ~BIT(5)) | BIT(6);
> > > +
> > 
> > here would be the other way around:
> > 
> > if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
> > 	val = (val & ~SR_BP3_BIT6) | SR_BP3;
> > 
> > 
> > >  		/* Some power-of-two sizes are not supported */
> > >  		if (val & ~mask)
> > >  			return -EINVAL;
> > > @@ -5244,6 +5306,12 @@ int spi_nor_scan(struct spi_nor *nor,
> > > const
> > > char 
> > > *name,
> > >  	if (info->flags & USE_CLSR)
> > >  		nor->flags |= SNOR_F_USE_CLSR;
> > > 
> > > +	if (info->flags & SPI_NOR_4BIT_BP) {
> > > +		nor->flags |= SNOR_F_HAS_4BIT_BP;
> > > +		if (info->flags & SPI_NOR_BP3_SR_BIT6)
> > > +			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
> > > +	}
> > > +
> > >  	if (info->flags & SPI_NOR_NO_ERASE)
> > >  		mtd->flags |= MTD_NO_ERASE;
> > > 
> > > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-
> > > nor.h
> > > index de90724f62f1..0190ed21576a 100644
> > > --- a/include/linux/mtd/spi-nor.h
> > > +++ b/include/linux/mtd/spi-nor.h
> > > @@ -129,7 +129,9 @@
> > >  #define SR_BP1			BIT(3)	/* Block protect
> > > 1
> > > */
> > >  #define SR_BP2			BIT(4)	/* Block protect
> > > 2
> > > */
> > >  #define SR_TB_BIT5		BIT(5)	/* Top/Bottom
> > > protect */
> > > +#define SR_BP3_BIT5		BIT(5)	/* Block protect
> > > 3
> > > */
> > 
> > IMHO just SR_BP3. but that is a matter of taste. But it is easier
> > on
> > the eye in the mask = SR_BP3 | SR_BP2 etc case.
> > 
> 
> SR_BP3 would be a more appropriate name if we could set the case with
> all BP bits next to each other as the "normal case."
> 
> I'm going to write patches based on latest spi-nor/next including
> what
> you mentioned.
> 
> Thanks,
> 
> > -michael
> > 
> > >  #define SR_TB_BIT6		BIT(6)	/* Top/Bottom
> > > protect */
> > > +#define SR_BP3_BIT6		BIT(6)	/* Block protect
> > > 3
> > > */
> > >  #define SR_SRWD			BIT(7)	/* SR write
> > > protect
> > > */
> > >  /* Spansion/Cypress specific status bits */
> > >  #define SR_E_ERR		BIT(5)
> > > @@ -240,6 +242,8 @@ enum spi_nor_option_flags {
> > >  	SNOR_F_HAS_16BIT_SR	= BIT(9),
> > >  	SNOR_F_NO_READ_CR	= BIT(10),
> > >  	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
> > > +	SNOR_F_HAS_4BIT_BP	= BIT(12),
> > > +	SNOR_F_HAS_SR_BP3_BIT6	= BIT(13),
> > > 
> > >  };
> 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
