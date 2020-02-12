Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B0EC35242
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:44:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE72D20848
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:44:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jUbOZDhS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9c3B+ET"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE72D20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ez83TAe5a5rWujlS5x3exw3GOyz+4/tOuUWsSTMhGEY=; b=jUbOZDhSmKvgzG
	i0NKLdT3hAveHBPxz5VmygJaeq81WGXJv1F9LRbBOU+Qvvr9BxblQVHIt6jHy5G/GZXagndlg81NY
	l+4CTlUtGMyKxWPCYaPw6mzrlFptBg8UUwcD/eyEzVKOVAx72EwlO3DcjKibwNXKhCd2Z1Ab07B9J
	QITywrQmqDJpKZOW3+nboKzaWuBf+/+6sdAqEBsZZIN5Y/WZiPdElalqs1e6J8KpOiMw85P3Tx4zq
	26/eRS7nnzguBPG0QXGL4pwGYf3TgBVn4cnayZF22rvD6sT0fDyQz2GK2ze3qx5/I6w0s9itU9aWi
	i1Es2T9vE44JCybDoEhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1g8m-0003gl-E8; Wed, 12 Feb 2020 00:44:32 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1g4l-0008H5-PH; Wed, 12 Feb 2020 00:40:25 +0000
Received: by mail-lf1-x144.google.com with SMTP id m30so263193lfp.8;
 Tue, 11 Feb 2020 16:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQvwUELB2lAk2lsQtZP8H2VNrhUPibDwY83BwnWamDU=;
 b=Y9c3B+ETlvveEsikvMHolWK2+/qerHygPjGpuDcQ/n0hRzfAyVEFoaL/+IMhgVyjVI
 HSM4dTDofvtZXO9YIsDpZjF5KiyGe/KSYLfyj/lrgFAqTg+F+HhTNFs2NrR75kkH+5i2
 64dyCzKM3mBF6vbMbd2Vncx7klqcoJPcacr4uH8igr4vZLxjQlrtlVoNOeg7u+NIlwtk
 pVq8ewORb7HXwzgmwlT40EqF0U7gCwYoQsjFgOLjzKfycJ0sHNsYcAemdsvUoHssc/hV
 PR7JNdgu6aRoPkTz5Y2KhggOiVi0wF4+40UKwSDIohurcU6VjH58IHlssvFEcDYXkx3H
 wxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQvwUELB2lAk2lsQtZP8H2VNrhUPibDwY83BwnWamDU=;
 b=scJRIJGuiynqDVoYBQgPpmiw4ZJiV0b7Bc0dc5wyawMgHicJ4dxXvPGvI4cyNeOYkU
 HfP1unOQ7DKayIohsYuBJbfeb7jT+KzJ6eud2vwgxtmtQMhHqxVJFgP6IQQDlyUJdDSN
 W2VETO0P9eWEcL5YkV69bgQMZyBNNIHbHJ1CCAx9wkbQCbt1X7lcHlSOBsg1S6ZI37Sv
 HzmloAvcxgtbyXvqRpusfekx49Omj4DbKTzTVcaQYU2fIjgG5u6dwRDQhfmKAjAbf6Ss
 IKVD1zxJi1ASJVkzCsUX1ZkYELkfPpGf1F7r+lkADP8ElHbXwSntjNyKCoEgnDumyzeu
 w8xA==
X-Gm-Message-State: APjAAAUiAyfr1ZFw5whUbjEYFOBa5iHIH7LrhCnc9lBErkWUZ285fx21
 diPUXtvIxoDoWFZtXnG0LU4=
X-Google-Smtp-Source: APXvYqzrumwlcv4WELKNafS26Pu7ImSy3VMG/Df7kdpl+EF/FXmNAxgvCTLUbWPORF6yRPXkGWwhbw==
X-Received: by 2002:ac2:43a7:: with SMTP id t7mr5135029lfl.125.1581468021768; 
 Tue, 11 Feb 2020 16:40:21 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl
 (109241122244.gdansk.vectranet.pl. [109.241.122.244])
 by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 16:40:21 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: [RFC PATCH 07/14] mtd: rawnand: ams-delta: Don't hardcode read/write
 pulse widths
Date: Wed, 12 Feb 2020 01:39:22 +0100
Message-Id: <20200212003929.6682-8-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_164023_859474_49BA2820 
X-CRM114-Status: GOOD (  11.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Instead of forcing Amstrad Delta specific read/write pulse widths, use
variables initialised from respective fields of chip SDR timings.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index c7aeb940accd..11689218d23a 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -40,12 +40,14 @@ struct ams_delta_nand {
 	struct gpio_desc	*gpiod_cle;
 	struct gpio_descs	*data_gpiods;
 	bool			data_in;
+	unsigned int		tRP;
+	unsigned int		tWP;
 };
 
 static void ams_delta_write_commit(struct ams_delta_nand *priv)
 {
 	gpiod_set_value(priv->gpiod_nwe, 1);
-	ndelay(40);
+	ndelay(priv->tWP);
 	gpiod_set_value(priv->gpiod_nwe, 0);
 }
 
@@ -82,7 +84,7 @@ static u8 ams_delta_io_read(struct ams_delta_nand *priv)
 	DECLARE_BITMAP(values, BITS_PER_TYPE(res)) = { 0, };
 
 	gpiod_set_value(priv->gpiod_nre, 1);
-	ndelay(40);
+	ndelay(priv->tRP);
 
 	gpiod_get_raw_array_value(data_gpiods->ndescs, data_gpiods->desc,
 				  data_gpiods->info, values);
@@ -187,8 +189,31 @@ static int ams_delta_exec_op(struct nand_chip *this,
 	return ret;
 }
 
+static int ams_delta_setup_data_interface(struct nand_chip *this, int csline,
+					  const struct nand_data_interface *cf)
+{
+	struct ams_delta_nand *priv = nand_get_controller_data(this);
+	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(cf);
+	struct device *dev = &nand_to_mtd(this)->dev;
+
+	if (IS_ERR(sdr))
+		return PTR_ERR(sdr);
+
+	if (csline == NAND_DATA_IFACE_CHECK_ONLY)
+		return 0;
+
+	priv->tRP = DIV_ROUND_UP(sdr->tRP_min, 1000);
+	dev_dbg(dev, "using %u ns read pulse width\n", priv->tRP);
+
+	priv->tWP = DIV_ROUND_UP(sdr->tWP_min, 1000);
+	dev_dbg(dev, "using %u ns write pulse width\n", priv->tWP);
+
+	return 0;
+}
+
 static const struct nand_controller_ops ams_delta_ops = {
 	.exec_op = ams_delta_exec_op,
+	.setup_data_interface = ams_delta_setup_data_interface,
 };
 
 /*
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
