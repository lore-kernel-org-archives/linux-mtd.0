Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8408EC4727F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:35:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 007122053B
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:35:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DzWDc0Mo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ps0/WBIO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 007122053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZUOZYFWa64EabRRQpl2bjH7ZYhlyRFS7QIg5c7KCcHk=; b=DzWDc0Monvkp21zStPFIVgwde
	b7Ljf5sqkCmfQA/cHdKJpf6ST1d7ZmlMGOA8HG8LfvjNb5wd+/7ohhg/TfBkU5yqKCSJaoNEwsikV
	975QQmHLZNnPN+dJcITbbwZU78QFZv4QbhGRZTjKiqgi3aHmyO6lqIIejbobLNQYMCaQrcWMskGfs
	2Pvv475wuV5EY03nGypIoVUX3VO7qGKUKvHQK6AvMr1+0A+VG7d/LYgoYNEg/qaltBpHvsz97yXLn
	4tnw1h3cnrThsMobYfMI/V6xXXZh2uRY8kPli+uN7G0bOpNie1lN9DFC7Dwvj2MsVXHS6wC7s1DNa
	whF8nqj3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXZk-0004rU-DX; Wed, 30 Sep 2020 08:35:00 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXZh-0004qo-LF
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 08:34:58 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U8YsLi019708;
 Wed, 30 Sep 2020 03:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601454894;
 bh=xiEfXyyoVBEQy077KvyFGTW8nUeUU8zW4KN2Ea5Ce9g=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Ps0/WBIO6AaukMPswHnjM9KxVNi85lcOg/2C7cbsSGOTZXnQzl7jvaPmTTqQ7gdxT
 EEmqXdy2ieteVjfxIDLOFbSev2zkG9UM9OUnCYGXRCCahtZQcI69idXFweP4jiw+bF
 KvbRLMdd/dyvzkwl4GqSPq6pQgfi0BqJQsx9Z9LE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U8YsVm058661;
 Wed, 30 Sep 2020 03:34:54 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 03:34:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 03:34:53 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U8Yo8j098804;
 Wed, 30 Sep 2020 03:34:51 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Douglas Anderson <dianders@chromium.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: Prefer asynchronous probe
Date: Wed, 30 Sep 2020 14:04:42 +0530
Message-ID: <160145480408.16293.4165746233350450081.b4-ty@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902160002.1.I658d1c0db9adfeb9a59bc55e96a19e192c959e55@changeid>
References: <20200902160002.1.I658d1c0db9adfeb9a59bc55e96a19e192c959e55@changeid>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_043457_752251_5E4E408C 
X-CRM114-Status: GOOD (  10.52  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2 Sep 2020 16:00:40 -0700, Douglas Anderson wrote:
> On my system the spi_nor_probe() took ~6 ms at bootup.  That's not a
> lot, but every little bit adds up to a slow bootup.  While we can get
> this out of the boot path by making it a module, there are times where
> it is convenient (or even required) for this to be builtin the kernel.
> Let's set that we prefer async probe so that we don't block other
> drivers from probing while we are probing.
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[1/1] mtd: spi-nor: Prefer asynchronous probe
      https://git.kernel.org/mtd/c/03edda0e1e

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
