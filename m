Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C14C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RLfBazvwUTQnt/2Wn0P/aBaBThAmtRCNt243tTtqho=; b=whaQO4DSmpcquK
	yx4787VtGYFZtjw3SwHez1H2TcoPoLRTeGT5Cm584FIpndCi9DeAE9SN4dgjzTgT11+AM9+QOs9AT
	O2NeCnYWKpbMGwULYq5W3oLpnIqAvLYpvg7IGYRYJyPSfBo2qC/AYf10qjXC02WdNHRIvoA/Tpvhj
	F9HORGvC2hKwVEGxUnuf3vLy/dlw5x4gMbODVCCFz6W2b0k+RBVftBNRfaJgdwFNlAjoWXWTERDLT
	/3zH1zqiRUPliIUc1YfV37beassSRoE8ZyPtr5kpe6yV5zzCb6Tw7gsDVx+uWRBz2zlqOOLS3oFVh
	JMNg8bRQMwtfAr3a6tIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiX6-004goz-90; Tue, 18 Oct 2022 09:05:08 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiWW-004gJk-DK
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:04:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0DA6660004;
	Tue, 18 Oct 2022 09:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666083868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RL6Pm1PtqnVst262VMQ9ziU0/oxy9Za+p2F3nlrAD18=;
	b=STdvyZIjCcaUjwvKJjxQS/ON3ZGJa05Wco8/7zUFV8AbdhWUDDLBh3VZJCOeNrVSTnHPF7
	iTiQrLlEsNN62pcD2oiRd9HPZXN9k/B6LfSRRFJ3Ov102WDXSAlF2agjan0Q7ZLLZhWsns
	paM6bxGLTKtLP7Rah7Edt0KEfsytxyv+9MmdyNIRIXB+DOy0IEMJ8rMuZWudNWdsZ9gM1Z
	dyTTedX2AJW5ZaVVoCyQJobKCsIXUTPMz5In/taKHI1S/gcJfUlnsvYiAVbx4/lECRRTc2
	X2+34cB5bMoI+ibMWGkwi3QjJQRPu7ScJbjwm2KPpRQ0suRfOgQTZCOwPZr6PA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: rectify entry for MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
Date: Tue, 18 Oct 2022 11:04:26 +0200
Message-Id: <20221018090426.466380-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929123431.23180-1-lukas.bulwahn@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd4353decd4fdec71b9f9d1ba8fa85b7e595e8924'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_020432_639671_7F5C06A0 
X-CRM114-Status: UNSURE (   6.54  )
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

On Thu, 2022-09-29 at 12:34:31 UTC, Lukas Bulwahn wrote:
> Commit fbc00b5e746f ("dt-bindings: nand: meson: convert txt to yaml")
> converts amlogic,meson-nand.txt to yaml, but misses to adjust its reference
> in MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
> 
> Repair this file reference in MESON NAND CONTROLLER DRIVER FOR AMLOGIC
> SOCS.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
