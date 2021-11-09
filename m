Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D22C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:24:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 787B1610E9
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 787B1610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+/wYZ1QtD9/8R6xgSjSXD+gHY2qH+iGvZxI3lpz0fw=; b=IKOk5sI7BNxoTJEzmCFC31+enJ
	RdmW9znKiy7+2hoLBSs6S0Yt5LsCxHosfwKnsBc640cc28HBjt/2gWZ/fvQAn0akiOVQO6MY+pdSE
	x6zxsVSmVy+DALsq3AJ/H/rLbcuShfY8esay22oTzt03lEeZj6hzyOIwyid6uRTedI6OI/Bp4+jX5
	HsPd4NhzMPFqgkBUWePVzFjYrvCLQC8umLtn9msqmzr7kuQ++XEVymqHdc5oUZTCoScDkB1dsZgIW
	EDhPLIqc3oh/dyksCzszUjYlSwv45XFJAiQWSD23rgd3doP/V48II14XhWV3IS33YOLxHYaJdKFat
	82iRjZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMQY-000zCt-Cf; Tue, 09 Nov 2021 08:24:22 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMOu-000yhv-3s; Tue, 09 Nov 2021 08:22:41 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6ABA222234;
 Tue,  9 Nov 2021 09:22:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636446158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUEtkYDZ8Fcisup6bp1olxFdi72KX98N3GOWMp2j0uk=;
 b=taV9TjX3J6RxTajyx0ZIEw6DI/TvI4wT6c9JWvyaAFDnVb//h5ZiwFTjrlZSJIqpuaM+zh
 6xO9ryhIc4vjQdkVHKjMt3H5IpxYTGbBiMCcCI46f6b64J4q9CtkfNqBcqwRU/yBpxq9ia
 GUD9kaAYp8AGRrCCZmFx5Dl615DExFA=
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 09:22:38 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 03/25] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
In-Reply-To: <20211029172633.886453-4-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-4-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <1acc322b17d7685e9b86e20ae7798eea@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_002240_373288_79E49563 
X-CRM114-Status: UNSURE (   8.41  )
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
> Used to init all the mtd_info fields. Move the mtd_info init
> the last thing in the spi_nor_scan(), so that we avoid superfluous
> initialization of the mtd_info fields in case of errors.
> 
> While here use common naming scheme for functions that are setting
> mtd_info fields:
> s/spi_nor_register_locking_ops/spi_nor_set_mtd_locking_ops
> s/spi_nor_otp_init/spi_nor_set_mtd_otp_ops
> The functions names are self explanatory, get rid of the comment
> for the OTP function.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
