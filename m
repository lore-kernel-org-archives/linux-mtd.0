Return-Path: <SRS0=9DP4=3M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D7EC33CAA
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 08:54:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CCE421734
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 08:54:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MgNCT0Pg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NJamlHp+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CCE421734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfEyWoOeA9T1yCJrqzFwlxIvMnR5be6PSWIWW75wKiY=; b=MgNCT0PgfOgI2z
	N7O40X+WSYukwAwQKr5SM2rQEWL+jfE9cyR32dGxkDVv5EteLD+2T3psgW72FoSHr9MuwuJHjW4a1
	18hi2xSpahuWHpVR5qgcJZOJ2ma5JR6z7MCOgSou1JR9BrJAFPHRMMXrWoszkhBHRITE5Gu2GZiSx
	ZJNo7jaHSSaloIMp4S5GftTa1TYgGHmpFJaa9bVVrjeOHwYMzgD8yr6kOKenVgKVk/90YJF6Vc8Yb
	KdZCO5gglTMtP2EY1do6okUpM8QRRnMkG5RC51Bw7plTfhMcaPMKR+MtmJCcpTebyV8DBQ+xf2xWC
	GZZRQOagQo5avIXxYodg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuYFJ-0003ku-F7; Thu, 23 Jan 2020 08:53:49 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuYFE-0003kW-MY
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2020 08:53:47 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200123085341epoutp015bfc4f90b4217f7aa64e3df7a03827f2~seBnCd_m21315113151epoutp01x
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2020 08:53:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200123085341epoutp015bfc4f90b4217f7aa64e3df7a03827f2~seBnCd_m21315113151epoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579769621;
 bh=465IuIEuWpgEPvaPHR5T2l8Rl2Wt/T7UymrJaqMe87I=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=NJamlHp+jwp/avyw8ELESimyEzJLgCrdFx5yNGYLCks8HBJsVP6GUOKrnpsD+blFt
 D8cefxiy4APvoWFIXQsiHBI74TjNELffthTgDnHwwW+GUixvjV/+L2NzxzSFtVIdQH
 HSWY6yYT1TTruY9Nxgtx5yGaVwVnb7eBRkqNIOto=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200123085340epcas1p4b95d2a72d4b45e624575c52bcf6b6e49~seBma_LSs0255702557epcas1p4T;
 Thu, 23 Jan 2020 08:53:40 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.161]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 483GJz5L13zMqYkV; Thu, 23 Jan
 2020 08:53:39 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 15.DC.52419.31F592E5; Thu, 23 Jan 2020 17:53:39 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200123085338epcas1p1a1dd03c18366aa965a0199aa6828c1c6~seBkx4_sE1762317623epcas1p1T;
 Thu, 23 Jan 2020 08:53:38 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200123085338epsmtrp1bffa7dec94d4c3efba1ce55dd43495dd~seBkxSg3g0901609016epsmtrp1B;
 Thu, 23 Jan 2020 08:53:38 +0000 (GMT)
