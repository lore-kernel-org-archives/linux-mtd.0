Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82299C3F2CD
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 18:27:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5954D2051A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 18:27:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VsyRPQSf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="JkzFJV31"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5954D2051A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BASsM9jbyECNcHe4bC8UKX5CQhhgVGQUr0FLzLjiUCs=; b=VsyRPQSfeZti3APTyUJV2j4xf
	d7FAPvbNk9mvLIghXA6IbZttTZB40Wb2DP3XPcXwMjLhPRg2AR+tG6AXJwqyaOlbpgayhZv7Ik1zO
	uPR9VVIcDP4DTrfO+9K0UFFbxWh98SVwrVACTqLux7byASH5FrdnSgwtmTmRkKmQZu6PFxvqgugzy
	2Kv5I4DQPj7XVnyu0KdojIfZtkqZPxcI0t3/F3LUKIqKknpSi78wAmC15Sgu/+oG8+NB2UzbXd4do
	RmSdJDrS5GQCAVfrTCKDMIVybnIJ/7BoUWmertV+j6tt7dIM2yAIUK1yAZhj6+rmV1rCODGe9bdKG
	rFJL9YE+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGRnE-000885-Ev; Mon, 23 Mar 2020 18:27:20 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGRnA-00087e-UH
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 18:27:18 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9F8442304C;
 Mon, 23 Mar 2020 19:27:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1584988034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jXmKMnSViOzXiTgM8vM+s0qautTTUTSjWOyPyai5cMw=;
 b=JkzFJV31mChTHQM03+e+SkSFe4wjVG3M8Q8GZes4DX+keuUBCAgUWYpzpGhIGlCKwAjLYn
 MZNMxGEPOJexSrHeDZAPkWxLhpcmY2w0rEQZtg5yqyQi0q4dkKhmxz+lUNehrOuol1Njs9
 vN51XTBgh6id4rrAVInLB4wzYh3Usic=
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 19:27:13 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
In-Reply-To: <20200323092430.1466234-2-tudor.ambarus@microchip.com>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <20200323092430.1466234-2-tudor.ambarus@microchip.com>
Message-ID: <b9a6d699790e48723489ecbbf1322dfe@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: /
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 9F8442304C
X-Spamd-Result: default: False [-0.10 / 15.00]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_NONE(0.00)[];
 DKIM_SIGNED(0.00)[]; NEURAL_HAM(-0.00)[-0.775];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_112717_285236_5738847A 
X-CRM114-Status: GOOD (  19.72  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@samsung.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Am 2020-03-23 10:24, schrieb Tudor.Ambarus@microchip.com:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Fix the gap for the SR block protection, the BP bits were set with
> a +1 value than actually needed. This patch does not change the
> behavior of the locking operations, just fixes the protected areas.

So instead of rounding up, it does round down now?

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

I don't know if that is really what a user really want. Because you'd
end up with regions which the user believes are locked but are not.
IMHO if you'd have to make a choice I'd prefer to have the remainder
locked. Not the other way around. Esp. since the user explicitly
express to have a region locked.

-michael

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
> -	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
> +	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len)) + 1
>  	 */
> -	pow = ilog2(mtd->size) - ilog2(lock_len);
> +	pow = ilog2(mtd->size) - ilog2(lock_len) + 1;
>  	val = mask - (pow << SR_BP_SHIFT);
>  	if (val & ~mask)
>  		return -EINVAL;
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
> -	 *   pow = floor(log2(size / len)) = log2(size) - ceil(log2(len))
> +	 *   pow = floor(log2(size / len)) = log2(size) - ceil(log2(len)) + 1
>  	 */
> -	pow = ilog2(mtd->size) - order_base_2(lock_len);
> +	pow = ilog2(mtd->size) - order_base_2(lock_len) + 1;
>  	if (lock_len == 0) {
>  		val = 0; /* fully unlocked */
>  	} else {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
