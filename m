Return-Path: <SRS0=BLjR=5C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12D6C2BB1D
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2020 11:00:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDA7F20736
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2020 11:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zo8DN4AS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CApzFwyA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDA7F20736
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OstiYGgjVFvJMyyDbpK1aao9aHM7EHnQclQ1VTmkk70=; b=Zo8DN4AStbO7+m
	F4nuQ9Vh047SyKDDbW1KpgPrelspADc9ka+Y5wuYzzzJF+Zu3Duj9N32TgwrenldQibRozW+DqLmb
	IRKxk7Vztb5Icrov9aI6yOWXlSsvag9sg8OOVQ/0OpJym5maj4qT1JBRtdW8RZp2w8jv7drrTIVEm
	Sh0UsrZjL7yowBpqtFWaD3rI2CbN8S52IRGhqBtMyYYzyFWCpSIjeISGwjC2ZvIcD+JZYFLHjGhA2
	UNnGhWlujt2kKDLM6X/SdxwAq+F8Va3GgftTCDTvev/ZMLuJmgpKhiiZDEDaTfli1oTyC8BpGH6li
	bpk20kwt3sU7oL1M6w4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jE9xM-00066R-NY; Tue, 17 Mar 2020 11:00:20 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jE9xF-0005wW-Ma
 for linux-mtd@lists.infradead.org; Tue, 17 Mar 2020 11:00:16 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200317110010epoutp04f476f0de19d7599b91ea1f426cf74aa2~9EldLbaUw2187621876epoutp04U
 for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2020 11:00:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200317110010epoutp04f476f0de19d7599b91ea1f426cf74aa2~9EldLbaUw2187621876epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584442810;
 bh=5ekazTGTGX4U/+sxAoxQBbfJ+A5+j4kWGKldZMNQ54s=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=CApzFwyAmRNQVBAMBnpINOcTq7FYyUdtey04NkHJ0AA8Kw5kmGEqA5iIp4fsFJEgf
 CPzC14dSHlRUsl7lHIr3qVqiOcgSvSxwcxZt9mhbmVjTt87wet39E+VEtX9ko4F+Du
 GGJyvDkjb8yyXFeOYdrPS1ULY6c9nvJj4GWiHc+s=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200317110009epcas1p333359c58d90b2b8d18fd80eb36367904~9Elc65Yv42545325453epcas1p3U;
 Tue, 17 Mar 2020 11:00:09 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.161]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 48hVZ04zpkzMqYkc; Tue, 17 Mar
 2020 11:00:08 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 07.5D.04074.8BDA07E5; Tue, 17 Mar 2020 20:00:08 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200317110008epcas1p3d8a2c38e25ec7bd22c785c6aa2a6cb65~9Elbgpe9W2545725457epcas1p3H;
 Tue, 17 Mar 2020 11:00:08 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200317110008epsmtrp19745c5c6157e7544bf33f894f9341525~9ElbfruYq1678916789epsmtrp1-;
 Tue, 17 Mar 2020 11:00:08 +0000 (GMT)