X-AuditID: b6c32a37-5b7ff7000001ccc3-b6-5e295f13f6b7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 14.ED.10238.21F592E5; Thu, 23 Jan 2020 17:53:38 +0900 (KST)
Received: from ara-VirtualBox (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200123085338epsmtip1fbb4b78928b300b2798543038a4a4a75~seBkmp_Q50419504195epsmtip1J;
 Thu, 23 Jan 2020 08:53:38 +0000 (GMT)
Message-ID: <7843bb76c9c3854a4b9fa4b2b69d760e965bbb22.camel@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: Michael Walle <michael@walle.cc>
Date: Thu, 23 Jan 2020 17:53:38 +0900
In-Reply-To: <f4581c4cb231cc4c61b9a146dda5fada@walle.cc>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTYRT32912Z7W4TavDIprXymZNd51zMzQETRaJDArJINfNfai4F7sz
 MnqMtFFiPhAKzKJyKkZRqKQWYkxDKHrQg4SyNLFInPYyipC6253Yf79zzu/3nd8535ERinqp
 Ulbm8GC3g7XR0mXiO0NqjSbGoi7Seh8kGBdaZkXGe6faSWPw0W3S+NWfZfz7+AuZJTH1N4+R
 pm7/SdPbX23INDLaKzLdH6iWmiX7bRmlmLVitwo7ip3WMkdJJr17jyXbok/TMhom3WigVQ7W
 jjPpnDyzJrfMxvemVYdZWwWfMrMcRyfvyHA7KzxYVerkPJk0dlltLkbrSuJYO1fhKEkqdtq3
 M1ptip5nHrSVTl3+Qbjm69GR8amfhBfVFtegaBlQqdDeNCEOYQXVh+B0YFcNWsbjbwiueVtJ
 IfiJ4PmZG+Si4tvQkEgoDCCYG26RCsEMgjG/F4VYcsoEDf4aSQjHULvhYl1QGsJSKhFG/3SF
 87HURpj8/izMJygML6q7w1hMbYKmutdhTjRlhLaRsxKh8zYIPqzjvcr491fBQl+MIN0AvcEW
 IuQBqGEpjL0cJAR+DtR0tURcx8D0SE8EK+FzvS+COejvbCQFcTWCDx3+SEEHs8GbRKgZQanh
 1t1kIR0H/X8uRTyvhNn5WkmIApQczvgUAoWGmfFqsYABnk2ei9g3QffH84SwK78Irn66ixqQ
 qnlpnOb/xmleanwFEdfRGuzi7CWYY1y6/3+4C4WPMdHQh24/yQsgSoboFfKs9C1FCgl7mKu0
 BxDICDpWjgrURQq5la08it1Oi7vChrkA0vPLbiSUq4ud/Gk7PBZGn6LT6YypaYY0vY5eK58o
 5EVUCevB5Ri7sHtRJ5JFK70oQ38pIb0ptfXCvZmqlLryzqcFjle583jXHm9qw4E4qtO3mRme
 r39UmEcvaLLzj71JWFc21DrtjFenmLPimMqdr3wEmcGRPwaPT+X8nluPmCO5N5XvxVWzgQkq
 9tDOOOe6777EnMn4clNVVHmH4YR2+b6+fMXereaodz1WxnCdFnOlLJNIuDn2H74yiwaiAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWy7bCSnK5QvGacwa4vhhZ/57xjstjdtIzd
 4u3pDewWH5c4WPw/+4HdgdVj56y77B6bl9R73PmxlNHj+I3tTB4H9rawBbBGcdmkpOZklqUW
 6dslcGU8nfeFueBrP2PFg6ffmBsYe5K7GDk5JARMJD4dPszUxcjFISSwm1Fi8vfDLBAJCYlH
 O78A2RxAtrDE4cPFEDWvGCU+HDvCDFLDK+AhMWFJFyuILSzgLTG77y0biM0moCVx4/cmsLiI
 gIrE488XGEFsZoE0ifV9W9lBbBYBVYnJfdfBajgFLCSWHu9khViwgkli37pl7BANmhKt23+z
 QxykI/H2VB/YQbwCghJ/dwhDlMhLbH87h3kCo+AsJB2zEKpmIalawMi8ilEytaA4Nz232LDA
 MC+1XK84Mbe4NC9dLzk/dxMjONy1NHcwXl4Sf4hRgINRiYfXwVIjTog1say4MvcQowQHs5II
 L2OYZpwQb0piZVVqUX58UWlOavEhRmkOFiVx3qd5xyKFBNITS1KzU1MLUotgskwcnFINjGmV
 Rf0y9u8iS/64aK/6Uft1xf1D7T+MZbvTWoXFX4W/0f7+5uuKpS+jGhk071tfcOLQfvurw3NV
 ywR1N8ndArJPqi6Z1/ZFXH2kHLbl9s+GBJXur2f2Nfybeqt468PTa+/ov5/B5rD2T738zghT
 95+8r+XOfr/Gf/tlxzbDXyvTNJ+lsTMHVSqxFGckGmoxFxUnAgCjLCxQcwIAAA==
X-CMS-MailID: 20200123085338epcas1p1a1dd03c18366aa965a0199aa6828c1c6
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200122193640epcas1p2e8df0b73bdf6c6389709148702082aef
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <CGME20200122193640epcas1p2e8df0b73bdf6c6389709148702082aef@epcas1p2.samsung.com>
 <20200122193608.3859-1-michael@walle.cc>
 <0c4e70fcf58c93f9b7375d83b50028df225aed82.camel@samsung.com>
 <f4581c4cb231cc4c61b9a146dda5fada@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_005345_286511_0413718A 
X-CRM114-Status: GOOD (  41.04  )
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
Cc: tudor.ambarus@microchip.com, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 js07.lee@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Michael

2020-01-23 (Thu), 09:10 +0100, Michael Walle:
> Hi Jungseung,
> 
> Am 2020-01-23 07:22, schrieb Jungseung Lee:
> > Hi, Michael
> > 
> > 2020-01-22 (Wed), 20:36 +0100, Michael Walle:
> > > Hi,
> > > 
> > > > Currently, we are supporting block protection only for
> > > > flash chips with 3 block protection bits in the SR register.
> > > > This patch enables block protection support for some flash with
> > > > 4 block protection bits(bp0-3).
> > > > 
> > > > Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> > > > ---
> > > > v3 :
> > > >   Fix wrong ofs calculation on v2 patch
> > > > v2 :
> > > >   Add sample table portion about 4bit block protection on the
> > > > comment
> > > >   Trivial coding style change
> > > > 
> > > >  drivers/mtd/spi-nor/spi-nor.c | 127
> > > > +++++++++++++++++++++++++++++-
> > > > ----
> > > >  include/linux/mtd/spi-nor.h   |   8 +++
> > > >  2 files changed, 119 insertions(+), 16 deletions(-)
> > > > 
> > > > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-
> > > > nor/spi-nor.c
> > > > index e3da6a8654a8..7e8af6c4fdfa 100644
> > > > --- a/drivers/mtd/spi-nor/spi-nor.c
> > > > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > > > @@ -238,6 +238,14 @@ struct flash_info {
> > > >  					 * status register.
> > > > Must be
> > > > used with
> > > >  					 * SPI_NOR_HAS_TB.
> > > >  					 */
> > > > +#define SPI_NOR_HAS_BP3		BIT(17)	/*
> > > > +					 * Flash SR has 4 bit
> > > > fields
> > > > (BP0-3)
> > > > +					 * for block
> > > > protection.
> > > > +					 */
> > > > +#define SPI_NOR_BP3_SR_BIT6	BIT(18)	/*
> > > > +					 * BP3 is bit 6 of
> > > > status
> > > > register.
> > > > +					 * Must be used with
> > > > SPI_NOR_HAS_BP3.
> > > > +					 */
> > > > 
> > > >  	/* Part specific fixup hooks. */
> > > >  	const struct spi_nor_fixups *fixups;
> > > > @@ -1767,23 +1775,47 @@ static void stm_get_locked_range(struct
> > > > spi_nor *nor, u8 sr, loff_t *ofs,
> > > >  	struct mtd_info *mtd = &nor->mtd;
> > > >  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> > > >  	u8 tb_mask = SR_TB_BIT5;
> > > > -	int pow;
> > > > +	u8 bp;
> > > > +	int pow = 0;
> > > > 
> > > >  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> > > >  		tb_mask = SR_TB_BIT6;
> > > > 
> > > > -	if (!(sr & mask)) {
> > > > -		/* No protection */
> > > > -		*ofs = 0;
> > > > -		*len = 0;
> > > > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > > > +		u8 tmp;
> > > > +
> > > > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> > > > +			tmp = sr & (mask | SR_BP3_BIT6);
> > > > +		else
> > > > +			tmp = sr & (mask | SR_BP3_BIT5);
> > > > +
> > > > +		if (tmp & SR_BP3_BIT6)
> > > > +			tmp = (tmp & ~BIT(6)) | BIT(5);
> > > > +
> > > > +		bp = tmp >> SR_BP_SHIFT;
> > > > +		if (!bp) {
> > > > +			*ofs = 0;
> > > > +			*len = 0;
> > > > +			return;
> > > > +		}
> > > > +		if (bp <= ilog2(nor->n_sectors))
> > > > +			pow = ilog2(nor->n_sectors) + 1 - bp;
> > > >  	} else {
> > > > -		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
> > > > -		*len = mtd->size >> pow;
> > > > -		if (nor->flags & SNOR_F_HAS_SR_TB && sr &
> > > > tb_mask)
> > > > +		bp = (sr & mask) >> SR_BP_SHIFT;
> > > > +		if (!bp) {
> > > >  			*ofs = 0;
> > > > -		else
> > > > -			*ofs = mtd->size - *len;
> > > > +			*len = 0;
> > > > +			return;
> > > > +		}
> > > > +		pow = bp ^ (mask >> SR_BP_SHIFT);
> > > >  	}
> > > > +
> > > > +	*len = mtd->size >> pow;
> > > > +
> > > > +	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
> > > > +		*ofs = 0;
> > > > +	else
> > > > +		*ofs = mtd->size - *len;
> > > >  }
> > > > 
> > > >  /*
> > > > @@ -1823,7 +1855,7 @@ static int stm_is_unlocked_sr(struct
> > > > spi_nor
> > > > *nor, loff_t ofs, uint64_t len,
> > > > 
> > > >  /*
> > > >   * Lock a region of the flash. Compatible with ST Micro and
> > > > similar flash.
> > > > - * Supports the block protection bits BP{0,1,2} in the status
> > > > register
> > > > + * Supports the block protection bits BP{0,1,2,3} in the
> > > > status
> > > > register
> > > >   * (SR). Does not support these features found in newer SR
> > > > bitfields:
> > > >   *   - SEC: sector/block protect - only handle SEC=0 (block
> > > > protect)
> > > >   *   - CMP: complement protect - only support CMP=0 (range is
> > > > not
> > > > complemented)
> > > > @@ -1831,7 +1863,7 @@ static int stm_is_unlocked_sr(struct
> > > > spi_nor
> > > > *nor, loff_t ofs, uint64_t len,
> > > >   * Support for the following is provided conditionally for
> > > > some
> > > > flash:
> > > >   *   - TB: top/bottom protect
> > > >   *
> > > > - * Sample table portion for 8MB flash (Winbond w25q64fw):
> > > > + * Sample table portion for 8MB flash (Winbond w25q64fw / BP0-
> > > > 2):
> > > >   *
> > > >   *   SEC  |  TB   |  BP2  |  BP1  |  BP0  |  Prot Length  |
> > > > Protected Portion
> > > >   *  --------------------------------------------------------
> > > > ----
> > > > --------------
> > > > @@ -1851,6 +1883,32 @@ static int stm_is_unlocked_sr(struct
> > > > spi_nor
> > > > *nor, loff_t ofs, uint64_t len,
> > > >   *    0   |   1   |   1   |   0   |   1   |  2 MB         |
> > > > Lower
> > > > 1/4
> > > >   *    0   |   1   |   1   |   1   |   0   |  4 MB         |
> > > > Lower
> > > > 1/2
> > > >   *
> > > > + * Sample table portion for 64MB flash (Micron n25q512ax3 /
> > > > BP0-
> > > > 3):
> > > > + *
> > > > + *   TB   |  BP3  |  BP2  |  BP1  |  BP0  |  Prot Length  |
> > > > Protected Portion
> > > > + *  --------------------------------------------------------
> > > > ----
> > > > --------------
> > > > + *    0   |   0   |   0   |   0   |   0   |  NONE         |
> > > > NONE
> > > > + *    0   |   0   |   0   |   0   |   1   |   64 KB       |
> > > > Upper
> > > > 1/1024
> > > > + *    0   |   0   |   0   |   1   |   0   |  128 KB       |
> > > > Upper
> > > > 1/512
> > > > + *    0   |   0   |   0   |   1   |   1   |  256 KB       |
> > > > Upper
> > > > 1/256
> > > > + *   ...
> > > > + *    0   |   1   |   0   |   0   |   1   |  16 MB        |
> > > > Upper
> > > > 1/4
> > > > + *    0   |   1   |   0   |   1   |   0   |  32 MB        |
> > > > Upper
> > > > 1/2
> > > > + *    0   |   1   |   0   |   1   |   1   |  64 MB        |
> > > > ALL
> > > > + *    0   |   1   |   1   |   0   |   0   |  64 MB        |
> > > > ALL
> > > > + *   ...
> > > > + *  ------|-------|-------|-------|-------|---------------|---
> > > > ----
> > > > ------------
> > > > + *    1   |   0   |   0   |   0   |   0   |   NONE        |
> > > > NONE
> > > > + *    1   |   0   |   0   |   0   |   1   |   64 KB       |
> > > > Lower
> > > > 1/1024
> > > > + *    1   |   0   |   0   |   1   |   0   |  128 KB       |
> > > > Lower
> > > > 1/512
> > > > + *    1   |   0   |   0   |   1   |   1   |  256 KB       |
> > > > Lower
> > > > 1/256
> > > > + *   ...
> > > > + *    1   |   1   |   0   |   0   |   1   |  16 MB        |
> > > > Lower
> > > > 1/4
> > > > + *    1   |   1   |   0   |   1   |   0   |  32 MB        |
> > > > Lower
> > > > 1/2
> > > > + *    1   |   1   |   0   |   1   |   1   |  64 MB        |
> > > > ALL
> > > > + *    1   |   1   |   1   |   0   |   0   |  64 MB        |
> > > > ALL
> > > > + *   ...
> > > > + *
> > > >   * Returns negative on errors, 0 on success.
> > > >   */
> > > >  static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t
> > > > len)
> > > > @@ -1898,6 +1956,12 @@ static int stm_lock(struct spi_nor *nor,
> > > > loff_t ofs, uint64_t len)
> > > >  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> > > >  		tb_mask = SR_TB_BIT6;
> > > > 
> > > > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > > > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> > > > +			mask = mask | SR_BP3_BIT6;
> > > > +		else
> > > > +			mask = mask | SR_BP3_BIT5;
> > > > +	}
> > > >  	/*
> > > >  	 * Need smallest pow such that:
> > > >  	 *
> > > > @@ -1908,7 +1972,17 @@ static int stm_lock(struct spi_nor *nor,
> > > > loff_t ofs, uint64_t len)
> > > >  	 *   pow = ceil(log2(size / len)) = log2(size) -
> > > > floor(log2(len))
> > > >  	 */
> > > >  	pow = ilog2(mtd->size) - ilog2(lock_len);
> > > > -	val = mask - (pow << SR_BP_SHIFT);
> > > > +
> > > > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > > > +		val = ilog2(nor->n_sectors) + 1 - pow;
> > > 
> > > Why do you use a new calculation here? As far as I can see, the
> > > method is
> > > the same except that is has one bit more. That also raises the
> > > question why
> > > n_sectors is now needed?
> > > 
> > > Can't we just initialize the mask with
> > > 
> > > mask = SR_BP2 | SR_BP1 | SR_BP0;
> > > if (nor->flags & SNOR_F_HAS_SR_BP3)
> > >     mask |= SR_BP3_BIT5;
> > > 
> > > do the calculation and checks and then move the SR_BP3_BIT5 to
> > > SR_BP3_BIT6
> > > if SNOR_F_HAS_SR_BP3_BIT6 is set.
> > > 
> > 
> > For most of flashes that supporting BP0-2, the smallest protected
> > portion is fixed as 1/64
> > and it can be properly handled by existing
> > calculation. (Actually it's not fully generic, see flashes like
> > w25q40bw or m25p80. Of course, it doesn't have SPI_NOR_HAS_LOCK
> > flag
> > even though it has BP0-2 bit in SR)
> 
> No. The rules are always the same wether there are three or four BP
> bits (the example in stm_lock() has not enough information on this):
> 
> (1) the first setting (besides 0) protects one sector. The second
>      protects 2, the third 4 and so on. eg 2^N
> (2) the last setting is _always_ protect all, just like the '0'
> setting
>      is always protect none.
> (3) if there is an overflow because there are no more free slots for
>      further settings (for 3 bits with flashes > 32MBit, for 4
>      bits if should be flashes > 16GBit), the first entry will be
>      discarded (eg the very first is the "just one sector" entry).
> 
> This is true for all flashes which uses this kind of setting, have a
> look at the m25p80 or w25q40bw, these are no exception. It is just
> the
> notation "lower 1/64" which is only true for flashes which either
> overflows in (3) or fill all entries (eg. with 3bits that would be
> the
> 32Mbit version).
> 

