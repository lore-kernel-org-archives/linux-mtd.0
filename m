Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DFAC41621
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 03:53:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95B5F20714
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 03:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sw7f/h36";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="MjNNRRYN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95B5F20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XzunW2KnJ/ZgLYGuf/h2nNygLUAUG27JYuD/jn+26OU=; b=sw7f/h36PauoPO
	cl6RFEMMFdTpkPmQq1mEvVgwwEZ/wkq9edl5ZI8N+fXfVzOZQxlzP4X29LxLUjL7YjlDC9XyxbJbe
	fxcQICHYPEyvpHeORaZiIQGqKf5Yo0zBtysVx81ggLIOQPBE0RlTIX+3BvuOelFbxeHlM64EqwIIh
	cwegJoPkAvVVZTyRag6c26/kZ/jbpW7W4cE5XFMn+ToIuD0KmJZSDQNzhfnbUGbtchDo/zAlZwvu7
	/YwMcZPJNXzSuZosHN/JHkgge7yZjX+9/leOznUDE+TmO4r78dTi0/mouUCJsyUnb+aHdam1DPTJP
	pXejrunQlND5+hGLvNiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGacm-0005l6-Gk; Tue, 24 Mar 2020 03:53:08 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGacj-0005kR-0l
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 03:53:07 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200324035300epoutp0437984ea460a75a0c59630f3be7d934a0~-IRgCONmX2999229992epoutp04b
 for <linux-mtd@lists.infradead.org>; Tue, 24 Mar 2020 03:53:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200324035300epoutp0437984ea460a75a0c59630f3be7d934a0~-IRgCONmX2999229992epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585021980;
 bh=G8bisu6W+IPuffq26Y/p9R7swoDeXyeduhLyty4LMy4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=MjNNRRYNLdPcNM21w0KUE0faJBYiTiM6X2wYbdFhpXLamhuxsEo13e/2CA+LzoP9G
 V/1zNwzP/YsO/ec9K0iK56FxBk3/mKmnulpPjvUuHIYg+/C2bUKSAM7o4IhQ1SBV1s
 pwIyv3otMBUoA+xoEQLB92NnCl5coPB+I3nkeHDg=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200324035300epcas1p20d3023a921a4f8c4cd3a13d325f124cb~-IRfzIw802718527185epcas1p2l;
 Tue, 24 Mar 2020 03:53:00 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.166]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 48mclv4TmJzMqYkq; Tue, 24 Mar
 2020 03:52:59 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 41.AF.04140.A14897E5; Tue, 24 Mar 2020 12:52:58 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200324035258epcas1p3c4f44b499f65df96665f90924ef2dadf~-IRdiTxdE1332213322epcas1p3b;
 Tue, 24 Mar 2020 03:52:58 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200324035258epsmtrp27a76acd777afcea84cb772929cfcd8f9~-IRdhqIC92018420184epsmtrp2L;
 Tue, 24 Mar 2020 03:52:58 +0000 (GMT)
