Return-Path: <SRS0=RTUQ=EB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB58C4363A
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2020 17:47:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D452C206FB
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2020 17:47:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D7O9mcHF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D452C206FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xu7rR40WpkYDgXxpP2cu+ZC6l8gE4axX9e+Hj+CYCc8=; b=D7O9mcHFYHRntrUokI42Yi/Pu
	mk+MX7sFWPpmCGtrIqfGLZtD7aKWOeycG6hG2vM+DkPxDOI3dVJYnffwNuTlBGbzRdczIN/WC6ZkI
	YUqit3XxXu1QpX7WSKZTncffY6kasx4jFtyW+oyOnuhMjMdzR7vKyCLgSefWUDr6wrQ5P38HrCsUK
	5Ho1h2VAjX2xLp145j/2b4qJiJrZhmhp7mkd+wMdT8JOZmtkRzbOO8u0lothwdR/g0ZxCq8prZKGq
	/2zVdJeQvYYU+Sz9m96LntwcVuIPEGRGoMdRlmfZZDD/zHxGQmHFAoqz5sfXdTYuP67o67azPLNkR
	aCLdrDEGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX6Ym-0005lg-H4; Mon, 26 Oct 2020 17:45:32 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX6Yk-0005ki-Ah
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2020 17:45:31 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 55FB9200005;
 Mon, 26 Oct 2020 17:45:26 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>,
	miquel.raynal@bootlin.com
Subject: Re: [PATCH v2] mtd: rawnand: ifc: Move the ECC engine initialization
 to the right place
Date: Mon, 26 Oct 2020 18:45:25 +0100
Message-Id: <20201026174525.6027-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201016132626.30112-1-festevam@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 3aee8a3a88fa533b74fb75640ca23001358e5476
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_134530_496180_875E5864 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: vigneshr@ti.com, richard@nod.at, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, han.xu@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-16 at 13:26:26 UTC, Fabio Estevam wrote:
> No ECC initialization should happen during the host controller probe.
> 
> In fact, we need the probe function to call nand_scan() in order to:
> - identify the device, its capabilities and constraints (nand_scan_ident())
> - configure the ECC engine accordingly (->attach_chip())
> - scan its content and prepare the core (nand_scan_tail())
> 
> Moving these lines to fsl_ifc_attach_chip() fixes a regression caused by
> a previous commit supposed to clarify these steps.
> 
> Based on a fix done for the mxc_nand driver by Miquel Raynal.
> 
> Reported-by: Han Xu <xhnjupt@gmail.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Tested-by: Han Xu <xhnjupt@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
