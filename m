Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AE1C7EE29
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jun 2023 07:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CW6P7U8hrwomiX1CR0sRpaBCB1qM8BGF+NAaf1f/GYs=; b=htfUAp/ZQS4XXzA+5edQHzcKAO
	TPVDkasEU9GGhVBiKmYGj+mF5U50cqQ7Wp/LV6Whi8awhb0sHa3WNkfSXXNVS078p8j02ew6FYRlJ
	30HCRxQan0g1BIsrRRjTjrXWCPsIPtxJs0Ac3q8lLVRsfnDPpe448Lt0VNOVNVhXe2wexhgWbp2Fu
	RnWScAy80SmSPRMWMz8cx22GegF62gm+1U5aLVmT6n6j2+3INQPMnp6IlyAzkrtELev5TYK14bY6Z
	RwycQKobsIyujISks4n4K93tyfiLd06EWmPvCbb8lgaAgtXPHD5JOfDW4SFgekxMBhnssTLL+9cHE
	tRl4qtwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ycA-007Emw-1r;
	Tue, 13 Jun 2023 07:38:54 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8yc7-007ElT-0l
	for linux-mtd@lists.infradead.org;
	Tue, 13 Jun 2023 07:38:53 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4524CA6C;
	Tue, 13 Jun 2023 09:38:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1686641924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uoH/uMeicjUdNtFSQLmo6mWyGBlwS1oGld82WQS/IgY=;
	b=dfyG9jinDTmNpRZnxh2ga9XHKTXPmfXHzFPEqihoz2tLMQs3/JDuxJ41SFw1aRHrawRUdS
	ZtOnRkOwY35bkTQR40qqPxTn5ZOQ3oQD0F3TzdFnsIgvLR02CgYgbACvedjXIXT75ZLMW7
	z5qXVjYbKTqBcy4vrAWnbTKZX/2UxQ6R9OjvhS3QVR0L+xw/DHQ45mhQsfnNN5uXOGMDYc
	l2IVDtCCwA7hHU3NHoFSF84LGvThxjSovoR/KhqEdKh12ZrAZwR1HE90S2X0eHkTsb+15z
	FpIV1SRBj+15acvkBPb0Zjzj7W/bG9U2WGCVHlm+JOI4kqrYhKNzjHA8B48LSw==
MIME-Version: 1.0
Date: Tue, 13 Jun 2023 09:38:44 +0200
From: Michael Walle <michael@walle.cc>
To: Bruce Suen <bruce_suen@163.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd:spi-nor:Add support for xtx flash
In-Reply-To: <20230601102238.948177-1-bruce_suen@163.com>
References: <20230601102238.948177-1-bruce_suen@163.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <60cea62991520f98d80af0382e43bff0@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_003851_540615_2E5BA559 
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

Hi,

> Dear Maintainers,
> 
> This patch add support for XTX spi nor flash.
> Dadasheet Link:
> http://www.xtxtech.com/download/?AId=449
> http://www.xtxtech.com/download/?AId=267
> http://www.xtxtech.com/download/?AId=426
> http://www.xtxtech.com/download/?AId=445
> http://www.xtxtech.com/download/?AId=274

Link: tags

> Signed-off-by: Bruce Suen <bruce_suen@163.com>

XTX parts seem to have SFDP tables and they should work out of the box
without any patches with the generic spi nor driver [1].

-michael

[1] 
https://elixir.bootlin.com/linux/v6.4-rc6/source/drivers/mtd/spi-nor/core.c#L2019

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
