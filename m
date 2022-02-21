Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBA7C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 07:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT8aq3nU//KK9BuwiUKcXwusUmGH1HPaPf59YzxgG4s=; b=YkDDa/gBqDamH2NpEQ33mziofa
	76LOwi7/rBnJfrCMMEfL0CAICScihy2Wm/6zkbkNOzzZbVOkqaPIxoXadbDnQ8dE2u6bGAZebodKb
	IhaCIkS6U/C/P6g/gkPj2UGKQuLsMYmEAfhNen4/eznnGthfsEptxq57RdfX/Czlvf0Vpb53zqA4b
	9uW3j8W5BbpD6weDnW374Rj/pROso7D1NjBJTTjZMY1WZagnzTQ/B3rsbVeXTU1ttvzZ//fHQdM9p
	tnNRuLPbcuja2ENEZP2Gs7fPJHlfrtAzNa12wkxbJqbReEamVd9ddDDFuwTB19A+JKaysIUxdj4QO
	/bqw4J9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM3NC-0044uc-Ae; Mon, 21 Feb 2022 07:44:42 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM3N7-0044sf-FF
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 07:44:39 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BA42C2223A;
 Mon, 21 Feb 2022 08:44:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645429475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CYxJg6RXHwuQQPHgm7btkpehETiBp1YmrUpCpg1PZHg=;
 b=SmDq0SK53YoVS9qM7butDx4U4t9guXFj6hquSPFA6/Q7Cd9xxqpQT8lxQcQhwMawAvCoKO
 yB4iq/kf6bsLDi1j/XEvL1wtdzpM/ajbmDRu37+xBVtrar6+9P93R/JXKT/JCDRAwXSNz6
 1oEpPYgWdDnKfVwT4qgTtvZbNDybl7E=
MIME-Version: 1.0
Date: Mon, 21 Feb 2022 08:44:35 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, broonie@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 nicolas.ferre@microchip.com, zhengxunli@mxic.com.tw, jaimeliao@mxic.com.tw
Subject: Re: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
In-Reply-To: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <44f655d027b49b87065915f6ba2744d2@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_234437_748364_C64B8DC7 
X-CRM114-Status: UNSURE (   8.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-02-18 15:58, schrieb Tudor Ambarus:
> Fortunately there are controllers
> that can swap back the bytes at runtime, fixing the endiannesses. 
> Provide
> a way for the upper layers to specify the byte order in DTR mode.

Are there any patches for the atmel-quadspi yet? What happens if
the controller doesn't support it? Will there be a software fallback?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
