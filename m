Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40EDECAAD2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 22:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALx9SK8+tlgFXgwVdKOQZKNx8k4siwougybIEHr1J7E=; b=Aa1/bRmF6tvXGu
	JaTIyKvtsp27G0bLYoC9j27yNn2tg24X8Dcm88lVea179EFmDl5WT55cdYxdKij+6tK1iapzNDd/q
	V2JELy4+XNjwjl/NLqHVbUyrFdXJmZ37uQMYx0w42CNb3TzoVVIbBsS979sbz7owkPP6zspUk4bu+
	KjAMUGsgAxYPUoRjskhovNclARgZNebBrHgPPAoM6Pw34oF+lzfCgGhYgw2EcMX0x79z820x+Ah9L
	slxmIXvUaDoDqVlIMkvwcoaE691IVn2PIwi7YAKxlbsy0UIg2BNPnxmQ1uJdUgDuOUQ08zvK7I/To
	5mb66zvVMnTX39JUIpcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsYp-00FGHY-Rq; Thu, 01 Sep 2022 22:21:20 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsWt-00FEdZ-S8; Thu, 01 Sep 2022 22:19:21 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 9138421BD;
	Fri,  2 Sep 2022 00:19:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662070750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YzIFljraErWsasEqYLJKeAqVh3TDfkAos+3Qz9UmFWA=;
	b=0OsQx82QhxwxgMgq1GWosKoZPIy15WweD1yq8n5XPxEAuo2zMSf+8ds0dc6qGwIoS1ODAp
	k3181AnAImgxLXQSs+ZcDH07QolxcOqP3YNmlFqXAIbxVrQwvxWYorUeiKHVPA/EVQ2Cgf
	epxDes/mtR0BEr9ptGYlVlS3/eRLxCxBmx1U287n7wb8xBtH6pijqrM3OwaVtqexrHSzT2
	x5jcUuQ1KAN/6PpI5ckb0/neylcEEgINwlU0Btyqy/eJU20P3/amuQWAkIjfNys0iHPZSK
	gUwCfj7pzD7whR5xJMFVAtKe5uszJV2SKXQVs0c/qRyRKYtMC0Cbu6UfAXe9ow==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v2 05/20] nvmem: core: drop the removal of the cells in nvmem_add_cells()
Date: Fri,  2 Sep 2022 00:18:42 +0200
Message-Id: <20220901221857.2600340-6-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901221857.2600340-1-michael@walle.cc>
References: <20220901221857.2600340-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_151920_090324_FBE6EB88 
X-CRM114-Status: GOOD (  13.22  )
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

If nvmem_add_cells() fails, the whole nvmem_register() will fail
and the cells will then be removed anyway. This is a prepartion
to introduce a nvmem_add_one_cell() which can then be used by
nvmem_add_cells().

This is then the same to what nvmem_add_cells_from_table() and
nvmem_add_cells_from_of() do.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v1:
 - none

 drivers/nvmem/core.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index ab055e4fc409..be38e62fd190 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -515,7 +515,7 @@ static int nvmem_add_cells(struct nvmem_device *nvmem,
 		    int ncells)
 {
 	struct nvmem_cell_entry **cells;
-	int i, rval;
+	int i, rval = 0;
 
 	cells = kcalloc(ncells, sizeof(*cells), GFP_KERNEL);
 	if (!cells)
@@ -525,28 +525,22 @@ static int nvmem_add_cells(struct nvmem_device *nvmem,
 		cells[i] = kzalloc(sizeof(**cells), GFP_KERNEL);
 		if (!cells[i]) {
 			rval = -ENOMEM;
-			goto err;
+			goto out;
 		}
 
 		rval = nvmem_cell_info_to_nvmem_cell_entry(nvmem, &info[i], cells[i]);
 		if (rval) {
 			kfree(cells[i]);
-			goto err;
+			goto out;
 		}
 
 		nvmem_cell_entry_add(cells[i]);
 	}
 
+out:
 	/* remove tmp array */
 	kfree(cells);
 
-	return 0;
-err:
-	while (i--)
-		nvmem_cell_entry_drop(cells[i]);
-
-	kfree(cells);
-
 	return rval;
 }
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
