Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847D7C5AD4C
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Nov 2023 16:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6s/Vy2QLZv1C9+fVEf/R3Hx7xMLbK64LTlhDNHubUY=; b=ZNIUBd+KmJ4BHI6jaHq6TUKo48
	rxnCGNOAS2ihrRE8tN8jCwcHUldlTRE4iZbzpl0N7gX6jXCH3AtE4QJIyoU3luc8q7voB74ExDLoR
	kj8KKTju/pnHoCE/opr6y2tup2zmt4ZLPScGrxsMHRV1I+v4djxNv5zLr+YqMxem/r2HPUDtpiVHl
	aTPT9finT2BM2ruu0V8fjy+5joAdogUXV55IzqcKfETXgCQnAKwxMICjE5UcdoCt8UJHLVzCkgDoz
	IJQv9YHQzvmrLSwxm0KpjwG4lnLznu0GZqjwdIMB3Cs9jptoz9BS/GoyRl0Ou1doSVK1uyNsxSz7p
	sP04PqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6CMu-005Gic-1o;
	Thu, 23 Nov 2023 16:15:56 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6CMr-005Gi6-0w
	for linux-mtd@lists.infradead.org;
	Thu, 23 Nov 2023 16:15:54 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 79A3C33C;
	Thu, 23 Nov 2023 17:15:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1700756151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3mKxwmjen41Ks2QpqmtZQa7d9qvwTznyPnsUUWAHpOg=;
	b=wqByrB3M51mgwtA9Ou51bwSQ1rOjoonS140m3LdB2kZkTiFC8mcZmoMBdFQFbf7qM8XjcI
	JejDDfDG8kmJPoK5c2qzro2A5ihcgeyz9sYxanMSrdE9Mybxy0S/oH7akUhqibOmmvPRZf
	gUp/AOkHH0oYkSM47UPKEbq4004yAEvKZfIOsV4c2D7opK9JdCCDBtAmEWD/2ncxqAIMkW
	LCiOjLt3tXYwLBqIbBLzwaxuVbvaOqWNnnUzaJAjhLMWGKEoRH4ub9vz+FpdJqE4caxtVV
	+h//ZH1Lz4quO70pmmARZFa7EH8GevDTJBHLDoEY+gGJxEWkB7IShNmKKrO0ag==
MIME-Version: 1.0
Date: Thu, 23 Nov 2023 17:15:51 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-doc@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: mtd: spi-nor: drop obsolete info
In-Reply-To: <20231123160721.64561-3-tudor.ambarus@linaro.org>
References: <20231123160721.64561-1-tudor.ambarus@linaro.org>
 <20231123160721.64561-3-tudor.ambarus@linaro.org>
Message-ID: <ea3aeb73f087bdd9719fb88aafda7ad1@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_081553_488161_2F8787BE 
X-CRM114-Status: UNSURE (   6.12  )
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

> The architecture description is obsolete, it no longer applies to
> the current SPI NOR framework state, remove it.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
