Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32911CE7B1E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fNaSAeF1vFNrJQv1XDWAV+I0sq+U4MCO7jscnR+AAHw=; b=ICNx3fxRw1rnYz
	fCkfCMokmnM6UW3Xlx9k1FP8OHKpopYq59G9x4GVOlMaPINhsa+ityX53jRoeZSoDckqxP3k5/R/2
	+w/+J72935Y3rBqQtf4XFzfIRBAW3jzVN6/HIsxywjuNB8QXQCx8168kGQTy3VFnYbnApBRx5+Tjc
	vE/e0aVk2P5TLYgVyFAIvd+6Jo2jVId9XxqqhO/vNn3DxVUapADIhFR8uKug2nswy3dorysfmOEcz
	k+ALyZLgjMPSn6T2NG0+NEik3AgppnkQa+80U0HS25tbVFK31Tw96v6ARkwXBhFkQXT2CGYuuspB2
	SxSidh8C2ZXMd2dId2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaYC-0000000CgHY-17gf;
	Fri, 06 Sep 2024 15:07:04 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaUS-0000000CeoP-1HTi
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:03:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70C2FC0009;
	Fri,  6 Sep 2024 15:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725634991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gxvLF0eE6mbjYMgwC38QABo642i8hbGbBdGkJx8GLIQ=;
	b=SIw+jhRxhJ8DtaZJ28fTfK+HtPYuE2oVw5evfUaTEGSkRGXZOmOm0q34j5mgu9eEHeskcg
	dVhASSDU8IUyEkry8hJyJeFlW/Ia/uCs1T3r7mRNaALiMVXkB09Ys21X7vtbxpaOGBn2oN
	hq2UiRHJfdV3FAefwPLD+mk5Xj61BSwCSXPSyzYsxMhuVMwIrOf7HmWjr59lbyJZTTvbJ2
	3l5yn0qSrv3+PLQmmVCWrQN/0v/TsTpVkUmN3A6zENxZJJAW+QIb5LOPPFW4cn5dKmyf1O
	yJHX65O1kLxppa2ADnR8DO4Cxb8ZwU4u3xo0vR3GnDYy7PxJXkotFqSLDwqPtQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 3/9] mtd: spi-nand: Isolate the MTD read logic in a helper
Date: Fri,  6 Sep 2024 17:03:09 +0200
Message-ID: <20240906150310.734415-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826101412.20644-4-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'79da17072e22a802a321ca44c9082ee2e855e72b'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080312_495305_641BFDD1 
X-CRM114-Status: UNSURE (   8.52  )
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

On Mon, 2024-08-26 at 10:14:06 UTC, Miquel Raynal wrote:
> There is currently only a single path for performing page reads as
> requested by the MTD layer. Soon there will be two:
> - a "regular" page read
> - a continuous page read
> 
> Let's extract the page read logic in a dedicated helper, so the
> introduction of continuous page reads will be as easy as checking whether
> continuous reads shall/can be used and calling one helper or the other.
> 
> There is not behavioral change intended.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
