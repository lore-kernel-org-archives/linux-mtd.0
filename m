Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAAAEB48E8
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Feb 2026 08:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bb2+WChCxByzhCnaK97R6whrTFAiCs9SHvD142Zf5pA=; b=B4GWGH7Npw9bKz
	867eRuqSX7HIDH/0Il2iX8/zvfjzo+nCdtJ9Q8yNy0QoHw2yX4C9RQlukgu6RyTEp8pKpx2Y+44bJ
	kgXFLn98fidwduyDcZxcxKFYZWGVnZ3VZ4naO2z4FRrCnlmLdtJt6AEhKqbvnDjlv6INmqr4bzW1X
	MsqRIDun89nUdE0E157YcIGKGr1GLOdIPa8mC0+z+z6NNumFe705M9hFXjo5c/656XxQmoQQKPYD/
	dyrejM4VKsgia2VQSA+gjLT/wQ81LQlxBnw/zytXQy196+zH8AgIANcUlqGQU1OyASi+4IQ6mbQX4
	RgHBibWEalkrM8/oRKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSUe-00000001mZf-1NVl;
	Thu, 12 Feb 2026 08:56:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSUa-00000001mZA-2MFd;
	Thu, 12 Feb 2026 08:56:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 76FB01A0E3C;
	Thu, 12 Feb 2026 08:55:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D1B5606CA;
	Thu, 12 Feb 2026 08:55:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CAE7119714B5;
	Thu, 12 Feb 2026 09:55:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770886557; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=DDNoaaEfwFU2nsc6h/m5gjTCggQVtwmmt0PAUYALLLU=;
	b=2CJ/TI6fiRTYG0KHUKvYNl6G6WRWp2Ju5O8x+MeEy28lPp2fe4Yaij4SinsOddzSwh6Qyz
	kTpDbA6FmHQABgb67N/JnGY4kHXoxiy9wS8ZcAOaet6MKsBQfFNAiSlp5epGwWRDvoTFzP
	JjOw6iFDPUQMfp7wOxc/xPdY2nkldA9hJh2RTqB59HNK5d6KToqZM8G0WMAA4KZVScLkBG
	GcFYFgPfYJTyAT4677Tob6xvQYDNeojpu0D8vKuRNEO+tO/el1Hn9P+0ViYjwL19vPWNTF
	d+iJSaXUiBtGLHhTtmxlLSl47EG+6OG7NKkcKEYv7zUuhndA+mNV8NVAmOUIVg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: imx: move NAND properties under nand@0 node
In-Reply-To: <20260211-imx25_nand_dtb_warnings-v1-3-2f06aaa1e3b9@nxp.com>
	(Frank Li's message of "Wed, 11 Feb 2026 16:19:41 -0500")
References: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
	<20260211-imx25_nand_dtb_warnings-v1-3-2f06aaa1e3b9@nxp.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 12 Feb 2026 09:55:52 +0100
Message-ID: <878qcyz6g7.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_005609_104276_925D00B2 
X-CRM114-Status: UNSURE (   6.14  )
X-CRM114-Notice: Please train this message.
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

On 11/02/2026 at 16:19:41 -05, Frank Li <Frank.Li@nxp.com> wrote:

> Move NAND flash properties under the nand@0 node and place partition
> properties under the partitions node.
>
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: nand-controller@d8000000 (fsl,imx27-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clocks', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt', 'partition@0', 'partition@100000', 'partition@180000', 'partition@200000', 'partition@280000', 'partition@300000', 'partition@800000' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
