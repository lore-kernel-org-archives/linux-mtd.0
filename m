Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF9FCCA48B
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 10:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mesqqpSm1991GikxtGwGP41zBJLoUziyu6elaRgjr2g=; b=RYk1G+EsIc+8J7
	LmfidoawE2pFXseS0S66Vp8xf9+oYg8Qsp8qk7j2vfETv1MAhUULZyK4s3bOEhUqsGGDg/r48APD9
	rDmwaAeLDgarQ3SWqMwV1es01zqSfOWT8mvSAdWizAAFspzvEqyXeYKdojU7SyhspgOctflZRhJFb
	snsOxBCw/E0FOfVr5CaqIgxCzlBzDeTSKbN6BbhOMB2h/2zFPklFhNJcoEuoyy/5/aanplAOtg3Pz
	TrU8r6ff9orWDmpLMnvywOh8jvinRzMPfdUjGnadb0H/9bR2T21joWnpZKoggGv7BCzsC0Iz9Dtxc
	kM87hNO9RCoHF9fgn/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfLl-00000002fhF-3hyX;
	Fri, 16 Oct 2026 10:39:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfLk-00000002ff5-0vol;
	Fri, 16 Oct 2026 10:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=81rtumvOwZF5YJF/8g6XUDJyRFlvfEFktfTfS1JZY1Q=; b=OTLjXKI8KMmilhh06WhV411Glv
	KhjHAe8SIyt5dvBfr2dO47WvOKA0jsDg2kMrptfn9s8YkoHobZ5AZPmrY41zmR9C0K+STPYt62SQE
	eXERlMRHBTTctbG80/eFGLAdR98cs0Izb3a/0YP1DkDb6cIPnbXsD3ei5I7rBSxqJtlRpgHReIaxB
	inklDSszQACDdAc3w+inbAZVZtQtjkjunuz+3HWuhQ1gpZ2es9DUI39Txb0QP2rOoTM9JUa5/1Fbs
	KLveB80C+7gW4VJUKMOg63+CnvSSa42ZfjcG0ogqLzfho4G4HI1FLVE18rlDpv2sDYSTkDTOt3ksJ
	cQIJy6Kw==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHfLe-00000001OXD-3LP5;
	Fri, 16 Oct 2026 10:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1792147178; x=1823683178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pyoeyqlj2ef2+TJRwREjVNJtbdmhfRsvaWxlfOjmE4A=;
  b=N+hdVJ9vAiyJaGp1+ky39K7ebppctTrd3zn6NCr7optOjeIb3lrCbnzh
   5wi/vODE7j4TFwQ6lw3+w6/kel4ZcP6PBFk1zNxV9iaspGa/uodAnSLR3
   FIiLu2Ty4dEeStZPBY9KizCtK+SCRz0E+ARQkzWKo3jPTxVFDOVKGU+/r
   7iTxm8ysxCGwXyKzXswK7F20Ny+dtBLoTmNfbdvjS4FONqQ0EVJK0bQ+R
   IbmnPAGeT6QK77Z763iJfVmfbCItFK+MAYmOPfI3oczPNzTcVzE/s/unm
   z2U19fJH9UuNPxxMWZmtLgvv3+YtXGnqt2UUsH8xS0Rida/1ilXjEuMrH
   w==;
X-CSE-ConnectionGUID: JDoxDy82Tu6LYhgkHviMTg==
X-CSE-MsgGUID: Xa1eC8fnRnqH8lMVC36B0w==
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="64191102"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 03:39:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Fri, 16 Oct 2026 03:39:35 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Oct 2026 03:39:27 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <pengpeng@iscas.ac.cn>, <gregkh@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v9 4/8] mtd: spi-nor: sfdp: expose the SFDP as a read-only NVMEM device
Date: Fri, 16 Oct 2026 16:08:32 +0530
Message-ID: <889d6d5b7c608fd6553f38e4a34b050dcf70317f.1792145382.git.manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792145382.git.manikandan.m@microchip.com>
References: <cover.1792145382.git.manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113939_598254_BC3B9F7C 
X-CRM114-Status: GOOD (  17.35  )
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

