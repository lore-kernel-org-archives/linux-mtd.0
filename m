Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD98C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1fvKa2kYELXzkotrTrFdQlr8qSLnGwpiqH+iYOKI0g=; b=pyEw26rqw+joy1
	7pznsjfnoWpRxCxx79P62MuDiId1z8894TqZMkNC+QxjUi8gUipiEuobwdy56vMahk+3qHZdvVdyf
	EmOI7Lmev4PqTftixbRehcbRb4zhBVtzMNQxt15Bfv7DQtE8D5SKgqtdI013YNOcfHWAfhdaeb2HP
	igKkK6iBJLOSw2P2bgylfsCPnCwEzwDD92lwSEphAzteL6pDhe1RUG2UyoE4L+L+Xu5V9ElV+CCZM
	7KVlMJKWLgB9Lw9fiiMIjH55j8i5A7kPQTw7tPJOYaqJX4GiehNNOa+OiujBwR+FHkJEgeEWGSxu/
	YG+sQlsHe3pj4HYivlrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaN9-00000000f8k-1AyF;
	Mon, 26 Feb 2024 12:46:20 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYSN-000000008Y8-3fxd
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 10:43:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 366601BF209;
	Mon, 26 Feb 2024 10:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Im0dd+xV/6aatIfuvAgE4yr1Ev4gmz/X+TFs9Fz1xS0=;
	b=S8PzLHDWRECMzBtDc2peHSLxHlwYDZ1H8GfPZYWaujpl4a6nSbjTDS/WmOKC+xJTVC6RKU
	yn4s1Gh5EKOzzoxSuxaI6RjjbuXbF0Imh7Tg1V3pm7b9Oq7O0krAlEPFyEtTW5oZ/+JMfo
	aB/M7/cbw1WkCjXyyc6SPOhACpWV0bQvIrxcZKerJb75XZhKmeo1N0PDrcy8bSGiD1/aH7
	gmWAAzRvCTDDcjGWNjrqGY45VKu9lmmp8UQoX9mfs5pNwmGmoirOGZpG/l/Cm5aZnL5wbu
	epHBBqapYoQ6r5OgTo0umgITEkK1GEe0lK3Uf78RFjEEEVC3dCr4uasJWLwrZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nayab Sayed <nayabbasha.sayed@microchip.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stefan Agner <stefan@agner.ch>,
	Lucas Stach <dev@lynxeye.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Han Xu <han.xu@nxp.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: update references from partition.txt to mtd.yaml
Date: Mon, 26 Feb 2024 11:43:29 +0100
Message-Id: <20240226104329.489122-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208-partition-txt-v1-1-4398af3b7bb2@microchip.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8709aa3e9d7ed8aadf0ba193821c8a2b692092a1'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024336_397360_AAE5F075 
X-CRM114-Status: UNSURE (   7.17  )
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

On Thu, 2024-02-08 at 11:42:12 UTC, Nayab Sayed wrote:
> Commit f902baa917b6 ("dt-bindings: mtd: Remove useless file about
> partitions") removed the file partition.txt. Hence, in this commit, the
> lines mentioning this file are updated to reference mtd.yaml, which now
> includes partition{,s}.yaml.
> 
> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
