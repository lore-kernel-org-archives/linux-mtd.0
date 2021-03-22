Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97787C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 09:13:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0BA361983
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 09:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0BA361983
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1dwqCKdh7mCbbkwgUBdBLawUV62ZKMrXUrTuIWGsOok=; b=KcBt+mMywIiCQFkRNaqTIDslQ
	QWeeJCiB2kcMG8LUYhAwXpRAI3NNFNs5d3Yof3iQ5ETYTx6TrKBlzXcefqRT8kOKS/pLuL+E85Vjo
	UzXfGGMaawwdkwcHGhVOtQo2U5YHZO5QWhz5y/auBhmu/sIibSEyVcIobUKSagkaaKS9H8ka3oeKt
	RAIPDtgTGDIwPZ7nr9zNTibcW341y8fEZkiICj/lK6EwIP4sttKTTP4W6/6WZytEknrVKHD0dCZjW
	cg5KiFG/DOh5zsQ/8S7mjx70NkZNg/Yl3vR6LON0tyFvJ71r4objujNAQRGP4UBwMuOti8yXSjpAv
	rwqc0Jl0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOGby-00BEMz-QR; Mon, 22 Mar 2021 09:12:35 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOGbs-00BEMU-51
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 09:12:32 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id F37602223E;
 Mon, 22 Mar 2021 10:12:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616404346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YgJiudvxY8DvM0hPuoWetWoJtQ5Ih6Qu354QJL1DFN4=;
 b=Z8JKxdkBPC4XyEnBELWkFW7YXx6kUJqZ+iT23rZsJMa3XjhkESAFlA9dZ1miqhvxW4nli4
 g9zlFVeUwkwlvgGs6d17axpQxaUiQ4ToBL1BHZWNFwpO4jhfbLr7aNyT1t8TvHaj968jmm
 XvpBmyLIfj1cquSvXXEDM5d+SQp8G2w=
MIME-Version: 1.0
Date: Mon, 22 Mar 2021 10:12:25 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: vigneshr@ti.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: Move Software Write Protection logic
 out of the core
In-Reply-To: <20210322075131.45093-2-tudor.ambarus@microchip.com>
References: <20210322075131.45093-1-tudor.ambarus@microchip.com>
 <20210322075131.45093-2-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <1685b2d9d1deaab55b3719d88187bcf1@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_091230_717826_CD4233F6 
X-CRM114-Status: UNSURE (   7.95  )
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
> It makes the core file a bit smaller and provides better separation
> between the Software Write Protection features and the core logic.
> All the next generic software write protection features (e.g. 
> Individual
> Block Protection) will reside in swp.c.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
