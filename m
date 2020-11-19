Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A307C56201
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 20:47:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1AF722261
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 20:47:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uLiy/N6N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1AF722261
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6J1Jm+QKiRYiGai4gkPglXapx6TIjcDMpWQCJSH3NWo=; b=uLiy/N6N/fG7uME5lVs2R2IGLI
	K8N57fGpnz+sdIC6lp6QTKRJnhq5zeLxA6Zr1V1WQvCEyaHcd2UJL4xQuk9KiXY+iGYj489JOQtHL
	X4o8wsuD9Q0oAaAlALfnqiWVIr90XHwLAdQ9Mpf/KtMyWYov//ZddkjG1La4VNrQNXJUYeceTYPjA
	vA4YWwTm2/0KpJcEqWlxnpd7IwBCh9xs5d2jubc2dt/3D3m4+/T7r2u0WujDlSjea+LGvtpFJDxFB
	NfG/Jp3cFPTyIq8S26tJk2JKmJYhiAup+/qVwO3khcofmXhhbV0EW7Kz7UozOxyBj8RBFqAi6NZr5
	5F3OP2pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfqpq-0004KI-R7; Thu, 19 Nov 2020 20:47:18 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfqpn-0004JN-SS
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 20:47:16 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3B466200004;
 Thu, 19 Nov 2020 20:47:11 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 14/19] mtd: rawnand: tmio: Move the ECC initialization to
 ->attach_chip()
Date: Thu, 19 Nov 2020 21:47:10 +0100
Message-Id: <20201119204710.10411-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-15-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 1018a27a3e92ee86c3ca3e76725960532cdf6713
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_154716_097164_80CAC745 
X-CRM114-Status: GOOD (  10.44  )
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

On Fri, 2020-11-13 at 12:34:19 UTC, Miquel Raynal wrote:
> The probe function is only supposed to initialize the controller
> hardware but not the ECC engine. Indeed, we don't know anything about
> the NAND chip(s) at this stage. Let's move the logic initializing the
> ECC engine, even pretty simple, to the ->attach_chip() hook which gets
> called during nand_scan() routine, after the NAND chip discovery. As
> the previously mentioned logic is supposed to parse the DT for us, it
> is likely that the chip->ecc.* entries be overwritten. So let's avoid
> this by moving these lines to ->attach_chip().
> 
> Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
