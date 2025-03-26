Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2F5C36008
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Mar 2025 14:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2254yQMDWyI+ormL6kESZCuT45CuP+o+Y5vKmNXQBk=; b=bxeyM7Po+VxIgC
	cKu26oqBlJl/qKed/p8CGTaPCrdwv09rXB/da3baqS5zYmzxq+ZiuStnChvQK9avN8L9WLWT9LjNf
	lhksDUXzpSgxe0r9wc6wXpkEHPWuukb1PxaPoKSQTcW2vdKEG+cbx9/OP4AuiXCQXLLewFhyp/gCI
	zWn17z8Iy0agXNw2gHq8yn/MUvRNY6tmk2DnfsGuqF52A9ZnmHMOSduidD7m5fjFmypCvxWMR24qu
	2+5schS2gCd3goFbg9Fz17mcLtcwOLDgCTlgclQylXPf9nGE+YG/f1C+UuOWSJ/NVS1kbMoiIhgVB
	oDg9p57+bW632fpjF0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRhL-00000008gPH-0ujA;
	Wed, 26 Mar 2025 14:25:39 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRg7-00000008gD0-3ZvN
	for linux-mtd@lists.infradead.org;
	Wed, 26 Mar 2025 14:24:25 +0000
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac289147833so1009689966b.2
        for <linux-mtd@lists.infradead.org>; Wed, 26 Mar 2025 07:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742999060; x=1743603860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVeEr5fe+QcsB1CPbzMqouy4dYpCMr7o6TNfEQFa78s=;
        b=u21k/g+DlWo603jMixSPLInCqeEM8x5GjT7kahEkJSKxUHvE0IShlE5t7QgJ9sRwN9
         XxSla75xm30JLKBtFim1l0ve1LfyCc3ObjwGnb3S5ZynbsNUeMAc/jQhRWlUO/Wfa9N2
         Q5XpohIvQSaev0qq+sKGMmWCdJhcDlJSg2OmX/vw39mdUDsYnP62PAKv/kZRPbHA/ado
         dNPLRTSShwd5zqBv7rT1S4H0KKGcRf6ktjm7Odv4NB8x9rK2ox0JdcA2lfL7a4XqwNfk
         hWA6XzVbpUH0onDHZ6swUIdeVel/+3kdOHrSBjlGSklVH6Oqk3dkmeogBQO6TG8K5avM
         I1dw==
X-Forwarded-Encrypted: i=1; AJvYcCXs6wgDHxWukS4+scVUf4oTpfcmkDCzeBr4yfFJJyJzdOrxWxVBcBsOfT/ejGLkk+YVIpbMhdHZC24=@lists.infradead.org
X-Gm-Message-State: AOJu0YySO40sibBo9alB5C6dDWPqEFBKiY3ruiSckrod4KLmp3AUo62W
	0uliPGTl356AVvZ8/OLXrdxzEeDLEHINni41Qpm2w0Z/zGC6MSrP9u7hAeDAdYQ=
X-Gm-Gg: ASbGncuVApKooXQvjQgJkuZG70g3wXXmdZYizztKSP6O4nJHIfPyk4a1e7MWqxvHKMz
	fqbB0bt+tw1MReCGC6iO58BEdIuXEbNwCb+GpFq5p9GUMua0Z9CRW2wc24lLuuuaDNRPsAsjc+J
	MWNQwuUS1xTEwqa6eZybfoOdGE4m4cox7DmLNO3itFwyHcioz+B6d7SZpNOlH33sKS7LKjdTcKH
	BPw2s8jdr2oyVY9oIcgVisHLofPXUnFZHX7NBQb3fp0UithWScwwScpns49iMGc9frt3BoNEHre
	ELz227YOMgI1x1GH9WcAQF4mIhlVP07mCzw9udRc2jC4WznzcTsFZNBH9pDZpNuXzSWk6g6QE3A
	qRM++wj0=
