Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35CD60A260E
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JlsjPeO7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=zGU/13vq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5gfSfyKZWpTlHhpec3HYZ8Tb10J453aWB/3V5074ODo=; b=JlsjPeO7smqEhwRzApkLnvrVqh
	TXG79kxxb3nPqW8pnoBg6BPkbiqIcogivZkhfo6tdGGHNqjDAlPfiJsjUtZsTDqXn6HgfV/Uugjv3
	ium2wyRzuebNuvfvSsAQx/MVByh+g+n0buvctFFpxKs/+gIKkTGR1cenJ02anjCQroNc6uQE47wgA
	OXUHJqurb7aeMzZPESeJLBhHc/5wzmuQQn3KfQfFvjvcOeZSHW8CzmL4iw0kEWc+KJ/ew3ZB0kBhf
	0NjihMag9i0RtKcpR9OLTIpyAijBO334v+nyOo2PRiniYkkt8EpJwvwFhxDwPmmkcYkWyC1X1qUSP
	FAc5hs4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR71V-00000006axM-2uk7;
	Wed, 11 Nov 2026 12:01:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR71T-00000006avr-2QdY
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 12:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794398511; x=1825934511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O6Ci8KqCR4/fKEBbb/kiuWd/gp3h3w7zKEf1wHvnL20=;
  b=zGU/13vqQ5I+/rIC2yoB5H8QiCutVr9pGEOnFtdTOCNWM7OsiOr5jOd9
   H9HCI5e+QbsBSX/h5m6STca4J/EclwjPhBQZH4yUqac3UY+sdJJ6iKOcq
   t6PFbKeJ1dNDVVn0VREKAijzm0BnTtF+XPslFiRZxvXzS/MnKBGK2bbH5
   pQbacee2brink5TTqnr0GsqaHX8vjtIUyHSZ1krCeyMBsb2AXWhviRshB
   0W+Q/wyNW0fFXyArjpW7k5GQ53sEdsb4nNI6pGYCkiKd7cfIMe0VegQJR
   Ql7PVyx+hsDH2IjQF36/NBaxVU7Ppg9d3uXB6CL7FhtlNTiet2qRXsmAK
   Q==;
X-CSE-ConnectionGUID: GyyFCI85QbmZ8i9JheubPA==
X-CSE-MsgGUID: U4Q/youGQ8qHnUvIPLJG0g==
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="66592432"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 05:01:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Wed, 11 Nov 2026 05:01:49 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Nov 2026 05:01:46 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <srini@kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 2/2] nvmem: core: don't defer for a missing cell once the layout is bound
Date: Wed, 11 Nov 2026 17:31:32 +0530
Message-ID: <6b8408e4052882b2d248db3c873242f879e897b0.1794391847.git.manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794391847.git.manikandan.m@microchip.com>
References: <cover.1794391847.git.manikandan.m@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_040151_686540_581E76D7 
X-CRM114-Status: GOOD (  15.51  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

of_nvmem_cell_get() returns -EPROBE_DEFER whenever a requested cell is
not found and the nvmem device has a layout, assuming the layout has not
added its cells yet. A layout may add none, e.g. when the data the cell
describes is not programmed on the device. The layout is then bound but
the cell is never going to show up, and the consumer is deferred forever
instead of falling back.

Only defer while the layout device is not bound yet, and return -ENOENT
once it is, so that a consumer such as an Ethernet MAC can fall back to a
random address.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/nvmem/core.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index be3a05150085..f34a35a04e55 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1403,6 +1403,31 @@ static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem)
 	return 0;
 }
 
+/**
+ * nvmem_layout_pending() - Check whether a layout may still add cells
+ * @nvmem: nvmem device the layout belongs to
+ *
+ * A layout adds its cells from its probe. Once the layout device is bound,
+ * a cell that is still missing is never going to show up.
+ *
+ * Return: true if @nvmem has a layout that is not bound yet, false otherwise.
+ */
+static bool nvmem_layout_pending(struct nvmem_device *nvmem)
+{
+	struct device *dev;
+	bool bound;
+
+	if (!nvmem->layout)
+		return false;
+
+	dev = &nvmem->layout->dev;
+	device_lock(dev);
+	bound = device_is_bound(dev);
+	device_unlock(dev);
+
+	return !bound;
+}
+
 /**
  * of_nvmem_cell_get() - Get a nvmem cell from given device node and cell id
  *
@@ -1486,7 +1511,7 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
 	of_node_put(cell_np);
 	if (!cell_entry) {
 		nvmem_layout_module_put(nvmem);
-		ret = nvmem->layout ? -EPROBE_DEFER : -ENOENT;
+		ret = nvmem_layout_pending(nvmem) ? -EPROBE_DEFER : -ENOENT;
 		nvmem_device_put(nvmem);
 		return ERR_PTR(ret);
 	}
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
