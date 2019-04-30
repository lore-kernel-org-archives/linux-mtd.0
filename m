Return-Path: <SRS0=r2JG=TA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D862EC43219
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 17:13:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A757A2064A
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 17:13:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GNtxx+9v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="emNtFUXx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A757A2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rf6TEszR4h53rq18LHYM7POJdnVI7iL/MfwBtHrT0io=; b=GNtxx+9v6Fxh0G
	R0q7F0HS7sXVSzKIthqG0kGb+jE4Ktwcqkx9Ha7KlymJu1R2vYCwyip15OcubSulTo26ChUB0LJQ2
	Cak0E9Zpzt9hi7W4zbhhz59ne8zxBKYe7V4w8S3ua0X4jtjt8KsRlt1DUbld4ubZ6Xquc/L3CATER
	vv/wGCrotRgRZQxfkrGmDFbERMhxWYuwdGY3QDgAZ24ve/1TEJsm9qzEhZszU0qPKDI1uAAHBUldG
	JqS5Vt9pDe2ZE+6qiSZtpORfWfQLYgSLpg0YH9IPt5IIMALQ1YsRiJfnhAYtqLlb3XRqZUhrPyarT
	Y3CQ9XTDAXR1HhAj0TWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLWJn-0000TT-Lx; Tue, 30 Apr 2019 17:13:23 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLWJk-0000Gu-A9
 for linux-mtd@lists.infradead.org; Tue, 30 Apr 2019 17:13:21 +0000
Received: by mail-io1-xd44.google.com with SMTP id m14so1951189ion.13
 for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2019 10:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=jK04ckLw0I34yJUnmy5KSQzRcqzMiLH61Olu1nj5FW8=;
 b=emNtFUXxA6u3/X0LFCk/N10uGRLXoXN7d7GVsStivjArpsRMcME2Zqrfdavw7fxwEb
 XA/RviIt2rvTIl7KWC+tvORxzVDxNdl1cvTbRoU00fuR8cIIxYIlhPX2hB+khOPRzyM7
 tM6XxbMozgawjRU+uj6KAtZ7XTtOTzlnjVg5bL6SxL3O7Gh+hvQDViflYBwZC+MaF3RD
 Bfoj0xtDWxQ0xEFnQ2Wois9cUiiHE/bxIInR8J0YAiNe8/D3hUJeEzmjAIkRbgwzqgPl
 MMgfqCg4jxKx04FT5kDGVHrh/zUr5yOMWuNKJa3Rhe3LCYEgWJEsTRIJol9jc7I3FhBl
 9VtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=jK04ckLw0I34yJUnmy5KSQzRcqzMiLH61Olu1nj5FW8=;
 b=I2CUbkrYF44hDFhZQV2N34R8nj8MioI7+hzbeWIWyEhZC1dm4mT9ahIY8wXndFnZIo
 EZFxmuRYUxNU45qFdrSzQTtaMet0HY7wB0fVKUYb0AfJAb7zzM2uHaFQ4NClj6fRFR3D
 pPwLdpbnNsQ4MZk42gZKz70O0slgRITvGnd7PosmBpeICye+N7ew/lZK32qK9KdBTSDV
 3mvym8PJQzpt7GTLrYmHcQsI4wx28OwnBYSLZ3b5rl9e9r7u9EgWCFM14SFRFvcN98ad
 vf0AuJ9SNuURvsavWYO8RC8oV23BvNKd+HlvciooOcTYN1O5030RnHP/apXI7+pzxQgE
 8wXQ==
X-Gm-Message-State: APjAAAVGo80lH/aYfg6m3lP818vMZ0kAzeyvasOe94Wt6uQrmWZqbzlH
 w6CbGwcJfkUwqEhRcT7QdAzaeQ==
X-Google-Smtp-Source: APXvYqwmi65gW/QZM3FdeLpUsXcro8Mpg0Mj+1XnX3LL/CbQGIlPSbxiLXKUD6sVG4MQUwbLHM5tDA==
X-Received: by 2002:a6b:4f0f:: with SMTP id d15mr5036524iob.48.1556644398210; 
 Tue, 30 Apr 2019 10:13:18 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 f204sm1787534itc.26.2019.04.30.10.13.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Apr 2019 10:13:17 -0700 (PDT)
