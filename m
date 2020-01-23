Return-Path: <SRS0=9DP4=3M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C17C33CAA
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 06:22:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0806024673
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 06:22:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jjLyySom";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FYxSkAPX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0806024673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5RpDwQkIQzxZOxSSQY03vC7h6AcCT9ZsKVqV7flN2Y=; b=jjLyySomNhpwMv
	5+npT2wKRPb5PrSjoFRFKf/Aw5CplRexYnmity3UWcJq2/tXKZqNhiqcgxddr5XgzUjz/Z4xEzWdc
	VRZKNI7yRNRZMqdB5u297UYuvO+l1iMbqgptSmLpy/83rMJ2qFrkvjd8Nt6afIN5D6Eb9hquRZV3E
	ZPSSy4Um4p842TgWAg04OjZEj68QC+AgssHLSj7+X0iwEft/yWebgTDD4CjoXT8nerIs3/a8ibUi5
	7BHAuMuC4F0cGA1u9IXDuiBlcnHGpC7PUZHiU/Sgu8ZeWjXY/EcmcdrQYaoBEq/+VRUbhseU0BITM
	lqM7WycWBMWsdHRDToJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuVsc-0003n1-ST; Thu, 23 Jan 2020 06:22:14 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuVsY-0003mH-9Z
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2020 06:22:13 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200123062206epoutp04cb43b792932a6393e222691f528e5755~sb9QZBgrW0933809338epoutp04F
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2020 06:22:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200123062206epoutp04cb43b792932a6393e222691f528e5755~sb9QZBgrW0933809338epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579760526;
 bh=TeyogZiTDqPlBYfk6/zamXkqqugbmmJsc0/sS19OiVw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=FYxSkAPXtws9LdQfCP0n1f4aaQgwjEPTBqSqdGl8Xup/AotTLHqDBcLQcrKjIm1H0
 RyNsFoayRDesxCstqhgxvarXu5ryZ9aN9QcBEYPvMMkbssSTNPNopDqkNXx6p8tqOd
 72Ka/M2ftt+9iDjkupfxcnTU4Ik9LmCwFMwxkXYY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200123062205epcas1p4e39d721c03b78d6a7949c49bf69e4f43~sb9QF05Uo0508305083epcas1p4H;
 Thu, 23 Jan 2020 06:22:05 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.166]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 483By43ZG3zMqYm0; Thu, 23 Jan
 2020 06:22:04 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 06.4C.52419.C8B392E5; Thu, 23 Jan 2020 15:22:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200123062204epcas1p2862633474fc4617eedc971a2c7c39e97~sb9OlvnWl0430904309epcas1p2O;
 Thu, 23 Jan 2020 06:22:04 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200123062204epsmtrp2cdbab75707ca20c04c476673964dffea~sb9OlFCyU2359523595epsmtrp2Z;
 Thu, 23 Jan 2020 06:22:04 +0000 (GMT)
