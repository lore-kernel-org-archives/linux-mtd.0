Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADA4EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jul 2023 07:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0VU1AbHjFMiKlfkpQdA2yvMGE49etkF5tzjkPogVmM=; b=y4pk4n0bWUvqTTKBkPk6A/eXAz
	j0XFM5VZFaiBjl9VVkSKj4nZfU/ZgbpF85rjgK6dTTNm2rT2pBLMsu6hOXfCXBoY8lG0rLus9mIWC
	U51BZDlEZr7qj6iLytY7eeOPgttFdTgCe+0b1JoDedF1GuMBfJdoRPsn9zJTspenvJj1J0Wg5GUcM
	qgG09rUQ686PoxjerjaV4gteQGjY48nmFenMqohuplY+c78Hf9b7G+fKzllbWM6EPNOcmlW6zajt+
	3NkOM3kmG10w8+cY6xXbLkqiC/9xYG4dhYMFx6BIFhFsJNaxOTvEm2WhJoMOd5OcRutqDv9xqYi5Q
	XZIxCC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJNU-000mqY-26;
	Thu, 06 Jul 2023 07:26:12 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJNS-000mp4-2T
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jul 2023 07:26:12 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C8AFF14B;
	Thu,  6 Jul 2023 09:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1688628365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YByh8/bD0lokeLpwwWy7poHsp9CxyNU7yYEqLS8fnbM=;
	b=N2KmBuvYlYNhjlwPc4e//wQwq3U5zCy1arst2ocZgKa/6/TyDRTbwjiOog1y8r5YdwwMWQ
	o/RpgbV6EmkJ8BLRG0d+3yp7FE5l5MYwBwAoZOGiUHPGYCZh1PpATIx8cBFVYJ1L8DWHiN
	UacgjSdCdPRerlEIpW7FvVeo5W+pOxvoXKZkJiZtchTLS12DinPaSuATDj2C9at5vMZUhn
	LmC86NiKoo0TAX3N5NOLY9wS/fBRulpJyjjmiqNCxZhWeyvgyY1LGSTsRmvi8R4UW5d4mP
	W6kI+lzeoi4uT0QBPLq5GZHLU5W4I1+n/PRcHj1+Ksci76Z7P6A9Z4cZFJLJuw==
MIME-Version: 1.0
Date: Thu, 06 Jul 2023 09:26:05 +0200
From: Michael Walle <michael@walle.cc>
To: Mamta Shukla <mamta.shukla@leica-geosystems.com>
Cc: Mamta Shukla <mamta.shukla@leica-geosystems.com>,
 tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH] mtd: micron-st: enable lock/unlock for mt25qu512a
In-Reply-To: <419d80f252f12f091b9c555da0965c84@walle.cc>
References: <20230705130010.2999839-1-mamta.shukla@leica-geosystems.com>
 <419d80f252f12f091b9c555da0965c84@walle.cc>
Message-ID: <582915cc4adc89b8ce16568f4d0421ca@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_002610_959906_D620A266 
X-CRM114-Status: UNSURE (   7.50  )
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

Am 2023-07-05 15:22, schrieb Michael Walle:

> FWIW, I noticed the difference between MT25QU and MT25QL here. But
> I don't think we can do anything about it. It is just another example,
> that the name is mostly irrelavant/cannot be trusted. Vendors tend to
> reuse the id for different (software compatible probably) parts. Maybe
> we can get rid of it entirely. Tudor, Pratyush?

I must have been blind, the ID is different (ba vs bb), but my point
is still valid.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
