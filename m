Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04541C4332B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 12:43:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE3F520663
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 12:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CgSe+gpx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EsWDBiZ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE3F520663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IT7ElHWmRn9/nx7EoKqPqSiOVyunYXqsiOgk0tZ63bU=; b=CgSe+gpxrEKROE
	olBmU722Q67KNi92bXGnoPYfBKzAv+bYdGIKgzyoMpfTPj375pPblr8CO/wHqyz2WYW6gXiS1JAxx
	KxqjLrxTF1EBKGqnyCIrEB+jM7owNiDFcPon0iHnQLm7R2hZu1ybxWw3eZNTpdFsqObgkk568bVDJ
	9ZALioR0w+zyn/32tmngmaPibElmD09H5nvirauMGkT1fc9LW6JKRkl9wRKb1vqqTgbVFZUABwCRt
	ERro8++LhGrnFTfJqRMoRIOwwa4nYPjaaqWZJvIgYZtuF6wElzSAo0WM+xLSYYdqud4CXZ2eORg1I
	Iz6o/8F03zzsu+eWzQiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGMQI-00046k-Pm; Mon, 23 Mar 2020 12:43:18 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGMQF-000466-2f
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 12:43:17 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200323124312epoutp046d09b9150f239d4cd1544535c807c955~_73IWldlf0741607416epoutp04R
 for <linux-mtd@lists.infradead.org>; Mon, 23 Mar 2020 12:43:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200323124312epoutp046d09b9150f239d4cd1544535c807c955~_73IWldlf0741607416epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584967392;
 bh=eBsD/NaBRRW7YhhVvRKKIasm6e72oD+QlVRsA+xAuvc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=EsWDBiZ/jc/QINNnqmQF4XH7fl3rT9J0QMBvExu0hBMPwOSrbOhog9BN5G+z3veAU
 YZ82asjUrfkNsiWfyKDXGLNUYFzzorIOplAtVIAK7HD2U2YGyEfoF5EtDxG4pBHGEG
 bP/Kqo1xrdQ/rs6bTTRH4xuSmy8CGpe63yCQnS8c=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200323124311epcas1p3b3af5521952a2f803bb869cbb1863f21~_73IIDPkI1019010190epcas1p3B;
 Mon, 23 Mar 2020 12:43:11 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.161]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48mDZ708K9zMqYkY; Mon, 23 Mar
 2020 12:43:11 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 51.56.04074.EDEA87E5; Mon, 23 Mar 2020 21:43:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200323124310epcas1p1f8b7917be6df577e8221ce6f4aab4936~_73Gog9ib2466424664epcas1p1Z;
 Mon, 23 Mar 2020 12:43:10 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200323124310epsmtrp1912b539503bd99756d9297a9be2b8af6~_73GnDbKR1938619386epsmtrp1t;
 Mon, 23 Mar 2020 12:43:10 +0000 (GMT)
