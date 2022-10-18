Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41787C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8m/14fDTRIIYaq5WnPN+jSAwFS1D0VYRUv2b7gnuJQ=; b=paOndcapE1+10r
	4T/dPj0aF3u/1PslMDcVp0Ra4qsOg6hIaxui1s27QxiRIxGY5TsMuW2MRFlM+NzOocSecMBphiwBa
	rg4LPpcLAlp8Nka1S8yMn9L3yNBAhBFcjqh8kM72lfnzkEtYpjOMF3ztun4U6EE8HDJJh2rsM/k5W
	1eHeKsP2ErQ3nsOvhNiYGY9Y+vQh1IOnQ6krWUvZg24ipv94930R/kbOLU6lF/koiBxQ3qt5e3zBt
	R1SVd1DTuYhdSLlcZJSE3UK2z1EG7j9WX7WIF395FR57ItJ83chg9sEt+LRncKk2WlvAaOnyxKFFL
	EU8NpIKMBdEhWvsB/psg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiWK-004gAO-LS; Tue, 18 Oct 2022 09:04:20 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiWB-004g0B-Nz
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:04:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E8DB11C0014;
	Tue, 18 Oct 2022 09:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666083850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P6KtNeMpTG5EYxhj2LWodlcM8U9peuLBtoyu5uXj7jU=;
	b=RsdaifbddHmoxiXbEkbM1J3/PJZ2OWY3AxSze2GoctWni2jB/Qpl9cmG3HvE6rPQiOeI9M
	xVUaLcv3oSGFvzJtNhYZe44Q3qgOIq1psRoxUDiaE1INfH2bcmCAtkEi9v/UjkkvLlIF8g
	4HQx21daVSAkbF1SxyL4JTHsBIlOtmsxsJa5w2TPL/i1vm+p4S4tXHpoF6HbN1YJpDECcj
	8Ju83ZZlpngSijZh13pqw42SA6rc73MxZVNY857yxyMoppRxa8uc4dLoSJWAZ9g6d8xMbi
	1AjS8O6bmQYI38Ai7oMvAsSg4TKuUBTmmtvcCVlJFziSOKK/eOEKLGgUDYhWZg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: mikhail.kshevetskiy@iopsys.eu,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v3 1/2] mtd: spinand: winbond: fix flash identification
Date: Tue, 18 Oct 2022 11:04:08 +0200
Message-Id: <20221018090408.466267-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010105110.446674-1-mikhail.kshevetskiy@iopsys.eu>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'dbf70fc204d2fbb0d8ad8f42038a60846502efda'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_020411_978746_7AA9593C 
X-CRM114-Status: UNSURE (   7.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2022-10-10 at 10:51:09 UTC, mikhail.kshevetskiy@iopsys.eu wrote:
> From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> 
> Winbond uses 3 bytes to identify flash: vendor_id, dev_id_0, dev_id_1,
> but current driver uses only first 2 bytes of it for devices
> identification. As result Winbond W25N02KV flash (id_bytes: EF, AA, 22)
> is identified as W25N01GV (id_bytes: EF, AA, 21).
> 
> Fix this by adding missed identification bytes.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
