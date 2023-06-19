Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB9CEB64DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ZgGYAOZ7Spc28p8ABgp4SLJTxl+4xvUjRVWvnAMcrE=; b=bXiyQAXgF0T7Wp
	0TjjTNLBywAm5hFtOOPmIlzWPMhHHASiymIspOLdgmR7g18lZUwMxq4VGKwMBPcvVd/O7mczwycUR
	ljGRv1W1bFEBhUMfouhc98P3k4JvXnlRLwF7Rs8WGuaG43S010ZSEccPIrNFVnc1FZk5o6Ti/3NOL
	ojKTno8cD0bukUtG8Bx7rzNBeifn3ofy1nsd03A5iJQzLISx9ws4sYhFDqPzuw73PSIWxfb3R89bN
	voMa79v1ojabWrvyzKZeuCGDF3Fhqoh1Ftk9LPsyBYPbEpMusBuysG823qCaQO7iPyM7HcwN0ugzl
	LtlIJewJ1xwnZfyPUKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAQJ-007qv3-0g;
	Mon, 19 Jun 2023 08:39:43 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAQG-007qtl-0a
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 08:39:41 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687163975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MT6uDaSkCDJITV06UAl2h0AfMSfuqotMYDYo0551NCk=;
	b=W1jYyYog3H4BR24DLohzhRwLtxM9EFAsZK1tS2ADvcS6DP7AWOxbTOg75u1s1VdxxuTA6I
	7l1Wp7rlwGeTtrWovPVRMtjdEcCPxEVDWr7jUIkY9GGbtP1mAAG5aUL+EnnxZXPmnLOL3A
	tjj6k4++lmMPhdXKJmS9ZiU4SGiDYhwSiQk7kmaqwCqQVumj/6XNYLMCZjv4IN9eFjZAK0
	CvgFUPlp+O4fEwajlfP7QT9oYcJhLnA2CnBc1KSCtoIJ4FQ+o4RNOqPrs5B7Vadzh8gY4X
	7sp7PsBC+kCx3AznY9TLfGh85KW1K+R6WbaKdTKoJri05zL49U/bJAdcKMyjtw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A89591BF206;
	Mon, 19 Jun 2023 08:39:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	linux-mtd@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: otp: clean up on error in mtd_otp_nvmem_add()
Date: Mon, 19 Jun 2023 10:39:34 +0200
Message-Id: <20230619083934.2940387-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <fe7ef901-9571-4c6e-a40e-449046efe2c6@moroto.mountain>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cefa1aaa31bd7bb73a37c15ec66a9353753b2abc'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_013940_352812_6336B9EB 
X-CRM114-Status: UNSURE (   7.94  )
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

On Thu, 2023-06-15 at 06:09:20 UTC, Dan Carpenter wrote:
> Smatch complains that these error paths are missing cleanup:
> 
>     drivers/mtd/mtdcore.c:983 mtd_otp_nvmem_add()
>     warn: missing unwind goto?
> 
> This needs to call nvmem_unregister(mtd->otp_user_nvmem) before
> returning.
> 
> Fixes: 3b270fac8443 ("mtd: otp: Put factory OTP/NVRAM into the entropy pool")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