X-AuditID: b6c32a39-573ff70000000fea-7b-5e78aedea6f5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 53.F4.04024.EDEA87E5; Mon, 23 Mar 2020 21:43:10 +0900 (KST)
Received: from asdf (unknown [10.88.100.192]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200323124310epsmtip2aa1cecf6d72f4c83e3ef6e8d7cd0c86b~_73GeuSx61291512915epsmtip2E;
 Mon, 23 Mar 2020 12:43:10 +0000 (GMT)
Message-ID: <26331bf950dc9945aad93f874dcf15d639fe3424.camel@samsung.com>
Subject: Re: [PATCH v3 4/5] mtd: spi-nor: Add SR 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor.Ambarus@microchip.com, michael@walle.cc, vigneshr@ti.com
Date: Mon, 23 Mar 2020 21:43:09 +0900
In-Reply-To: <20200323092430.1466234-6-tudor.ambarus@microchip.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeT3z7CitTtPyyS+tE2FK6ubcnJeVpcVAg1FQFKEd3MuUdmNn
 EwtCK6kwswQtGkUXprFIM7WcdpmXyrKbBJIfTIemdJuVWEQSdY6nsG+/5//+H/7P+7wvRcgP
 kbFUic2FnTbWwpCRktt98cmJo81lBcpmT6buzuFGqS70tEWq++rN1v1+/kWaLTG0ecsNIz8a
 kKF/uCPM0H2vkjRKdluyijFrwk4FthXZTSU2s57J216YU6jRKlWJqnRdGqOwsVasZ3LzjYlb
 Six8IqMoZS1uXjKyHMckr89y2t0urCi2cy49gx0mi0OldCRxrJVz28xJRXZrhkqpTNHwzr2W
 Yk+gLsxxcWNZ9Z1BsgL9SKlCERTQqfDqUk+4wHLaj2Dy644qFMnzDIL62vuEWHxH0P2wj/zX
 MRrwScWDewiCI89IsRhHMDz7FgkuGW2AX5d7wgSOoo3w8eE3qcAknQDDc63zedH0JjgzNsR7
 KIqgV0Hn7SxBltBrYHbMTwgcQefA0NhjJAavg9BAjUSwy+il8MsfJcgEvRI6QufnBwW6nYQT
 kz5S8ACdCwNNTrE1Cj70t0tFjoX3p47+ZQ46fbVSsbcSwfhV798DNUyHmghxtHi40ZUsyvyU
 cxeQmLsYpr9Vh4tRMjh+VC5aGPgUrJSIDDA4cTJcZAN4DncR4qJfImisWX0aKTwLl/H8dxnP
 Qu4lRFxDy7GDs5oxp3Jo/n/dVjT//RLS/ejRi/xeRFOIWSRrOVNWIA9nS7n91l4EFMFEy9ow
 L8lM7P4D2GkvdLotmOtFGn7VtUTssiI7/5ltrkKVJkWtVutStWlajZqJkdW/thTIaTPrwvsw
 dmDnv74wKiK2AtVZf+78PHVkontIqpDrjdrKR9ErqrbNUE13+2t2zcZr6q/rzo4mtMwGct9k
 Jst7xkaKXHFLMrxmbUdq9tZ1uitP9ImuUKSvenPd6yl99OAtPy53fcnzTT4g1ioV1YdMQfOG
 41rfu4IY5aqKAw0Hz5UcmwqY47p/p9pDezJvBoOMhCtmVQmEk2P/AEvuwO6UAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSvO69dRVxBpO6+S12Ny1jt3h7egO7
 xcclDhb/z35gd2Dx2Lyk3uPOj6WMHsdvbGfyOLC3hS2AJYrLJiU1J7MstUjfLoErY9b+KUwF
 8x0renZfYGtg/GHUxcjJISFgInFv/0r2LkYuDiGB3YwS33YdYYFISEg82vkFyOYAsoUlDh8u
 hqh5wCgx59EiNpAaXgEPib8LDzKB2MICARKvj35lB7HZBLQkbvzexApiiwg4SUy7f5UJZA6z
 gKLEzm02IGEWAVWJL/d3MIPYnALOElfvn2CEmH+RUeL0tq1gM5kFNCVat/9mh7hHR+LtqT6w
 e3gFBCX+7hCGKJGX2P52DvMERsFZSDpmIVTNQlK1gJF5FaNkakFxbnpusWGBYV5quV5xYm5x
 aV66XnJ+7iZGcFhrae5gvLwk/hCjAAejEg8vx8yKOCHWxLLiytxDjBIczEoivJtTgUK8KYmV
 ValF+fFFpTmpxYcYpTlYlMR5n+YdixQSSE8sSc1OTS1ILYLJMnFwSjUwSn1ddslR78LkJZaL
 o5QOlvktENqiK5qsP4E3YI7em5wt8WEc8mEhcfOfVDmxRz38mrH+kSqDwAWnryd8my9pzjgZ
 MCHIfMuHT43dhwWUONlXqm9mtdUt7j+y49G+Op87i37MOBa031fspnxvmKUkF0fDkxaOeU47
 LfOXfThj0389kFE+Od9KiaU4I9FQi7moOBEAz00limcCAAA=
X-CMS-MailID: 20200323124310epcas1p1f8b7917be6df577e8221ce6f4aab4936
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200323092441epcas1p30bd5f41331ae8baba171e63fd78198ac
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <CGME20200323092441epcas1p30bd5f41331ae8baba171e63fd78198ac@epcas1p3.samsung.com>
 <20200323092430.1466234-6-tudor.ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_054315_543291_66731CF8 
X-CRM114-Status: GOOD (  28.64  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, 2020-03-23 at 09:24 +0000, Tudor.Ambarus@microchip.com wrote:
> From: Jungseung Lee <js07.lee@samsung.com>
> 
> Currently, we are supporting block protection only for flash chips
> with
> 3 block protection bits (BP0-2) in the SR register.
> 
> Enable block protection support for flashes with 4 block protection
> bits
> (BP0-3).
> 
> Add a flash_info flag for flashes that describe 4 block protection
> bits.
> Add another flash_info flag for flashes in which BP3 bit is not
> adjacent
> to the BP0-2 bits.
> 
> Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> Tested-by: Michael Walle <michael@walle.cc>
> [ta:
> - introduce spi_nor_get_sr_bp_mask(), spi_nor_get_sr_tb_mask()
> - drop Micron n25q512ax3 / BP0-3) boilerplate description
> - be explicit in spi_nor_get_locked_range_sr aboyt SR_BP3 as Michael
> suggested,
> - amend commit description]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 66 +++++++++++++++++++++++++++------
> ----
>  drivers/mtd/spi-nor/core.h  | 10 ++++++
>  include/linux/mtd/spi-nor.h |  2 ++
>  3 files changed, 60 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index c0d186f417d8..b70c0b2e0958 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1514,13 +1514,34 @@ static int spi_nor_erase(struct mtd_info
> *mtd, struct erase_info *instr)
>  	return ret;
>  }
>  
> +static u8 spi_nor_get_sr_bp_mask(struct spi_nor *nor)
> +{
> +	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> +
> +	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> +		return mask | SR_BP3_BIT6;
> +
> +	if (nor->flags & SNOR_F_HAS_4BIT_BP)
> +		return mask | SR_BP3;
> +
> +	return mask;
> +}
> +
> +static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
> +{
> +	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> +		return SR_TB_BIT6;
> +	else
> +		return SR_TB_BIT5;
> +}
> +
>  static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
>  {
>  	unsigned int bp_slots, bp_slots_needed;
> -	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> +	u8 mask = spi_nor_get_sr_bp_mask(nor);
>  
>  	/* Reserved one for "protect none" and one for "protect all".
> */
> -	bp_slots = (mask >> SR_BP_SHIFT) + 1 - 2;
> +	bp_slots = (1 << hweight8(mask)) - 2;
>  	bp_slots_needed = ilog2(nor->info->n_sectors);
>  
>  	if (bp_slots_needed > bp_slots)
> @@ -1535,12 +1556,14 @@ static void
> spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
>  {
>  	struct mtd_info *mtd = &nor->mtd;
>  	u64 min_prot_len;
> -	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> -	u8 tb_mask = SR_TB_BIT5;
> -	u8 bp = (sr & mask) >> SR_BP_SHIFT;
> +	u8 mask = spi_nor_get_sr_bp_mask(nor);
> +	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
> +	u8 bp, val = sr & mask;
>  
> -	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> -		tb_mask = SR_TB_BIT6;
> +	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
> +		val = (val & ~SR_BP3_BIT6) | SR_BP3;
> +
> +	bp = val >> SR_BP_SHIFT;
>  
>  	if (!bp) {
>  		/* No protection */
> @@ -1598,7 +1621,8 @@ static int spi_nor_is_unlocked_sr(struct
> spi_nor *nor, loff_t ofs, uint64_t len,
>  
>  /*
>   * Lock a region of the flash. Compatible with ST Micro and similar
> flash.
> - * Supports the block protection bits BP{0,1,2} in the status
> register
> + * Supports the block protection bits BP{0,1,2}/BP{0,1,2,3} in the
> status
> + * register
>   * (SR). Does not support these features found in newer SR
> bitfields:
>   *   - SEC: sector/block protect - only handle SEC=0 (block protect)
>   *   - CMP: complement protect - only support CMP=0 (range is not
> complemented)
> @@ -1633,8 +1657,8 @@ static int spi_nor_sr_lock(struct spi_nor *nor,
> loff_t ofs, uint64_t len)
>  	struct mtd_info *mtd = &nor->mtd;
>  	u64 min_prot_len;
>  	int ret, status_old, status_new;
> -	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> -	u8 tb_mask = SR_TB_BIT5;
> +	u8 mask = spi_nor_get_sr_bp_mask(nor);
> +	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
>  	u8 pow, val;
>  	loff_t lock_len;
>  	bool can_be_top = true, can_be_bottom = nor->flags &
> SNOR_F_HAS_SR_TB;
> @@ -1671,9 +1695,6 @@ static int spi_nor_sr_lock(struct spi_nor *nor,
> loff_t ofs, uint64_t len)
>  	else
>  		lock_len = ofs + len;
>  
> -	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> -		tb_mask = SR_TB_BIT6;
> -
>  	if (lock_len == mtd->size) {
>  		val = mask;
>  	} else {
> @@ -1681,6 +1702,9 @@ static int spi_nor_sr_lock(struct spi_nor *nor,
> loff_t ofs, uint64_t len)
>  		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
>  		val = pow << SR_BP_SHIFT;
>  
> +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val &
> SR_BP3)
> +			val = (val & ~SR_BP3) | SR_BP3_BIT6;
> +
>  		if (val & ~mask)
>  			return -EINVAL;
>  
> @@ -1718,8 +1742,8 @@ static int spi_nor_sr_unlock(struct spi_nor
> *nor, loff_t ofs, uint64_t len)
>  	struct mtd_info *mtd = &nor->mtd;
>  	u64 min_prot_len;
>  	int ret, status_old, status_new;
> -	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> -	u8 tb_mask = SR_TB_BIT5;
> +	u8 mask = spi_nor_get_sr_bp_mask(nor);
> +	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
>  	u8 pow, val;
>  	loff_t lock_len;
>  	bool can_be_top = true, can_be_bottom = nor->flags &
> SNOR_F_HAS_SR_TB;
> @@ -1756,9 +1780,6 @@ static int spi_nor_sr_unlock(struct spi_nor
> *nor, loff_t ofs, uint64_t len)
>  	else
>  		lock_len = ofs;
>  
> -	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> -		tb_mask = SR_TB_BIT6;
> -
>  	if (lock_len == 0) {
>  		val = 0; /* fully unlocked */
>  	} else {
> @@ -1766,6 +1787,9 @@ static int spi_nor_sr_unlock(struct spi_nor
> *nor, loff_t ofs, uint64_t len)
>  		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
>  		val = pow << SR_BP_SHIFT;
>  
> +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val &
> SR_BP3)
> +			val = (val & ~SR_BP3) | SR_BP3_BIT6;
> +
>  		/* Some power-of-two sizes are not supported */
>  		if (val & ~mask)
>  			return -EINVAL;
> @@ -3125,6 +3149,12 @@ int spi_nor_scan(struct spi_nor *nor, const
> char *name,
>  	if (info->flags & USE_CLSR)
>  		nor->flags |= SNOR_F_USE_CLSR;
>  
> +	if (info->flags & SPI_NOR_4BIT_BP) {
> +		nor->flags |= SNOR_F_HAS_4BIT_BP;
> +		if (info->flags & SPI_NOR_BP3_SR_BIT6)
> +			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
> +	}
> +
>  	if (info->flags & SPI_NOR_NO_ERASE)
>  		mtd->flags |= MTD_NO_ERASE;
>  
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 3ce826b35ad1..6f2f6b27173f 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -24,6 +24,8 @@ enum spi_nor_option_flags {
>  	SNOR_F_HAS_16BIT_SR	= BIT(9),
>  	SNOR_F_NO_READ_CR	= BIT(10),
>  	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
> +	SNOR_F_HAS_4BIT_BP      = BIT(12),
> +	SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
>  };
>  
>  struct spi_nor_read_command {
> @@ -301,6 +303,14 @@ struct flash_info {
>  					 * status register. Must be
> used with
>  					 * SPI_NOR_HAS_TB.
>  					 */
> +#define SPI_NOR_4BIT_BP		BIT(17) /*
> +					 * Flash SR has 4 bit fields
> (BP0-3)
> +					 * for block protection.
> +					 */
> +#define SPI_NOR_BP3_SR_BIT6	BIT(18) /*
> +					 * BP3 is bit 6 of status
> register.
> +					 * Must be used with
> SPI_NOR_4BIT_BP.
> +					 */
>  
>  	/* Part specific fixup hooks. */
>  	const struct spi_nor_fixups *fixups;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-
> nor.h
> index e656858b50a5..1e2af0ec1f03 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -111,7 +111,9 @@
>  #define SR_BP0			BIT(2)	/* Block protect 0 */
>  #define SR_BP1			BIT(3)	/* Block protect 1 */
>  #define SR_BP2			BIT(4)	/* Block protect 2 */
> +#define SR_BP3			BIT(5)	/* Block protect 3 */
>  #define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
> +#define SR_BP3_BIT6		BIT(6)	/* Block protect 3 */
>  #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect */
>  #define SR_SRWD			BIT(7)	/* SR write protect
> */
>  /* Spansion/Cypress specific status bits */

Tested with a n25q512ax3 (bp0-3) and w25q128 (bp0-2).
It passed all of my test cases.

Tested-by: Jungseung Lee <js07.lee@samsung.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
