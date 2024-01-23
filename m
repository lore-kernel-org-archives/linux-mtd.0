Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AC3C47DDB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 01:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWIlrcSLwb3CZEzGfAljGvqiF6CRmcJGulf586j/+O4=; b=VF3rkKrL6e8Bxn
	+LjDDNC3gXQc+ZBA0OgaU4PoBvSKTuBoUuifidlJRZTJP/Y0pggMj0p2qu7HjE8/Gz+Rkjd4j22Mw
	bhnb1qeJJRjs1ba+PMuro6Pp7F1yqNc0B/BQPFvrw8MSv7j2fUc7RJ2QLe4b7EaHRvVVkcboW4Exh
	9mAG68g757/eBs74eHseowqCsDK3L1AIF4ZP4Fus2l553pA/0+OZNFWubRCXU1zmF7zQqOmOMrp+F
	h4DQ99upb0CiTkNpGkwn3jsMo6Qm7WTcQXLtQJiZXzBzbXzCKb1HcW5haJSzeyVRwYooKUTCShfoM
	Xq2M3KaW5Or0igEKKW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS5sq-00Enx4-0b;
	Tue, 23 Jan 2024 01:47:24 +0000
Received: from mail-40133.protonmail.ch ([185.70.40.133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS5sn-00Enw2-1o
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 01:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1705974439; x=1706233639;
	bh=4YREAB+lLFhLYt23yOuuQE8IjzcG54BZ+WRgblN4Okw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qucMjGILNV9xcag759X1TuTYlyL0txyxsfKThwXcZbwH7piqvdGUkheC7w6oM1ne1
	 cy9kEbGzLwMMKqQTrXDFvV22FAr4bI7QK6ntMZJuP7ORlhJDak+fRg6cfr90FQ4jNI
	 S63nvaYljxfj+Ohg4Xw9URE0+p/sJdX1bcdaVP3KTjV0lxCdDBj+03g21N42sUMhj2
	 ATg+V4N1Pfl58CD7kt51GLnK/tg526xMjnQanL/loJ2Vqge7nrqwhZx9L4aN5iGsDR
	 424DxiwHM7Yj8SJAp/Z56wmUqxnauuipqmRstjuOOKWRXEKOJqdEqdUPltuer/QV6E
	 NlrBgyN1KmpSA==
Date: Tue, 23 Jan 2024 01:47:01 +0000
To: devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
From: Michael Pratt <mcpratt@pm.me>
Cc: Michael Pratt <mcpratt@pm.me>, saravanak@google.com, abel.vesa@linaro.org, alexander.stein@ew.tq-group.com, andriy.shevchenko@linux.intel.com, bigunclemax@gmail.com, brgl@bgdev.pl, colin.foster@in-advantage.com, djrscally@gmail.com, dmitry.baryshkov@linaro.org, festevam@gmail.com, fido_max@inbox.ru, frowand.list@gmail.com, geert@linux-m68k.org, heikki.krogerus@linux.intel.com, kernel@pengutronix.de, linus.walleij@linaro.org, linux@roeck-us.net, luca.weiss@fairphone.com, magnus.damm@gmail.com, martin.kepplinger@puri.sm, miquel.raynal@bootlin.com, rafal@milecki.pl, ansuelsmth@gmail.com, richard@nod.at, sakari.ailus@linux.intel.com, sudeep.holla@arm.com, tglx@linutronix.de, tony@atomide.com, vigneshr@ti.com, dianders@chromium.org, jpb@kernel.org, rafael@kernel.org
Subject: [PATCH v1 3/4] driver core: fw_devlink: Add function device_links_fixup_suppliers()
Message-ID: <20240123014517.5787-4-mcpratt@pm.me>
In-Reply-To: <20240123014517.5787-1-mcpratt@pm.me>
References: <20240123014517.5787-1-mcpratt@pm.me>
Feedback-ID: 27397442:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_174721_910955_6EF68725 
X-CRM114-Status: GOOD (  29.36  )
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

If the supplier fwnode of a link is a child firmware node
of a real device, the probe of the consumer device can be indefinitely
deferred in some cases like when the consumer is registered as a device
and attempts probe first.

Add a function to fixup or recreate both fwnode and device links
to a consumer device before probing gets deferred.

As noted in the previous commit,
descendant fwnodes of the real supplier device only become flagged
with PARENT_IS_DEV when the real supplier device probes,
which is necessary in some cases for knowing how many ancestors up
in the tree the fwnode representing the real device is.

In the case where the consumer device has a probe attempt
before the supplier device while the correct supplier fwnode
is multiple ancestors up from the fwnode being linked,
the unknowns present before the supplier device probes
causes incorrect fwnode links that either become incorrect device links
or in some cases, fwnode links are unable to become device links at all,
which leads to the need to redo the link between the devices
after a probe defer of the consumer, therefore,
when the original supplier fwnode is flagged PARENT_IS_DEV
after supplier device probing,
and the consumer is about to be deferred again from a missing supplier,
flag the original supplier fwnode as NOT_DEVICE also
and recreate the relevant fwnode/device links to the consumer device.

In the case where the supplier probes first
but a descendant fwnode is the one linked to the consumer,
the link recreation happens on the first probe attempt of the consumer.

Because of the fwnode flags, the links will be handled differently
when deleted and recreated compared to before the consumer probe attempt
by linking the consumer with a ancestor of the original supplier fwnode,
which at this point represents a device that already probed successfully.
In the future, a way to develop "deferred device links" may be possible,
but that is likely much more complex.

The existing function device_links_check_suppliers() is not suitable
for these fixup changes because of the case where a different supplier
may also cause a deferred probe for a completely different reason.
Handle this in a new function device_links_fixup_suppliers()
which will be called before device_links_check_suppliers()
which is where it is decided whether or not the consumer must be deferred.
Checks in the new function exactly match checks in the function
device_links_check_suppliers() for consistency.

This new function is now the last opportunity to interact with
device links before probe is deferred, which stops device links from
being processed until re-probe or the next time device_add() is called.
This makes it an ideal location to finally assume that the supplier
must have probed at that point in time, unless there is an issue.
This should be called at every probe, because it is important to
handle as many device link changes as possible before probe deferral,
since deferred_probe_initcall() will only be called *once*
at late_initcall, and another probe defer at that point or later
can cause the consumer to be deferred indefinitely,
and the fact that in some cases, a probe deferral can be
avoided entirely if the real supplier device probes first.

Also, make sure that the device links are not handled earlier
than the fixup function for these cases.
Otherwise, before deferred probes are started again,
the link will be converted to sync-state only.

Signed-off-by: Michael Pratt <mcpratt@pm.me>
---
 drivers/base/base.h |  1 +
 drivers/base/core.c | 91 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/base/dd.c   |  2 +
 3 files changed, 94 insertions(+)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index eb4c0ace9242..96593650a861 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -229,6 +229,7 @@ bool device_links_busy(struct device *dev);
 void device_links_unbind_consumers(struct device *dev);
 void fw_devlink_drivers_done(void);
 void fw_devlink_probing_done(void);
+void device_links_fixup_suppliers(struct device *dev);
 
 /* device pm support */
 void device_pm_move_to_tail(struct device *dev);
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 7f2652cf5edc..96edcd842b42 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1773,6 +1773,9 @@ static void fw_devlink_relax_link(struct device_link *link)
 	if (device_link_flag_is_sync_state_only(link->flags))
 		return;
 
+	if (link->supplier->fwnode && (link->supplier->fwnode->flags & FWNODE_FLAG_PARENT_IS_DEV))
+		return;
+
 	pm_runtime_drop_link(link);
 	link->flags = DL_FLAG_MANAGED | FW_DEVLINK_FLAGS_PERMISSIVE;
 	dev_dbg(link->consumer, "Relaxing link with %s\n",
@@ -2286,6 +2289,94 @@ static void fw_devlink_link_device(struct device *dev)
 	mutex_unlock(&fwnode_link_lock);
 }
 
+/**
+ * device_links_fixup_suppliers - Fix bad device links to suppliers of @dev.
+ * @dev: Consumer device.
+ *
+ * This should be called after the suppliers of @dev have a chance to form
+ * device links and @dev is probing so that, even if the consumer device
+ * has had it's fwtree parsed and it's attempt to probe started first,
+ * the suppliers are guaranteed to have an attempt at probing
+ * thanks to the dependency defined through the existing device links.
+ *
+ * In driver core, the suppliers have had an opportunity to probe at this point.
+ * Therefore, this is an ideal position to handle corner cases where,
+ * for whatever reason, the supplier is not optional, but the link to
+ * a supplier is bad and causing the probing of the consumer to defer.
+ * This is the last opportunity to handle a bad device link before
+ * that link will cause a probe defer of the consumer.
+ *
+ * If a fwnode link has not been translated to a device link at this point,
+ * or if a device link has not successfully resulted in the supplier probing,
+ * we know it is not possible for that node to represent a real device that
+ * provides functionality to the consumer, but an ancestor of that node might be.
+ */
+void device_links_fixup_suppliers(struct device *dev)
+{
+	struct fwnode_link *fwlink, *fwtmp;
+	struct device_link *link, *tmp;
+
+	mutex_lock(&fwnode_link_lock);
+	device_links_write_lock();
+
+	if (!dev->fwnode)
+		goto no_fwnode;
+
+	/* Keep flag checks in sync with fwnode_links_check_suppliers() */
+	list_for_each_entry_safe(fwlink, fwtmp, &dev->fwnode->suppliers, c_hook) {
+		if (fwlink->flags & FWLINK_FLAG_CYCLE)
+			continue;
+
+		/* The supplier may be a child fwnode of a device, if so, relink */
+		if (fwlink->supplier->flags & FWNODE_FLAG_PARENT_IS_DEV) {
+			dev_dbg(dev,
+				"Linking to ancestor of fwnode %pfwf\n",
+				fwlink->supplier);
+			fwlink->supplier->flags |= FWNODE_FLAG_NOT_DEVICE;
+			dev->fwnode->flags &= ~FWNODE_FLAG_LINKS_ADDED;
+			__fwnode_link_del(fwlink);
+			mutex_unlock(&fwnode_link_lock);
+			device_links_write_unlock();
+			fw_devlink_link_device(dev);
+			mutex_lock(&fwnode_link_lock);
+			device_links_write_lock();
+			continue;
+		}
+	}
+
+no_fwnode:
+	/* Keep flag checks in sync with device_links_check_suppliers() */
+	list_for_each_entry_safe(link, tmp, &dev->links.suppliers, c_node) {
+		if (!(link->flags & DL_FLAG_MANAGED))
+			continue;
+
+		if (link->status != DL_STATE_AVAILABLE &&
+		    !(link->flags & DL_FLAG_SYNC_STATE_ONLY)) {
+
+			if (!dev->fwnode || !link->supplier->fwnode)
+				continue;
+
+			/* The supplier may be a child fwnode of a device, if so, relink */
+			if (link->supplier->fwnode->flags & FWNODE_FLAG_PARENT_IS_DEV) {
+				dev_dbg(dev,
+					"Linking to ancestor of %s\n",
+					dev_name(link->supplier));
+				link->supplier->fwnode->flags |= FWNODE_FLAG_NOT_DEVICE;
+				dev->fwnode->flags &= ~FWNODE_FLAG_LINKS_ADDED;
+				__device_link_del(&link->kref);
+				mutex_unlock(&fwnode_link_lock);
+				device_links_write_unlock();
+				fw_devlink_link_device(dev);
+				mutex_lock(&fwnode_link_lock);
+				device_links_write_lock();
+				continue;
+			}
+		}
+	}
+	mutex_unlock(&fwnode_link_lock);
+	device_links_write_unlock();
+}
+
 /* Device links support end. */
 
 int (*platform_notify)(struct device *dev) = NULL;
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 85152537dbf1..24b8a506bc51 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -606,6 +606,8 @@ static int really_probe(struct device *dev, struct device_driver *drv)
 			   !drv->suppress_bind_attrs;
 	int ret, link_ret;
 
+	device_links_fixup_suppliers(dev);
+
 	if (defer_all_probes) {
 		/*
 		 * Value of defer_all_probes can be set only by
-- 
2.30.2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