X-AuditID: b6c32a36-fa3ff7000000102c-cb-5e79841a0cbd
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 8B.1B.04024.A14897E5; Tue, 24 Mar 2020 12:52:58 +0900 (KST)
Received: from asdf (unknown [10.88.100.192]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200324035257epsmtip170274fe9f8a01e8bb6d75c6f22a8fcce~-IRdXqwy01451714517epsmtip1f;
 Tue, 24 Mar 2020 03:52:57 +0000 (GMT)
Message-ID: <794ff38f1976ed842d13abec7b0a87e0727cb5f8.camel@samsung.com>
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor.Ambarus@microchip.com, michael@walle.cc, vigneshr@ti.com,
 js07.lee@samsung.com
Date: Tue, 24 Mar 2020 12:52:57 +0900
In-Reply-To: <20200323092430.1466234-2-tudor.ambarus@microchip.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTYRTn8+5xlRa3+egwstbtAUrq5txcQ3vQg0VRplBk5LrMryntxe4U
 LUqJFSkpWmQgvSgztUQpcZosTC1TU6P+0LQkplZGamX2YJht3kX99/t+53fO75zzHZIQFwkk
 ZKbZjm1mxkgLgniN7RHRURJHbpos371G7X7l4atbTlUK1ZM99UL1l4pN6vnez8JNfO39ijzt
 65+3kLa4oQZpOwedAdpWl0OQxE81JmRgJh3bpNist6Rnmg2J9M4U3RadUiWTR8nXq+NpqZkx
 4UR6666kqO2ZRq83Lc1mjFleKolhWTpmQ4LNkmXH0gwLa0+ksTXdaJXLrNEsY2KzzIZovcWk
 kctksUqv8rAxw9k1i6wdUTkNnpdEPnoXXogCSaDi4NfZDl4hCiLFVBOC1ulSvi8gpr4iqB4W
 cYHvCKoaKgP+ZrjK5wVcwIVgzlnif7gRlPY/EfhUIkoLdVcnFkoFU8nwoqBnAQuoSBj03FvA
 IVQq/C4oEhYikiSoldDcmOCjedQaqH1WJfThQGoL1HRdEHDG62Cyu5jnk4uoJTDXFOyjCWoF
 OCcvE74WgGoVQEVfmb/RreAZnhdyOBg+djb4sQRmplz+miw0V5cKuWQHAvftCr9IAVOTtQTX
 WwTUPYjhaG+bniuIM14MU7Pn+D4JUCI4e0bMSWj49NbB4zDA89EiPoe1MOJsE3Kr6kfwaGgw
 oARJy/+NU/7fOOX/jK8jogaFYStrMmBWbo39/3/voYVTjFQ1oRt9u9oQRSJ6kai+LCdNzGey
 2VxTGwKSoENE97GXEqUzucewzaKzZRkx24aU3mWXEpJQvcV72Ga7Tq6MVSgU6jhVvEqpoJeK
 Lg4Y08SUgbHjoxhbse1vXgAZKMlHug7J+fqH36q6N2xbclczFpa3TelaLBkytFyN25zt1pSl
 tJ861Ft8ItRzLeVO9oebYWXJIwcwbA9fq3nfN64fPrkDb5zZHX46TTyw/DGdeuli7Z6SgqaD
 0+MTO9uvO+pj9lmOFEzQP47f1ozhS6N7V/fDqnH9/lBVt2LVm2XNE5VPaR6bwcgjCRvL/AFD
 5h5qoAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHLMWRmVeSWpSXmKPExsWy7bCSnK5US2WcQdM6VotHN3+zWuxuWsZu
 8fb0BnaLj0scLP6f/cDuwOqxeUm9x50fSxk9+rasYvQ4fmM7k8eBvS1sAaxRXDYpqTmZZalF
 +nYJXBnbT35lLDiiW7Hl92XmBsZnsl2MnBwSAiYSe2f9Z+ti5OIQEtjNKHHs5EdWiISExKOd
 X1i6GDmAbGGJw4eLIWoeMEq8O/aMEaSGV8BDYv28l2D1wgJBEpc6T4PZbAJaEjd+bwKzRQSi
 JXo+LWcGmcMsoCixc5sNSJhFQFVi7ZkV7CA2p4CzxKqTk6FuuMgosbzxONh8ZgFNidbtv9kh
 7tGReHuqD+weXgFBib87hCFK5CW2v53DPIFRcBaSjlkIVbOQVC1gZF7FKJlaUJybnltsWGCY
 l1quV5yYW1yal66XnJ+7iREc6lqaOxgvL4k/xCjAwajEw8sxsyJOiDWxrLgy9xCjBAezkgjv
 5lSgEG9KYmVValF+fFFpTmrxIUZpDhYlcd6neccihQTSE0tSs1NTC1KLYLJMHJxSDYz1Spss
 nzz+wDThScnXV0cnz/jz1ZuDWefRWi82WR6+D6HPbM6Ltz1yY27UKVuwQnDBpMBbcXK7F97n
 YTjyuEpK1oLPdoJQG/tR89rZnapmc70sF9cmZqt5z2j4tbeo/p4vv4l/r3LUrHVrZTjDNq0o
 cyz/e2bpoY8fj87d7/dON/KDVYfnzCQlluKMREMt5qLiRADa4sEwcQIAAA==
X-CMS-MailID: 20200324035258epcas1p3c4f44b499f65df96665f90924ef2dadf
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200323092441epcas1p2b6410e4734cf25203daa19a0ad349a33
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <CGME20200323092441epcas1p2b6410e4734cf25203daa19a0ad349a33@epcas1p2.samsung.com>
 <20200323092430.1466234-2-tudor.ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_205305_598167_A9C2FE2D 
X-CRM114-Status: GOOD (  26.09  )
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

Hi, Tudor,

On Mon, 2020-03-23 at 09:24 +0000, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Fix the gap for the SR block protection, the BP bits were set with
> a +1 value than actually needed. This patch does not change the
> behavior of the locking operations, just fixes the protected areas.
> 
> On a 16Mbit flash with 64KByte erase sector, the following changed
> for the lock operation:
> 
> Number of blocks | BP2:0 before | BP2:0 now |
>                1 | 010b         | 001b      |
>                2 | 110b         | 010b      |
>                3 | 110b         | 010b      |
>                4 | 100b         | 011b      |
>                5 | 100b         | 011b      |
>                6 | 100b         | 011b      |
>                7 | 100b         | 011b      |
>                8 | 101b         | 100b      |
>                9 | 101b         | 100b      |
>              ... | ...          | ...       |
> 
> For the lock operation, if one requests to lock an area that is not
> matching the upper boundary of a BP protected area, we round down
> the total length and lock less than the user requested, in order to
> not lock more than the user actually requested.
> 
> For the unlock operation, read the number of blocks column as
> "locked all but number of blocks value". On a 16Mbit flash with
> 64KByte erase sector, the following changed for the lock operation:
> 
> Number of blocks | BP2:0 before | BP2:0 now |
>                1 | 111b         | 101b      |
>              ... | ...          | ...       |
>               15 | 111b         | 101b      |
>               16 | 110b         | 101b      |
>               17 | 110b         | 100b      |
>              ... | ...          | ...       |
>               24 | 101b         | 100b      |
>               25 | 101b         | 011b      |
>               26 | 101b         | 011b      |
>               27 | 101b         | 011b      |
>               28 | 100b         | 011b      |
>               29 | 100b         | 010b      |
>               30 | 011b         | 010b      |
>               31 | 010b         | 001b      |
>               32 | 000b         | 000b      |
> 
> For the unlock operation, if one requests to unlock an area that is
> not matching the upper boundary of a BP protected area, we round up
> the total length and unlock more than the user actually requested.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 877557dbda7f..36660068bc04 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1654,13 +1654,13 @@ static int spi_nor_sr_lock(struct spi_nor
> *nor, loff_t ofs, uint64_t len)
>  	/*
>  	 * Need smallest pow such that:
>  	 *
> -	 *   1 / (2^pow) <= (len / size)
> +	 *   1 / ((2^pow) - 1) <= (len / size)
>  	 *
>  	 * so (assuming power-of-2 size) we do:
>  	 *
> -	 *   pow = ceil(log2(size / len)) = log2(size) -
> floor(log2(len))
> +	 *   pow = ceil(log2(size / len)) = log2(size) -
> floor(log2(len)) + 1
>  	 */
> -	pow = ilog2(mtd->size) - ilog2(lock_len);
> +	pow = ilog2(mtd->size) - ilog2(lock_len) + 1;
>  	val = mask - (pow << SR_BP_SHIFT);
>  	if (val & ~mask)
>  		return -EINVAL;

    (1) - if bp slot is insufficient.
    (2) - if bp slot is sufficient.

    if (bp_slots_needed > bp_slots)    // (1) 
        min_prot_length = sector_size << (bp_slots_needed - bp_slots);	
	
    else                               // (2) 
        min_prot_length = sector_size;

I think that current mainline implementation is only valid for flashes
in case (1). (for BP0-2 : 1/64, 1/32 ...) Isn't it?

This is current implementaion.
	pow = ilog2(mtd->size) - order_base_2(lock_len)
	val = mask - (pow << SR_BP_SHIFT);

1/64 6 = 110b -> 001b
1/32 5 = 101b -> 010b
1/16 4 = 100b -> 011b
1/8  3 = 011b -> 100b
1/4  2 = 010b -> 101b
1/2  1 = 001b -> 110b
ALL  0 = 000b -> 111b

It is handling case (1) admirably. In other cases, however, the
situation would be different.


A 16Mbit flash with 64KByte erase sector(which you mentioned on this
patch) should get 32 erase sectors and seems that it's smallest
protected portion is 1/32.

So supporting the flash, it needs some modification as you did.

	pow = ilog2(mtd->size) - order_base_2(lock_len) + 1
	val = mask - (pow << SR_BP_SHIFT);

1/64 6 = 110b 111b -> 000b (execption case)
1/32 5 = 101b 110b -> 001b
1/16 4 = 100b 101b -> 010b
1/8  3 = 011b 100b -> 011b
1/4  2 = 010b 011b -> 100b
1/2  1 = 001b 010b -> 101b
ALL  0 = 000b 001b -> 110b

It would works for the flash, but it will conflicts with flashes in
case (1) what has already been applied on mainline.

And there are too various flashes that has different protected portions
to handle with the above.

Btw, the description on this patch is exactly what I had been looking
for before and seems it's very useful.

Thanks,


> @@ -1739,13 +1739,13 @@ static int spi_nor_sr_unlock(struct spi_nor
> *nor, loff_t ofs, uint64_t len)
>  	/*
>  	 * Need largest pow such that:
>  	 *
> -	 *   1 / (2^pow) >= (len / size)
> +	 *   1 / ((2^pow) - 1) >= (len / size)
>  	 *
>  	 * so (assuming power-of-2 size) we do:
>  	 *
> -	 *   pow = floor(log2(size / len)) = log2(size) -
> ceil(log2(len))
> +	 *   pow = floor(log2(size / len)) = log2(size) -
> ceil(log2(len)) + 1
>  	 */
> -	pow = ilog2(mtd->size) - order_base_2(lock_len);
> +	pow = ilog2(mtd->size) - order_base_2(lock_len) + 1;
>  	if (lock_len == 0) {
>  		val = 0; /* fully unlocked */
>  	} else {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
