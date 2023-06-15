Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0B6EB64D9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 05:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pH3gqy65qMKM5nNyxtifPlors5wRxEZwUmjFLClXew=; b=5BYey/8K/sOXnTm9UASpHUsBnN
	QaqSMD22oZtejCcW5iW3PzwqYP/WUTRV8DK0hbm8fAZQ7SFKpJgWJasfBRh438dSS8yIorZT51fyX
	REcgwF4ePdUUVLXW/ExmVFSoytp9iTEp1AHf4HxGbtzh4x+giBk6xsxNzfH/gx7cedK+zT7G5pBuJ
	IcXaTbJAiygoF7tNd8noo8V+aBE3/N6v9AzbcHKEuVNaiqHwwTmFghoFteLjfx9lyo3EWeuDsvDyf
	dGVhoUFPrhIiXnXZ68NqiHMGexzJGZRGwWHrD+/IMGFNtNlfra+ijcRxUKivvhO/El4beziYkt3c9
	xnGNsVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9fqW-00DlFa-0v;
	Thu, 15 Jun 2023 05:48:36 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9fqT-00DlCy-2L
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 05:48:35 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A25691133;
	Thu, 15 Jun 2023 07:48:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1686808098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgrXriMydU/6/ADwvZ96XPu6EPhDZCzDUEGCSuSn6Do=;
	b=qSm/POLHRKeyjfHPxLwf4yiR7p1HgCzXJfFTenhAuWvamaPTmO7h5RNaeWCQ4X+5LoRu7b
	4rzXgiWaEeZu4orZRCk+VKQRdnAVEEus+y2g9wcmzq2D8CsEWNSIHUe4lkYxPHkWHC4uJ2
	3hP0aZi2pZKFwoI0R8shxv5aQo75kkFoxFHzugpyyOK0u7ETSh+7KZFhOH85OITZrhTaGU
	wTu4LDWKzTvR/7jb5Pp94V8w6gh/N3mDor9VIkAKtRvhaC4RriV3vpngx4QmILjBGK11A/
	xgc3aF5HKW0tut6H26Pccpt1YGUH1tarIAfOa/kwpFIoRR21zKywaH2F9hd7dQ==
MIME-Version: 1.0
Date: Thu, 15 Jun 2023 07:48:18 +0200
From: Michael Walle <michael@walle.cc>
To: Bruce Suen <bruce_suen@163.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd:spi-nor:Add support for xtx flash
In-Reply-To: <5b092faf-2e06-baf8-d3d7-366054d5e0dd@163.com>
References: <20230601102238.948177-1-bruce_suen@163.com>
 <60cea62991520f98d80af0382e43bff0@walle.cc>
 <5b092faf-2e06-baf8-d3d7-366054d5e0dd@163.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f9005a2043ed82ccc3a65cd3e3e6697b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_224834_092998_C0ED7CEA 
X-CRM114-Status: UNSURE (   5.79  )
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

Am 2023-06-15 03:55, schrieb Bruce Suen:
> Hi,
> 
> Thanks, I got it.
> 
> I wonder what I should do if some parts need special bugfix ?

In this case, you'll add an entry like you did below and register
some fixups. But keep in mind that you won't use NO_SFDP_FLAGS() in
this case, because you already have that via the SFDP tables.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
