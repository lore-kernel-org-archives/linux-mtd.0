Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D02C7EE29
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urMcI2pkQWUN5WK26yK7VJpQtEfQoLGKJ04gQ7qTMrA=; b=g9xxR2laki2t+l
	PUtTui2JEEgn9Av12yYXL9ShmkojOA9FeeTSCBs4CBxQdaLf4vO0k62Objtx+Yk82PnDrd+SeT3V/
	ZOQfy1GdRYoJwbQC6grLs6TNZXJdf/dnvO87M2Lla37vUXHXpqcYFLY1RGESi2rFPLtZrHbV0jmxb
	bus+cllxUSILQ+eHo3KhzOvl3k1plsZwb95R9RqFUqPTM0Q5n+IFiCWVwp4Kx/IR1C0/5N4nky9EV
	o04fVzNU30c5ovYj4vSxv1w5Uyb0CMiJb58fRWGYruacpnQBxC4Z1cfF1wWYUs4QTQY2hwlqmCcCt
	59RXa9GibAyEHWu81qVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7e1n-00DRJq-2E;
	Fri, 09 Jun 2023 15:27:51 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7e1k-00DRGh-2W
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jun 2023 15:27:50 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686324464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RLJuEcyw4DgyqwASkH52u/EUraJSggR1OrQdkimUDOg=;
	b=LAz6mudqO14uTnjG+FDjrAXWuWNtJIMOx7hRdINmvd6CxN7zKfOKbTW8heTpLXhy2EWMk2
	HM88NkZYYCVCVUcyfFddX2xR3lKfEs1sq/bYSSb1uVCy/BaQ0ddBjjqLr2pF4UmBM0Lyr6
	9Hp1lGBAdbsbLZoOCD4RmZvTFU8vne+J1hIcYagpCDFFr/YtzqZnG5X5Tf/Q8xZMRcoCfp
	P7cWVEugRc4iiH5vV+SurLoZSa4BkVd7TGWIp1d7IPnQ/A9cAZee3/Cshx7Jt7iX5UYC0V
	YclQcKrjL/I1I+5ErYvx9EI/SRUKt+P71FPfr+GuFmqATxIudDGpCiI2uPT7Vw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1A821C0008;
	Fri,  9 Jun 2023 15:27:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] mtd: chips: Use SPDX license headers
Date: Fri,  9 Jun 2023 17:27:42 +0200
Message-Id: <20230609152742.1188541-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603185200.3571174-1-linus.walleij@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'87194abaa5ced8c1cee5499d9da058eadfa63f44'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_082748_950547_40796C3E 
X-CRM114-Status: GOOD (  11.94  )
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

On Sat, 2023-06-03 at 18:52:00 UTC, Linus Walleij wrote:
> Some of the files in mtd/chips do not have a SPDX license
> header, presumably because the text string "GPL'd" didn't
> parse with Thomas rulesets for magic license tagging.
> 
> Fix this, the code is initially from RedHat which clearly
> targeted the Linux kernel and intended it to be GPLv2.
> 
> In any case the original author appears to be David
> Woodhouse who can then confirm this.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
