Return-Path: <SRS0=MQGH=JZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B599C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 08:00:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FB3A61042
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 07:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FB3A61042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d0/+Qeh/R1hd9WxHWsNI2qAc2JUes6RjXBLTvFnoZF0=; b=fw1vOm4TMmMtSMXEf2YtI/SWt
	9VJsKWyhaxDutkZEkfrMzkGAGwEQ5SsWoWOK8hRLPj4yIhQPHEE5zBeeicVqPn1cu+MpDyKOY5cOD
	v2YOb53ZiIOrjCM9qeis1Kzosv0mF5IztI4/CAXz2K/egwuXtRMvKZh+EccQYhu9VJeP/9cZCqA8H
	uvbQ4zf1WT4OySKtsEPW+LCMad4lxXMxQbGrvpLunHxpQBwcLL1DvPT/4xXh9+IZiA6ctkekpywjp
	HP4LwVKeoOifMrOyvcNB1oa0KwzEW8GO+TwKU0vuV4kMg1i8gERwkDNUwXEUmUU4I7DR2zoMWZR2i
	whtROqTWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbf5r-0034lx-CE; Wed, 28 Apr 2021 07:58:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbf5n-0034lg-5Q
 for linux-mtd@desiato.infradead.org; Wed, 28 Apr 2021 07:58:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=7dtPxz3peg+LrXXsJS+bg5vTyzb5cCiVzwUPdlB5mPk=; b=JydBU6OWJBT6bTIXtdXeRJffOq
 jtjYBBkdkiMO8uzcsL2EGRdjUTBBFYqCzrl9XyT/JCaHpcg80mz0uhwz8VB/H7yA3vo7MEGGp5ct0
 2p2+IsI7Zex6d52zmC5jBUYju6qq6s9fN79TOAupmvutGZWEKWAGwb/Wu3etnqO8ePRAB4Z2gtdF3
 LVe/njEC9cvCqMk9WB35gtUAzzesBMfzOzj+KZEnA598+ClQAiIWNjveG1pYBiKqmr2u6vAG40PXT
 MwF3t/PhGi9obgtDIZPcte4uc76cRfAjKr//soCFPTKIgMLNbCQeK9N+GB5wEXlblZ4hpHilTyy8l
 xcSK9zoA==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbf5i-00HGVi-Un
 for linux-mtd@lists.infradead.org; Wed, 28 Apr 2021 07:58:40 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3FD092224E;
 Wed, 28 Apr 2021 09:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619596712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dtPxz3peg+LrXXsJS+bg5vTyzb5cCiVzwUPdlB5mPk=;
 b=aphNbo50ugLQyHgwGRpmR5HeuktvWwJ+6ONa/idWhlFMPKQjxSzNPspcCPVrH1A4a4iO0E
 7YsfjDp9FUq1Q3jMQZpEk0f+4R0AFR74+VKIwnMxgV3IS85qBfvMJ2t5zsdpze0KoYssWj
 kyv4Zs7dMz23a5IBrpVJnudfYw3L9Ms=
MIME-Version: 1.0
Date: Wed, 28 Apr 2021 09:58:31 +0200
From: Michael Walle <michael@walle.cc>
To: Alexander Williams <awill@google.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: spi-nor: Export SFDP access to sysfs
In-Reply-To: <20210428052725.530939-1-awill@google.com>
References: <20210428052725.530939-1-awill@google.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <dd33cf8d3a78d60eebbb6f1be90cb7d3@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_005839_202053_1F4FEA35 
X-CRM114-Status: UNSURE (   6.80  )
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

Hi Alexander,

Am 2021-04-28 07:27, schrieb Alexander Williams:
> Add the ability to specify a technology-specific attribute_group, and
> expose the SFDP through spi-nor's private group. This enables user 
> space
> to have full access to the contents of the SFDP, so all information is
> available without regard for whether the kernel supports parsing it.

Please see:
https://lore.kernel.org/linux-mtd/20210318092406.5340-1-michael@walle.cc/-

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
