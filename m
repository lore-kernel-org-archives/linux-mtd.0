Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3773C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 19:06:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8876636F0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 19:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8876636F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9zAaiafsu8GctbJEMMtc6RTVSVdFT+H1A6Zlz33+H8=; b=vFxG9sSZQPKf1o
	KXIEJufFQnkEjE6QrfFmvHgQ25zLXWWHgAQgA/s5ZJxYY+9Vi1r3rQHXD5DtrNHRsVTFrYGYSSUFT
	gkBiQqo7fYMCZx9BOqjvuTqdNQahxwEcoOOBhEQ0vL5MSJ1MANqAsNjR9iuEY+iqW7cJfRwOJILwo
	T/ESB8fNONgXp0pTRaIej3t1wi2FmYxFvratXhiBR79kCW+YC6lCUGWrh6tTuRh2pCaYHRbQC7dGK
	VO12Q8F9tY0EZNIYr13HT+5ZCf+yBOcqM+Ba8pq8mNka8RPEODAb1TY0uvNLL1fGvG2syWavwjtgM
	UhAq+LmWZIKynqFRvM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmhJB-00GqXd-Nw; Mon, 15 Nov 2021 19:06:26 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmhGf-00Gpcf-Dl; Mon, 15 Nov 2021 19:03:50 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AFJ3R31021411;
 Mon, 15 Nov 2021 13:03:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1637003007;
 bh=BkpsjDAQNWCf+SnfmiRytZQGHuGacPutwu+WwTtNuqw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=cLq4JXBzZcDhCLtUGqPXmt9ZP3HGgsojcLL2BYfMBeOLCBrDFjWzpxRUzpXCozkup
 Dbp4lZZLYQIKCQ/gL150K756z2P/6UKG1b2A830d2LK5zXQzp4oKBne8yIMhLrTSBF
 G/aEvlndXd45sgO1MZBA4CR8YqhILi2G1/SLJz6U=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AFJ3R2c093786
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Nov 2021 13:03:27 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 15
 Nov 2021 13:03:26 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 15 Nov 2021 13:03:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AFJ3PQN079857;
 Mon, 15 Nov 2021 13:03:26 -0600
Date: Tue, 16 Nov 2021 00:33:25 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 10/25] mtd: spi-nor: sst: Use manufacturer late_init()
 to set _write()
Message-ID: <20211115190325.qaqdxpcrvqt6pemh@ti.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-11-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211029172633.886453-11-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_110349_558381_1B12ADB7 
X-CRM114-Status: UNSURE (   7.32  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29/10/21 08:26PM, Tudor Ambarus wrote:
> Setting the correct nor->mtd._write in a fixup hook was misleading,
> since this is not a fixup, just a specific setting for SST, that differs
> from the SPI NOR core default init.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