X-Google-Smtp-Source: AGHT+IEQs9l6R4c9EzV3m5cYmmS3pm/Kb5ig8usqndfP6tTc7fmMgmwLaeOH7Xmd0winsw58g46aYg==
X-Received: by 2002:a17:907:6095:b0:ac3:4138:6ae5 with SMTP id a640c23a62f3a-ac3f24c852dmr2117905466b.46.1742999060118;
        Wed, 26 Mar 2025 07:24:20 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd3aab3sm1018370266b.156.2025.03.26.07.24.17
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 07:24:17 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so12656716a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 26 Mar 2025 07:24:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvklIMLxOGk9J4t2AAcYNq3K4e19HgAXP8EOUT5JWscHitBuPPUsB5sKBgDSA7Krc9F6xH2EmWgHU=@lists.infradead.org
X-Received: by 2002:a05:6402:210d:b0:5ed:2762:727a with SMTP id
 4fb4d7f45d1cf-5ed27627ba1mr4923443a12.11.1742999057224; Wed, 26 Mar 2025
 07:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250224111414.2809669-1-quic_mdalam@quicinc.com> <20250224111414.2809669-3-quic_mdalam@quicinc.com>
In-Reply-To: <20250224111414.2809669-3-quic_mdalam@quicinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Mar 2025 15:24:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUOt8PxbRt-vGfeD5=uEtMVV0TLPUridu=nCkzX9iP24Q@mail.gmail.com>
X-Gm-Features: AQ5f1JrfbKrmBiixGhwve_DBCFWEH-PHEu3H-5oG_9hBLQTIaQ4FX125IicniZo
Message-ID: <CAMuHMdUOt8PxbRt-vGfeD5=uEtMVV0TLPUridu=nCkzX9iP24Q@mail.gmail.com>
Subject: Re: [PATCH v15 2/2] spi: spi-qpic: add driver for QCOM SPI NAND flash Interface
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_072423_890354_B3A8869A 
X-CRM114-Status: GOOD (  28.42  )
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

Hi,

On Mon, 24 Feb 2025 at 12:15, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
> This driver implements support for the SPI-NAND mode of QCOM NAND Flash
> Interface as a SPI-MEM controller with pipelined ECC capability.
>
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Thanks for your patch, which is now commit 7304d1909080ef0c
("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
upstream.

> Change in [v11]
>
> * Changed "depends on MTD" to "select MTD" in
>   drivers/spi/Kconfig file

Why? This is the only driver that selects MTD instead of depending on it.

> Change in [v7]
>
> * Made CONFIG_SPI_QPIC_SNAND as bool

Why? The driver uses MODULE_*, so a janitor may remove the latter.

> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -936,6 +936,15 @@ config SPI_QCOM_QSPI
>         help
>           QSPI(Quad SPI) driver for Qualcomm QSPI controller.
>
> +config SPI_QPIC_SNAND
> +       bool "QPIC SNAND controller"
> +       depends on ARCH_QCOM || COMPILE_TEST
> +       select MTD

As SPI_QPIC_SNAND is bool, this forces MTD (and various related symbols)
to be built-in, as seen in an allmodconfig kernel.

So I think SPI_QPIC_SNAND should be tristate, and it should depend on
MTD to avoid circular dependency issues.

> +       help
> +         QPIC_SNAND (QPIC SPI NAND) driver for Qualcomm QPIC controller.
> +         QPIC controller supports both parallel nand and serial nand.
> +         This config will enable serial nand driver for QPIC controller.
> +
>  config SPI_QUP
>         tristate "Qualcomm SPI controller with QUP interface"
>         depends on ARCH_QCOM || COMPILE_TEST

--- /dev/null
+++ b/drivers/spi/spi-qpic-snand.c

> +static const struct of_device_id qcom_snandc_of_match[] = {
> +       {
> +               .compatible = "qcom,ipq9574-snand",
> +               .data = &ipq9574_snandc_props,
> +       },
> +       {}
> +}

Missing semicolon, so that's why you are forcing the driver built-in? ;-)

> +MODULE_DEVICE_TABLE(of, qcom_snandc_of_match);
> +
> +static struct platform_driver qcom_spi_driver = {
> +       .driver = {
> +               .name           = "qcom_snand",
> +               .of_match_table = qcom_snandc_of_match,
> +       },
> +       .probe = qcom_spi_probe,
> +       .remove = qcom_spi_remove,
> +};
> +module_platform_driver(qcom_spi_driver);
> +
> +MODULE_DESCRIPTION("SPI driver for QPIC QSPI cores");
> +MODULE_AUTHOR("Md Sadre Alam <quic_mdalam@quicinc.com>");
> +MODULE_LICENSE("GPL");

I have sent a patch to fix these issues
https://lore.kernel.org/b63db431cbf35223a4400e44c296293d32c4543c.1742998909.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
