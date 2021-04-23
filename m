Return-Path: <SRS0=ovMs=JU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F4FC433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Apr 2021 16:55:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 726CF613C4
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Apr 2021 16:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 726CF613C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R6fGPaJyxgEsQsl1qL4IDiBs1y1Na70xMPI3emJw2qs=; b=G4IuqOH0qiWNzrpsNa6bLp9VH
	CMkqWHiU4+J2z/jh8reYlE6qpmtsNXkYjcKqk+YVUmfVVJlvlYyY4iCu9Sd2uSjnS4YfroSmpJZIZ
	OU3g1YsH/z/y58ZZJktADuesAcPTYrOzRyAKxszAjSQh4ew5YhovL1OM/94KrMvBYUteyK8YpT+YG
	sM0jsI14stPX0gE6WlWNuD2ZS7bgvftjG4XjOkz7rb9i9ZCBOeOzL/APTuMJq7jcMzUwV7CIxIXKg
	FFymU8rm+kzO9XbNnULm+kdIp9NfMxRsUQCkhwSb0/IGeeQqythxZDCxb0lBJJyMh3M/bWyZj2xGz
	obv9syc/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZz4V-001w8z-Fm; Fri, 23 Apr 2021 16:54:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZz4R-001w8M-8F
 for linux-mtd@desiato.infradead.org; Fri, 23 Apr 2021 16:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=GexNYXxnvklMRxNquAZfL0Ckrpw/ojez2uA/Pad+fyY=; b=AS2tKyXgn/LVADDpL28CjycGoy
 T4xah3cdA9R9DkmRUH7/ozMUOiYPK8sHMjxzVoLZulcuaGxxoIbn7mNURvZjvNt2WwqDAbPV74uhi
 mfeALXmVkUR20XNsrumGzjW5DZpL+k419CtW6iUa3Q6zfe3XtnKjpTQ5uL5+pxIJtMJNAwnCtApJs
 RdiZqrv4lI2xMCkus2c1Ftw/icYf8iOmc6pfD7WOuHN8AqV0tzjZjxR3+TWLQ6QvwDxIl458+LzJ/
 5aBXaOgFJEm0JN9QGxTbxQP67gEtGipd50qSjRIr72Czcx8aMN6xEBA8YCLkMUX5snPpQUNRiegBZ
 4bvJdiLw==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZz4N-00EZD1-Dl
 for linux-mtd@lists.infradead.org; Fri, 23 Apr 2021 16:54:22 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 29FA922239;
 Fri, 23 Apr 2021 18:54:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619196853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GexNYXxnvklMRxNquAZfL0Ckrpw/ojez2uA/Pad+fyY=;
 b=UhswT+ZCrbY01ijf9weaCj+d7oHRStjOY925IOm2ioaILM8l7q6oQ8lpJk7l13J6LJ2e7S
 YkNp+kP9+GuaJz058D5Hyyo0RmD7wxzuqenJPxh0qv3wvQlG0ZfYkRWsZEtKxdwaYme9wo
 G7RFx7u3o7tEBiy4IuJbRjwrXc0QsMk=
MIME-Version: 1.0
Date: Fri, 23 Apr 2021 18:54:12 +0200
From: Michael Walle <michael@walle.cc>
To: Larisa Ileana Grigore <larisa.grigore@nxp.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/1] mtd-utils: flash_erase: Add flash erase chip
In-Reply-To: <20210423150704.7248-2-larisa.grigore@nxp.com>
References: <20210423150704.7248-1-larisa.grigore@nxp.com>
 <20210423150704.7248-2-larisa.grigore@nxp.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ce27623b508a67790ea140f97dbfc814@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_095420_048170_1776295A 
X-CRM114-Status: GOOD (  18.29  )
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

Hi,

Am 2021-04-23 17:07, schrieb Larisa Ileana Grigore:
> Some flash types support full erase chip command which can reduce the
> flash erase time. Try first to erase the entire flash and fall back
> to the old method if the operation fails.
> 
> Signed-off-by: Larisa Ileana Grigore <larisa.grigore@nxp.com>
> ---
>  include/libmtd.h         | 15 +++++++
>  lib/libmtd.c             | 26 ++++++++---
>  misc-utils/flash_erase.c | 95 ++++++++++++++++++++++++++++++----------
>  3 files changed, 106 insertions(+), 30 deletions(-)
> 
> diff --git a/include/libmtd.h b/include/libmtd.h
> index cc24af8..6ab0de5 100644
> --- a/include/libmtd.h
> +++ b/include/libmtd.h
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright (C) 2008, 2009 Nokia Corporation
> + * Copyright 2021 NXP

really? because of one prototype?

Just out of curiousity, is there any incentive that you NXP guys add 
these
copyrights all over the place, even for one line changes.

>   *
>   * This program is free software; you can redistribute it and/or 
> modify
>   * it under the terms of the GNU General Public License as published 
> by
> @@ -174,6 +175,20 @@ int mtd_lock(const struct mtd_dev_info *mtd, int
> fd, int eb);
>   */
>  int mtd_unlock(const struct mtd_dev_info *mtd, int fd, int eb);
> 
> +/**
> + * mtd_unlock_multi - unlock eraseblocks.
> + * @desc: MTD library descriptor
> + * @mtd: MTD device description object
> + * @fd: MTD device node file descriptor
> + * @eb: index of first eraseblock to unlock
> + * @blocks: the number of eraseblocks to unlock
> + *
> + * This function unlocks @blocks starting at eraseblock @eb.
> + * Returns %0 in case of success and %-1 in case of failure.
> + */
> +int mtd_unlock_multi(const struct mtd_dev_info *mtd, int fd, int eb,
> +		     int blocks);
> +

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
