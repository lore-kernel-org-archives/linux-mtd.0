Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA09C46CD8
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 09:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6+UXeMq4e4PNMQbjI3e68QiG++Pv4YKTFVrJFYjv94=; b=gE532IeFFf0Tq9
	+yogIbkuEnF4/AfOJDNntcjCCbJBN82umZXEA2IcO5gwSmNeb/bXd4mdZdihoXquxT6CTtHpqSVXP
	Yia8vJPiSauW9PSk1JPFTzuIspoMoIaLy2UtXilFm8+T+AyXjqhpUZYnoKuLsmZc/jX3O/lXmG3cP
	7WhkJ70RWn+08pOJhS9yOmWJSSRPyuLpQTaZ1qOhDCHED01cGntIwumGUgQV/M+nBBRwPyJRxE3N+
	/nbtNIp8wNgXC+hScaLMYn4f6RQM6A5iFp+5/ag2NbIO1SkcDr62DSo/SAAqE06tPZqJLdAZ/fmdR
	BW5ASHKwsAYLf+p1pCdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGF1e-002Azs-2g;
	Thu, 21 Dec 2023 09:07:30 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGF1Y-002AtX-1o
	for linux-mtd@lists.infradead.org;
	Thu, 21 Dec 2023 09:07:27 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-28bd31683a6so473304a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 21 Dec 2023 01:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703149641; x=1703754441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3GyXJb1Q6IVqZm+jxYBDPVvW6P1FYJdkXuzb8mhWu8=;
        b=C6OQrC2fvJIF1jVLGHBap8VBZnThJ0EHBzSM7ECriybYCfVmwMBzz5SjPORSAxnEFK
         adrkdnzRHd7nSW/KLU+BksUpHqK50tAgZuLFEaBamqA3F+0P+vx6D16XPOYGwR2Ucj3j
         srnZ8y9hBlYmJLJ69TpoUcEpxgk7H4GZBRLyr2pwLfSdPPb1V3KGjdTB1RS5UjVpcSdP
         GeuopB5m4hcqwfnrKZgND8JmNhgEaV7BwEXFoCVcOI/1pXYDBZQfe0Mg1+6dmRzrD3iK
         QtubjSqRXbu02aN5Pi22qp9r9WmfuqrlFcAm1hrQzhrs1RdWT/T5bYnyJsGSfR2zJ6sV
         MthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703149641; x=1703754441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3GyXJb1Q6IVqZm+jxYBDPVvW6P1FYJdkXuzb8mhWu8=;
        b=FtZnHs1+ZSxTo+QMkjQvQQTAwIDF6UhtdKVsbZiwLavSBzgzFmP6igTw512dTlfIZj
         JHZL+fjpRUqXNQ7LqmG+swdH2SfNQlIKcWjXqK7lM5Ner2Whs+pusKuxgctBnb131YWo
         c9FretO9IDeXvMfPtv8Vlbwc3DUXI0K/r4Zvi5oKa9W7VF5NMkn1mhqcqX2tMETJti9E
         i4DNGMbvtpWbuRqSonF7+/GEDvKOJ2PsZJVVA8J3zfFRbCXMkUCbIFzhhtSqlzTlijEi
         qgsTUNAjAnobJ3j3RBDZXAT7hmBN+N+e+YOjIcXZhFcpe+yG3GKQ/z5BsZTmetyfaiNa
         c/Og==
X-Gm-Message-State: AOJu0YwuInMx06AGCuRZ4tl/E4mAhUAgNcqf7J1Z9bXgYdEFof3PT6Lo
	ymAunxbDFhVPFTlxivs85AIoywRJBTI=
X-Google-Smtp-Source: AGHT+IEfIvQRZPtgsyOIVSCjH1JabD5sI2s6oId8KgelGs+4WgGuQTSL539Ekmi7NRgVitY4T/gBRQ==
X-Received: by 2002:a17:90b:3018:b0:28b:f559:69af with SMTP id hg24-20020a17090b301800b0028bf55969afmr176220pjb.83.1703149641537;
        Thu, 21 Dec 2023 01:07:21 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm1258827pjb.34.2023.12.21.01.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:07:20 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 2DC5380582;
	Thu, 21 Dec 2023 17:11:30 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v7 2/7] spi: spi-mem: Allow specifying the byte order in DTR mode
Date: Thu, 21 Dec 2023 17:06:57 +0800
Message-Id: <20231221090702.103027-3-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_010724_610650_287674B4 
X-CRM114-Status: GOOD (  15.72  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

There are NOR flashes (Macronix) that swap the bytes on a 16-bit
boundary when configured in Octal DTR mode. The byte order of
16-bit words is swapped when read or written in Octal Double
Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses
8D-8D-8D SPI mode for reading, it will read back D1 D0 D3 D2.
Swapping the bytes may introduce some endianness problems. It can
affect the boot sequence if the entire boot sequence is not handled
in either 8D-8D-8D mode or 1-1-1 mode. So we must swap the bytes
back to have the same byte order as in STR modes. Fortunately there
are controllers that could swap the bytes back at runtime,
addressing the flash's endiannesses requirements. Provide a way for
the upper layers to specify the byte order in Octal DTR mode.

Merge Tudor's patch and add modifications for suiting newer version
of Linux kernel.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/spi/spi-mem.c       | 4 ++++
 include/linux/spi/spi-mem.h | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index edd7430d4c05..9c03b5617fff 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -172,6 +172,10 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 		if (!spi_mem_controller_is_capable(ctlr, dtr))
 			return false;
 
+		if (op->data.dtr_swab16 &&
+		    !(spi_mem_controller_is_capable(ctlr, dtr_swab16)))
+			return false;
+
 		if (op->cmd.nbytes != 2)
 			return false;
 	} else {
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 6b0a7dc48a4b..d4935c5c3c7a 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -89,6 +89,8 @@ enum spi_mem_data_dir {
  * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or not
  * @data.buswidth: number of IO lanes used to send/receive the data
  * @data.dtr: whether the data should be sent in DTR mode or not
+ * @data.dtr_swab16: whether the byte order of 16-bit words is swapped when read
+ *		     or written in Octal DTR mode compared to STR mode.
  * @data.ecc: whether error correction is required or not
  * @data.dir: direction of the transfer
  * @data.nbytes: number of data bytes to send/receive. Can be zero if the
@@ -123,6 +125,7 @@ struct spi_mem_op {
 	struct {
 		u8 buswidth;
 		u8 dtr : 1;
+		u8 dtr_swab16 : 1;
 		u8 ecc : 1;
 		u8 __pad : 6;
 		enum spi_mem_data_dir dir;
@@ -294,10 +297,13 @@ struct spi_controller_mem_ops {
 /**
  * struct spi_controller_mem_caps - SPI memory controller capabilities
  * @dtr: Supports DTR operations
+ * @dtr_swab16: Supports swapping bytes on a 16 bit boundary when configured in
+ *		Octal DTR
  * @ecc: Supports operations with error correction
  */
 struct spi_controller_mem_caps {
 	bool dtr;
+	bool dtr_swab16;
 	bool ecc;
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
