Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07E4C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 19:07:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CCB664F77
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 19:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CCB664F77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HTywq2d9UoteJ22k+zSLjApliR6cCtQNtEd+YQgCXoc=; b=coOmUMKXcsZeq4WEGHj1OSJrt
	avCAMH3HQlLNTvbr+NwecBzOa8YaxEfrNLSG3WWzUv6qJONjOUpVpKWtFh1/wefKE2xigiVfo+/gi
	+vIWUPbF7awDH8rgUwCVRjZgOkkib3/J5M1GZK+RqvfNpGy/shvmvtJz0wlSxPw/xWzcdrM3Nwf/c
	047DafZXO9NcB82HC/NozQN7cLD3lRWDHBdXIBwN4uS6+PQ+QrWCGgnZjkuz5hIynvzonvrGWfSzh
	5vnyH9o8oBzXkDOu114EyAySTqhXqQxfHjq46jzcV7A8G4mNIRLPUj6skUVSLsG1mRipHEYWDup3G
	WqYBT070w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKn74-00CFQM-UA; Fri, 12 Mar 2021 19:06:18 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKn6r-00CFO0-3A
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 19:06:07 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 18E5D22246;
 Fri, 12 Mar 2021 20:06:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615575964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6+KxuP01OXn0P4BC96DpLPW6zDJBUCK1si/Mhm3vETY=;
 b=uFdxA+J9wKJe1up+L2tmP70GjgkcwqQqLn6rrQw8tKjaXfNZFxVMRY8Z1PPQepdLHJ6KU7
 M0qeo3lfCOZ22IQpR5UCM606r48VpNrIIVR0CK36y7J18Eik51gNtSQOHhF9uPqyOKDQQQ
 NOKXiEjw0U3gdEq8k8JoVnMrzWpom8w=
From: Michael Walle <michael@walle.cc>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [RFC PATCH 1/3] mtd: spi-nor: sfdp: remember sfdp_size
Date: Fri, 12 Mar 2021 20:05:46 +0100
Message-Id: <20210312190548.6954-2-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312190548.6954-1-michael@walle.cc>
References: <20210312190548.6954-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_190605_219648_5DD4B15D 
X-CRM114-Status: GOOD (  14.56  )
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

Save the sftp_size in the spi_nor struct so we can use it to dump the
SFDP table without parsing the headers again.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/sfdp.c  | 12 ++++++++++++
 include/linux/mtd/spi-nor.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 25142ec4737b..b1814afefc33 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -16,6 +16,7 @@
 	(((p)->parameter_table_pointer[2] << 16) | \
 	 ((p)->parameter_table_pointer[1] <<  8) | \
 	 ((p)->parameter_table_pointer[0] <<  0))
+#define SFDP_PARAM_HEADER_PARAM_LEN(p) ((p)->length * 4)
 
 #define SFDP_BFPT_ID		0xff00	/* Basic Flash Parameter Table */
 #define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
@@ -1263,6 +1264,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
 	struct sfdp_parameter_header *param_headers = NULL;
 	struct sfdp_header header;
 	struct device *dev = nor->dev;
+	size_t param_max_offset;
 	size_t psize;
 	int i, err;
 
@@ -1285,6 +1287,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
 	    bfpt_header->major != SFDP_JESD216_MAJOR)
 		return -EINVAL;
 
+	nor->sfdp_size = SFDP_PARAM_HEADER_PTP(bfpt_header) +
+			 SFDP_PARAM_HEADER_PARAM_LEN(bfpt_header);
+
 	/*
 	 * Allocate memory then read all parameter headers with a single
 	 * Read SFDP command. These parameter headers will actually be parsed
@@ -1311,6 +1316,13 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
 		}
 	}
 
+	for (i = 0; i < header.nph; i++) {
+		param_header = &param_headers[i];
+		param_max_offset = SFDP_PARAM_HEADER_PTP(param_header) +
+				   SFDP_PARAM_HEADER_PARAM_LEN(param_header);
+		nor->sfdp_size = max(nor->sfdp_size, param_max_offset);
+	}
+
 	/*
 	 * Check other parameter headers to get the latest revision of
 	 * the basic flash parameter table.
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index a0d572855444..a58118b8b002 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -404,6 +404,7 @@ struct spi_nor {
 	bool			sst_write_second;
 	u32			flags;
 	enum spi_nor_cmd_ext	cmd_ext_type;
+	size_t			sfdp_size;
 
 	const struct spi_nor_controller_ops *controller_ops;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
