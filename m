Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633E3C001B0
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jul 2023 16:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/O8YKkcI7jpr2jNaLu5ftIVAFFVWw6jKk3V1RJvqoc=; b=FT5ojFaVz/a/78
	2IgW9Zlzbri96oLM+xDZECzizZfFpPGgs4Dfit+dswLkcNDz0JxzIyl/CY4fy0A+YcoU3n0MfXo+N
	H+2XrpC7hpCgGBAb8a6JVetAv+jlypf5eN26Gyu3fFN6L++V/MudCJsXvYxI2UeaMEk1vk8fTETfA
	JKL6kUU9loqQtEdXmmTnPdkZoB8Yho+hMiOK3DHVwDRwj2p5V2Rg/M/UtimG1Y37jK5W8M4BeZPIg
	8PbEfuXB4UuwAdQ2rboGC4q88tJFuBJuJ9PUWiKcNo/RZZ61TVsenw6JlOS0q6gz7WTHmlDRD8VpD
	ECXGj/FViPkcqzgsbi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhzX-0096v1-0t;
	Sat, 15 Jul 2023 16:19:31 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhzS-0096tS-2f;
	Sat, 15 Jul 2023 16:19:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E23020002;
	Sat, 15 Jul 2023 16:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689437962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dlIhZ9cfFkihaTXZUNHm8+GcslExR23+39+IT1xIDsc=;
	b=d6ZJx5pKwMJZjAERl31AmymcOB9SMQ/+mBsarvOMWIosFMnzU/wBtwzC7q1t8TL3mzp5F4
	JcBRBfeyJEtZxF8s84cErO6D8/S4talyv4OQgb2YyYiQiGw9CdmBaYvaRMzJHCLYON0Uum
	Xopv28dxUjjw1v0Qsy6LTD45e6Z19EmSrqbhi7c4DWyEiGclhG+gD0nkx4or00tgrdvxdw
	i2QewPVpUmOuZ2bhxYuRvDERtc9UtggGCm3w3oc1zOl7URj82rbZdlbDRw7oWBR5LKWH88
	nPjWPZo8/s1jXpuVdnX3BEF+wwBSAPLyBkN4ueFajXZZc8rtGhZfvGnWgR87nQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	heiko@sntech.de,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	yifeng.zhao@rock-chips.com
Subject: Re: [PATCH v5 2/2] mtd: rawnand: rockchip: Align hwecc vs. raw page helper layouts
Date: Sat, 15 Jul 2023 18:19:18 +0200
Message-Id: <20230715161918.20613-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <5e782c08-862b-51ae-47ff-3299940928ca@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ea690ad78dd611e3906df5b948a516000b05c1cb'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_091927_020199_A9AAD108 
X-CRM114-Status: GOOD (  11.89  )
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

On Fri, 2023-07-14 at 15:21:21 UTC, Johan Jonker wrote:
> Currently, read/write_page_hwecc() and read/write_page_raw() are not
> aligned: there is a mismatch in the OOB bytes which are not
> read/written at the same offset in both cases (raw vs. hwecc).
> 
> This is a real problem when relying on the presence of the Page
> Addresses (PA) when using the NAND chip as a boot device, as the
> BootROM expects additional data in the OOB area at specific locations.
> 
> Rockchip boot blocks are written per 4 x 512 byte sectors per page.
> Each page with boot blocks must have a page address (PA) pointer in OOB
> to the next page. Pages are written in a pattern depending on the NAND chip ID.
> 
> Generate boot block page address and pattern for hwecc in user space
> and copy PA data to/from the already reserved last 4 bytes before ECC
> in the chip->oob_poi data layout.
> 
> Align the different helpers. This change breaks existing jffs2 users.
> 
> Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
