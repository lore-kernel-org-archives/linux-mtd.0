Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A99C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 18:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IdGqJRFMjqd07udDOKsmMwyX76Sg/7gDcJWg4r3L90=; b=uAep8IU84fheto38+HBxcMN4os
	yxj96NuOvC9ivJ5JySTw1CwnjPp9XWHyO/6j3N6bawv54w0cUjXJHFiu/AZOBGRqEVLIjZX7H8Op5
	tKMFs3R3xZA+Uf4RJbpJOumNafR5v1Bog8W7+04iC8tw35PnzRdSRy5rl9hfzHyTYFWGzt2tCUBiR
	pItjIvWUXlkyxONk4qX0XVf2JCCs9oaAd/9KpY9uExlmm7R1BpnAExg8C7sFlnqwvH62ImiZti0g6
	tC+LlIaucS+qg3j7ddPFmp4P39kG916Oxhc1x62JtXLP3Kj1cO6vGVzXWy3CmqnQ1VtaR96uz2BJo
	kxeNIX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpE3J-00HLL2-BJ; Mon, 22 Nov 2021 18:28:29 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpE36-00HLJK-Dg; Mon, 22 Nov 2021 18:28:17 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E9DA222246;
 Mon, 22 Nov 2021 19:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1637605694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQIKN8fzRCihpEcEabM11MKoHn50L6oJG6fykriPXoU=;
 b=ru0cn6U7NfC5VrZ9ezumCQohF3h66J/Cm2tUe7qD3Xz68RMEICKsxs5y/Xd+FIj5bBabTc
 4LuUgWHrac358cc5nqXFTF58JD9Fnty18cwEvY6Jey1A1tRDtp7zifnD20K3rAX3hXgJba
 YDV0TY9ahpr1N7UtoRPCFIcuM/z19aw=
MIME-Version: 1.0
Date: Mon, 22 Nov 2021 19:28:13 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 01/13] mtd: spi-nor: core: Don't use mtd_info in the
 NOR's probe sequence of calls
In-Reply-To: <20211122095020.393346-2-tudor.ambarus@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
 <20211122095020.393346-2-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8895167bfe243a76d83bf6f5d41b6b62@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_102816_641938_A022184D 
X-CRM114-Status: UNSURE (   7.57  )
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

Am 2021-11-22 10:50, schrieb Tudor Ambarus:
> Use NOR parameters in the probe's sequence of calls, thus
> nor->params->size instead of nor->mtd.size and let the mtd_info
> fields be used by the mtd calls (mtd->_erase, mtd->_read, mtd->_write).
> mtd_info fields should not be used during probe because we haven't
> registered mtd yet.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
