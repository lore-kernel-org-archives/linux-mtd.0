Return-Path: <SRS0=TepB=IE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F159C433E0
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 11:20:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F5D464EDB
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 11:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F5D464EDB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f/iJBbSUywbJEJb1Kvz8PKMlDiVjbEkKeUg8tLh4p28=; b=O2oAJXnR2qQmyw9a9y7Kn9XKN
	ShnUaQP6sVgzHJAQIzDLSLoSZCyYOvc/yEqx97ZWTMJ9yOCLQ7A7UTxTunexcWZLjqWTQ/0/yHqye
	LMxkJjz5Y2ceVJ41E96PRfdpx7kwcY2QqccNmPskv8HMIumBYk4E7pnjxjP3lrtbH+0+MVFfqIO8Q
	W5JhsVKqIOCD1wkev8W9Vba/SFfnvGpk5ZNQknqHk5ak4m3wukK3u3lr3eKdoZfmNmIQRald9HaqF
	QOrX205XPY3iUS2qULEPf0G2jYJZTS4y7TDOS3N8LQRdLgzvJsESQHJa4VR8Wm8o/Z7GRAsL259jH
	eDx/pZtJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIUxm-002rZn-Fj; Sat, 06 Mar 2021 11:19:14 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIUxf-002rYc-J7
 for linux-mtd@lists.infradead.org; Sat, 06 Mar 2021 11:19:11 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 44EB422239;
 Sat,  6 Mar 2021 12:19:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615029544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zX9fO4b7o8NQG+rCtbaK0gMHIlmYCHWUTWEk7uKieYc=;
 b=fiqyZFA/qmJlYzwdeAt10ZrSLagIBQZmdfpkR2tHYfM9AmLraABBY8FcKm6KlO2ZHk4nNz
 3VmwoKfU2I2soU6Kyrhmejh454b5RGbDGQepd928pxzB6lR1VjJarDydRBxPnsxRJHKxut
 hvWbbV6H1FTaWQS8S1r8uPvUo8c1JF0=
MIME-Version: 1.0
Date: Sat, 06 Mar 2021 12:19:03 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: vigneshr@ti.com, p.yadav@ti.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, richard@nod.at, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection logic
 out of the core
In-Reply-To: <20210306095002.22983-5-tudor.ambarus@microchip.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-5-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <7fb8af561eda06444ee0e0c592147af7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_111907_835780_9DF0E690 
X-CRM114-Status: GOOD (  10.17  )
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

Am 2021-03-06 10:50, schrieb Tudor Ambarus:
> It makes the core file a bit smaller and provides better separation
> between the Software Write Protection features and the core logic.
> All the next generic software write protection features (e.g. 
> Individual
> Block Protection) will reside in swp.c.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---

[..]

> @@ -3554,6 +3152,9 @@ int spi_nor_scan(struct spi_nor *nor, const char 
> *name,
>  	if (ret)
>  		return ret;
> 
> +	if (nor->params->locking_ops)

Should this be in spi_nor_register_locking_ops(), too? I.e.

void spi_nor_register_locking_ops() {
     if (!nor->params->locking_ops)
         return;
..
}

I don't have a strong opinion on that so far. I just noticed because
I put the check into spi_nor_otp_init() for my OTP series. They should
be the same though.

> +		spi_nor_register_locking_ops(nor);

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
