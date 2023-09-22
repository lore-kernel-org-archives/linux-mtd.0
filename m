Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934D9E6FE42
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 14:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qk4kQbYlYlTjhCo52xDs/YdL+8B3AnoyW/5lqa9mRw4=; b=EqTu6IzR/uq+3s
	BkNwIkne/zpgYusAOYIHNXwAug9X7+rSmO9MzvHWIMkMhFuN5MjHJQtVIChL8U2yhRsGvqfaxcLFu
	/tfNYo0LQhDBCR/jCAMW+/PMgYn/PwnXyCLKikoYU4XuVKDwe50b5iBqlPNSaYZ3jFzjE62zMx1zu
	DJIEDNG1Jrx700R0P0x6km6mrdKC//oICFrra0MlVu+x5G7CXvfufeO30+BO25Yo0NCwW8SVrVT9b
	83ZSdvpkfMK/Zqa4JeNj7le0YOGY69RgW5c7YJoUEhvaOVqwiSKSu4uKnZbv6z8d+5m5Zz1xAHHPy
	tBsrYVb5yBpbiYxYaHYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVD-009FHz-1U;
	Fri, 22 Sep 2023 14:51:31 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhV9-009FFy-04
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 14:51:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B41AA6000B;
	Fri, 22 Sep 2023 14:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695394282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XoRUll6CaorBhs0khbfmRz9BF9/JTkYhq0xhHzZ3EUM=;
	b=ex4JyoMjQ1GB/sXvlDYbkr5R/96btL6C1gZgOnfYfsrwAh92b5cF40Go53MegJ5I0xwv3/
	hO9PNGlRcP2zlAYmdNI9HO7XnD+GSCliVsIRQ9nC+210FkZh1FA188FXxEBBawpkPOgm2r
	BaQHPgYtGGyXu7hIAcZcIGT1Ow9nkUHejkz8tuCXNWIvk2sxYGkeyo/WwBy0x9ZZ5IfTPR
	qxWOsWrayM8AMV+tdnaZ5Tu8FiccEe2VLAs4XE8B1h4CJgVRI0wHuhcEx+B7+hOuUMB6mr
	8K8veM4IEAATv7QzSvfwuhpDfIr1iVqWB1nIS5jDCuoHfi87g2X+eXTGf+K/iA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org
Cc: linus.walleij@linaro.org,
	b.spranger@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: map_ram: prevent use of point and unpoint when NO_XIP is set
Date: Fri, 22 Sep 2023 16:51:21 +0200
Message-Id: <20230922145121.578332-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919113320.16953-1-shivamurthy.shastri@linutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3cff177fc2793a362d784c912f536e69a755925e'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_075127_193905_C6C30659 
X-CRM114-Status: UNSURE (   8.82  )
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

On Tue, 2023-09-19 at 11:33:20 UTC, Shivamurthy Shastri wrote:
> When the DT property no-unaligned-direct-access is set, map->phys is set
> to NO_XIP. With this property set, the flash should not be exposed
> directly to MTD users, since it cannot be mapped.
> 
> map_ram() exposes the flash direct access unconditionally which leads to
> access errors (when the bus width does not match the RAM width).
> 
> Therefore do not set point and unpoint when NO_XIP is set.
> 
> Signed-off-by: Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>
> Reviewed-by: Benedikt Spranger <b.spranger@linutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
