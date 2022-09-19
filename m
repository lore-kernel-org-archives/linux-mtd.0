Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD4DC54EE9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 16:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ib6CzQhqh4SHt0PMXJmxx4TSj6D/Kqrp3TyFGryi+2o=; b=0r0620Vz3FgCzk
	mg+KHhqZSGSOp9LTkMrB1VWdvZG5DshmO1HdQrK/1mpReKw3SBU9px0T8M7gxltfpqFsbJWZ3Zvm+
	eCBWdMD0GGaVkDQc3IaHaHfZlsGMR8CK9JVudbQlAnrI27lZcVz7eZ7Kpy1v7c3j9Gtg2AX8wasAA
	Joy8U/613QgL3lcW+RWwcfpb1WDyjMyPxGT9/xgnHu6XB2sPvn+Z3sAkMHvi8RHrc9YurJPeXHR69
	1eQTkjl+M9J30Af4iUNrEr63Rlybm9HNWGQ4soNL3D8V379tYnXV5RCn8R+bUQOtMhw30/IBKwAVq
	e6LTUXiRaaVlpifDBd2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJRD-00Cnup-To; Mon, 19 Sep 2022 16:16:04 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJR8-00Cnrf-OQ
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2022 16:16:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 45FA924000B;
	Mon, 19 Sep 2022 16:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663604154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N53lFuTivYC5vBnMbOqNikz5xNoHZbhEvLvTfGv0G/w=;
	b=S9POnKx+YNyZpCByZ5G/S08K5baSM3a17yJEk/rkmg5LJqGCOWUE8kb5ZZDDSil9mA+Oj6
	YBU5SklxuvTR0KLDp274SvrYLV0n5FKPfdUPC/gvptwqlKBz5mdYaLgn9LGch77xaA7OIA
	8SroGnVhtyPYLgI1YDW3ddVb7Ovk4X/JkjkYEz6nVTZ8gm9/c+lxDhdNaAQRnl+nuCLHk4
	8VfSujnctuZiVMKKfvdJ+r7OtVMR+sQS0VMS8s9ffQ10QjE907p7+V5XWh/n8YBE12cxif
	R4ABVY5Z6A+HDXWnKRXtDQ1cQDUpDIc2ptlgJ39onBzkmK2FWiqOhArDpGFdjA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: Fix a typo in a comment
Date: Mon, 19 Sep 2022 18:15:52 +0200
Message-Id: <20220919161552.226510-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <de1b1134f056ea7563bb0a9bb2f66ede1475728d.1659816434.git.christophe.jaillet@wanadoo.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8d704c4e1ead92b6185d6aedeb08ac6a85c4a42a'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_091559_729473_5FB41C30 
X-CRM114-Status: UNSURE (   6.63  )
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

On Sat, 2022-08-06 at 20:07:22 UTC, Christophe JAILLET wrote:
> o and t are swapped.
> s/mtdpsotre/mtdpstore/
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
