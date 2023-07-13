Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5F1EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeMs2UPZJNYA/2dkPSl5ab+Uv4X83PhOW7KHk7fHwfg=; b=vhcxnjAJha32hc
	4/CmUVNJaJTTl55lZR8kz7BJrN137y8MWB9bg4AqAowq0BchRNRz1MinlLe03xccwiYjDz0WAK6jo
	MbHTMUHngzXijUOBx6BQksVjBOeIZW/c/KKxCku28AG/t7v2PYgXt3U044RPUj1wmD5OGtiC3/L+g
	5wPx9nyz6dDis8reT39JDxx8ePE09WFXYD2EUMBJNTvFY6LM9yLeBN6x99+kDzE/7aELjmQSb6dO7
	Wqc/CIQywrYuGY7dLhpFurrCN4fT+Pc9J57u23k24EqaFk7jvb6y69rtaMSGYD6KoR/uLJvaYBXd2
	P9ZCatMgrgKFgV4/K4MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDv-002KDM-10;
	Thu, 13 Jul 2023 07:58:51 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDr-002K86-2I
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:58:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DBD240003;
	Thu, 13 Jul 2023 07:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CAcdgMe2/s9IbGFcplUxzsGXDAg2SeY5YUX5I1fIs5A=;
	b=oi0J6CpOPXfLfbUneqPDi+zoXuN+iEyY9u0jowSSMSWYbreVvFKHkkdRDWfhy9P0OV6LY3
	KgZ3zaRuCipq1Mi2G8yn5IuyVvlE37zaejQnJ7hlEsUUAGKFhAhH8UYd06z8v3zcDRblyh
	aq4hqCeXMEZumvN6SgoIuruDvy+SGU4bM/ezDS+Cu3iLTVcSCPnqRrQnDoiLyGXo+hQM+1
	29rq9KQbnJIDKit8Ru6c5Am+mDaz8/D0buwg2jIKZbrdR1+XESgHkfZTZIF0O9TYaV37St
	52EUNblsUHDaBFKWVO0gIObjJEcNtefbnOUE1N+o2gIo4ZkCPYnWi3DDRDrBZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	f.fainelli@gmail.com,
	rafal@milecki.pl,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	computersforpeace@gmail.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v4 2/5] mtd: rawnand: brcmnand: Fix potential false time out warning
Date: Thu, 13 Jul 2023 09:58:43 +0200
Message-Id: <20230713075843.486536-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230706182909.79151-3-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9cc0a598b944816f2968baf2631757f22721b996'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005847_882102_8957D500 
X-CRM114-Status: UNSURE (   8.98  )
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

On Thu, 2023-07-06 at 18:29:06 UTC, William Zhang wrote:
> If system is busy during the command status polling function, the driver
> may not get the chance to poll the status register till the end of time
> out and return the premature status.  Do a final check after time out
> happens to ensure reading the correct status.
> 
> Fixes: 9d2ee0a60b8b ("mtd: nand: brcmnand: Check flash #WP pin status before nand erase/program")
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: stable@vger.kernel.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