X-AuditID: b6c32a39-58bff70000000fea-f7-5e70adb841df
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 98.79.04158.8BDA07E5; Tue, 17 Mar 2020 20:00:08 +0900 (KST)
Received: from asdf (unknown [10.88.100.192]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200317110008epsmtip1c6fb17d6b1a0000cd4e81175e1e35349~9ElbTu1-A3156031560epsmtip1Y;
 Tue, 17 Mar 2020 11:00:08 +0000 (GMT)
Message-ID: <b3e7a00fb5014efefc7214e12883deb77e3ae02f.camel@samsung.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: add 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: Michael Walle <michael@walle.cc>
Date: Tue, 17 Mar 2020 20:00:07 +0900
In-Reply-To: <ab18ece8973dbf89448d2070a78ff50b@walle.cc>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEJsWRmVeSWpSXmKPExsWy7bCmru6OtQVxBmeOqVpcv3aF0eLvnHdM
 Fo9u/ma12N20jN3i7ekN7BYflzhY/D/7gd2B3WPnrLvsHo/nbmT32Lyk3uPOj6WMHn1bVjF6
 HL+xncnjwN4WtgD2qBybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFsl
 F58AXbfMHKB7lBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkFhgYFesWJucWleel6
 yfm5VoYGBkamQJUJORlvPq5mL9gUULHqyGnmBsZr5l2MnBwSAiYSjx8dYgWxhQR2MEpc3xbT
 xcgFZH9ilLj2bC8LhPONUWLx/+1MMB17DrQyQiT2MkpMPbOTGcJ5BNR++TELSBWvgIfErKPv
 2EFsYSB7xvmHYDabgJbEjd+bwPaJCKhIPP58AWwSs8ApRomD+2eBFbEIqErsnnQGyObg4BSw
 kHj0TgZis47E21N9LCBhXgFBib87hEHCzALyEtvfzgG7QULgPpvEsSd3WSDqXSQ2PfgEZQtL
 vDq+hR3ClpJ42d8GZRdL7Fw5kR2iuYVR4tHyJVAJY4l3b9cygyxjFtCUWL9LHyKsKLHz91xG
 iMV8Eu++9rCClEgI8Ep0tAlBlChJvHnQArVWQuLC415WCNtD4v6ln2yQsHrNKPHvYyfjBEaF
 WQjvzELyziyExQsYmVcxiqUWFOempxYbFpgiR/AmRnD61LLcwXjsnM8hRgEORiUe3hk5+XFC
 rIllxZW5hxglOJiVRHgXFwKFeFMSK6tSi/Lji0pzUosPMZoCw3ois5Rocj4wteeVxBuaGhkb
 G1uYmJmbmRorifNOvZ4TJySQnliSmp2aWpBaBNPHxMEp1cAYJGUw4XLAOhmma3/iS10ULqy/
 WTaJbZKTH+PPogMztvgLrL0zdbVC6rwLCzba3ta/JqO3RvNmxPnXIWrX7h/wPS/QmeH31qRj
 vlmgsrTkuYOGH5dE8yfwTVxRur3tnnu8sqdLhI+2teKXSSsnV2dHMC5fczI88ky00o5zvzS6
 Yu5EVPT7LfmoxFKckWioxVxUnAgAEpnZhLUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsWy7bCSnO6OtQVxBmeesVtcv3aF0eLvnHdM
 Fo9u/ma12N20jN3i7ekN7BYflzhY/D/7gd2B3WPnrLvsHo/nbmT32Lyk3uPOj6WMHn1bVjF6
 HL+xncnjwN4WtgD2KC6blNSczLLUIn27BK6MNx9XsxdsCqhYdeQ0cwPjNfMuRk4OCQETiT0H
 Whm7GLk4hAR2M0qcer6ZBSIhIfFo5xcgmwPIFpY4fLgYouYBo8SnRR8ZQWp4BTwkZh19xw5i
 CwPZM84/BLPZBLQkbvzexApiiwioSDz+fAFsAbPAKUaJ3dt3MIMkWARUJXZPOsMOsoBTwELi
 0TsZiAXvGCUuzlkEVsMsoCnRuv03O8RBOhJvT/WBHcQrICjxd4cwRIm8xPa3c5gnMArOQtIx
 C6FqFpKqBYzMqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxgqNCS2sH44kT8YcYBTgY
 lXh4HbLy44RYE8uKK3MPMUpwMCuJ8C4uBArxpiRWVqUW5ccXleakFh9ilOZgURLnlc8/Fikk
 kJ5YkpqdmlqQWgSTZeLglGpgLNR+f7vWc8m7iULzN3OLiKpP/HB987ds24teZ3x0FpvrtWT2
 ZzCkn3xvxGi90EHPJdntgXfiipaOXQzsR7P4r5kqtWS9XfS6REv5z9bVM72uuX65Z8njq/Uk
 tuX2w/bk2tn7rnEXeK+fPF2ixcq96dLlqsVfZzAyRUSG7hT+UHOAgyf/frWzEktxRqKhFnNR
 cSIA6l8aaoYCAAA=
X-CMS-MailID: 20200317110008epcas1p3d8a2c38e25ec7bd22c785c6aa2a6cb65
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_040014_232392_AFD70CAA 
X-CRM114-Status: GOOD (  36.21  )
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

Hi, Michael,

On Fri, 2020-03-13 at 17:24 +0100, Michael Walle wrote:
> Hi Jungseung,
> 
> sorry for the late review.
> 

Not at all. thanks for your review.

> Am 2020-03-04 12:07, schrieb Jungseung Lee:
> > Currently, we are supporting block protection only for
> > flash chips with 3 block protection bits in the SR register.
> > This patch enables block protection support for flashes with
> > 4 block protection bits(bp0-3).
> > 
> > Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 82
> > ++++++++++++++++++++++++++++++++---
> >  include/linux/mtd/spi-nor.h   |  4 ++
> >  2 files changed, 79 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c 
> > b/drivers/mtd/spi-nor/spi-nor.c
> > index c58c27552a74..31a2106e529a 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -238,6 +238,14 @@ struct flash_info {
> >  					 * status register. Must be
> > used with
> >  					 * SPI_NOR_HAS_TB.
> >  					 */
> > +#define SPI_NOR_4BIT_BP		BIT(17)	/*
> > +					 * Flash SR has 4 bit fields
> > (BP0-3)
> > +					 * for block protection.
> > +					 */
> > +#define SPI_NOR_BP3_SR_BIT6	BIT(18)	/*
> > +					 * BP3 is bit 6 of status
> > register.
> > +					 * Must be used with
> > SPI_NOR_4BIT_BP.
> > +					 */
> > 
> >  	/* Part specific fixup hooks. */
> >  	const struct spi_nor_fixups *fixups;
> > @@ -1786,7 +1794,16 @@ static int spi_nor_erase(struct mtd_info
> > *mtd,
> > struct erase_info *instr)
> > 
> >  static u8 spi_nor_get_bp_mask(struct spi_nor *nor)
> >  {
> > -	return SR_BP2 | SR_BP1 | SR_BP0;
> > +	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> > +
> 
> can we just use the SR_BP3 eg:
> 
> 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> 	if (nor->flags & SNOR_F_HAS_4BIT_BP)
> 		mask |= SR_BP3;
> 	return mask;
> 
> 

I'd prefer this one too if we can, but there are some places to need
the real mask value. It is also used in other places such as
spi_nor_sr_lock/unlock.

> > +	if (nor->flags & SNOR_F_HAS_4BIT_BP) {
> > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> > +			mask = mask | SR_BP3_BIT6;
> > +		else
> > +			mask = mask | SR_BP3_BIT5;
> > +	}
> > +
> > +	return mask;
> >  }
> > 
> >  static u8 spi_nor_get_tb_mask(struct spi_nor *nor)
> > @@ -1797,12 +1814,26 @@ static u8 spi_nor_get_tb_mask(struct
> > spi_nor 
> > *nor)
> >  		return SR_TB_BIT5;
> >  }
> > 
> > +static u8 stm_get_bpval_from_sr(struct spi_nor *nor, u8 sr) {
> > +	u8 mask = spi_nor_get_bp_mask(nor);
> > +	u8 bp = sr & mask;
> > +
> > +	if (bp & SR_BP3_BIT6)
> > +		bp = (bp & ~BIT(6)) | BIT(5);
> > +
> > +	bp = bp >> SR_BP_SHIFT;
> > +
> > +	return bp;
> > +}
> 
> Don't convert this. It makes the code really hard to read. See below.
> 
> > +
> >  static int stm_get_min_prot_length(struct spi_nor *nor)
> >  {
> >  	int bp_slots, bp_slots_needed;
> > -	u8 mask = spi_nor_get_bp_mask(nor);
> > 
> > -	bp_slots = (mask >> SR_BP_SHIFT) + 1;
> 
> Then just keep this.
> 
> > +	if (nor->flags & SNOR_F_HAS_4BIT_BP)
> > +		bp_slots = 1 << 4;
> > +	else
> > +		bp_slots = 1 << 3;
> > 
> >  	/* Reserved one for "protect none" and one for "protect all".
> > */
> >  	bp_slots = bp_slots - 2;
> > @@ -1821,9 +1852,8 @@ static void stm_get_locked_range(struct
> > spi_nor
> > *nor, u8 sr, loff_t *ofs,
> >  {
> >  	struct mtd_info *mtd = &nor->mtd;
> >  	int min_prot_len;
> > -	u8 mask = spi_nor_get_bp_mask(nor);
> >  	u8 tb_mask = spi_nor_get_tb_mask(nor);
> > -	u8 bp = (sr & mask) >> SR_BP_SHIFT;
> > +	u8 bp = stm_get_bpval_from_sr(nor, sr);
> 
> also this.
> 
> > 
> >  	if (!bp) {
> >  		/* No protection */
> > @@ -1881,7 +1911,7 @@ static int stm_is_unlocked_sr(struct spi_nor
> > *nor, loff_t ofs, uint64_t len,
> > 
> >  /*
> >   * Lock a region of the flash. Compatible with ST Micro and
> > similar 
> > flash.
> > - * Supports the block protection bits BP{0,1,2} in the status
> > register
> > + * Supports the block protection bits BP{0,1,2}/BP{0,1,2,3} in the
> > status register
> >   * (SR). Does not support these features found in newer SR
> > bitfields:
> >   *   - SEC: sector/block protect - only handle SEC=0 (block
> > protect)
> >   *   - CMP: complement protect - only support CMP=0 (range is not 
> > complemented)
> > @@ -1889,7 +1919,7 @@ static int stm_is_unlocked_sr(struct spi_nor
> > *nor, loff_t ofs, uint64_t len,
> >   * Support for the following is provided conditionally for some
> > flash:
> >   *   - TB: top/bottom protect
> >   *
> > - * Sample table portion for 8MB flash (Winbond w25q64fw):
> > + * Sample table portion for 8MB flash (Winbond w25q64fw / BP0-2):
> >   *
> >   *   SEC  |  TB   |  BP2  |  BP1  |  BP0  |  Prot Length  |
> > Protected 
> > Portion
> >   *  
> > -----------------------------------------------------------------
> > ---------
> > @@ -1909,6 +1939,32 @@ static int stm_is_unlocked_sr(struct spi_nor
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
> > Protected 
> > Portion
> > + *  
> > -----------------------------------------------------------------
> > ---------
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
> > + *  
> > ------|-------|-------|-------|-------|---------------|----------
> > ---------
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
> > @@ -1960,6 +2016,9 @@ static int stm_lock(struct spi_nor *nor,
> > loff_t
> > ofs, uint64_t len)
> >  		min_prot_len = stm_get_min_prot_length(nor);
> >  		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
> >  		val = pow << SR_BP_SHIFT;
> > +
> > +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> > +			val = (val & ~BIT(5)) | BIT(6);
> 
> .. and the use just the following here:
> 
> if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
> 	val = (val & ~SR_BP3) | SR_BP3_BIT6;
> 
> Ie. just use the "normal case" where all BP bits are next to each
> other
> and then fixup the resulting value and shift the SR3 bit if
> necessary.
> This will be much easier to read.
> 

Yes, I agree. It would be better to minimize this kind of conversion in
one place.

> >  	}
> > 
> >  	if (val & ~mask)
> > @@ -2042,6 +2101,9 @@ static int stm_unlock(struct spi_nor *nor,
> > loff_t ofs, uint64_t len)
> >  		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
> >  		val = pow << SR_BP_SHIFT;
> > 
> > +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> > +			val = (val & ~BIT(5)) | BIT(6);
> > +
> 
> here would be the other way around:
> 
> if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
> 	val = (val & ~SR_BP3_BIT6) | SR_BP3;
> 
> 
> >  		/* Some power-of-two sizes are not supported */
> >  		if (val & ~mask)
> >  			return -EINVAL;
> > @@ -5244,6 +5306,12 @@ int spi_nor_scan(struct spi_nor *nor, const
> > char 
> > *name,
> >  	if (info->flags & USE_CLSR)
> >  		nor->flags |= SNOR_F_USE_CLSR;
> > 
> > +	if (info->flags & SPI_NOR_4BIT_BP) {
> > +		nor->flags |= SNOR_F_HAS_4BIT_BP;
> > +		if (info->flags & SPI_NOR_BP3_SR_BIT6)
> > +			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
> > +	}
> > +
> >  	if (info->flags & SPI_NOR_NO_ERASE)
> >  		mtd->flags |= MTD_NO_ERASE;
> > 
> > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-
> > nor.h
> > index de90724f62f1..0190ed21576a 100644
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
> IMHO just SR_BP3. but that is a matter of taste. But it is easier on
> the eye in the mask = SR_BP3 | SR_BP2 etc case.
> 

SR_BP3 would be a more appropriate name if we could set the case with
all BP bits next to each other as the "normal case."

I'm going to write patches based on latest spi-nor/next including what
you mentioned.

Thanks,

> -michael
> 
> >  #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect */
> > +#define SR_BP3_BIT6		BIT(6)	/* Block protect 3
> > */
> >  #define SR_SRWD			BIT(7)	/* SR write protect
> > */
> >  /* Spansion/Cypress specific status bits */
> >  #define SR_E_ERR		BIT(5)
> > @@ -240,6 +242,8 @@ enum spi_nor_option_flags {
> >  	SNOR_F_HAS_16BIT_SR	= BIT(9),
> >  	SNOR_F_NO_READ_CR	= BIT(10),
> >  	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
> > +	SNOR_F_HAS_4BIT_BP	= BIT(12),
> > +	SNOR_F_HAS_SR_BP3_BIT6	= BIT(13),
> > 
> >  };
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
