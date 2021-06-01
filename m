Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFE1C4708F
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 12:48:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA9666135D
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 12:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA9666135D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtOIfGUSphzQ6hTwh0MYfWzPKu0hrygRQClbg8MA9is=; b=1fgoQt4d0196hgIoOhUotcdavt
	+DSuAMMnM0h4RQf+Dpc2fV8tostUxybhJxqiVHtzwwkDHfYSBiVqAsw34EyTfuPImhm3y0HmWJLhS
	AKYk/7hs8Dh0G5i3CvY8z1WNKsd//F1LXBRq+NkcN1HA7dj2nZq03I0RZ2kEDtHJAtOewK2ko80/W
	oJM3FUHuWh4sqAWX2AT10GdzLdiENl6Rvz8/FDJvL3/9Zi15S3pL4bC1UN0p/EpQgLf/qZXDIPiI4
	nAvxX6kfJa5ZgfM+kfnEv+8Mu2xEGbcPpmjAnVlbKWFPJBqkds6h1yBj8q/kMu+RN0e2HWOpASxPr
	V8dxa07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo3nl-00GaLF-Hx; Tue, 01 Jun 2021 12:47:21 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo3ni-00GaIh-3H
 for linux-mtd@lists.infradead.org; Tue, 01 Jun 2021 12:47:19 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9D5A922236;
 Tue,  1 Jun 2021 14:47:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1622551635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/3YxyX+Ol081lsLNR+PQ0B+vmJYYqKxRHPUbEOofow=;
 b=RuJdqdfALJu7SASfKuKsUSVyIPOaiNgbbVjCQjbSn9oR86pzD+Nn8Cjo3An4+GI6LX6NCG
 YdDfaCBp/Rm6HZwSbxSLzqCyqu6SI3PfrNb5/dMEAH5tvoXqKMSQUnDDW0GV0WL3DI3HxI
 fS71hmVivc3y/VR4oEEoLlOvP6chNfI=
MIME-Version: 1.0
Date: Tue, 01 Jun 2021 14:47:15 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: spansion: write 2 bytes when
 disabling Octal DTR mode
In-Reply-To: <20210531181757.19458-3-p.yadav@ti.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
 <20210531181757.19458-3-p.yadav@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <f875025538713a005b1c18f8eb5c24c0@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_054718_354148_CBA277BE 
X-CRM114-Status: UNSURE (   9.95  )
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

Am 2021-05-31 20:17, schrieb Pratyush Yadav:
> The Octal DTR configuration is stored in the CFR5V register. This
> register is 1 byte wide. But 1 byte long transactions are not allowed 
> in
> 8D-8D-8D mode. Since the next byte address does not contain any
> register, it is safe to write any value to it. Write a 0 to it.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---

Can't say much, because there is no public datasheet, is there?

But looks sane. Same for patch 3/6.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