The SPI NOR core already reads the SFDP tables during enumeration and
caches them in nor->sfdp->dwords (see spi_nor_parse_sfdp()). Re-expose
that cached data as a read-only NVMEM device, in on-flash byte order,
rooted at the flash's SFDP child node (compatible "jedec,sfdp"), if any.

This lets NVMEM cells reference any SFDP data: a fixed-layout for
parameters at a known offset, or an nvmem-layout parser for vendor data
whose location must be discovered at runtime.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 75 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8bc117b46e02..ed478e48ca11 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -17,6 +17,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched/task_stack.h>
@@ -3001,6 +3002,72 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
 }
 
+static int spi_nor_sfdp_reg_read(void *priv, unsigned int offset,
+				 void *val, size_t bytes)
+{
+	struct spi_nor *nor = priv;
+	struct sfdp *sfdp = nor->sfdp;
+	size_t sfdp_size = sfdp->num_dwords * sizeof(*sfdp->dwords);
+
+	if (offset >= sfdp_size || bytes > sfdp_size - offset)
+		return -EINVAL;
+
+	/* The cached SFDP is kept in on-flash (little-endian) byte order. */
+	memcpy(val, (u8 *)sfdp->dwords + offset, bytes);
+
+	return 0;
+}
+
+/**
+ * spi_nor_register_sfdp_nvmem() - expose the SFDP as a read-only NVMEM device
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Expose the whole SFDP, in on-flash byte order, as a read-only NVMEM device
+ * rooted at the flash's SFDP child node (compatible "jedec,sfdp"), if any.
+ * This lets generic (fixed-layout) or vendor (nvmem-layout) cells reference
+ * any SFDP data.
+ *
+ * Return: 0 on success or if there is nothing to do, -errno otherwise.
+ */
+static int spi_nor_register_sfdp_nvmem(struct spi_nor *nor)
+{
+	struct device *dev = nor->dev;
+	struct nvmem_config config = { };
+	struct nvmem_device *nvmem;
+	struct device_node *np;
+
+	if (!nor->sfdp)
+		return 0;
+
+	np = of_get_compatible_child(dev_of_node(dev), "jedec,sfdp");
+
+	config.dev = dev;
+	config.of_node = np;
+	config.name = "sfdp";
+	config.id = NVMEM_DEVID_AUTO;
+	config.owner = THIS_MODULE;
+	config.read_only = true;
+	config.word_size = 1;
+	config.stride = 1;
+	config.size = (int)(nor->sfdp->num_dwords * sizeof(*nor->sfdp->dwords));
+	config.reg_read = spi_nor_sfdp_reg_read;
+	config.priv = nor;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	of_node_put(np);
+	if (IS_ERR(nvmem)) {
+		/* NVMEM support is optional. */
+		if (PTR_ERR(nvmem) == -EOPNOTSUPP)
+			return 0;
+		return dev_err_probe(dev, PTR_ERR(nvmem),
+				     "failed to register SFDP NVMEM device\n");
+	}
+
+	dev_dbg(dev, "exposed %d-byte SFDP as an NVMEM device\n", config.size);
+
+	return 0;
+}
+
 /**
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
@@ -3204,6 +3271,14 @@ static int spi_nor_init_params(struct spi_nor *nor)
 		spi_nor_init_params_deprecated(nor);
 	}
 
+	/*
+	 * Expose the SFDP table as an NVMEM device only when
+	 * the flash actually provides one
+	 */
+	ret = spi_nor_register_sfdp_nvmem(nor);
+	if (ret)
+		return ret;
+
 	ret = spi_nor_late_init_params(nor);
 	if (ret)
 		return ret;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
