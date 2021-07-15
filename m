Return-Path: <SRS0=WX7q=MH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D77C636C9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 23:09:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D75D6610C7
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 23:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D75D6610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=widgfJrsERgFaBCFr2gcXpe1gQ3WlR/PhZna+PfUmBo=; b=RYSSKCFqVkYISR
	JOajJQ0XR89aA54CUzMkT3VlcU+2apnwBzEdSZ8Gj/AytjrsCU+Xki6b+aVS5o4h5e3JgEYYiuQ5u
	y2dVWiEW6bWbJZSlleWCwe7u3YJg/BRhOH/DloBYutyXttd3hSjLciowEKXZmBG9leT9WWwRCO+2x
	TURRHAEXp3zqP26kbupBzDN/z0QHFXepxTM+UwEo34/jUDdp05ZXGM2b8+v7S54PuZethYfKchP7c
	28uH+LsxnNa/dkpSmsDWdmGQvHknrICATESFaXmU/vhgqejqv5a7giLj5taXQJ2/XyKy15d1G9SPV
	79xZeeC5v89IsEZ+U9Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4ATr-002cvG-Hp; Thu, 15 Jul 2021 23:09:23 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4ATF-002cmd-UY
 for linux-mtd@lists.infradead.org; Thu, 15 Jul 2021 23:08:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 99606100005;
 Thu, 15 Jul 2021 23:08:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 "Ryan J . Barnett" <ryan.barnett@collins.com>
Subject: Re: [PATCH] dt-bindings: mtd: gpmc: Fix the ECC bytes vs. OOB bytes
 equation
Date: Fri, 16 Jul 2021 01:08:41 +0200
Message-Id: <20210715230841.222881-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610143945.3504781-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'778cb8e39f6ec252be50fc3850d66f3dcbd5dd5a'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_160846_171071_91AA6170 
X-CRM114-Status: UNSURE (   8.34  )
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

On Thu, 2021-06-10 at 14:39:45 UTC, Miquel Raynal wrote:
> "PAGESIZE / 512" is the number of ECC chunks.
> "ECC_BYTES" is the number of bytes needed to store a single ECC code.
> "2" is the space reserved by the bad block marker.
> 
> "2 + (PAGESIZE / 512) * ECC_BYTES" should of course be lower or equal
> than the total number of OOB bytes, otherwise it won't fit.
> 
> Fix the equation by substituting s/>=/<=/.
> 
> Suggested-by: Ryan J. Barnett <ryan.barnett@collins.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
