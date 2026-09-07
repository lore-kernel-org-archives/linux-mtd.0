Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E30C79F9E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 07:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XHIHhQCbcGRRGCYflHBQoS5hF3mPLJdhvLe6T8DhoM=; b=QJIdaADqbeOh+b
	7wQ2qMwN9lbrl30AijxZtth4NGfUMqKqlSpCsPak6INwHm4XmWFbGk0Wvcs+0lU3FcYD0cOD4zluG
	OfWH2v3GlIu7U4H8eWSr+tG2tN97IizLjtqPoOJ0HJmnXONzH6gYPXJutxALoewZ6LLTixOGJDnON
	HVs/VzkajromCm0wMrCOzdfuouRmACCDeeAu2gySwuv/uvtN6PXLhv5NHN0J7tYECW/W3lm93x2wi
	5qHUn95BkgjrjkaWCiwB/FLOSBesNdDwtYNgdF7fOABkRrUPaZ9XUTH9gPU3z+stnAgTWQlQCFa2u
	n1iB8jRa2h7s3n7kYmfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3U3u-00000006Bec-0LbM;
	Mon, 07 Sep 2026 07:46:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3U3o-00000006BdT-3MYC;
	Mon, 07 Sep 2026 07:46:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0608760D8B;
	Mon,  7 Sep 2026 07:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919BA1F00A3D;
	Mon,  7 Sep 2026 07:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788767195;
	bh=znofJdxAtEdOPXZO/tg6KzvuNnqq4TPuEDJXPclTxNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HQpMUMwdPLv34W75NbtEM1pUYuB7OsuCRSD6oBYxinkIzHjGj/AdaUTK89imJJvn+
	 UXRrz6kE9wMaMdq0t6jhN+2/AMVAUM78zXcmLxBuBtkVCtF+ARJ48kovQyEsQ8MBYd
	 NQ2Rvq96073biWdJrUNct2UtH695+D0n4mpXfWZ8/wI4prwaxMibpERNcnqPIpeajW
	 MX/MqVseEsBGXtCkJiDSL6kf/yi+CdjX4BCZ2kVhlWrNop05nPUm4Cc2u0Ijiccx9B
	 pycSsaQ9fKICNHxj1W8NaW51PL/dh3Fqu094oa9TRu4tAYKAJFYbQLe5V3YcfBv3cc
	 QtHHgcTdG6j+g==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
Subject: Re: [PATCH v5 00/25] mtd: spi-nor: QE handling cleanup + fixup
 reworks + Winbond RV chips addition
Message-Id: <178876719232.3543902.14451625037676421254.b4-ty@b4>
Date: Mon, 07 Sep 2026 09:46:32 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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


On Fri, 04 Sep 2026 20:12:37 +0200, Miquel Raynal wrote:
> Following my "software protection" enhancement series, there were
> several comments about the need to simplify and reorganize the handling
> of the QE bits, which is strongly impacted by the various read/write
> status register capabilities.
> 
> The third patch is all about this. It is a massive cleanup, everything
> is explained inside, the how and the why. This is a commit that must be
> tested, so if you have a SPI NOR chip with one of the not yet tested
> SFDP QER configuration, please consider applying that patch (just patch
> 1 is enough) and boot. If your chip is recognized, it's probably all
> good.
> 
> [...]

Applied, thanks!

[01/25] mtd: spi-nor: Rename BFPT_DWORD15_QER_SR2_BIT1_BUGGY
        commit: a885b694afb4acd914e4a9f94365d828432ca066
[02/25] mtd: spi-nor: Create a structure containing the flash opcodes
        commit: 01771ff25fec9d24663a0087723621e97e6d8484
[03/25] mtd: spi-nor: Refactor Read Status/Write Status support
        commit: 63489002d397ebf136548c79af68a8e05b30d45c
[04/25] mtd: spi-nor: Add support for the new JESD216 rev F QER field
        commit: 9f1feb4162387295b0d8de6c879f00357852609b
[05/25] mtd: spi-nor: Create the concept of fixup table with match function
        commit: af9bc9f9c5dcbc1a351ac00d9a4b86400bc442b8
[06/25] mtd: spi-nor: Move the fixup flags into the fixup list
        commit: e6dfda3c83eb8463bdf22289cfb42de9938446d0
[07/25] mtd: spi-nor: Create an indirection on the part name
        commit: 98b89d868a178d47277feede51314d8227d4cb56
[08/25] mtd: spi-nor: Move the SFDP header structure to a C header
        commit: aa0a09e0e99838ab9349b1958118c44e6db6737d
[09/25] mtd: spi-nor: winbond: Prepare introduction of W25QxxRV-Q/N parts
        commit: 7fdc105ff98d712e1e2f7e9f55e4ab2251e1344f
[10/25] mtd: spi-nor: winbond: Add support for W25Q32RV-Q/N
        commit: 7e896ca2fcf15066a6957120dfd9063820506cd2
[11/25] mtd: spi-nor: winbond: Add support for W25Q64RV-Q/N
        commit: 25949585ca2f31f39a5b116aee23ffa017281929
[12/25] mtd: spi-nor: winbond: Add support for W25Q12RV-Q/N
        commit: f84397a769c9aa45e9a6b6a6f1253c1f990c7c72
[13/25] mtd: spi-nor: winbond: Add support for W25Q25RV-Q/N
        commit: 7573a4edaae362fc0da3fc8996f1265a9dbace4c
[14/25] mtd: spi-nor: winbond: Add support for W25Q51RV-Q/N
        commit: 49c32f5b2c2ec8abfc97b8c0ea0c645568f65f8e
[15/25] mtd: spi-nor: winbond: Add support for W25Q01RV-Q/N
        commit: 4da2d59f3a6cc217399b7c106c36c2f3655106a7
[16/25] mtd: spi-nor: winbond: Add support for W25Q02RV-Q/N
        commit: 8d3298fd1d75011c2fa30e813cd280856ea86a2e
[17/25] mtd: spi-nor: winbond: Prepare introduction of W25QxxRV-M parts
        commit: 66d57b58c918a556d57bfab2d85ac1d33e21e1d9
[18/25] mtd: spi-nor: winbond: Add support for W25Q32RV-M
        commit: 650ee584cc52124a8ab51070d320d6752ea2f580
[19/25] mtd: spi-nor: winbond: Add support for W25Q64RV-M
        commit: 94460d091584f9032539a5c949e6e71fa812ad15
[20/25] mtd: spi-nor: winbond: Add support for W25Q12RV-M
        commit: 11484eb5458fd54b59f35c511819af9e4de27cd1
[21/25] mtd: spi-nor: winbond: Add support for W25Q25RV-M
        commit: 8eb8c80e59a3cde9fd7e4d730532668cb8ef7b0d
[22/25] mtd: spi-nor: winbond: Add support for W25Q51RV-M
        commit: 6397f5f8f8754218dd3a059d39eba6b57d04dc3d
[23/25] mtd: spi-nor: winbond: Add support for W25Q01RV-M
        commit: 677a0d6752eda1480eae3e187c5dfe7367f9d752
[24/25] mtd: spi-nor: winbond: Add support for W25Q02RV-M
        commit: 4094a2fd562453cac04e909688af6620fbd3203f
[25/25] mtd: spi-nor: debugfs: Expose SR opcodes and QE mask
        commit: 700bf34058ca7cd792236b1ba5caad3770d66208

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
