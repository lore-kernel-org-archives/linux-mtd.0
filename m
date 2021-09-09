Return-Path: <SRS0=lC14=N7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E504C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Sep 2021 22:03:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5673361186
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Sep 2021 22:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5673361186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xFHyBMhnX6pNXY5lUHvgGjzfSmXB+c74kUrpeFBPaY=; b=YU+Z+97itBOs4EImRwG8I/Kfvx
	43WQqN5KRqP/IeNFFzzegHIadOxLQocHvOT0s4ZsgBPmbbU22fVF9M+9yEXIrB4aYKXFY0+LQxuYn
	tZaj0eJ8p2W9RGiTX1UOznC4z38xi56yDwvVx3ZOdnbFFHEAvu4gHX1ScY7FpgM/soFZR/fUnGcWQ
	DWGRenQGE5J70XeSQg0V1dqwYtYtEm6N0vZShd6UC7iT4sBuPJlP7AsXtHiEzsvnWRz7i6reYRCYZ
	VIJQN7ZPdrspTSaJfyU/V4fIW0Vrd/xgwyqS5tEhT9lnw+bql8JPk7nTg02tB07P4Wt4IY+Gyh9yG
	wySElgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOS87-00B2Qm-28; Thu, 09 Sep 2021 22:02:47 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOS7t-00B2OJ-Fn; Thu, 09 Sep 2021 22:02:34 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id EB71E22236;
 Fri, 10 Sep 2021 00:02:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1631224952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZSP7IqHVq4TYvdDVBfi2Ecx2S8H47zIbCpFSrZ4f2c=;
 b=UCiqDk0cVuF4MbF976r07VWsPmOiSiIYjgx+3JeEteahJ+TWbM9wrVcfTeAj66HSMUpPQP
 O78Ac89GVHpu7VGapCUC19iVP4bXYUK32djClzNOPYRaiaqywgNnBQml7CKha/s5GmVqUW
 CZvFC+5CMLNNV0s/lATOIm8sxxHSmFc=
MIME-Version: 1.0
Date: Fri, 10 Sep 2021 00:02:30 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 14/35] mtd: spi-nor: spansion: Use manufacturer
 late_init()
In-Reply-To: <20210727045222.905056-15-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-15-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ebfc420928ef28bb508148b41f55b0e6@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_150233_735664_2491564D 
X-CRM114-Status: UNSURE (   8.30  )
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

Am 2021-07-27 06:52, schrieb Tudor Ambarus:
> spansion_post_sfdp_fixups() was called regardless if the flash defined
> SFDP tables or not. A better place for this kind of parameters init is
> in manufacturer's late_init() hook. post_sfdp() should be called only
> when SFDP is defined. No functional change in this patch.
> 
> Instead of doing the 4b opcodes settings at manufacturer level, thus
> also for every flash that will be introduced, this should be done
> just where it is needed, per flash. I'll let this for other patch.

Mh, then why does some flashes define SPI_NOR_4B_OPCODES. It's
unclear to me when you would use SPI_NOR_4B_OPCODES and when
this individual fixup. Also right now, these SPI_NOR_4B_OPCODES
flags for the spansion flashes are superfluous, no?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
