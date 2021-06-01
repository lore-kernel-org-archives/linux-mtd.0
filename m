Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF116C4708F
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 12:45:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73BB760234
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 12:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73BB760234
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuKS7Tmvz93NghcIlx3IBXlvtnOooJHT7v0Wtf/0OK0=; b=4kG5oOZ+hT36sWEBUinA9ovJ8R
	OKlT7JFsj2QMjJaRIIOdqXkVN0onTD1qxv3y4ZTuLT6lyT6ho+MtkbKZINytxDqP/z7F0Bwx3XYr6
	9cQHdDJPckRIdxpAbt5hqD3N1DQeWLNYhc2w680SQWu8MhRnZnMSmmhy14gmqW4OyksIKce3v1Lg1
	DYJ+dE17JiRoPiH+/jxwUotBzRrLQr8dw2I3/JA494hNSQvUYBvEu6ozOJLtKUWL9dU5fTU3JvtMb
	fffi8d0BluO0xZw18xagRSQ+QeCI3a9p+Eq95EeIH6AsGS1kflBKuCVK1n3eXvWF5eGE3VvzoigcV
	JAL8bhdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo3lX-00GZhR-1V; Tue, 01 Jun 2021 12:45:03 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo3lU-00GZg8-01
 for linux-mtd@lists.infradead.org; Tue, 01 Jun 2021 12:45:01 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8735722236;
 Tue,  1 Jun 2021 14:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1622551498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b43l9JwGMojnvxR7u6rb4bHE+y8B1xgeuP6UyhnRg5c=;
 b=rNrxYXXV2kN3d7v6g8tdreG6grSr43AMWyyJiXRAN9wHYI7ylyOnvcu3RMCODE/vVAQgxk
 Hibh6sxO6fBla+TpjAkb4hR658JUgaTvrByCl2UMuJxUp4jeiyZ2ngu/tk0Z7wyDTdNIYh
 0fF8pYRGkd4I7NJq9uFUwXwFw3Ab4oc=
MIME-Version: 1.0
Date: Tue, 01 Jun 2021 14:44:57 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
 writes in 8D-8D-8D mode
In-Reply-To: <20210531181757.19458-7-p.yadav@ti.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
 <20210531181757.19458-7-p.yadav@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <6fb69565f7b27eb7e8ee3321624ad624@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_054500_218924_562BBA92 
X-CRM114-Status: UNSURE (   8.66  )
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
> On Octal DTR capable flashes like Micron Xcella the writes cannot start
> or end at an odd address in Octal DTR mode. Extra 0xff bytes need to be
> appended or prepended to make sure the start address and end address 
> are
> even. 0xff is used because on NOR flashes a program operation can only
> flip bits from 1 to 0, not the other way round. 0 to 1 flip needs to
> happen via erases.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
