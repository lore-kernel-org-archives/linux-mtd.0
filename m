Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C450CC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:16:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 964B320857
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:16:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uj6ZFiJl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="S2IlJaR1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 964B320857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BjfxGmwTjTKMd882Ppe9upJsnT8g7e0gDuimMv0ZXtA=; b=uj6ZFiJlv8TvsF
	EcIQH4KNYCQfOPmqbmIj4oy60xk0GRYcXvgVfgjujxV/d6DscQ0Nv9f4Woas+kSDV18S71oqDSczA
	TKTEgmmSLSD0bt+CeKAGGToT5ffiYiO8N2aEY0l+qALNvtC1O2JZ8MswQPirDphdwWDBiYh2kqsyk
	YFk75fhy8X8e6R9wxdVgkmL1Mp/gKZVGS5AMQ6X1WXzKtZS7cuZHI9zNYtc8qhR4uLcsWjyJyOjXk
	6sms5xqaIFVh3qLfLxpgSe8Ig1qyRq1BywRXewECcUr8itPE1lSOJf9zcW9oUV7Tu9fIao9CQ8kwO
	kaEdRoEqeN8B3AGF2+wg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6HQ8-0001rr-02; Tue, 19 Mar 2019 16:16:56 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6HQ4-0001pw-I5
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 16:16:54 +0000
Received: by mail-pf1-x442.google.com with SMTP id i19so14056281pfd.0
 for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2019 09:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=AVUDGAKMXL02had+OfqDpgrMI7oxWdy7jajLhNkrmyE=;
 b=S2IlJaR1xm8sukVefIyGyCJ1F5AE9+cotz3qtiXFXWrsLH+KitmIjXSdkZoh5Rdhzq
 Ckog4x47NulvYgX7aCLITngufAINlgwtcHFdkg3brS+iEuwYCU9Fh09+N0iZ6hrzEata
 QsrtXvd9BQJmVq7TTrYluKxCFWQ/MtO9yq+PBBRitBlOVIl2MT/XOXW4JWm088KsPc0d
 e3KiWhmxt0AYeiSngftqkFvzpPqud5k2lx/dJeZN6jXEqbLMaYEGacDpKGTbHpBeL4PQ
 4pWKRZuiOrjAtlqYggy8gn34ePLQIXv3Bx3fRih/t/nQcUn3cCK10b34OxdI8+1dbFj3
 Vt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=AVUDGAKMXL02had+OfqDpgrMI7oxWdy7jajLhNkrmyE=;
 b=lMcw0ormKmiJ71Xyn/whruV9bqVZ9nxlpg8nurt6J5/dCV33G6lCvX3P7v+nQsl6/q
 KoJLPkdLSqZC7hzdiqN4Y1MVSyRze11LsdX+AhQccAHl1nCEKT8yEzuzWKvxLS7r7sb7
 W4HlBL4fqMZdaexQ5CCg8zv6EKNmEiog5m7Y6MOFUM9K/rrqDK4WF8gpUhfM9x4uBAUi
 +/fjTljZWtZuQKI197J3yw6uGLOPXPgiWmeMJDnKLAmClCuG+SyNu3NpVkmbfQeFPqxT
 tqN09RsNzzF5a6rigz6wQiKv5vEFJqYH+jfK/HjEIv6wKF3oaUHtmvtQwdPcc7isF57v
 KREQ==
X-Gm-Message-State: APjAAAVaa6agu8vbbYY2d/vplN9TEuLskNZ3MJQ8sBkjRlQfI4CDSime
 7ir2qR1zDONBcJSpjxtRUAsaSg==
X-Google-Smtp-Source: APXvYqwj6y8yzmHlW8DfzTGUVXLjBxzZQpe+ovEtdOmKaOCF/pwWJ4ULKIWhqbt0hTzt/Eotj3fscw==
X-Received: by 2002:a63:ed0a:: with SMTP id d10mr2580885pgi.452.1553012211556; 
 Tue, 19 Mar 2019 09:16:51 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id x5sm16510833pgp.68.2019.03.19.09.16.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 Mar 2019 09:16:50 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-mtd@lists.infradead.org,
 bbrezillon@kernel.org, miquel.raynal@bootlin.com
Subject: Re: [PATCH v2 1/2] mtd: rawnand: meson: add missing ENOMEM check in
 meson_nfc_read_buf()
In-Reply-To: <20190318204722.9901-2-martin.blumenstingl@googlemail.com>
References: <20190318204722.9901-1-martin.blumenstingl@googlemail.com>
 <20190318204722.9901-2-martin.blumenstingl@googlemail.com>
Date: Tue, 19 Mar 2019 09:16:50 -0700
Message-ID: <7hy35ag7pp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_091652_645689_FE87457F 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 liang.yang@amlogic.com, linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> kzalloc() can return NULL if memory could not be allocated. Check the
> return value of the kzalloc() call in meson_nfc_read_buf() to make it
> consistent with other memory allocations within the meson_nand driver.
>
> Fixes: 8fae856c53500a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Acked-by: Liang Yang <liang.yang@amlogic.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
