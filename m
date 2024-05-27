Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99693C25B74
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 12:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tG3b7cBeIpyWObImNAGkYTj8lqu49gIVOwu4GgXiOkk=; b=l6kiVVTnCQIL2o
	CwHPVGF+gRJexZQs2GdcpQU8pueqWMKDYl0NDOFXDoIE9a2IALOlIcAjjAVI2wz7Ws9Hc54QVf3OQ
	4EMxai3w91wQ9cz1cqumWomUmM0r7nI8oUTTf/pB14+49ZVCuuoAldFusUL//P9hoTnKwVRjaciQa
	yW2AUUmZcKfeujfxjaNsukE+9JxYcJs7d5LokJ9n2kaK/P+W5twHmD82TqIR1fNszk95HscEPXWvU
	vjMMVRxnVp4IX/RzRWgnZJVItFiWqZ7rqGj9nJqJLxt8v0ToDjIcUWk5GAV6VBc806DperkOiR/Rf
	6AdBlKt7s6arvY6nsGnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJv-0000000EqJ0-2UJs;
	Mon, 27 May 2024 12:19:19 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJS-0000000Epya-0mBi
	for linux-mtd@lists.infradead.org;
	Mon, 27 May 2024 12:18:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6786660005;
	Mon, 27 May 2024 12:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ljXnv7jIfAdkaMgii6nM8Jjri0Nf4oqo8tMGW+JTGks=;
	b=jIRoTlyiSA07+Vzq380JmPd+BHDvOla9auFJBFUstlmkOrMZOTsWI6MK6qotkJO2Zi4DCW
	YXwophTwacmZVPgdYgIbO1/pY1nma7C1d0PArSNDr347jKFJII16HlyvtnOmJJIzhqtIVq
	rsqbdJ/KRQY4XvcWq4xzzycN6uq7GsEin+gmPj9YDEEtHnm0HkH30Abya7dRcOweaPd8vk
	b+VSvJDvw84t8GXyQ3SxjTQn5M8HPqZop1hm5IiaY7zXAreg2m787UlfSpvXAPmjFc5+qz
	qa37sHX28v7Kz3qUqIBVY0K7yAWLw17NoZ4pdydkpDkyL4uUCnQjY+zuF9WnGg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] mtd: nand: mxc_nand: support software ECC
Date: Mon, 27 May 2024 14:18:48 +0200
Message-Id: <20240527121848.178542-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240522-mtd-nand-mxc-nand-exec-op-v4-3-75b611e0ac44@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2ba9d29c44cc046b46c275d654fa946a0781a540'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051850_463241_37F3C9B3 
X-CRM114-Status: GOOD (  13.82  )
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

On Wed, 2024-05-22 at 05:39:53 UTC, Sascha Hauer wrote:
> With these changes the driver can be used with software BCH ECC which
> is useful for NAND chips that require a stronger ECC than the i.MX
> hardware supports.
> 
> The controller normally interleaves user data with OOB data when
> accessing the NAND chip. With Software BCH ECC we write the data
> to the NAND in a way that the raw data on the NAND chip matches the
> way the NAND layer sees it. This way commands like NAND_CMD_RNDOUT
> work as expected.
> 
> This was tested on i.MX27 but should work on the other SoCs supported
> by this driver as well.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
