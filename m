Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2CDC4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62Iqnro3tC5SBa/JIXyeyMLFSMGNIrd+5c9qqzganHU=; b=GLxmSujISbKr+D4ZCNu2UweC9u
	KSSlX+w4RzbYjd+L+p5AEB476hsegyeEiANABVQ/a+1G2WHi+ZmXVTfymHlLmwIt9Avq91cJhRBSG
	+WrUAJzTOkvsqzI5Z8PLAeFKMRRDC/ZP+Z+Xonrax+9eP535cZrhMakOVpxY3AFhMFR29KwWUbW6m
	p20XEhaZkKBZw61FIzrJ1Z6MQaBQfgGgqysle4LUZQ5fyiSn1Bqg7/qonvJUY6uRtGfwE9I+KzO2A
	Kkbme2GQk/dh56CKAjUb2cpU7w0XEpIJAWv9a/WZoIPr62048WEwyWjS5UiFwFeknaNlq5KNWejza
	tcDaiW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16RS-00Ggqx-5v; Fri, 02 Dec 2022 13:51:02 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16RP-00GgqB-6w
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2022 13:51:01 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id BB32388;
	Fri,  2 Dec 2022 14:50:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1669989054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tilAL8aqBQUyn2WnIvAxQ51aF8srqNrDTY4JFIBpU7s=;
	b=gsQHzKvfjfX2hKQWxAG3U8OlLn79D3YMj7KHWD5ykMD9WlPkF+l9mW+6kTMTdq23i/eDpf
	fCP5yYx9aBwrdmm2ViFz4emjfUW6MtAAsdYqxrCjc/G2jk+6Xt+dQUrTdaZVnWexMC0NMH
	HtubyqWNYsgZjz05u2RPlREyQ53Rr+kczS9kx3QHPRMOTtPe1ULYDuNw8w4beh/tEbirMH
	P/4xv8Xy6DSrI1m2lV24RbYNLwueQGyANcZIXY+U/4KbTRFt2R5QDrzWl0Ac3cuYTC/Bu0
	/a3fPtRVhRkS8ZFpk7O2qhhF09n8VFzbFJuL9Lf//znZlRcZ9AuQQLR6cG8adA==
MIME-Version: 1.0
Date: Fri, 02 Dec 2022 14:50:54 +0100
From: Michael Walle <michael@walle.cc>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
In-Reply-To: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <1503a3857107e3a4f34e0c7fb5dada39@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_055059_997488_8EB31115 
X-CRM114-Status: GOOD (  11.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-12-02 14:37, schrieb Geert Uytterhoeven:
> Document support for the Micron MT25QU256A and MT25QU512A Serial NOR
> FLASHes.
> 
> Merge the new entries with the existing entry for MT25QU02G.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> mt25qu512a is already in active use, causing "make dtbs_check" errors.
> mt25qu256a is supported by the Linux spi-nor driver, but there are no
> upstream users yet.

Is it encouraged to use the specific compatible with SPI-NOR flashes?
As far as I know it isn't. The spi-nor subsys tries hard to identify
any flashes at runtime and any additional information in the device tree
is used as a last resort (just for flashes which doesn't support the
read jedec id command yet). And usually boards have different sources
for flash chips, so hardcoding a particular part in the device tree
doesn't make sense.

just my 2 cents,
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
