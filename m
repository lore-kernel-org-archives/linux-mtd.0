Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7DAC2BB3F
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Nov 2023 08:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDnebJtfPirC3krSVGgNrz8s/10MLK/5T9ndV04DwQk=; b=YstxLqr43yags1
	65bVkRy1K8sAoyPJDpiNkPYeo1thUfnJD+puvpHLpyOsv232gLUHKzf3mXorXV6QcgC0LXU/UsJwb
	BPishVRDhEUq5D0xsMZVv4ihAy38bJyEKS8hGok0iLb58yc4DinOzGjxOVAHIgL/WmFdk/U71nSVt
	GefC8s6cO/W3Cx4i01PXddmBkq0y/Xd8d1ir4WUZaEZTVTzFbrF1kvYMy9VCUINUUfA/o/TFg4omO
	ZFVV/2C1y6hNU5lP+Xp8Y/cJxM+xcc7lLK0Dy34VRVhLPrkn3KCLFQE3gCQP7v78QWXhxrBNK9NH5
	7DYzLPHx5ckouYIKvRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4GkZ-00869B-2p;
	Sat, 18 Nov 2023 08:32:23 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4GkW-00868c-0t
	for linux-mtd@lists.infradead.org;
	Sat, 18 Nov 2023 08:32:21 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5c1f8b0c149so1515876a12.3
        for <linux-mtd@lists.infradead.org>; Sat, 18 Nov 2023 00:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700296336; x=1700901136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRANfzk8DzwIUFYJFYbkxOxGetsmi0eUJR18Xl/qRK4=;
        b=M75GE4RzuawKxfmTbYaFR9eosMRpd0ZvySBdjq3ef0SmtRjAW+jLa50PTftk+Fnti7
         ey2sJUwv8bA6XviqwEbZfl5ZJeomqSrcDQ2wZgoN2OPgKKkMS2a5yWX3L47XgnfFRFim
         C9EZFWi+NmnmI5KT80rFpxTvhxGo1A84h5T38TRJhumgJjkkka0oI+54hOnE8EwJi3i0
         DOHXgHqjKGWANMjnD2wZReQF4mx1Cr05zRvwO8mNKtE59DpiacoAi9Kyd7DTbex1PCwO
         s1VPyPZxYrhrUueo8FPa4NT1TTQB5JmETqaIUAI29sHUudG6X6FMKIOKLPi9toEzhd4N
         5chQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700296336; x=1700901136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRANfzk8DzwIUFYJFYbkxOxGetsmi0eUJR18Xl/qRK4=;
        b=MAC68oKZ/yHSbslLj2amnjrJsItCl+jCVGIzevW1SnJvuSmIthA+hP1k+0qKfhHJk3
         yrH9QP5upfZLs1fcZtWuS2zp/dZTni+ayOugdbZRLFxAZgsr/QKodQa1iCAw1V7fM1hO
         yrbhrKyIausvYvHnR2Qnz3YWndUR0Iac/tmfiCUkdYjx0vyxUI2SOdyy29V7Oxt2fHLS
         Gj9d8L+QLP2zMAZcyOTNbnAFJ6DQQ6diDsiW/NrQlXBTN49VBp7ZLOt3LO2JmswqgNPg
         9YdfGDf7CvM2gsU24JynKCy1AzxQZtQvbWgy3PuKL6ncex5IPH1VuvZnAw+MQzr4ZgRh
         YCsw==
X-Gm-Message-State: AOJu0YxC0ch0J+Csh0mgtUvoHcw7ld6G+A1Zvxf1IPPL09f4Jz8stzNT
	8oZpsaewGRiABcMavqbEet4=
X-Google-Smtp-Source: AGHT+IE13xiSJX75T0VlBR4pVfBBh7BsR12krg4aaLio2bGeoPLCw/utRUbdBwIeF12lBtHoaYWxFg==
X-Received: by 2002:a17:902:d304:b0:1c9:b207:d412 with SMTP id b4-20020a170902d30400b001c9b207d412mr2112867plc.37.1700296336499;
        Sat, 18 Nov 2023 00:32:16 -0800 (PST)
Received: from eagle-5590.. ([103.137.12.142])
        by smtp.gmail.com with ESMTPSA id c8-20020a170902d48800b001ce5b6de75esm2532059plg.160.2023.11.18.00.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 00:32:16 -0800 (PST)
From: Ronald Monthero <debug.penguin32@gmail.com>
To: miquel.raynal@bootlin.com,
	andriy.shevchenko@linux.intel.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	heiko@sntech.de,
	martin.blumenstingl@googlemail.com,
	paul@crapouillou.net,
	robh@kernel.org,
	u.kleine-koenig@pengutronix.de,
	debug.penguin32@gmail.com,
	AVKrasnov@sberdevices.ru,
	r.czerwinski@pengutronix.de,
	jaimeliao.tw@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Poonam Aggrwal <poonam.aggrwal@freescale.com>,
	Dipen Dudhat <Dipen.Dudhat@freescale.com>,
	Kumar Gala <galak@kernel.crashing.org>,
	Li Yang <leoyang.li@nxp.com>,
	Liu Shuo <b35362@freescale.com>
Subject: [PATCH v4] mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand controller response
Date: Sat, 18 Nov 2023 18:31:51 +1000
Message-Id: <20231118083156.776887-1-debug.penguin32@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114091302.1f865d66@xps-13>
References: <20231114091302.1f865d66@xps-13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_003220_337119_CBE94359 
X-CRM114-Status: GOOD (  11.31  )
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

Under heavy load it is likely that the controller is done
with its own task but the thread unlocking the wait is not
scheduled in time. Increasing IFC_TIMEOUT_MSECS allows the
controller to respond within allowable timeslice of 1 sec.

fsl,ifc-nand 7e800000.nand: Controller is not responding

[<804b2047>] (nand_get_device) from [<804b5335>] (nand_write_oob+0x1b/0x4a)
[<804b5335>] (nand_write_oob) from [<804a3585>] (mtd_write+0x41/0x5c)
[<804a3585>] (mtd_write) from [<804c1d47>] (ubi_io_write+0x17f/0x22c)
[<804c1d47>] (ubi_io_write) from [<804c047b>] (ubi_eba_write_leb+0x5b/0x1d0)

Fixes: 82771882d960 ("NAND Machine support for Integrated Flash Controller")
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Ronald Monthero <debug.penguin32@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 20bb1e0cb5eb..f0e2318ce088 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -21,7 +21,7 @@
 
 #define ERR_BYTE		0xFF /* Value returned for read
 					bytes when read failed	*/
-#define IFC_TIMEOUT_MSECS	500  /* Maximum number of mSecs to wait
+#define IFC_TIMEOUT_MSECS	1000 /* Maximum timeout to wait
 					for IFC NAND Machine	*/
 
 struct fsl_ifc_ctrl;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
