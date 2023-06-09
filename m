Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370DBC7EE29
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESOlylQ2PiRO0x+cGLco0CmFLK7xgEB9LIzC94HlEFU=; b=ehlzB+fLK/lvhW
	1TIGK3wH5b9aOnYdrxcWQH18WoBOnYMJosrRx49uE/KMv6gmPEPUsMjG6bUxopOUIS+A8WQUBQ7gs
	9vzb8Zc3Vv1B25Q5BJpsrokp4iGkmcAjhS6L6oo+svTSV7muTSEjnIaON5sw7OdIXQAEpWgoKOE8Z
	t5DttxutZXYKpRs3Enf6iokUVV66/4xVhaiknTzwFSSKghMn+fIifjhkZOv3GedRbfCqT2fsr/b1i
	C0jR0lFFjzpNrpg7RlpISikuF7GfUqBYDAdcY+/TPh5w6hKnxVd79aLqdhgSomgLUhpJkLJyRYpfd
	hXfuW8/PACk1ixopAa7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7e1b-00DRFF-08;
	Fri, 09 Jun 2023 15:27:39 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7e1X-00DRDw-17
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jun 2023 15:27:36 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686324453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PpbkyFnRZ5CyCeKnPpu5rcRdfslLkQA74elnioRyJRA=;
	b=BGBtx/SPAD+I1X9TT5c6KbNHy0/jovH0a5ROCF9dp437oHd7nizle8lr2stTr3I7xbxSRO
	EiWsJh4VDuvrgVSpRUXyXDPvGKkYPmeDHK/Rt9F5en4acuANI6SVyi1SFb783mvLMS4e6n
	FrZA3r9y9hss1B9fTO5CO7W1vBAlJjHER2xDrJESTNkB+C5pcuIggt/0P+JW7aJEzjhNIu
	oU3vmis9iUVXS4v7cBk7Jk6Wp6awb+NuML/e/hbCAZggpCMxQcL6jQiBBWAMYYHjNIIyTv
	iMcmIIigmb6TDLs6iNHKHmWyluXlQ8v26MHJwE1JWQ48mgx/+ISSwR27CZnSvw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B088FF809;
	Fri,  9 Jun 2023 15:27:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Michael Walle <michael@walle.cc>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v3] mtd: otp: Put factory OTP/NVRAM into the entropy pool
Date: Fri,  9 Jun 2023 17:27:31 +0200
Message-Id: <20230609152731.1188432-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606142931.3721374-1-linus.walleij@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3b270fac84439cbd036c98e189d17f2bc3c85494'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_082735_518699_F2DA0033 
X-CRM114-Status: GOOD (  11.46  )
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

On Tue, 2023-06-06 at 14:29:31 UTC, Linus Walleij wrote:
> The factory OTP, if supported, contains factory-programmed
> information such as typically the serial number or production
> week for the chip.
> 
> As this is device-unique information, submit it into the
> system entropy pool.
> 
> This does not count as improvement of the entropy as such
> but in practice it makes it a bit more random to mix in these
> numbers.
> 
> Cc: Michael Walle <michael@walle.cc>
> Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
