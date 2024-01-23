Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801A7C47DDB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 01:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMr5dQBAkEPXkuBi8PHnRsXXxXkXjHs6bytpA/VJCRA=; b=b4Z5P8sZlO/UDr
	QJJMSUxBYMXrJma9n3BV9OfhxawCWC4L2ZDamEKaewHo/BhedT5SZBe6SYQk5iUk9gRdfp12J0vlE
	B5Qtpbm9rjbHgO5K2edMYT54u4fnlIXVLEvxwAYFb3fIk8wjSh9U9Qk1hfR5VqIKcBD8maRT052en
	+2caV4BPUbTN+wp58s0Orhoa8O2JJhlU7jEWygITxPGBfTiSmYWi9r0TgV2xwCYjVAeKHT+uC2km+
	TqzF3Zz50RUWGZdd8reWcsSesUHhVibC04BePS5Nlf8GbbERPl1mDq+iG5l4Ii7zeOytboiM0BMFZ
	8RAQaOpRdBFdkAJ68meA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS5sw-00Enzq-2e;
	Tue, 23 Jan 2024 01:47:30 +0000
Received: from mail-40133.protonmail.ch ([185.70.40.133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS5st-00Enxy-2m
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 01:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1705974445; x=1706233645;
	bh=fxYcyr7pTg3CIHphjSaf+5XlmBylc2uV3tWOoWgMT1I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aGnzN1SPVWxRuRi4Z7/2pPvz4qx+/sZqPAlwic66PqRSxOz12oLYuDGQ81TT554FJ
	 TC87LdXQB4+y5NNUcRyw+NUf1ATXMcvo60pdGxwkWaTxojIUnhUdqZDAAuQMdzMRm2
	 bkYw5wkE59UC79vNsYKEgfr/jb3crCY9wFBdB8WcdW0eF3nQO6gytc/kMFKAr4vvO/
	 yODQ/be5Z8x5JSbkUf3/0ITSXJAEsm7f/QcU442N1e1TNZ6hAvmfE7hDlybzHK4loE
	 ag2xjQmep00Z8ojpE+BUIKCKoG2hoVEpzH5DpbXa6HHKfgjBokN0IAnKlbp6WOhm69
	 zOQFz43uWo9dg==
Date: Tue, 23 Jan 2024 01:47:21 +0000
To: devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
From: Michael Pratt <mcpratt@pm.me>
Cc: Michael Pratt <mcpratt@pm.me>, saravanak@google.com, abel.vesa@linaro.org, alexander.stein@ew.tq-group.com, andriy.shevchenko@linux.intel.com, bigunclemax@gmail.com, brgl@bgdev.pl, colin.foster@in-advantage.com, djrscally@gmail.com, dmitry.baryshkov@linaro.org, festevam@gmail.com, fido_max@inbox.ru, frowand.list@gmail.com, geert@linux-m68k.org, heikki.krogerus@linux.intel.com, kernel@pengutronix.de, linus.walleij@linaro.org, linux@roeck-us.net, luca.weiss@fairphone.com, magnus.damm@gmail.com, martin.kepplinger@puri.sm, miquel.raynal@bootlin.com, rafal@milecki.pl, ansuelsmth@gmail.com, richard@nod.at, sakari.ailus@linux.intel.com, sudeep.holla@arm.com, tglx@linutronix.de, tony@atomide.com, vigneshr@ti.com, dianders@chromium.org, jpb@kernel.org, rafael@kernel.org
Subject: [PATCH v1 4/4] mtd: mtdpart: Allow fwnode links to NVMEM compatible fwnodes
Message-ID: <20240123014517.5787-5-mcpratt@pm.me>
In-Reply-To: <20240123014517.5787-1-mcpratt@pm.me>
References: <20240123014517.5787-1-mcpratt@pm.me>
Feedback-ID: 27397442:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_174728_053291_E120B21F 
X-CRM114-Status: GOOD (  10.50  )
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

This reverts commit fb42378dcc7f247df56f0ecddfdae85487495fbc
("mtd: mtdpart: Don't create platform device that'll never probe").

That commit is a manual named exception in order to avoid fw_devlink links
to an "nvmem-cells" compatible node which is a descendant of the fwnode
that represents the real supplier device that probes.

The commit does not work for newer cases, like the "fixed-layout"
compatible nodes, but instead of adding another compatible string,
remove this workaround as it is no longer needed after
the previous few commits which handle the situation in a generic way
for all supplier nodes that are a child or further descendant fwnode
of a parent device that can probe, including when the consumer device
has a probe attempt before the supplier device, by using an existing
incorrect fwnode or device link to recreate the correct one.

Signed-off-by: Michael Pratt <mcpratt@pm.me>
---
 drivers/mtd/mtdpart.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 6811a714349d..dd2b27674f56 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -582,7 +582,6 @@ static int mtd_part_of_parse(struct mtd_info *master,
 {
 	struct mtd_part_parser *parser;
 	struct device_node *np;
-	struct device_node *child;
 	struct property *prop;
 	struct device *dev;
 	const char *compat;
@@ -600,15 +599,6 @@ static int mtd_part_of_parse(struct mtd_info *master,
 	else
 		np = of_get_child_by_name(np, "partitions");
 
-	/*
-	 * Don't create devices that are added to a bus but will never get
-	 * probed. That'll cause fw_devlink to block probing of consumers of
-	 * this partition until the partition device is probed.
-	 */
-	for_each_child_of_node(np, child)
-		if (of_device_is_compatible(child, "nvmem-cells"))
-			of_node_set_flag(child, OF_POPULATED);
-
 	of_property_for_each_string(np, "compatible", prop, compat) {
 		parser = mtd_part_get_compatible_parser(compat);
 		if (!parser)
-- 
2.30.2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
