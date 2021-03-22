Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5698AC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 08:58:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE296191C
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 08:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFE296191C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=or8Q2eH3ZPjasf/pFHqxnJ7N9L8fBu7juVQBrcBTbbc=; b=nCF6U763NdcAWa/952dJKTKcJ
	wl18vwW5PPwImvbOvr/naCsXUSPPJElwMsmK8zGR5heJTukvVCy+Acw3ejqM2GbmBRzIqgNWUHSxl
	RcQZLpt3mD074MphEVPLRWPZhKalqhEy6YpeThYkBLN0IyKyY/nRTCU1yqnS/5ageZS30Zj6fias4
	gUr4fBggEpAjgizzThmgLnpOjDOL7wymsRCI55dUEVHAmA0OxK26LIj7kS0xDb74rrxhvHiJ6q8BB
	O5QF/eYoaC5VUQ6GLwZXc5fD6JgrU368rbgmmrxSkBwnDhJeB86i7QXVYXpIVwRmCwhDXnq/v5yD7
	ISeI0GXEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOGNC-00BCrq-Bs; Mon, 22 Mar 2021 08:57:18 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOGN3-00BCqH-2F
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 08:57:12 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E5AEF2223E;
 Mon, 22 Mar 2021 09:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616403423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mNtl7wKZCKuA1tKkydoWUzCQ/+4X78f16aDFry4OxBg=;
 b=AZiVx4MM9z7YyEYBV0Nvus1SpSkdDqjRcI69JjvpzcwbJ+SKc+/h9BOcshUr8BzR/TRTNY
 wWTWEzjrrHE7LIFMpUvaXIHwWEKhySHtQIQTMxhhTdSGseywf5LeAeMrR3Jc9hpWFg3lFR
 IpT5p+ye+uacSnEDEh+Hi3UA5+11cuc=
MIME-Version: 1.0
Date: Mon, 22 Mar 2021 09:57:02 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: vigneshr@ti.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Joe Perches <joe@perches.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: swp: Improve code around
 spi_nor_check_lock_status_sr()
In-Reply-To: <20210322075131.45093-3-tudor.ambarus@microchip.com>
References: <20210322075131.45093-1-tudor.ambarus@microchip.com>
 <20210322075131.45093-3-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <67fc86c6757c19efa448098c83eb62d9@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_085709_400655_63420081 
X-CRM114-Status: UNSURE (   6.62  )
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

Am 2021-03-22 08:51, schrieb Tudor Ambarus:
> - bool return value for spi_nor_check_lock_status_sr(), gets rid of
>   the return 1,
> - introduce temporary variables for better readability.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
