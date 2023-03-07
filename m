Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA51C678D5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 19:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNhIRxcrGclzy+SQ4riZotRKhj6m9kALs/DkUe108lM=; b=R8PNbJG2Mx92UB
	CzKSnTdQVGs1FljQCgIudJ+rzFEqL5by/ga8jiJK/vJjGzI9VHRykZvPDnwxFImf0R9Q91Lvdq4Un
	GsXzbj9GUIOkQArd1/r1gVeyk/qgThx9qEDa1ZqTxlZhMVxg0mlYBpnxXhBuaKfymd3MmYln1jDIU
	Q/b8U3ocV/Cm4KWBC8JX1uV1wsiMmyT/EcVzFn4b0Rt0LLVgZdRMxDXorH2MwPdfSpGVelaBnBERx
	/HEVsefLt5G4w5YHYZk10+IcDklzJfwLPNoBDkTgGr6pfTaZeJEbvSuD1dOU7o5s6aWBut/fnYvRV
	t5+Fd6erLezzPCBHpw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcuV-002DwH-MG; Tue, 07 Mar 2023 19:23:43 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcuO-002DlO-6T
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 19:23:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2B305240009;
	Tue,  7 Mar 2023 19:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678217007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3ZPM5aLplYh/kEODDg7vzDSr4zlPL9PxCOr+/6vGAo=;
	b=QQ2FI11L7CqHLN2au9ZPmyogKIh0kIYrWF7v0RS25Mtb224Acm+ZthS5D+no78nlLqOOLv
	R3MBGKa1Qb3cthAenTB6NE6D1hBCrvNBvuZYdMvuel/D/TO0xlCiuaoX8fb9mYfJEXSNgb
	yvlGRs0IC5P8OpjGJFhiI5Js7cyvnfCPaJscCHUX5dRP9KxyhUNGpjDU3jzaTrP80JJWzT
	1r7bMTCVtb5A2L+pC68kOS4aO85HoRxPUK7IlbPJDWM0D1pQwj3aKY5pFzvd76t/LNrzN5
	iYzayoHXp+raKSQ8LnYMbkzXCJQV6DDRZOI3+J9eItEdgB0d8OPhXkIPfgRlfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/4] mtd: core: provide unique name for nvmem device, take two
Date: Tue,  7 Mar 2023 20:23:25 +0100
Message-Id: <20230307192325.353662-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306125805.678668-1-michael@walle.cc>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7edfc9143c90f627aa9697d7a82d83e749a82237'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_112336_425670_14E3CD8B 
X-CRM114-Status: GOOD (  11.34  )
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

On Mon, 2023-03-06 at 12:58:02 UTC, Michael Walle wrote:
> Commit c048b60d39e1 ("mtd: core: provide unique name for nvmem device")
> tries to give the nvmem device a unique name, but fails badly if the mtd
> device doesn't have a "struct device" associated with it, i.e. if
> CONFIG_MTD_PARTITIONED_MASTER is not set. This will result in the name
> "(null)-user-otp", which is not unique. It seems the best we can do is
> to use the compatible name together with a unique identifier added by
> the nvmem subsystem by using NVMEM_DEVID_AUTO.
> 
> Fixes: c048b60d39e1 ("mtd: core: provide unique name for nvmem device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
