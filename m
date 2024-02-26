Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB114C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCAIEfFEOU/Cvw6L2nfJDQ3oBJndeUWO+8SkIk2/3Q4=; b=JPm+37fQ9lNk45
	IHqhpugqcsFkP3oKSSIwLBX1RBGwXAqL49hXa070z43lR2trsPZtdGLxkWsB9oeFTXBZKDuYewRpz
	O18Cg/UJre+2r5UdptBhj4nTCNZzCzGaGHde4nB0rv7eudk8jx9FyX3FEthGLmVN0kmdONxtGNCD8
	zYeVeEUtCR0PkGBwVPwudSSR9xjvAEDoxf4YW3Hu/yyukgQeLrf4PQHiNxQVH4Jf2+/mDWiQ2kPZy
	WICDcsj/fVXDre7nyxDccb33ybidlVn7vc9p2yGYvbTHTYWRdH7+eyEWLxYtHBvP8yBh2/eHfw8Pv
	DJHX7g9pG3o0jLZHsFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaNx-00000000ffG-1iM6;
	Mon, 26 Feb 2024 12:47:09 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTN-000000009Be-0tP1;
	Mon, 26 Feb 2024 10:44:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 862F960007;
	Mon, 26 Feb 2024 10:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wEfzB1nd/zVZF23uR/LjdFqixm6QUNJQL8/Lb4lp4ck=;
	b=E+YASnOU/WN00JkzEqMHSEXuDgjlzyoiCaRS8ZT2/ci7zz8S4tozzBFXoBggpq83qAL981
	JdtOIN/PuGWnWjGuDkQldGosWdKUOD196RDIzx+8W2FTseo6bA6C0OeVH7y7qgS6Szk3R/
	dXKEnp9Ph/yRC6+H9UvdnV5Y5TnkA+LgFVDD1n14PqZ1yEuQM8jf/3H+5KbjN8GAzuvO9k
	WSWL55ICAE/D0DelERo/y62bptEUx5CQrcSsf8C0tbByPYhSAJNE3Gz/72YBLlfyvUZ+MH
	IiutkJMlQsriXYiV7uQkQme4IgQ9JJq2b4GIfKAMUP15IVj1jLLlQZXtR3FrIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	David Regan <dregan@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v6 02/13] mtd: rawnand: brcmnand: fix style issues
Date: Mon, 26 Feb 2024 11:44:34 +0100
Message-Id: <20240226104434.489790-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223034758.13753-3-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8e6070e5a39cb2202d66b78134f8b7681cdf3cd8'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024437_548496_AE1EDE24 
X-CRM114-Status: UNSURE (   4.57  )
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

On Fri, 2024-02-23 at 03:47:47 UTC, William Zhang wrote:
> Fix various style issues.
> 
> Signed-off-by: David Regan <dregan@broadcom.com>
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
