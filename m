Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D667C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 09:33:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6851660F58
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 09:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6851660F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXuDroik/qYY8TLI58fXg4sGr8IMy4A+9Ba4skn+Jlk=; b=b9aZ9/dIaL6/VPqhPNOyJculje
	vDEdICQCCK48n5MRGArMQssdP8ua4CD5IL/JYGJ7yBm/xsEU54/BrmBVJUCokGOGYJQTpCMkhWq18
	HLNZPw2aos61FzJU0KUPRt2cxmlZUoGVLvOIg/Zb76h5/C7yhCEiHBcE1lLk5xciZHRCklI7oNkIR
	XzFEtKZ/2fNGiQUw1HeM08JXsF3p09btvRlpXTbA+QfoD5Yv71EC1e1jUBkqNhYIKZqIfV9Bia+UI
	+4poIl+JbCaP+e8ticzfqCELNV9sM4/mqiPQkajb3M9hXzhKe6de/+rgYbdQJHpUXM1D30aY6ZwtN
	cO7sFiuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNUY-001F2g-Qh; Tue, 09 Nov 2021 09:32:34 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNTB-001Elu-Tb; Tue, 09 Nov 2021 09:31:12 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2173D22234;
 Tue,  9 Nov 2021 10:31:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636450267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2St0dVtratovV1JEd0UY9RKrZdqkQbKfHOfS3T3XFE=;
 b=IUQsKjtKm5WsN3MDIutIRgq6j1sxG7K78fVWOv0byewqMI/r3jITO9+d3tbuzMmlwreQMm
 oxDESpih7farANIh2qDB/MdbazoyDl3TdjqEEJrk/66fVyR5nfB8mE5b8n0vfWUT5gHdTC
 bphkSta60DUS4J238JDFsbhml4Qitsg=
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 10:31:04 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 05/25] mtd: spi-nor: core: Introduce the late_init()
 hook
In-Reply-To: <20211029172633.886453-6-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-6-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <18c4c29c9ae9e2c968e61722aa264335@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_013110_603172_2875B08D 
X-CRM114-Status: GOOD (  13.28  )
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
> Flash parameters init is done in a spaghetti way right now.
> There is the init based on the flash_info data, then there is the
> default_init() hook, then SFDP init, an intermediary post_bft(),
> then post_sfdp() and a spi_nor_late_init_params(). Each method can
> overwrite previuosly initialized parameters.
> 
> We want to separate what is SFDP and non-SFDP specific. late_init()
> will replace the default_init() hook and will be used only to 
> initialize
> flash parameters that are not declared in the JESD216 SFDP standard, or
> where SFDP tables are not defined at all.
> We cut a member in the chain of initializing parameters by getting rid
> of the default_init() hook, and we make it clear that everything that 
> is
> in late_init() is not covered by the SFDP tables defined by the flash.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
