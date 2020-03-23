Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE9AC4332B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 13:33:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 925112074D
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 13:33:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G7G54+yW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="T41Dp7Ez"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 925112074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkEY+E3zvpOohddTVjSkhlNmSVm3pH7Ahhq7PyfTq6U=; b=G7G54+yWXUATTb
	qJQI0tGeNWTLGmJde6JgdmiTDorE8SRzxtZNthy5R3uDesDpDjGR3zhIjWfbtvBqGKnRbNKMjkPLr
	WGMK7oycqJ0d5gUcQePZFWAUNSogD4ydxFFh7FmkZmJEGvJS+mDYMAtcm29UnCAInOqaUUopVOc2l
	RhYON1azLLjr/jZm8FMrq8BIweQN7GjpDhGEnQ5GJLK51k6T3KqazV0PxhjlmwvhKFFvnQzUfBxVL
	BknGuT7TcgIDguQ5hHYoPH3wXeLxEd08uC6OcENdfL2dS5wkNZhf5jD3uGLo7Cst30EhW2p5WZhWW
	C88SKDtvTyOvuJUqI7IA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGNCM-0001dq-RG; Mon, 23 Mar 2020 13:32:58 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGNCI-0001dI-1N
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 13:32:57 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200323133250epoutp01a368d5490f8f4eedb61563d95e8e755d~_8ieVqmf20846508465epoutp01f
 for <linux-mtd@lists.infradead.org>; Mon, 23 Mar 2020 13:32:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200323133250epoutp01a368d5490f8f4eedb61563d95e8e755d~_8ieVqmf20846508465epoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584970370;
 bh=HltyJx6Vx+2AECz6AWznKbYzirN9rTA7eU/Wg+M8i0k=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=T41Dp7EzioluOpnYpABrJgMMEGiUaNNvRhXsGzV1pCTiEjfkL9bLgrC3GTmxDUaBl
 Y7GfPEGkhYorO2jlgLo6gUQxNejPXaaNS8Y0tO/Xfzhe8VF14+kB6PrNd9ZPOPFMEJ
 FOpI4hoz5tfvW/5xmZryGpmSvsVh43mXdXFoIhQM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200323133250epcas1p177d949703d99428745cae4ed808e88c4~_8ieFsosF1589315893epcas1p1G;
 Mon, 23 Mar 2020 13:32:50 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.164]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48mFgP3npwzMqYkV; Mon, 23 Mar
 2020 13:32:49 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 63.D9.04140.18AB87E5; Mon, 23 Mar 2020 22:32:49 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200323133248epcas1p3e7e9a995f140557c762966a61ab7f7ea~_8icaKZWp0082400824epcas1p3R;
 Mon, 23 Mar 2020 13:32:48 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200323133248epsmtrp273dfc178f144f2ce46f784ed74c0aff1~_8icZmRdW1390613906epsmtrp2p;
 Mon, 23 Mar 2020 13:32:48 +0000 (GMT)
