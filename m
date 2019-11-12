Return-Path: <SRS0=8T9L=ZE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1898C17441
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2019 14:19:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E7A021D7F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2019 14:19:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gNW+A1Xt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E7A021D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cR09dKktgz54Z63Oyz8MWnjOwyFtpv0y3ZX1/fzsxas=; b=gNW+A1Xt23Gdf6
	mGIit3w7kZxgIqOK+88zqW8EkK9rR41XCLm6uS+VGdxTRJ3K5mvK7BQt8qPdxU9nhLlqedb25uz0+
	0uqOCjcdd5qBxyl/Td1ZTHb9WiSy2H2iaXrH8MlkYJ0VDQCDuUuuxOPO+p/Ek/AAaSf2ZnBozLGL2
	ieurdNeLb5erxokUMR7OsfBoAapavzF1g889RW5hfYodHqp/EZlW8GgAnl44T9V6bQLoHYnwBaFGz
	DUWvFVTCAsIfA6umdn/oQTauefdedGuCUcH0t4VCJOIq6iZsINUIJCGT9+ZctxiC2cPb3K2vF+HeG
	loCoYY1M3dLwKQ3H0G1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUX12-0004QU-Cx; Tue, 12 Nov 2019 14:19:32 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUX0z-0004Oh-Tr
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2019 14:19:31 +0000
X-Originating-IP: 86.206.246.123
Received: from localhost.localdomain
 (lfbn-tou-1-421-123.w86-206.abo.wanadoo.fr [86.206.246.123])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E62A424000F;
 Tue, 12 Nov 2019 14:19:15 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Angelo Dureghello <angelo.dureghello@timesys.com>, vigneshr@ti.com,
 richard@nod.at, miquel.raynal@bootlin.com
Subject: Re: [PATCH] mtd: devices: fix mchp23k256 read and write
Date: Tue, 12 Nov 2019 15:19:13 +0100
Message-Id: <20191112141913.21413-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030113957.1625342-1-angelo.dureghello@timesys.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: f3ede16510057e8fc178483e14b9c1aac6622cda
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_061930_094462_0D7C8901 
X-CRM114-Status: UNSURE (   6.91  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2019-10-30 at 11:39:57 UTC, Angelo Dureghello wrote:
> Due to the use of sizeof(), command size set for the spi transfer
> was wrong. Driver was sending and receiving always 1 byte less
> and especially on write, it was hanging.
> 
> echo -n -e "\\x1\\x2\\x3\\x4" > /dev/mtd1
> 
> And read part too now works as expected.
> 
> hexdump -C -n16 /dev/mtd1
> 00000000  01 02 03 04 ab f3 ad c2  ab e3 f4 36 dd 38 04 15
> 00000010
> 
> Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