Date: Tue, 30 Apr 2019 10:13:16 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: add locking support for is25xxxxx
 device
In-Reply-To: <1556474956-27786-4-git-send-email-sagar.kadam@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1904301004060.7063@viisi.sifive.com>
References: <1556474956-27786-1-git-send-email-sagar.kadam@sifive.com>
 <1556474956-27786-4-git-send-email-sagar.kadam@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_101320_348850_B95707C1 
X-CRM114-Status: GOOD (  23.30  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: palmer@sifive.com, bbrezillon@kernel.org, richard@nod.at,
 tudor.ambarus@microchip.com, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 28 Apr 2019, Sagar Shrikant Kadam wrote:

> The locking scheme for ISSI devices is based on stm_lock mechanism.
> The is25xxxxx  devices have 4 bits for selecting the range of blocks to
> be locked for write.
> 
> The current implementation, blocks entire 512 blocks of flash memory.
> 
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 60 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 81c7b3e..2dba7e9 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1459,6 +1459,65 @@ static int macronix_quad_enable(struct spi_nor *nor)
>  
>  	return 0;
>  }
> +/**

The above sequence indicates a kerneldoc-style comment, but the format of 
the comment is not in kerneldoc format.  Please fix this comment to 
conform with

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/kernel-docs.rst


> + * Lock a region of the flash.Implementation is based on stm_lock
> + * Supports the block protection bits BP{0,1,2,3} in the status register
> + * Returns negative on errors, 0 on success.
> + */
> +static int issi_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{

Almost all of this function is copied and pasted from stm_lock().  Please 
don't do this: it adds bloat, makes the code hard to maintain, and 
increases the risk that fixes will only target one function rather than 
both.  Instead please pull the common code out into a separate static 
function.

> +	struct mtd_info *mtd = &nor->mtd;
> +	int status_old, status_new;
> +	u8 mask = SR_BP3 | SR_BP2 | SR_BP1 | SR_BP0;
> +	u8 shift = ffs(mask) - 1, pow, val = 0;
> +	loff_t lock_len;
> +	bool use_top = true;
> +
> +	status_old = read_sr(nor);
> +
> +	if (status_old < 0)
> +		return status_old;
> +
> +	/* lock_len: length of region that should end up locked */
> +	if (use_top)
> +		lock_len = mtd->size - ofs;
> +	else
> +		lock_len = ofs + len;
> +
> +	/*
> +	 * Need smallest pow such that:
> +	 *
> +	 *   1 / (2^pow) <= (len / size)
> +	 *
> +	 * so (assuming power-of-2 size) we do:
> +	 *
> +	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
> +	 */
> +	pow = ilog2(mtd->size) - ilog2(lock_len);
> +	val = mask - (pow << shift);
> +
> +	if (val & ~mask)
> +		return -EINVAL;
> +
> +	/* Don't "lock" with no region! */
> +	if (!(val & mask))
> +		return -EINVAL;
> +
> +	status_new = (status_old & ~mask & ~SR_TB) | val;
> +
> +	/* Disallow further writes if WP pin is asserted */
> +	status_new |= SR_SRWD;
> +
> +	/* Don't bother if they're the same */
> +	if (status_new == status_old)
> +		return 0;
> +
> +	/* Only modify protection if it will not unlock other areas */
> +	if ((status_new & mask) < (status_old & mask))
> +		return -EINVAL;
> +
> +	return write_sr_and_check(nor, status_new, mask);
> +}
>  
>  /**
>   * issi_unlock() - clear BP[0123] write-protection.
> @@ -4121,6 +4180,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	/* NOR protection support for ISSI chips */
>  	if (JEDEC_MFR(info) == SNOR_MFR_ISSI ||
>  	    info->flags & SPI_NOR_HAS_LOCK) {
> +		nor->flash_lock = issi_lock;
>  		nor->flash_unlock = issi_unlock;
>  
>  	}
> -- 
> 1.9.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
