Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DBFC2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 10:01:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F6FF613B5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 10:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F6FF613B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GKvuwDMtnrMFOEj24xJV85inA4g2TiZ6R8IZHM7HX4=; b=TR3d9TXwdVVcS1
	PttOZNuHcW5pJrYsHwymWil3IdjxPuu0G28gZTtOQNIlKlklbqBEkacd9Xkq8IiTtW8hu4EkBiQDQ
	DjMu+UKMQNlAJBNfW3jxNKZL4ABkSw3UIMnLL9P9lIClROhbadNvcBIBgXNQ8kPFHBNYsQFac7mcn
	l3TniadT3xF9LO1F7hDvJNTtjOUi/3aqiK2eDdwI1j2zpJo91Q+Ia2XIYl3uQtISfupuaX0T64MDx
	8pV5cZqEtebAnxoTimlkDNwuDc3D6HP7CsWRpny8w77nGT4d92x4KxNB5xJy66DTljlfOLXWky2u4
	EQ0a8DmxgCuGtjHTZQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llqKv-00D3XI-0S; Wed, 26 May 2021 10:00:25 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpSU-00CiND-JR
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:04:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D8515FF80C;
 Wed, 26 May 2021 09:04:07 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>
Subject: Re: [PATCH 18/22] mtd: rawnand: Choose the best timings,
 NV-DDR included
Date: Wed, 26 May 2021 11:04:07 +0200
Message-Id: <20210526090407.181615-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-19-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a9ecc8c814e9600836e00cb592f1cb5378393126'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_020410_812786_FD632306 
X-CRM114-Status: GOOD (  16.63  )
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

On Wed, 2021-05-05 at 21:37:46 UTC, Miquel Raynal wrote:
> Now that the necessary peaces to support the NV-DDR interface type have
> been contributed, let's add the relevant logic to make use of it. In
> particular, the core does not choose the best SDR timings anymore but
> calls a more generic helper instead.
> 
> This helper checks if NV-DDR is supported by trying to find the best
> NV-DDR supported mode through a logic very close to what is being done
> for SDR timings. If no NV-DDR mode in common between the NAND controller
> and the NAND chip is found, the core will fallback to SDR.
> 
> Side note: theoretically, the data clock speed in NV-DDR mode 0 is
> slower than in SDR mode 5. In the situation where we would get a working
> NV-DDR mode 0, we could also try if SDR mode 5 is supported and
> eventually fallback to it in order to get the fastest possible
> throughput. However, in the field, it looks like most of the devices
> supporting NV-DDR avoid implementing the fastest SDR modes (like 4 and 5
> EDO modes, which are a bit more complicated to handle than the other SDR
> modes). So, we will stick to the simplest logic: try NV-DDR otherwise
> fallback to SDR. If someone else experiences strong differences because
> of that we may still implement the logic defined above.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
