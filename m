Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E42DC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 07:11:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BA2E22581
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 07:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BA2E22581
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XHXQq4TCVphL8TO0quldSY+Nw4TfJv6R+FOJB6gPp2Q=; b=SHROVUQP0wPYH2p86hIuTaa7F
	o4S8NheRmTu70w0b5n7F8Gh1AsReIsuFSsGipbdtKLCd6AcaMpupkWlMqekaPnoykMTvAvnNCNU++
	olPYyzdqIxHhgBm0yYLx5s7pfSH5uNijzhfqD1s8zQCyOB3ilKQEfsm8hYf6xjqclAMUWHV7HMV3/
	Jk5RgUv32psyo7TmzClpcztaLG4bPAPsJuWF+aGObJHyHI4JAanN6jbUpe6WeerZI29iFoMeQvkZU
	DR+doFkh6Um5OBpJ33LrQFT3tDVM0qHhxGNUpC1jM4tIFwD6gUDNLrMB3NJAvvLqkECmR82F2L2A4
	QxRDmOheg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3w0R-0004Mp-1d; Mon, 25 Jan 2021 07:09:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3w0N-0004Kc-56
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 07:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611558583; x=1643094583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RJBLB6P2jIwrzZxMBwWwieyM4efEub1T3vO1tr4sFD8=;
 b=wQYUbeM6FYH2sLMxShSjlvosHEpt3ZW9RnRGoigE92gAq2pEB33bR89w
 doJmFRQjIDkijgALkU2BVWb69ZY4U2V49w7vzC1fi0+dJmcuD6C34T+Y0
 /DRuDKk1tCBYm1YgEvXk3RX9PxTjl/hvfO3Oawwnz6HlVxbu39vcMhGHS
 3S6CcsStEEEZwL1Z/2mInQSQhwmHCvi+0jC9HuupGfuK0Ki1KrFigqs62
 TY97mBqE7AWKnRsf7fY4qBKBtbC+R3n0YQd6hHDD60CCFaCsXtxLQhzO5
 NWiATBbu012XkS0drkKrEtYfDhRBf+PML5UhwlCwgKyWMKn26pLSWA5Xo Q==;
IronPort-SDR: UukdEmfwL6ux++UfwOQJsldYuK9CRujJOhLYD7vqatCles2Ox2lgJQ16AfDLOYU/gR2s/Sj4Qn
 ET9E2WM3SUg/10PRlhfzJzcUc4dSPl5rHoPk1xAmpkGSJfO8bOtje/HnXXJyltkx3t37VM1pPo
 pM6lzGD3N5t+95dPaW5Z93MjBeAJBgH+pjLBVXxcltFwUDsoX3WePz65kTPFmX76v0ih1xxdMQ
 sgrql8iL4Rrhqnk/lBI/7vL881QN3BQ9kXBB8sHE0BPDEaQMt1NP+Q0wpSUmTKsyktwVx+0fda
 I/U=
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; d="scan'208";a="112321286"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Jan 2021 00:09:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 25 Jan 2021 00:09:37 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 25 Jan 2021 00:09:35 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>, Lee Jones
 <lee.jones@linaro.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Pan Bian <bianpan2016@163.com>
Subject: Re: [PATCH] mtd: spi-nor: hisi-sfc: Put child node np on error path
Date: Mon, 25 Jan 2021 09:09:31 +0200
Message-ID: <161155840485.1247075.6322709143299496385.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121091847.85362-1-bianpan2016@163.com>
References: <20210121091847.85362-1-bianpan2016@163.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_020943_409832_8DB8CD02 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 21 Jan 2021 01:18:47 -0800, Pan Bian wrote:
> Put the child node np when it fails to get or register device.

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: hisi-sfc: Put child node np on error path
      https://git.kernel.org/mtd/c/fe6653460ee7

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