X-AuditID: b6c32a36-fbbff7000000102c-f9-5e78ba814b10
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 42.47.04158.08AB87E5; Mon, 23 Mar 2020 22:32:48 +0900 (KST)
Received: from asdf (unknown [10.88.100.192]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200323133248epsmtip2c9e3cb830733fcefcb4f62ee19ff830b~_8icTNudT2802028020epsmtip2f;
 Mon, 23 Mar 2020 13:32:48 +0000 (GMT)
Message-ID: <dd90ca2707b6c78adbaaf608ad21d2268f09d382.camel@samsung.com>
Subject: Re: [PATCH v3 3/5] mtd: spi-nor: Add new formula for SR block
 protection handling
From: Jungseung Lee <js07.lee@samsung.com>
To: js07.lee@samsung.com, michael@walle.cc, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, Tudor.Ambarus@microchip.com
Date: Mon, 23 Mar 2020 22:32:48 +0900
In-Reply-To: <000001d600ff$063a8fd0$12afaf70$@samsung.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgk+LIzCtJLcpLzFFi42LZdlhTX7dxV0WcwbUueYtHN3+zWuxuWsZu
 8fb0BnaLj0scLP6f/cDuwOqxeUm9x50fSxk9+rasYvQ4fmM7k8eBvS1sAaxROTYZqYkpqUUK
 qXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QLuVFMoSc0qBQgGJxcVK
 +nY2RfmlJakKGfnFJbZKqQUpOQWGBgV6xYm5xaV56XrJ+blWhgYGRqZAlQk5GQ8u6hXsMqz4
 sfk/UwPjd9UuRk4OCQETiYlbJ7B2MXJxCAnsYJRoPnqTCcL5xCix8dtbZgjnG6PE3Mav7F2M
 HGAt059UQsT3Mkrcff6eBWSUkMAjoI4vKiA2r4CHxOdJh5hBbGGBGInlx6eA2WwCWhI3fm9i
 BbFFBColLm9fzA5iswioStx5NoMRxOYUsJJ4/ussM8R5OhJvT/WxgOzlFRCU+LtDGCTMLCAv
 sf3tHLDbJAQ2sEm82b6ADaLeRWLbnessELawxKvjW9ghbCmJz+/2QtUUS+xcOZEdormFUeLR
 8iVQRcYS796uZQZZxiygKbF+lz5EWFFi5++5jBCL+STefe1hhYQDr0RHmxBEiZLEmwctUGsl
 JC487mWFsD0kXh3eygIJq/+MEqf/nWSZwCg/C+GdWUjemYWweAEj8ypGsdSC4tz01GLDAiPk
 KN3ECE59WmY7GBed8znEKMDBqMTDu2FaRZwQa2JZcWXuIUYJDmYlEd7NqUAh3pTEyqrUovz4
 otKc1OJDjKbAwJ7ILCWanA9My3kl8YamRsbGxhYmZuZmpsZK4rxTr+fECQmkJ5akZqemFqQW
 wfQxcXBKNTDOkd9Usb3Qc28ql9aekibl6A0d7g9v3JOKdXPOWiRsa/etMf3595N6JpHzEi8V
 RL1Tz25SebnRIEU6//veFR+1E7yLI3O9Q8u0/3gVf2+53f+o6u5/xzsr4u5U2V61SXnIsNv9
 xx5J8x11Yud2JZ4J2Sr8Z1Lt/A3dy9PSmd/sawpaF6YQ163EUpyRaKjFXFScCAAIj8bSkwMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWy7bCSvG7Droo4g22HVSwe3fzNarG7aRm7
 xdvTG9gtPi5xsPh/9gO7A6vH5iX1Hnd+LGX06NuyitHj+I3tTB4H9rawBbBGcdmkpOZklqUW
 6dslcGU8uKhXsMuw4sfm/0wNjN9Vuxg5OCQETCSmP6nsYuTiEBLYzShx5t5kpi5GTqC4hMSj
 nV9YIGqEJQ4fLoaoecAo0bD8OzNIDa+Ah8TnSYfAbGGBGInlx6eA2WwCWhI3fm9iBbFFBKok
 nmxbAWazCKhK3Hk2gxHE5hSwknj+6ywzxNAmJolp0y+zgCSYBTQlWrf/Zoc4Qkfi7ak+sCN4
 BQQl/u4QhiiRl9j+dg7zBEaBWUg6ZiFUzUJStYCReRWjZGpBcW56brFhgVFearlecWJucWle
 ul5yfu4mRnBAa2ntYDxxIv4QowAHoxIPL8fMijgh1sSy4srcQ4wSHMxKIrybU4FCvCmJlVWp
 RfnxRaU5qcWHGKU5WJTEeeXzj0UKCaQnlqRmp6YWpBbBZJk4OKUaGO0fNYXXezwrDNO7E8NS
 tbt8zlulVuXplbNinMTLTuyesonZZenf2hs5LyN4y2oOCh/a/7346tJjHvzr3qa8D56S3epu
 Zhlqt+nGRsMtCeysc3RPMjhvWqRQ16eVHjTJe/buSM6Zi5scr8u8uc0/OzBdP/1Yv1gb981k
 jSsvdaV+nNmotCR0jRJLcUaioRZzUXEiACKUXwtkAgAA
X-CMS-MailID: 20200323133248epcas1p3e7e9a995f140557c762966a61ab7f7ea
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200323092440epcas1p3de979f13594433f3b6a8f6b2f570ee3a
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <CGME20200323092440epcas1p3de979f13594433f3b6a8f6b2f570ee3a@epcas1p3.samsung.com>
 <20200323092430.1466234-4-tudor.ambarus@microchip.com>
 <000001d600ff$063a8fd0$12afaf70$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_063254_510319_F7AB5BE0 
X-CRM114-Status: GOOD (  29.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com> 
> Sent: Monday, March 23, 2020 6:25 PM
> To: js07.lee@samsung.com; michael@walle.cc; vigneshr@ti.com
> Cc: linux-mtd@lists.infradead.org; Tudor.Ambarus@microchip.com
> Subject: [PATCH v3 3/5] mtd: spi-nor: Add new formula for SR block
> protection handling
> 
> From: Jungseung Lee <js07.lee@samsung.com>
> 
> The current mainline locking was restricted and could only be applied
> to flashes that has 3 block protection bit and fixed locking ratio.
> 
> A new method of normalization was reached at the end of the
> discussion [1].
> 
>     (1) - if bp slot is insufficient.
>     (2) - if bp slot is sufficient.
> 
>     if (bp_slots_needed > bp_slots)    // (1)
>         min_prot_length = sector_size << (bp_slots_needed -
> bp_slots);
>     else                               // (2)
>         min_prot_length = sector_size;
> 
> This patch changes logic to handle block protection based on
> min_prot_length.
> It is suitable for the overall flashes with exception of some corner
> cases
> (see EON and catalyst) and easy to extend and apply for the case of
> 2bit or
> 4bit block protection.
> 
> [1] https://protect2.fireeye.com/url?k=d62c9c1b-8bf82073-d62d1754-
> 0cc47a3356b2-012ef3655070329a&u=
> http://lists.infradead.org/pipermail/linux-
> mtd/2020-February/093934.html
> 
> Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> Tested-by: Michael Walle <michael@walle.cc>
> [ta: - drop spi_nor_get_bp_mask(), spi_nor_get_tb_mask()
> - rename spi_nor_get_min_prot_length/spi_nor_get_min_prot_length_sr
> - static u64 spi_nor_get_min_prot_length
> - unsigned int bp_slots, bp_slots_needed;
> - bp_slots = (mask >> SR_BP_SHIFT) + 1 - 2;
> - amend commit description]

All looks good and it's ok for me.

Thanks,

> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 72 ++++++++++++++++++++++------------
> ----
>  1 file changed, 41 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 3788a95c0a47..c0d186f417d8 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1514,29 +1514,51 @@ static int spi_nor_erase(struct mtd_info
> *mtd,
> struct erase_info *instr)
>  	return ret;
>  }
>  
> +static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
> +{
> +	unsigned int bp_slots, bp_slots_needed;
> +	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> +
> +	/* Reserved one for "protect none" and one for "protect all".
> */
> +	bp_slots = (mask >> SR_BP_SHIFT) + 1 - 2;
> +	bp_slots_needed = ilog2(nor->info->n_sectors);
> +
> +	if (bp_slots_needed > bp_slots)
> +		return nor->info->sector_size <<
> +			(bp_slots_needed - bp_slots);
> +	else
> +		return nor->info->sector_size;
> +}
> +
>  static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr,
> loff_t
> *ofs,
>  					uint64_t *len)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
> +	u64 min_prot_len;
>  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
>  	u8 tb_mask = SR_TB_BIT5;
> -	int pow;
> +	u8 bp = (sr & mask) >> SR_BP_SHIFT;
>  
>  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
>  		tb_mask = SR_TB_BIT6;
>  
> -	if (!(sr & mask)) {
> +	if (!bp) {
>  		/* No protection */
>  		*ofs = 0;
>  		*len = 0;
> -	} else {
> -		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
> -		*len = mtd->size >> pow;
> -		if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
> -			*ofs = 0;
> -		else
> -			*ofs = mtd->size - *len;
> +		return;
>  	}
> +
> +	min_prot_len = spi_nor_get_min_prot_length_sr(nor);
> +	*len = min_prot_len << (bp - 1);
> +
> +	if (*len > mtd->size)
> +		*len = mtd->size;
> +
> +	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
> +		*ofs = 0;
> +	else
> +		*ofs = mtd->size - *len;
>  }
>  
>  /*
> @@ -1609,6 +1631,7 @@ static int spi_nor_is_unlocked_sr(struct
> spi_nor
> *nor, loff_t ofs, uint64_t len,
>  static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t
> len)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
> +	u64 min_prot_len;
>  	int ret, status_old, status_new;
>  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
>  	u8 tb_mask = SR_TB_BIT5;
> @@ -1651,20 +1674,12 @@ static int spi_nor_sr_lock(struct spi_nor
> *nor,
> loff_t ofs, uint64_t len)
>  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
>  		tb_mask = SR_TB_BIT6;
>  
> -	/*
> -	 * Need smallest pow such that:
> -	 *
> -	 *   1 / ((2^pow) - 1) <= (len / size)
> -	 *
> -	 * so (assuming power-of-2 size) we do:
> -	 *
> -	 *   pow = ceil(log2(size / len)) = log2(size) -
> floor(log2(len)) +
> 1
> -	 */
>  	if (lock_len == mtd->size) {
>  		val = mask;
>  	} else {
> -		pow = ilog2(mtd->size) - ilog2(lock_len) + 1;
> -		val = mask - (pow << SR_BP_SHIFT);
> +		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
> +		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
> +		val = pow << SR_BP_SHIFT;
>  
>  		if (val & ~mask)
>  			return -EINVAL;
> @@ -1701,6 +1716,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor,
> loff_t ofs, uint64_t len)
>  static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs,
> uint64_t len)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
> +	u64 min_prot_len;
>  	int ret, status_old, status_new;
>  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
>  	u8 tb_mask = SR_TB_BIT5;
> @@ -1742,20 +1758,14 @@ static int spi_nor_sr_unlock(struct spi_nor
> *nor,
> loff_t ofs, uint64_t len)
>  
>  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
>  		tb_mask = SR_TB_BIT6;
> -	/*
> -	 * Need largest pow such that:
> -	 *
> -	 *   1 / ((2^pow) - 1) >= (len / size)
> -	 *
> -	 * so (assuming power-of-2 size) we do:
> -	 *
> -	 *   pow = floor(log2(size / len)) = log2(size) -
> ceil(log2(len)) +
> 1
> -	 */
> -	pow = ilog2(mtd->size) - order_base_2(lock_len) + 1;
> +
>  	if (lock_len == 0) {
>  		val = 0; /* fully unlocked */
>  	} else {
> -		val = mask - (pow << SR_BP_SHIFT);
> +		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
> +		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
> +		val = pow << SR_BP_SHIFT;
> +
>  		/* Some power-of-two sizes are not supported */
>  		if (val & ~mask)
>  			return -EINVAL;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
