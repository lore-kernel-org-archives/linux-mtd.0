Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E77C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 00:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 940622078B
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 00:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cVppvFLE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="11xf365l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 940622078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	References:In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jFzS+ds2nUIWK/c0NTNPkwHU8Bwy2A24tVBjyIRqaGI=; b=cVppvFLEk+CRiLqnMa5hC2FLFw
	NXW81bp6Sc55gThLeFfTlp9DyNalARc+BaSXtlJ2wTtoFWKI+KPgub/oGy4OkkPzZ+z8okZXFYtUH
	94NFHveHU35kSUyPDTXnfmAvTZN3J2OWf9VjjK54Wt9qR+tsznmKY5SlRPuaTYMbzH1wGiXxLq4P1
	XGFSPPc5xVgG5XzkS9Qny0PR7Z9PrvGewAYr49Wu8H8/utRZYjcQqMfk/vUeRD9cRiCzsY/plmioY
	EE1dWvUlSKie1POgRGnbNLsZq5k+UF+T1/L2jwcCUpD12TbNMncU2YvGbvpOrW63KsSNShUuPrj0N
	KkUcdiyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbvJv-0000hm-3k; Fri, 22 May 2020 00:13:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbvIe-0007qk-RT
 for linux-mtd@lists.infradead.org; Fri, 22 May 2020 00:12:34 +0000
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0AA23207D8;
 Fri, 22 May 2020 00:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590106352;
 bh=v6bb30QAvao8hJS61E4TORwQUIH9z8xaQlZ3KccNp+Q=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=11xf365lEPO+hylaoP+wv0wnwnqpjPEarKlrp9Umht9xJ9ArDCcRUcfJ4wHbr3QUv
 8WPnC6BzwLoLw7eLzjQlcRkiZkcbOei4EmHmW0+fFdJuzsqYP1G20sR1RIjxLauRUu
 tHLFUR0IxRgTEpY7RLOElyy18bYR7z22qPQIuYjc=
Date: Fri, 22 May 2020 00:12:31 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 36/62] mtd: rawnand: oxnas: Fix the probe error path
In-Reply-To: <20200519130035.1883-37-miquel.raynal@bootlin.com>
References: <20200519130035.1883-37-miquel.raynal@bootlin.com>
Message-Id: <20200522001232.0AA23207D8@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_171232_935110_41D79BE6 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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
Cc: stable@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: d44154f969a4 ("mtd: nand: Provide nand_cleanup() function to free NAND related resources").

The bot has tested the following trees: v5.6.13, v5.4.41, v4.19.123, v4.14.180, v4.9.223.

v5.6.13: Build OK!
v5.4.41: Build OK!
v4.19.123: Failed to apply! Possible dependencies:
    00ad378f304a ("mtd: rawnand: Pass a nand_chip object to nand_scan()")
    107d985a1a94 ("mtd: rawnand: diskonchip: Fix the probe error path")
    59ac276f2227 ("mtd: rawnand: Pass a nand_chip object to nand_release()")

v4.14.180: Failed to apply! Possible dependencies:
    00ad378f304a ("mtd: rawnand: Pass a nand_chip object to nand_scan()")
    02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
    107d985a1a94 ("mtd: rawnand: diskonchip: Fix the probe error path")
    1c782b9a8517 ("mtd: nand: mtk: change the compile sequence of mtk_nand.o and mtk_ecc.o")
    263c68afb521 ("mtd: nand: pxa3xx_nand: Update Kconfig information")
    34832dc44d44 ("mtd: nand: gpmi-nand: Remove wrong Kconfig help text")
    577e010c24bc ("mtd: rawnand: atmel: convert driver to nand_scan()")
    7928225ffcb3 ("mtd: rawnand: atmel: clarify NAND addition/removal paths")
    7cce5d835467 ("MAINTAINERS: mtd/nand: update Microchip nand entry")
    7da45139d264 ("mtd: rawnand: better name for the controller structure")
    93db446a424c ("mtd: nand: move raw NAND related code to the raw/ subdir")
    b4525db6f0c6 ("MAINTAINERS: Add entry for Marvell NAND controller driver")
    d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")

v4.9.223: Failed to apply! Possible dependencies:
    00ad378f304a ("mtd: rawnand: Pass a nand_chip object to nand_scan()")
    107d985a1a94 ("mtd: rawnand: diskonchip: Fix the probe error path")
    24755a55b01f ("Documentation/00-index: update for new core-api folder")
    4ad4b21b1b81 ("docs-rst: convert usb docbooks to ReST")
    609f212f6a12 ("docs-rst: convert mtdnand book to ReST")
    66115335fbb4 ("docs: Fix build failure")
    7ddedebb03b7 ("ALSA: doc: ReSTize writing-an-alsa-driver document")
    8551914a5e19 ("ALSA: doc: ReSTize alsa-driver-api document")
    90f9f118b75c ("docs-rst: convert filesystems book to ReST")
    93dc3a112bf8 ("doc: Convert the debugobjects DocBook template to sphinx")
    c441a4781ff1 ("crypto: doc - remove crypto API DocBook")
    d6ba7a9c8b5a ("doc: Sphinxify the tracepoint docbook")
    e7f08ffb1855 ("Documentation/workqueue.txt: convert to ReST markup")
    f3fc83e55533 ("docs: Fix htmldocs build failure")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
