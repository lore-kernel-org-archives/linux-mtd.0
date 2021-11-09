Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADE5C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 09:41:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF8DB61184
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 09:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF8DB61184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWg6h1KKdocWX6twAgcwZwAuDvMLi4pqzTzhTQ8cwMM=; b=uTL6LzS/4pRXYZdP+R0wK0Sv4a
	EWaN3HHLkKMBOD8DP4Bl2X078PgchDfDx6/oPovZNsDKM1qEcfAmQmCglK8/4kbIIuJkswlI7XM3B
	gjZ1nTNpexKbY13MGGLDQkxygzvnnFgqTW7CJMP4QLxqcNzJy64qXQ4GUtcFt7AuoDAKLxxs6Qyi9
	fCfCeU0fxw1P7NNC6d8cdTat0NCgT19gWUuPVsCHuzYHYIuIIltirNHzI464fVsdNRXwpRJw6p2pY
	4u1eo++koE1RGDXU6G75D4is5pe1ocykClJLamCJvN9uJmg+tar03FlPlkBBgH9i9Xqu4uVRa3jNk
	0xby0Jdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNcd-001H66-1u; Tue, 09 Nov 2021 09:40:55 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNYT-001G00-KA; Tue, 09 Nov 2021 09:36:39 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 44D9422234;
 Tue,  9 Nov 2021 10:36:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636450595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5Y+uuEmXeS0lcymGy8EiPtmGLhLum+O9IvbHE2iAHY=;
 b=jJh9QUCTGNIwUV7atwPbZRVSNRTemIwulAsQAuaeL+N6aBK8Y6q4eRLbTWc+vRKrprEdLq
 b7Gg+BNEdU4503NjVCm1xK6X2Jtxu+4+BUG+PAecyBFnveG2UHZdq4XwuKcUDgvSGC6xaP
 vgEzv7CbRLoiEEvJgNcdrkQfWJXYOV8=
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 10:36:35 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 08/25] mtd: spi-nor: winbond: Use manufacturer
 late_init() for OTP ops
In-Reply-To: <20211029172633.886453-9-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-9-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <3870de250a2da016340ba6dbf210ae13@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_013637_872385_849AC9A4 
X-CRM114-Status: UNSURE (   9.60  )
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
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-10-29 19:26, schrieb Tudor Ambarus:
> OTP is not described in the JESD216 SFDP standard, place the
> OTP ops init in late_init().
> 
> We can't get rid of the default_init() hook for winbond, as the
> 4byte_addr_mode is SFDP specific and will require to have all
> flashes at hand, in order to check which has the SFDP tables defined,
> in which case there's nothing to do if the SFDP tables are corect,
> and which of the flashes do not define the SFDP tables in which case
> each flash should declare a late_init() fixup.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
