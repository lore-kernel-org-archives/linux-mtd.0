Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBC1C0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zhVjo2PhuAWqtTerj0SWFV14Yy+ggPdpfCVi2V9Aatg=; b=bTi0kzCQOgAXsV
	ZiRuH6MZ93JaQexiNSW+BlBP+/LsfI8rnmgiXvHsLhaaFwoH5mrCux8trcnKjDPFRDmvdhZmyirwe
	OLw76pK7y1srTtoOjDfSOP/5gl/ZUy8Dnm1llquFXzglDRJbxJGFsUkUT1EnC2vtUF2KGjoohkhAp
	yUV68VQVdlICb2lecqCjBaO4RnuHr331DnlBQNYX3Duph1EjV6D8U1mHiegvXB49vuMjEEagmDk0r
	hpyZy8P6o7xbLhxQAOxzCHxDrVBTtJ1a1JnkUbFqjvt0fdCzyqn1ckE+1NW6xwIxkEfqscR7O/dfr
	WNcS42N2ZYSIKxHtmqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOb1W-009mCy-1g;
	Wed, 26 Jul 2023 09:41:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOb1P-009m6Y-38
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 09:41:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fd18b1d924so53798225e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 02:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690364488; x=1690969288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSuNg53H/eRmqu9mEiw63xexfk54mFabzvALVb5yShE=;
        b=Mp9KeALRnZGzIdCneMTxi34hjTOIcFCSZddek7Burzd1SXgq32zw7wRGVdoRQ1esp0
         LVOWkln7eQgL9b3IMepCiDpFj9i7RSKoBBkXdw3+WpmzmZuXjHdlgM1Iy8HFKyXhWpVA
         b5nyh7Vfo5cRd0lF03zOp8YzEeCAlCaL6f7gH1PO9xQJZhbsxs/YQDqPUmvw/6HTOong
         5llkjpEOShE4uzicGGuMcj9D23mMa1slymNV5OndC71PMa0/WjsOkCSrxqazEzL9/9P+
         fMdgjLMQEo5P6f7RLQs9YpPGVnZq/d+hUBJFq25UoxB4YyyVNyjy1tYM+JZTLcRkhDXe
         RnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690364489; x=1690969289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSuNg53H/eRmqu9mEiw63xexfk54mFabzvALVb5yShE=;
        b=lXMtDiCIL5SziBYGMQY4O27M36Wae1ahof5FKEB1o6x8wxuMEtI0bkblI9Osv9i4hO
         HvOtBMpZCuK+hACDea/fKC+mIWk6RBk4sXEkv3oHjuVZJMZydKDnCVCkTYL/ob+ozAzu
         BSNniS1xq+jup3OxvSeBK8fhdbWnSgf3wSNuHSA8RuePQX4WNhvf3ldn4QN/U4gf2ePd
         jR5H521QczZBZMlUV/Osq/ztHVAFbx81ImclhPNNBwdNnnhz1RcIKmfEZf+88cvgQwCb
         pGc5yQXzeK6xC4svQoIRBPEuLc7Zy5RW1cRsVe1afiTHIPNOAb6TV43F3F0INI1ZrUve
         dq3Q==
X-Gm-Message-State: ABy/qLaV4ZXKQaegk9BnaQOyDHR+sFUTpFmYwqfQnHILKKXEFKuAepT5
	UhBhD7Pf7ardqSde74gRDp5dIw==
X-Google-Smtp-Source: APBJJlGRJt9iE6by5+r9JGU4yXGFwaxVzc3NGMwzAmPoj5/gcjzSnz3j5vCQ6TfkZHC03JCcSW5I3A==
X-Received: by 2002:a05:600c:2248:b0:3fc:500:db7c with SMTP id a8-20020a05600c224800b003fc0500db7cmr1032792wmm.21.1690364488671;
        Wed, 26 Jul 2023 02:41:28 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003fc04d13242sm1533964wmc.0.2023.07.26.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 02:41:28 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at
Subject: Re: [PATCH v4 00/11] mtd: spi-nor: spansion: Add support for Infineon S28HS02GT
Date: Wed, 26 Jul 2023 12:41:25 +0300
Message-Id: <169036447855.16855.4782783762090892713.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726075257.12985-1-tudor.ambarus@linaro.org>
References: <20230726075257.12985-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=aVo6HXgzfBrWxmaR4b1LsmgS74bqiWlppyZxfX+Kpxs=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkwOpDf/lTojLk8cVCknrG9ctqt9OLeiBYkIh/9 zcMsXgK3HKJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZMDqQwAKCRBLVU9HpY0U 6fJMB/4+S1Jxsil9roPq0xcR28ApZzatZlmcxw6A5t4JR35sUGlrfpl7aA0F0X1N8X9cp/LCFqR xtRAo65Vlsk7+sakmjyS3A+BXDNsBneLqUND15J2D9zkm2c6IRf42c6gph8Ze2U1sivcSiv91Sd itNziotvW/2S2zaB9OPFn6j6t9rLGqBAkg36tJ81KYUhnan3nRi414PGn1mOsy7iyWFRljvlKzP /k8mrrtLOsjVLpyOUoQeR6LsNoikB0CbxDJOgTXGdctIZG5wrw/LARDOsoj41sYvnEZ2d06iZmx 9de1X5OCaLj6LOl++z/qdBIzm9WMk2fhzmVEvVtxvkJpgw3V
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_024132_018409_DB33C5AC 
X-CRM114-Status: GOOD (  11.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 26 Jul 2023 10:52:46 +0300, Tudor Ambarus wrote:
> v4:
> - define vreg_offset for S25FS256T in the post_sfdp hook. The goal
> is to use the same code base for both single and multi chip package
> flashes.
> - get rid of SPINOR_REG_CYPRESS_CFR{1,3,5}V as they are no longer used
> 

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[01/11] mtd: spi-nor: spansion: use CLPEF as an alternative to CLSR
        https://git.kernel.org/mtd/c/d534fd9787d5
[02/11] mtd: spi-nor: spansion: preserve CFR2V[7] when writing MEMLAT
        https://git.kernel.org/mtd/c/1e611e104b9a
[03/11] mtd: spi-nor: spansion: prepare octal dtr methods for multi chip support
        https://git.kernel.org/mtd/c/c0aa05123f11
[04/11] mtd: spi-nor: spansion: switch set_octal_dtr method to use vreg_offset
        https://git.kernel.org/mtd/c/362f786ea00a
[05/11] mtd: spi-nor: spansion: switch h28hx's ready() to use vreg_offset
        https://git.kernel.org/mtd/c/463d7cfd08d8
[06/11] mtd: spi-nor: spansion: add MCP support in set_octal_dtr()
        https://git.kernel.org/mtd/c/7d896a94bf74
[07/11] mtd: spi-nor: spansion: add octal DTR support in RD_ANY_REG_OP
        https://git.kernel.org/mtd/c/eff9604390d6
[08/11] mtd: spi-nor: spansion: add support for S28HS02GT
        https://git.kernel.org/mtd/c/68a86d183390
[09/11] mtd: spi-nor: spansion: let SFDP determine the flash and sector size
        https://git.kernel.org/mtd/c/39133e5f559e
[10/11] mtd: spi-nor: spansion: switch s25hx_t to use vreg_offset for quad_enable()
        https://git.kernel.org/mtd/c/fb63bfad1e8f
[11/11] mtd: spi-nor: spansion: switch cypress_nor_get_page_size() to use vreg_offset
        https://git.kernel.org/mtd/c/aa517a29d645

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
