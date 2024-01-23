Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA0AC46CD2
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 01:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/NonO+xIhZvgNCFrPwHqnvtqeY3p5Cvjdo7MiSIbg4=; b=BFXGhVJBrOfvF5
	6uzcunM8ljrTzztUSGmA4wDRvwlyYqnVNXAELhUX5LI/HZsV1YHqX4+2P4sueUF8nSemxqbdqWFOL
	0Om9w/fm2dDA7TOoRkmkw1VbF+ITmtIsQ3FMs98Bdp8tHdQaGySIGNdnfshsNtGhBt1rYHuvcYiA+
	i/LGdkK+5uPd4cLb+qgYA9opx6YstaV9uO5ZSlaUb/2t5+Juywyvs0OIa6zKHgougWha7yJ3EKmVE
	0HVANbWJii0UaHkJbDbkGTdMuquyyEeuCdiwSzCM5eU7MBRrlwpuZCxTiyMmO+xdSzlK8DuCVXkt1
	8Ms0L4Ll1hT7AsM52JgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS5ry-00EnlS-1B;
	Tue, 23 Jan 2024 01:46:30 +0000
Received: from mail-40133.protonmail.ch ([185.70.40.133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS5rv-00Enjz-36
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 01:46:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1705974384; x=1706233584;
	bh=W9fDeKvWcAx5zWuX6Ptj6h/hvIvYxgy0niruIGIV07k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SNycMXJi1xUXbudVK27K6Ff/w7QHAB+U/PohdYu5wEEP8rtIlEBoxxf1fyWL1PEIE
	 Nzl5I0slsPCV3rhtk5v8BMe5DglfMbHSZPjNHd22ISVeAYslobFD0dSK7VI7Myv/ZY
	 mGH/bn4Toh7tVHaLFBgjLwP2VLTyJL6d39sTDIJXyrcu3bO1DXI8K4PD3i09jWUl6c
	 qCkmvqSxF/ci+kJ7dD8Rv3tx9EMhi7ttBhJ1qgaA6X6WrYQYXIS/OtvizZEPsFcwV2
	 xO73OCxrLMXVS0qu4NwT6zgt9vfN2tvjaSlRLBsj/v9XsCWmY1taIer0hIVK7r9UwF
	 gBozSVS8Gxxww==
Date: Tue, 23 Jan 2024 01:46:18 +0000
To: devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
From: Michael Pratt <mcpratt@pm.me>
Cc: Michael Pratt <mcpratt@pm.me>, saravanak@google.com, abel.vesa@linaro.org, alexander.stein@ew.tq-group.com, andriy.shevchenko@linux.intel.com, bigunclemax@gmail.com, brgl@bgdev.pl, colin.foster@in-advantage.com, djrscally@gmail.com, dmitry.baryshkov@linaro.org, festevam@gmail.com, fido_max@inbox.ru, frowand.list@gmail.com, geert@linux-m68k.org, heikki.krogerus@linux.intel.com, kernel@pengutronix.de, linus.walleij@linaro.org, linux@roeck-us.net, luca.weiss@fairphone.com, magnus.damm@gmail.com, martin.kepplinger@puri.sm, miquel.raynal@bootlin.com, rafal@milecki.pl, ansuelsmth@gmail.com, richard@nod.at, sakari.ailus@linux.intel.com, sudeep.holla@arm.com, tglx@linutronix.de, tony@atomide.com, vigneshr@ti.com, dianders@chromium.org, jpb@kernel.org, rafael@kernel.org
Subject: [PATCH v1 1/4] driver core: fw_devlink: Use driver to determine probe ability
Message-ID: <20240123014517.5787-2-mcpratt@pm.me>
In-Reply-To: <20240123014517.5787-1-mcpratt@pm.me>
References: <20240123014517.5787-1-mcpratt@pm.me>
Feedback-ID: 27397442:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_174628_159116_76BABF5D 
X-CRM114-Status: GOOD (  13.16  )
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

The function __fw_devlink_pickup_dangling_consumers()
intends to ignore suppliers that are already capable of probing,
but uses whether or not a bus struct is defined in the device struct.

There are some cases where a firmware child node
can be address translatable but not able to probe
(e.g. the use of of_platform_populate() for MTD partitions),
so whether or not a driver is present is a more accurate way
to guess whether a fwnode represents a real probing device here.

This also serves as a preparation step for further changes
to fw_devlink including making the contents of this function
less strict in order to compensate for more cases being passed into
the rest of the function because the return case is now more strict.

"Hey! Who's driving the bus?"

Signed-off-by: Michael Pratt <mcpratt@pm.me>
---
 drivers/base/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 14d46af40f9a..c05a5f6b0641 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -214,7 +214,7 @@ static void __fwnode_links_move_consumers(struct fwnode_handle *from,
  * @new_sup: fwnode of new supplier
  *
  * If the @fwnode has a corresponding struct device and the device supports
- * probing (that is, added to a bus), then we want to let fw_devlink create
+ * probing (that is, bound to a driver), then we want to let fw_devlink create
  * MANAGED device links to this device, so leave @fwnode and its descendant's
  * fwnode links alone.
  *
@@ -225,7 +225,7 @@ static void __fw_devlink_pickup_dangling_consumers(struct fwnode_handle *fwnode,
 {
 	struct fwnode_handle *child;
 
-	if (fwnode->dev && fwnode->dev->bus)
+	if (fwnode->dev && fwnode->dev->driver)
 		return;
 
 	fwnode->flags |= FWNODE_FLAG_NOT_DEVICE;
-- 
2.30.2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