Looks like you noticed that we need new calculation method that would
be based on n_sectors :). Rule (1) is NOT true for some flashes
supporting BP0-2 and that's why I said that smallest protected portion
is fixed as '1/64' for these flashes.

See this one.

W25Q20EW	256KB	1/4 ... = 64KB		BP2
W25Q128JV	16MB	1/64 ... = 256KB	BP2 <--
S25FL132K	4MB	1/64 ... = 64KB		BP2 <--
S25FL164K	8MB	
1/64 ... = 128KB	BP2 <--
W25Q256JV	32MB	1/512 ... =
64KB	BP3
S25FL128L	16MB	1/256 ... = 64KB	BP3
S25FL256L	32MB	1/512 ... = 64KB	BP3

In current BP implementation, block protection is just working for some
flashes that has smallest protected portion as '1/64'.

We need new fomula based on n_sectors for BP3 at least.

> So for the 3 bit case the following flashes are border cases:
>   - 16mbit (less settings than slots)
>   - 32mbit (number of settings and free slots match)
>   - 64mbit (more settings than slots, first setting is discarded)
> 
> That being said, I suspect all the 16mbit flashes (and below) which
> have
> the _LOCK bit set are broken, because the entries has to be shifted. 
> I'll
> look into that later. This is the same "issue" you have with the 4
> bits.
> So if this is fixed, you should not need another formula for the 4
> bit
> case.
> 
> > We need new calculation method for 4bit block protection and for
> > making
> > it more generic, I choose n_sectors.
> > 
> > On all the flashes I checked, n_sectors is proper value for getting
> > block protected portion.
> > 
> > 		density	portion	n_sectors
> > W25M512JV	64MB	1/512	512
> > N25Q128A	16MB	1/256	256
> > N25Q512A	64MB	1/1024	1024
> > MT25QL02GCBB	256MB	1/4096	4096
> 
> The rules above apply to these flashes, too. Could you double check 
> that?
> 
> -michael
> 
> > 
> > > > +		val = val << SR_BP_SHIFT;
> > > > +
> > > > +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> > > > +			val = (val & ~BIT(5)) | BIT(6);
> > > > +	} else {
> > > > +		val = mask - (pow << SR_BP_SHIFT);
> > > > +	}
> > > > +
> > > >  	if (val & ~mask)
> > > >  		return -EINVAL;
> > > >  	/* Don't "lock" with no region! */
> > > > @@ -1983,6 +2057,13 @@ static int stm_unlock(struct spi_nor
> > > > *nor,
> > > > loff_t ofs, uint64_t len)
> > > > 
> > > >  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> > > >  		tb_mask = SR_TB_BIT6;
> > > > +
> > > > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > > > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> > > > +			mask = mask | SR_BP3_BIT6;
> > > > +		else
> > > > +			mask = mask | SR_BP3_BIT5;
> > > > +	}
> > > >  	/*
> > > >  	 * Need largest pow such that:
> > > >  	 *
> > > > @@ -1995,13 +2076,20 @@ static int stm_unlock(struct spi_nor
> > > > *nor,
> > > > loff_t ofs, uint64_t len)
> > > >  	pow = ilog2(mtd->size) - order_base_2(lock_len);
> > > >  	if (lock_len == 0) {
> > > >  		val = 0; /* fully unlocked */
> > > > +	} else if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > > > +		val = ilog2(nor->n_sectors) + 1 - pow;
> > > > +		val = val << SR_BP_SHIFT;
> > > > +
> > > > +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> > > > +			val = (val & ~BIT(5)) | BIT(6);
> > > >  	} else {
> > > >  		val = mask - (pow << SR_BP_SHIFT);
> > > > -		/* Some power-of-two sizes are not supported */
> > > > -		if (val & ~mask)
> > > > -			return -EINVAL;
> > > >  	}
> > > > 
> > > > +	/* Some power-of-two sizes are not supported */
> > > > +	if (val & ~mask)
> > > > +		return -EINVAL;
> > > > +
> > > >  	status_new = (status_old & ~mask & ~tb_mask) | val;
> > > > 
> > > >  	/* Don't protect status register if we're fully
> > > > unlocked */
> > > > @@ -4736,6 +4824,7 @@ static void
> > > > spi_nor_info_init_params(struct
> > > > spi_nor *nor)
> > > >  	/* Set SPI NOR sizes. */
> > > >  	params->size = (u64)info->sector_size * info-
> > > > >n_sectors;
> > > >  	params->page_size = info->page_size;
> > > > +	params->n_sectors = info->n_sectors;
> > > > 
> > > >  	if (!(info->flags & SPI_NOR_NO_FR)) {
> > > >  		/* Default to Fast Read for DT and non-DT
> > > > platform
> > > > devices. */
> > > > @@ -5192,6 +5281,11 @@ int spi_nor_scan(struct spi_nor *nor,
> > > > const
> > > > char *name,
> > > >  		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> > > >  	if (info->flags & USE_CLSR)
> > > >  		nor->flags |= SNOR_F_USE_CLSR;
> > > > +	if (info->flags & SPI_NOR_HAS_BP3) {
> > > > +		nor->flags |= SNOR_F_HAS_SR_BP3;
> > > > +		if (info->flags & SPI_NOR_BP3_SR_BIT6)
> > > > +			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
> > > > +	}
> > > > 
> > > >  	if (info->flags & SPI_NOR_NO_ERASE)
> > > >  		mtd->flags |= MTD_NO_ERASE;
> > > > @@ -5199,6 +5293,7 @@ int spi_nor_scan(struct spi_nor *nor,
> > > > const
> > > > char *name,
> > > >  	mtd->dev.parent = dev;
> > > >  	nor->page_size = params->page_size;
> > > >  	mtd->writebufsize = nor->page_size;
> > > > +	nor->n_sectors = params->n_sectors;
> > > > 
> > > >  	if (of_property_read_bool(np, "broken-flash-reset"))
> > > >  		nor->flags |= SNOR_F_BROKEN_RESET;
> > > > diff --git a/include/linux/mtd/spi-nor.h
> > > > b/include/linux/mtd/spi-
> > > > nor.h
> > > > index 541c06d042e8..92d550501daf 100644
> > > > --- a/include/linux/mtd/spi-nor.h
> > > > +++ b/include/linux/mtd/spi-nor.h
> > > > @@ -129,7 +129,9 @@
> > > >  #define SR_BP1			BIT(3)	/* Block protect 1
> > > > */
> > > >  #define SR_BP2			BIT(4)	/* Block protect 2
> > > > */
> > > >  #define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect
> > > > */
> > > > +#define SR_BP3_BIT5		BIT(5)	/* Block protect 3
> > > > */
> > > 
> > > maybe just name it SR_BP3? would also be more consistent with the
> > > proposal
> > > above.
> > > 
> > > >  #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect
> > > > */
> > > > +#define SR_BP3_BIT6		BIT(6)	/* Block protect 3
> > > > */
> > > >  #define SR_SRWD			BIT(7)	/* SR write
> > > > protect
> > > > */
> > > >  /* Spansion/Cypress specific status bits */
> > > >  #define SR_E_ERR		BIT(5)
> > > > @@ -248,6 +250,8 @@ enum spi_nor_option_flags {
> > > >  	SNOR_F_HAS_16BIT_SR	= BIT(9),
> > > >  	SNOR_F_NO_READ_CR	= BIT(10),
> > > >  	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
> > > > +	SNOR_F_HAS_SR_BP3	= BIT(12),
> > > > +	SNOR_F_HAS_SR_BP3_BIT6	= BIT(13),
> > > > 
> > > >  };
> > > > 
> > > > @@ -519,6 +523,7 @@ struct spi_nor_locking_ops {
> > > >   *
> > > >   * @size:		the flash memory density in bytes.
> > > >   * @page_size:		the page size of the SPI NOR flash
> > > > memory.
> > > > + * @n_sectors:		number of sectors
> > > >   * @hwcaps:		describes the read and page program
> > > > hardware
> > > >   *			capabilities.
> > > >   * @reads:		read capabilities ordered by priority:
> > > > the
> > > > higher index
> > > > @@ -541,6 +546,7 @@ struct spi_nor_locking_ops {
> > > >  struct spi_nor_flash_parameter {
> > > >  	u64				size;
> > > >  	u32				page_size;
> > > > +	u16				n_sectors;
> > > > 
> > > >  	struct spi_nor_hwcaps		hwcaps;
> > > >  	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX
> > > > ];
> > > > @@ -573,6 +579,7 @@ struct flash_info;
> > > >   * @bouncebuf_size:	size of the bounce buffer
> > > >   * @info:		spi-nor part JDEC MFR id and other info
> > > >   * @page_size:		the page size of the SPI NOR
> > > > + * @n_sector:		number of sectors
> > > >   * @addr_width:		number of address bytes
> > > >   * @erase_opcode:	the opcode for erasing a sector
> > > >   * @read_opcode:	the read opcode
> > > > @@ -599,6 +606,7 @@ struct spi_nor {
> > > >  	size_t			bouncebuf_size;
> > > >  	const struct flash_info	*info;
> > > >  	u32			page_size;
> > > > +	u16			n_sectors;
> > > >  	u8			addr_width;
> > > >  	u8			erase_opcode;
> > > >  	u8			read_opcode;
> > > > --
> > > > 2.17.1
> > > > 
> > > > 
> > > > ______________________________________________________
> > > > Linux MTD discussion mailing list
> > > > 
> > 
> > 
https://protect2.fireeye.com/url?k=06b6dd5d-5b7d5a63-06b75612-0cc47a31309a-83164929001f7741&u=http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > > > 
> > > 
> > > 
> 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
