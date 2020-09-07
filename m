Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF46C433E2
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:26:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB3A20757
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:26:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BIP/VLFf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB3A20757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H67Xc+wkFChmGM4GgaW2+/zuJk1DWEJKcipsSxMuaPY=; b=BIP/VLFfXX2wbx8lBCbkDRyynt
	HeIenqXq6thNa06kS7bphQMIsWabpLcn+3LPy/UZ0iIMed6x5bWSTIXH1qq43Dy35V9zqXRyTQRKY
	ayYsJvQSKzQdOfScSISNu5gWSUX7iI1Uo6v4OZgdWXVPzxNgL6JA3MRQ0Swf1ux62QFlxjSUAfdhW
	LETtn/W9GGB1oOwtwEbGnB2JIy8p/EtvNu+WhsKrXRMccYjpwXN7AAew+jzyXhHZa603HrQTB8myf
	Ph1sjXCi1/BGumB7OhK+qFNozV5uPH1sbhpH8jB9UaT0I8IfTacp81KOvLI3rcZQe8/FV141/8/+h
	WdyQcYTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBWO-0003zB-Tw; Mon, 07 Sep 2020 07:25:00 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBVU-0003Pn-0s
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2020 07:24:05 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 33B8F240012;
 Mon,  7 Sep 2020 07:24:02 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v13 13/20] mtd: nand: Create helpers to set/extract the
 ECC requirements
Date: Mon,  7 Sep 2020 09:24:01 +0200
Message-Id: <20200907072401.4753-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200827085208.16276-14-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 657132e90e75695bc2714ebb89d7f25bd498cea5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_032404_163995_E4E3AB66 
X-CRM114-Status: UNSURE (   9.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-08-27 at 08:52:01 UTC, Miquel Raynal wrote:
> Despite its current name, the eccreq field actually encodes both the
> NAND requirements and the final ECC configuration. That works fine when
> using on-die ECC since those 2 concepts match perfectly, but it starts
> being a problem as soon as we use on-host ECC engines, where we're not
> guaranteed to have a perfect match.
> 
> Let's hide the ECC requirements access behind helpers so we can later
> split those 2 concepts. As the structures have not been clarified yet,
> these helpers access the same internal variable as
> nanddev_get_ecc_conf() for now.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
