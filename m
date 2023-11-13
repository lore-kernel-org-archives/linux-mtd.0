Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FB2C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 17:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2t5a16Wg4f9cd1ZUKj6C7phKDjZ8RASlvq6+FHayBGU=; b=VwKeT51dt3VRdb
	zLBygTGOaepyRDnkR1q3r8B2K1kvBck/Fy/tBwT9uDwSmINpWEWBrT9Qrl0E7tS5zcXTSflLVHxd7
	BoCQgG9BJ4LS50esSPum3Hle6Zxr5Eb61uFk7RuTi0zRUKgNXYRUXeMTgLlzJB3PBI663f0UsRa99
	Qj4SakNuNa9ftzIL7vwlIoZG4EU1lIh7iuQ365TYPyZWdaB3ZWjTRN6Rdy0XxymwQU3x7ZK4+Mzwf
	ojtbAQRWiKLSUq3XSid84LIuQj7fII8bJxNly/PCtkD1VWFtVJUOLcBbClprMfgwI6aqwbwaOwFSw
	f2sQHamDSbAR8yQeT9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2aoK-00EOiw-1H;
	Mon, 13 Nov 2023 17:33:20 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2aoH-00EOiU-1t
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 17:33:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso3562342b3a.1
        for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2023 09:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699896794; x=1700501594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIiFWyxFC1HOSVVyldmWbIpiXOMSUH/VwjcC908opxI=;
        b=c9wWLhDxoZUMYmuvZ8uBHIXI/sqz3nXQt4KR6nm6Iy/g2cxRju7Yw89QbjL3wUOc4r
         qJZpxy55kdgdGxisODdQSVf+38uRtJJzew05gY9LHcmRzpunNMRo8+yG/0szJanVqinn
         u1X2s3osJl5AJcr0RJrdqlOlQdBqkciw9dlY6dQeBUiTFL7G6ByP48brSDEH2VcsnOcd
         nLjSqJbX2YqO3xTNQlZotXwoJIiYET7wr8SGJQP+WlxWALfBZuQB7FeCDcwlohx8pQv/
         nhfF54WPacIKCJwQXn1Kc1jBlJ2DnEY7Bv7h1kbOx+TqlWV5aICpFzamTsaWQ+7AyuUR
         64ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699896794; x=1700501594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIiFWyxFC1HOSVVyldmWbIpiXOMSUH/VwjcC908opxI=;
        b=lzJYMfa/Ct+/odu/dJF6MqTdt9lzq3h7M5Xc4FNQzWm07kY7rFJpCXDyoMSzjhlOLI
         /EzxahahmpiB9FSwdKa3hfA0UldddaKripRtRcqX307+ex9DbTjOfgiZKlykGiaiy3NL
         Uw6mB6Of/ACanVHuxc6rWGIqgbC8/Q4W+vpRgCYItQMhbhLZrM+4NJEopX2YYV1zEYTG
         GwA5iYehNzWlB9KIUhAU+5ze2ePgWyqUWyXE2humsboKHY7WHEgPA/fFJdnB4qcSA2Dh
         +r5bLN9byPZgf0YOTYcwobM49JUoG0tUVilGQ9cMXsmBz/jq2Gf8I7+loUfOb/72VI2i
         uLfQ==
X-Gm-Message-State: AOJu0YyX0t9PZWsTCJJXpgEe1L+/t2Z4bIMQ2g8TqHydMnUR2h547tZ+
	4sLNVmW2+grhONaDdBHn2CA=
X-Google-Smtp-Source: AGHT+IGDOTw4btLadk30e4pq3hs3nRiRTYRanmEDZrDxKxqMOnKUAA/7bsT8bFo4wKSI4J9uD9B78Q==
X-Received: by 2002:a05:6a20:430f:b0:17a:f4b6:bf89 with SMTP id h15-20020a056a20430f00b0017af4b6bf89mr174764pzk.31.1699896794496;
        Mon, 13 Nov 2023 09:33:14 -0800 (PST)
Received: from localhost.localdomain ([149.167.148.33])
        by smtp.gmail.com with ESMTPSA id v65-20020a632f44000000b0058a9621f583sm4210456pgv.44.2023.11.13.09.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 09:33:13 -0800 (PST)
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
	stable@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH v3] mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand controller response
Date: Tue, 14 Nov 2023 03:32:49 +1000
Message-Id: <20231113173251.623268-1-debug.penguin32@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZVJJAReXiEVc35HZ@smile.fi.intel.com>
References: <ZVJJAReXiEVc35HZ@smile.fi.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_093317_624675_7C8799D8 
X-CRM114-Status: GOOD (  12.23  )
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

Cc: stable@vger.kernel.org
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