X-AuditID: b6c32a37-59fff7000001ccc3-30-5e293b8c1729
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B7.24.10238.B8B392E5; Thu, 23 Jan 2020 15:22:03 +0900 (KST)
Received: from ara-VirtualBox (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200123062203epsmtip22cbb145debcdf79f74f88a30577b028b~sb9OXvtar1161811618epsmtip2_;
 Thu, 23 Jan 2020 06:22:03 +0000 (GMT)
Message-ID: <0c4e70fcf58c93f9b7375d83b50028df225aed82.camel@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: Michael Walle <michael@walle.cc>, js07.lee@samsung.com
Date: Thu, 23 Jan 2020 15:22:03 +0900
In-Reply-To: <20200122193608.3859-1-michael@walle.cc>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHeXbd3ZQmt2l1sqh1TWjiy9acu5krI4thRlbUhz7MLu6i5t7Y
 3cT8UKYmZSZJJGZmRpYpaZLvipUvafkSiiFGGaJkVs7USgST2rwL/fY/h995/uec5wgx8W3c
 R5hotDIWI60ncQ+3+g5pcGDOXqlWVvZ5K7VcNMOjxt8v8amW9EcCyt5bLaDmSiOov/2zgghc
 01Q4KtDUlF7UfFx8iDS5tRVI0z3SwNO8bM3EY/Az+vAEhtYxFgljjDPpEo3xavLIydiDscpQ
 mTxQvodSkRIjbWDUZGR0TODhRL2jC1KSTOttjlQMzbJk8L5wi8lmZSQJJtaqJhmzTm+Wy8xB
 LG1gbcb4oDiTIUwuk+1WOsiz+oSvg+mY+WdSSuO3Ll4ayo7ORu5CIEKgLXeEl408hGKiEUF+
 cw/ignkEi9/f8blgAUHx5KTb/5Kl9GwX1YpguP8WxgXTCJrG3/CdlIjQwOtLP3hO7UUcgTu5
 dtypccIfRpaerTDeRBg8mviAOTVGMDCUWYOc2o3wg4I/HSt5d0IJ1cvPeZxzANh7ch1dCB3v
 r4flRi+udDs02ItWegBiCIey+08EHB8JncPDLu0F37prXdoHfs604pxmoak8T8AVZyIYLyt1
 QQqYsVdiTjOMkMLT5mAuvQOalu4iztgTZn7n8J0IECK4kiXmEBKmxzJdywIYmLjO57QGaibz
 XbtqQNDf1ovfQJLC1XEK14xTuGpcgrAKtJExs4Z4hpWbFWt/+BlaOUt/VSOqfhvdjgghIteJ
 Ivbs0or5dDJ73tCOQIiR3qKSdD+tWKSjz6cyFlOsxaZn2HakdCw7D/PZEGdyHLnRGitX7lYo
 FFRIqCpUqSA3iQoiJVoxEU9bmSSGMTOW/3U8obtPGnpgKiie2iu9tXObJTW50liS9/jm5dOf
 qHMHqIyPfYeP3Zt6pe5kEwdVncd15aq0ltG5PvN06vyFgEMDJQLfExMnZz3ram0iUl/rP3at
 4VQUuppxx32gLWJ/T5zv0fDy0BTl7Is8qXUhuF6cZatL2dL1RV2Vk6/d/KtodKzqq/VPFOnG
 JtByf8zC0v8A4/YmUqwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSvG63tWacwcQrVhZ/57xjsnh08zer
 xe6mZewWb09vYLf4uMTB4v/ZD+wObB47Z91l99i8pN7jzo+ljB59W1Yxehy/sZ3J48DeFrYA
 tigum5TUnMyy1CJ9uwSujJcXm5gLPmdX7Hh1jKmBscuni5GTQ0LAROJ3UxdjFyMXh5DAbkaJ
 nesb2SASEhKPdn5h6WLkALKFJQ4fLgYJCwm8YpSY2q0LYvMKeEicaHzPBGILC3hLzO57C9bK
 JqAlceP3JlYQW0TASmLZ49vMIDazQJrE+r6t7CA2i4CqxIw/h8HinAKmEhv+7mOCuGEno8SZ
 fWdYIRo0JVq3/2aHuEdH4u2pPrB7eAUEJf7uEIYokZfY/nYO8wRGwVlIOmYhVM1CUrWAkXkV
 o2RqQXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZw+Gtp7mC8vCT+EKMAB6MSD6+DpUacEGti
 WXFl7iFGCQ5mJRHeBU2qcUK8KYmVValF+fFFpTmpxYcYpTlYlMR5n+YdixQSSE8sSc1OTS1I
 LYLJMnFwSjUwJoi+unq3U9rRKLCcU008NT3ywh0phSVJbwL3Htv31kvFa8uDjOmerqH27C8e
 zeNwbJobWqf9r2N7gFXZwgDf4M2zNyQ+7p68Z1vxZSVL9SKT6wsUla9KhUcr9i1u2/ute53q
 rZKjxaE7nrVqvk1f/nyXz52u/6k7TPeYxse/SbiavOX+nuQKJZbijERDLeai4kQA2WoGHHsC
 AAA=
X-CMS-MailID: 20200123062204epcas1p2862633474fc4617eedc971a2c7c39e97
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200122193640epcas1p2e8df0b73bdf6c6389709148702082aef
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <CGME20200122193640epcas1p2e8df0b73bdf6c6389709148702082aef@epcas1p2.samsung.com>
 <20200122193608.3859-1-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_222210_860712_6681444C 
X-CRM114-Status: GOOD (  34.79  )
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

2020-01-22 (Wed), 20:36 +0100, Michael Walle:
> Hi,
> 
> > Currently, we are supporting block protection only for
> > flash chips with 3 block protection bits in the SR register.
> > This patch enables block protection support for some flash with
> > 4 block protection bits(bp0-3).
> > 
> > Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> > ---
> > v3 :
> >   Fix wrong ofs calculation on v2 patch
> > v2 :
> >   Add sample table portion about 4bit block protection on the
> > comment
> >   Trivial coding style change
> > 
> >  drivers/mtd/spi-nor/spi-nor.c | 127 +++++++++++++++++++++++++++++-
> > ----
> >  include/linux/mtd/spi-nor.h   |   8 +++
> >  2 files changed, 119 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-
> > nor/spi-nor.c
> > index e3da6a8654a8..7e8af6c4fdfa 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -238,6 +238,14 @@ struct flash_info {
> >  					 * status register. Must be
> > used with
> >  					 * SPI_NOR_HAS_TB.
> >  					 */
> > +#define SPI_NOR_HAS_BP3		BIT(17)	/*
> > +					 * Flash SR has 4 bit fields
> > (BP0-3)
> > +					 * for block protection.
> > +					 */
> > +#define SPI_NOR_BP3_SR_BIT6	BIT(18)	/*
> > +					 * BP3 is bit 6 of status
> > register.
> > +					 * Must be used with
> > SPI_NOR_HAS_BP3.
> > +					 */
> >  
> >  	/* Part specific fixup hooks. */
> >  	const struct spi_nor_fixups *fixups;
> > @@ -1767,23 +1775,47 @@ static void stm_get_locked_range(struct
> > spi_nor *nor, u8 sr, loff_t *ofs,
> >  	struct mtd_info *mtd = &nor->mtd;
> >  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> >  	u8 tb_mask = SR_TB_BIT5;
> > -	int pow;
> > +	u8 bp;
> > +	int pow = 0;
> >  
> >  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> >  		tb_mask = SR_TB_BIT6;
> >  
> > -	if (!(sr & mask)) {
> > -		/* No protection */
> > -		*ofs = 0;
> > -		*len = 0;
> > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > +		u8 tmp;
> > +
> > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> > +			tmp = sr & (mask | SR_BP3_BIT6);
> > +		else
> > +			tmp = sr & (mask | SR_BP3_BIT5);
> > +
> > +		if (tmp & SR_BP3_BIT6)
> > +			tmp = (tmp & ~BIT(6)) | BIT(5);
> > +
> > +		bp = tmp >> SR_BP_SHIFT;
> > +		if (!bp) {
> > +			*ofs = 0;
> > +			*len = 0;
> > +			return;
> > +		}
> > +		if (bp <= ilog2(nor->n_sectors))
> > +			pow = ilog2(nor->n_sectors) + 1 - bp;
> >  	} else {
> > -		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
> > -		*len = mtd->size >> pow;
> > -		if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
> > +		bp = (sr & mask) >> SR_BP_SHIFT;
> > +		if (!bp) {
> >  			*ofs = 0;
> > -		else
> > -			*ofs = mtd->size - *len;
> > +			*len = 0;
> > +			return;
> > +		}
> > +		pow = bp ^ (mask >> SR_BP_SHIFT);
> >  	}
> > +
> > +	*len = mtd->size >> pow;
> > +
> > +	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
> > +		*ofs = 0;
> > +	else
> > +		*ofs = mtd->size - *len;
> >  }
> >  
> >  /*
> > @@ -1823,7 +1855,7 @@ static int stm_is_unlocked_sr(struct spi_nor
> > *nor, loff_t ofs, uint64_t len,
> >  
> >  /*
> >   * Lock a region of the flash. Compatible with ST Micro and
> > similar flash.
> > - * Supports the block protection bits BP{0,1,2} in the status
> > register
> > + * Supports the block protection bits BP{0,1,2,3} in the status
> > register
> >   * (SR). Does not support these features found in newer SR
> > bitfields:
> >   *   - SEC: sector/block protect - only handle SEC=0 (block
> > protect)
> >   *   - CMP: complement protect - only support CMP=0 (range is not
> > complemented)
> > @@ -1831,7 +1863,7 @@ static int stm_is_unlocked_sr(struct spi_nor
> > *nor, loff_t ofs, uint64_t len,
> >   * Support for the following is provided conditionally for some
> > flash:
> >   *   - TB: top/bottom protect
> >   *
> > - * Sample table portion for 8MB flash (Winbond w25q64fw):
> > + * Sample table portion for 8MB flash (Winbond w25q64fw / BP0-2):
> >   *
> >   *   SEC  |  TB   |  BP2  |  BP1  |  BP0  |  Prot Length  |
> > Protected Portion
> >   *  ------------------------------------------------------------
> > --------------
> > @@ -1851,6 +1883,32 @@ static int stm_is_unlocked_sr(struct spi_nor
> > *nor, loff_t ofs, uint64_t len,
> >   *    0   |   1   |   1   |   0   |   1   |  2 MB         | Lower
> > 1/4
> >   *    0   |   1   |   1   |   1   |   0   |  4 MB         | Lower
> > 1/2
> >   *
> > + * Sample table portion for 64MB flash (Micron n25q512ax3 / BP0-
> > 3):
> > + *
> > + *   TB   |  BP3  |  BP2  |  BP1  |  BP0  |  Prot Length  |
> > Protected Portion
> > + *  ------------------------------------------------------------
> > --------------
> > + *    0   |   0   |   0   |   0   |   0   |  NONE         | NONE
> > + *    0   |   0   |   0   |   0   |   1   |   64 KB       | Upper
> > 1/1024
> > + *    0   |   0   |   0   |   1   |   0   |  128 KB       | Upper
> > 1/512
> > + *    0   |   0   |   0   |   1   |   1   |  256 KB       | Upper
> > 1/256
> > + *   ...
> > + *    0   |   1   |   0   |   0   |   1   |  16 MB        | Upper
> > 1/4
> > + *    0   |   1   |   0   |   1   |   0   |  32 MB        | Upper
> > 1/2
> > + *    0   |   1   |   0   |   1   |   1   |  64 MB        | ALL
> > + *    0   |   1   |   1   |   0   |   0   |  64 MB        | ALL
> > + *   ...
> > + *  ------|-------|-------|-------|-------|---------------|-------
> > ------------
> > + *    1   |   0   |   0   |   0   |   0   |   NONE        | NONE
> > + *    1   |   0   |   0   |   0   |   1   |   64 KB       | Lower
> > 1/1024
> > + *    1   |   0   |   0   |   1   |   0   |  128 KB       | Lower
> > 1/512
> > + *    1   |   0   |   0   |   1   |   1   |  256 KB       | Lower
> > 1/256
> > + *   ...
> > + *    1   |   1   |   0   |   0   |   1   |  16 MB        | Lower
> > 1/4
> > + *    1   |   1   |   0   |   1   |   0   |  32 MB        | Lower
> > 1/2
> > + *    1   |   1   |   0   |   1   |   1   |  64 MB        | ALL
> > + *    1   |   1   |   1   |   0   |   0   |  64 MB        | ALL
> > + *   ...
> > + *
> >   * Returns negative on errors, 0 on success.
> >   */
> >  static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> > @@ -1898,6 +1956,12 @@ static int stm_lock(struct spi_nor *nor,
> > loff_t ofs, uint64_t len)
> >  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> >  		tb_mask = SR_TB_BIT6;
> >  
> > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> > +			mask = mask | SR_BP3_BIT6;
> > +		else
> > +			mask = mask | SR_BP3_BIT5;
> > +	}
> >  	/*
> >  	 * Need smallest pow such that:
> >  	 *
> > @@ -1908,7 +1972,17 @@ static int stm_lock(struct spi_nor *nor,
> > loff_t ofs, uint64_t len)
> >  	 *   pow = ceil(log2(size / len)) = log2(size) -
> > floor(log2(len))
> >  	 */
> >  	pow = ilog2(mtd->size) - ilog2(lock_len);
> > -	val = mask - (pow << SR_BP_SHIFT);
> > +
> > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > +		val = ilog2(nor->n_sectors) + 1 - pow;
> 
> Why do you use a new calculation here? As far as I can see, the
> method is
> the same except that is has one bit more. That also raises the
> question why
> n_sectors is now needed?
> 
> Can't we just initialize the mask with
> 
> mask = SR_BP2 | SR_BP1 | SR_BP0;
> if (nor->flags & SNOR_F_HAS_SR_BP3)
>     mask |= SR_BP3_BIT5;
> 
> do the calculation and checks and then move the SR_BP3_BIT5 to
> SR_BP3_BIT6
> if SNOR_F_HAS_SR_BP3_BIT6 is set.
> 

For most of flashes that supporting BP0-2, the smallest protected
portion is fixed as 1/64 and it can be properly handled by existing
calculation. (Actually it's not fully generic, see flashes like
w25q40bw or m25p80. Of course, it doesn't have SPI_NOR_HAS_LOCK flag
even though it has BP0-2 bit in SR)

We need new calculation method for 4bit block protection and for making
it more generic, I choose n_sectors.

On all the flashes I checked, n_sectors is proper value for getting
block protected portion.

		density	portion	n_sectors
W25M512JV	64MB	1/512	512
N25Q128A	16MB	1/256	256	
N25Q512A	64MB	1/1024	1024
MT25QL02GCBB	256MB	1/4096	4096

> > +		val = val << SR_BP_SHIFT;
> > +
> > +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> > +			val = (val & ~BIT(5)) | BIT(6);
> > +	} else {
> > +		val = mask - (pow << SR_BP_SHIFT);
> > +	}
> > +
> >  	if (val & ~mask)
> >  		return -EINVAL;
> >  	/* Don't "lock" with no region! */
> > @@ -1983,6 +2057,13 @@ static int stm_unlock(struct spi_nor *nor,
> > loff_t ofs, uint64_t len)
> >  
> >  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> >  		tb_mask = SR_TB_BIT6;
> > +
> > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> > +			mask = mask | SR_BP3_BIT6;
> > +		else
> > +			mask = mask | SR_BP3_BIT5;
> > +	}
> >  	/*
> >  	 * Need largest pow such that:
> >  	 *
> > @@ -1995,13 +2076,20 @@ static int stm_unlock(struct spi_nor *nor,
> > loff_t ofs, uint64_t len)
> >  	pow = ilog2(mtd->size) - order_base_2(lock_len);
> >  	if (lock_len == 0) {
> >  		val = 0; /* fully unlocked */
> > +	} else if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > +		val = ilog2(nor->n_sectors) + 1 - pow;
> > +		val = val << SR_BP_SHIFT;
> > +
> > +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> > +			val = (val & ~BIT(5)) | BIT(6);
> >  	} else {
> >  		val = mask - (pow << SR_BP_SHIFT);
> > -		/* Some power-of-two sizes are not supported */
> > -		if (val & ~mask)
> > -			return -EINVAL;
> >  	}
> >  
> > +	/* Some power-of-two sizes are not supported */
> > +	if (val & ~mask)
> > +		return -EINVAL;
> > +
> >  	status_new = (status_old & ~mask & ~tb_mask) | val;
> >  
> >  	/* Don't protect status register if we're fully unlocked */
> > @@ -4736,6 +4824,7 @@ static void spi_nor_info_init_params(struct
> > spi_nor *nor)
> >  	/* Set SPI NOR sizes. */
> >  	params->size = (u64)info->sector_size * info->n_sectors;
> >  	params->page_size = info->page_size;
> > +	params->n_sectors = info->n_sectors;
> >  
> >  	if (!(info->flags & SPI_NOR_NO_FR)) {
> >  		/* Default to Fast Read for DT and non-DT platform
> > devices. */
> > @@ -5192,6 +5281,11 @@ int spi_nor_scan(struct spi_nor *nor, const
> > char *name,
> >  		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> >  	if (info->flags & USE_CLSR)
> >  		nor->flags |= SNOR_F_USE_CLSR;
> > +	if (info->flags & SPI_NOR_HAS_BP3) {
> > +		nor->flags |= SNOR_F_HAS_SR_BP3;
> > +		if (info->flags & SPI_NOR_BP3_SR_BIT6)
> > +			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
> > +	}
> >  
> >  	if (info->flags & SPI_NOR_NO_ERASE)
> >  		mtd->flags |= MTD_NO_ERASE;
> > @@ -5199,6 +5293,7 @@ int spi_nor_scan(struct spi_nor *nor, const
> > char *name,
> >  	mtd->dev.parent = dev;
> >  	nor->page_size = params->page_size;
> >  	mtd->writebufsize = nor->page_size;
> > +	nor->n_sectors = params->n_sectors;
> >  
> >  	if (of_property_read_bool(np, "broken-flash-reset"))
> >  		nor->flags |= SNOR_F_BROKEN_RESET;
> > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-
> > nor.h
> > index 541c06d042e8..92d550501daf 100644
> > --- a/include/linux/mtd/spi-nor.h
> > +++ b/include/linux/mtd/spi-nor.h
> > @@ -129,7 +129,9 @@
> >  #define SR_BP1			BIT(3)	/* Block protect 1
> > */
> >  #define SR_BP2			BIT(4)	/* Block protect 2
> > */
> >  #define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
> > +#define SR_BP3_BIT5		BIT(5)	/* Block protect 3
> > */
> 
> maybe just name it SR_BP3? would also be more consistent with the
> proposal
> above.
> 
> >  #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect */
> > +#define SR_BP3_BIT6		BIT(6)	/* Block protect 3
> > */
> >  #define SR_SRWD			BIT(7)	/* SR write protect
> > */
> >  /* Spansion/Cypress specific status bits */
> >  #define SR_E_ERR		BIT(5)
> > @@ -248,6 +250,8 @@ enum spi_nor_option_flags {
> >  	SNOR_F_HAS_16BIT_SR	= BIT(9),
> >  	SNOR_F_NO_READ_CR	= BIT(10),
> >  	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
> > +	SNOR_F_HAS_SR_BP3	= BIT(12),
> > +	SNOR_F_HAS_SR_BP3_BIT6	= BIT(13),
> >  
> >  };
> >  
> > @@ -519,6 +523,7 @@ struct spi_nor_locking_ops {
> >   *
> >   * @size:		the flash memory density in bytes.
> >   * @page_size:		the page size of the SPI NOR flash
> > memory.
> > + * @n_sectors:		number of sectors
> >   * @hwcaps:		describes the read and page program
> > hardware
> >   *			capabilities.
> >   * @reads:		read capabilities ordered by priority: the
> > higher index
> > @@ -541,6 +546,7 @@ struct spi_nor_locking_ops {
> >  struct spi_nor_flash_parameter {
> >  	u64				size;
> >  	u32				page_size;
> > +	u16				n_sectors;
> >  
> >  	struct spi_nor_hwcaps		hwcaps;
> >  	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
> > @@ -573,6 +579,7 @@ struct flash_info;
> >   * @bouncebuf_size:	size of the bounce buffer
> >   * @info:		spi-nor part JDEC MFR id and other info
> >   * @page_size:		the page size of the SPI NOR
> > + * @n_sector:		number of sectors
> >   * @addr_width:		number of address bytes
> >   * @erase_opcode:	the opcode for erasing a sector
> >   * @read_opcode:	the read opcode
> > @@ -599,6 +606,7 @@ struct spi_nor {
> >  	size_t			bouncebuf_size;
> >  	const struct flash_info	*info;
> >  	u32			page_size;
> > +	u16			n_sectors;
> >  	u8			addr_width;
> >  	u8			erase_opcode;
> >  	u8			read_opcode;
> > -- 
> > 2.17.1
> > 
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > 
https://protect2.fireeye.com/url?k=06b6dd5d-5b7d5a63-06b75612-0cc47a31309a-83164929001f7741&u=http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > 
> 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
