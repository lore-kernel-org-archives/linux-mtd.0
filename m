Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C58C678D4
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EyCLeWPjmNkeOZVbykvMzrozRHUjoEkuklRJ0Ufs1Zs=; b=rukgSTaX5qpMc1
	MqqYZXnkkW/hTEhWUDJMexKEPlMakKfJv7tdWlnl+ejLoZmUhBXGxJi3KvZ2Yd6Ue7XCuU9iAkHVj
	aUWzVrQcsOql2TWuxk4omIH/sBWEBYZ4FagZtWb0h1hnDOLDCfeNZ+mNGl0yy+pokSmDiW9B6mtxE
	BXmpo2slXhZzDgbqcBGvH8Oko/Cq6QIhGdev1vt2e+dFFRByRqoTOR7gUjeSxmh3rb6hpmHBCQyhl
	yXw4V1aa6TAOWTllWEwEHiIWjQbsho0Ms5TGgedvxzWpAl9Ff7SLBVyDImXxBIW2G86KkTsLE1fLa
	lHt8nonS7TbUzkAnxqGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcvl-002EbE-39; Tue, 07 Mar 2023 19:25:01 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcvi-002EYL-Ay
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 19:25:00 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 947F4C0007;
	Tue,  7 Mar 2023 19:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678217094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eMi0mbcjRztU100Tey2B8cyzSfC0ZC93pEwyJgBeTio=;
	b=SPDlwe0p76ZXh73NXOVpUjy8tCXJAlYzijf2yHzzbNTieX6RcEUcB9/vXsWO8UVlOYZxR/
	ruFeEr/lQNBk9GpfXJURWukB9fFbdz16m1DNCcx+wm8XaP8qf0w/lZSvEC43D4hEQfC5x2
	VZuecOv8od3vXKjKc5zzY0Nv3kBJbDuUSsU+VrSB+JbjFPG8LHuX/smsA86xkkeXC371gQ
	I4ujLsR5JkKBRimt6xezk5H4GCFKylRXafdXEGAiHuE5V4K0Lz4/a7XUXwxhf3ltuuPC2v
	oACf0fVYuWu230caP9wrIIb9wibyfys2TvgaCf/AuRVTxBpwjBd1dKOJdPPd/g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mani@kernel.org
Cc: quic_sjaganat@quicinc.com,
	quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH 1/5] mtd: nand: raw: qcom_nandc: Use devm_platform_get_and_ioremap_resource()
Date: Tue,  7 Mar 2023 20:24:51 +0100
Message-Id: <20230307192451.432989-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306144141.15360-1-quic_mdalam@quicinc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bcf09d7e2ff435a5d587760170728c11773a4362'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_112458_560285_780E99BA 
X-CRM114-Status: UNSURE (   5.76  )
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

On Mon, 2023-03-06 at 14:41:41 UTC, Md Sadre Alam wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
