Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF7EC433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 21:35:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EFAA61441
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 21:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EFAA61441
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F2p7FIn1Dfab//FLuYyPTqvTpUAqiXrMlAJCoWOVfWo=; b=VNyzgwqk/DQ5BcPg8N6bvzsVr
	DXkqtZxtJbqbhnDBtLMUxDRE+PWHXx7k6DCx07mwk0NHNv9sOQzJnNDjxwiYLTXs/sp63+pDKJZPi
	wogR9rAOw7XLFtXT1222UEu7NlnAP064xMoQe03a43o6woPatH7zUeAE/1Br7763PL1rDiRz9TmFf
	rZ+WlFnhUTCXvCzFwn40BbD8t0cbtWUS7PpXd7QD0ftpEITXzb0oAg0u5IKr5uRys9Od+1qI/uOEK
	7Dc81yS76fO0Uholjfs2kjjWJZt1pp6J7UmvfqanFbmdkdL3hZq22RiEqtdiG7zp3CBswjPJGpPwr
	JF6muYDvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcEIn-006a31-4J; Thu, 29 Apr 2021 21:34:29 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEIj-006a2X-Q2
 for linux-mtd@desiato.infradead.org; Thu, 29 Apr 2021 21:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=94DCtsG2iFDGFG/cw++7NBkXph2eX5fX182KYqcDcOM=; b=34PxTTNSveLQ22TXd8E1dMj7Ag
 4YGC6wKup82fKsxLsHdBbrvY09isMXctg4WTRlwJt+vQtQ/copwks4adyFP+F11mlh5cqKwHETbmL
 CDDxIItb37VDakN4q44SC4hQ7gl0O2mwuTLyfRHW/u601/mqUHYrMhTC2MFRyxcju1CIO2xACudq7
 ishIdQ8lXMCok/durVl/gpvbkXkplCXd4I6tB9v6SdQJhsXvUFiNwhNRlzuCZMt32kTuVTndaiNAc
 YkzbROlnh72ROqzJzmvB+mcZqmePe9eP41Md7EQElsTsogMrLop1FXogvVW0/86Tb5LlwS2TopjVk
 rpdjTelg==;
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEIg-000zHL-Sx
 for linux-mtd@lists.infradead.org; Thu, 29 Apr 2021 21:34:24 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso48632105otm.4
 for <linux-mtd@lists.infradead.org>; Thu, 29 Apr 2021 14:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=94DCtsG2iFDGFG/cw++7NBkXph2eX5fX182KYqcDcOM=;
 b=jqlnxSTNisOmxaHPB0rtpEwXe4UXrel+3Ca+E4sQR+OcNLhjv0h5mXxnEv2gvFDZix
 APXmicSu3rTzUJ2PaXLMZg0mYMRnY/9ebySuie+w0TN6lR1XQS0q6p85LokN5zmO7wxv
 aid/ukI2RPPtH4YbK2rjPTEqcVM9oy7xbMrzm5HC/hrSrupgq2+rqMRDviD1HDtnnzvF
 rArJdVgyCfFkE7rd/E2m9f5m3IaTexIMEyTmrTUJuZFFTajwpNdQrOroLR+wv4/L+Nmq
 DDlBehLF0y5pun9HhKPFOaHHFqeEpvA9MICkLrCUAyw/9GQSDwo9c69X7Vi34HTKfWWi
 O/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=94DCtsG2iFDGFG/cw++7NBkXph2eX5fX182KYqcDcOM=;
 b=n6ImfP+M0YgOQriae+qON6mer64bOdYQUM2EbAniAwyabQP+EKdm8rRnpTH80iImJ8
 cvsojNiD5eBYKa4pXASTuA2rsp/bQG3cLlHZA2YxFQTI5YxZ6QtMmAgEn/AYJlI9mp2e
 A/Bo/xSAKiwtS/rUfjYtLvsafwu9WOVArgHxTs09qJDd+fkK9/3zzBt1eCem7gyosOVf
 j9FyoY38UorOThAt+onM1CyC5jjZb/F3ebIk8fU4DhOeRv43s0U5Y4EfCXfClt9SDMWn
 Rc0TMNsnTAbn7sI+vrCBfdclMoQgyht1Ql467qJlD7mxVVSROFZxP1CVb6125hHhrXU5
 DsSA==
X-Gm-Message-State: AOAM531gf731X/eSWktMeYUp8gnHlhfFP1Pd85TRSenzgzPw+I5QeJ/S
 6YXTMJF9nDrkzu4j3METPQyvP8HTK+faRmDMDhvFcOPNyaApqg==
X-Google-Smtp-Source: ABdhPJxrdtNiNne+su1y/Z0A6Qz3Gx1qyB2Pxu71jCm+DT4diilVTACODMAbTlv2OfFVcBd5KZGzWrmWsLf3VaGndYU=
X-Received: by 2002:a9d:459a:: with SMTP id x26mr890700ote.337.1619732061558; 
 Thu, 29 Apr 2021 14:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210429155713.28808-1-michael@walle.cc>
 <20210429155713.28808-3-michael@walle.cc>
In-Reply-To: <20210429155713.28808-3-michael@walle.cc>
From: Alexander Williams <awill@google.com>
Date: Thu, 29 Apr 2021 14:34:10 -0700
Message-ID: <CACqsJN9283nSmgdDTz+LhfiQwfi4ZmrSJEP+0JJ24-KZ7isMEA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: add initial sysfs support
To: Michael Walle <michael@walle.cc>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Yicong Yang <yangyicong@hisilicon.com>, 
 Heiko Thiery <heiko.thiery@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_143422_977908_2BC258E5 
X-CRM114-Status: GOOD (  19.24  )
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

On Thu, Apr 29, 2021 at 8:57 AM Michael Walle <michael@walle.cc> wrote:
>
> Add support to show the manufacturer, the partname and JEDEC identifier
> as well as to dump the SFDP table. Not all flashes list their SFDP table
> contents in their datasheet. So having that is useful. It might also be
> helpful in bug reports from users.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Pratyush, Heiko, I've dropped your Acked and Tested-by because there
> were some changes.
>
>  .../ABI/testing/sysfs-bus-spi-devices-spi-nor | 31 +++++++
>  drivers/mtd/spi-nor/Makefile                  |  2 +-
>  drivers/mtd/spi-nor/core.c                    |  1 +
>  drivers/mtd/spi-nor/core.h                    |  2 +
>  drivers/mtd/spi-nor/sysfs.c                   | 92 +++++++++++++++++++
>  5 files changed, 127 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
>  create mode 100644 drivers/mtd/spi-nor/sysfs.c
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
> new file mode 100644
> index 000000000000..4c88307759e2
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
> @@ -0,0 +1,31 @@
> +What:          /sys/bus/spi/devices/.../jedec_id

Since mtd/spi-nor doesn't own this device (belongs to the spi subsystem), should
we put its attributes under a named subdirectory? Perhaps something like
/sys/bus/spi/devices/.../spi_nor/jedec_id ?

I'm just thinking about avoiding any potential for namespace clashes.
- Alex

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
