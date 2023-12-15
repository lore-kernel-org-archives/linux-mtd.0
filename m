Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1F0C4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 10:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlPx0DlabMoNyIviMCcWnGrqGxTsClhGFa1NNGFSPyI=; b=JgOFBqBnLd8oDC
	UG9oexRVEFj8SjwrKY/C+iU1mSK9QVSS6D11eRs1QH9spFw7gTjMla0guQXH2zRkjp+Lfw6I+HA+R
	lbHLnK1VWFesc6+DHtLNbcLy8DcxNciBnfe44Vlw8HtTNw4uTcxveMUmcJISKc5qmPD1BGkY9RVnS
	gASx+B7yjs7BYIfPqV/tt1wPz9+dH11PFUeZn14C87Cl1EZzETCohMCn0xYSKMsNW5VNm93kokncL
	kz4YgHdQXoR/ETpvtzB8/V9xYQHr88lUoZ0JTdbw+xsHwvlwkeLH0Ty4zznkGZGNEsUck/sns2UNW
	xHc+Mf+hzycGzETKot7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5uk-002qJj-0z;
	Fri, 15 Dec 2023 10:59:30 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5ug-002qHT-2p;
	Fri, 15 Dec 2023 10:59:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB43B20010;
	Fri, 15 Dec 2023 10:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702637963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WadmhwllHZ/l755XrYqq791MtuE5Z1Iy8A0gM/xQmZ8=;
	b=ptB6nSkr3L574k00rpW1sYESQHgJJFebYHqqqx2J5lijq5VQgWgkBuHkAzROETk6b4WB3v
	wrAbhGu3i7RN7P+nICRxTgNr3zYC0BGMh76bQqNm06Upk5w7KkoJTIYpzUYrXK8DascAez
	9O3hMqY0+LgBQvtznyDb0ww/HfuaTdliW4nmdl7knBW+6N5b/63JCPW7E29tCGA1ds3Svf
	Y/F1lxzcInanafvLAovolmOTE+/TI4QpvL/8gZ25c4/kavPIpD+zjJdxsVor8kvRDCAYEI
	8t49yPmYMvS4PwbxapyaqAkRjX886lveL1DCcAIIRo7mC48XvCOP9wW3dr5I/g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: rockchip: Add missing title to a kernel doc comment
Date: Fri, 15 Dec 2023 11:59:20 +0100
Message-Id: <20231215105920.499247-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211150704.109138-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b6c985dd9a2d5902e413c2e9ba5a770fbca12322'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_025927_061219_4177E1F4 
X-CRM114-Status: UNSURE (   6.48  )
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

On Mon, 2023-12-11 at 15:07:04 UTC, Miquel Raynal wrote:
> All fields of the nfc_cfg structure are documented but the name, which
> leads to a W=1 warning. Add a title.
> 
> Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
