Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911B2C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 21:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WRT6IRf/p5v14fpr24CitjiG6Y2Jcks8kQAj3n6t2U=; b=H4yAhPIBwyo/lIIr4H2aJhXxsT
	KOze/oVo1+CjlyC5YBRrtjGmFlvZPaWNZK4isiBFTJtoTGfvJxfglxCKxH0NILbFlSB5txyovG8H4
	W6Q3HMgzn2lTjmyC68hAyBRotWg0DPCWNtL5EOjztIH5F06b2V+J94H1dQiLCsBkjF5CiPIHnYxsv
	FOkpXfNz+4bS8Vmyt+CRy2t4H3yVCBmBCnA3vpDVJ1wVv8y1C/VylIb9xbBzu2PG4O4N5Ivt8gbCX
	XQh03HsExElt0r+JQIzJxgUm6aS80Kr4x4Lmi55ayDSXuZsJGdR1FpsCkMG4p25Dk18I8jJAV9wIW
	U/ftkAtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPACy-000euk-EZ; Tue, 01 Mar 2022 21:39:00 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPACm-000esM-D6; Tue, 01 Mar 2022 21:38:50 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3C4FF22239;
 Tue,  1 Mar 2022 22:38:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646170725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Be65slyli5Dtd/tIqgTtsyO6hdB58R5MgJQ3wU5ki0w=;
 b=PSBTbgL8tEQUFeRgTMRonu9PtTXF2GInkU+75ocwejqCWPUyqmjF4RHvq0JpJbND7bTfaG
 vVh9IPxeG0o26jjALT2me/+UA9wjBKu6thoJdgCOWm0skLjlNW3poJo6NQCaTuoZNJ2qDA
 Hispk2rpAYJJnSOYRb7kM8xKYe3Pc8Y=
MIME-Version: 1.0
Date: Tue, 01 Mar 2022 22:38:42 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: core: Report correct name in case of
 ID collisions
In-Reply-To: <20220228134505.203270-2-tudor.ambarus@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-2-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <f94af564af0578a84fa351ca59e98ba7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_133848_637430_3D92448A 
X-CRM114-Status: UNSURE (   8.29  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 nicolas.ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-02-28 14:45, schrieb Tudor Ambarus:
> Provide a way to report the correct flash name in case of ID 
> collisions.
> There will be a single flash_info entry when flash IDs collide, and the
> differentiation between the flash types will be made at runtime
> if possible.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
