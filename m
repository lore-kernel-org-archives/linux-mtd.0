Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD77C83F09
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Jul 2025 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jQ1lYLKN7x7JScxkjjRl7orLyuAIUhLw5ciHGucYcts=; b=e1Ppx5xm7Wl2JE
	dzEGdrJSoIDg32K1Nd5zxHNZJwg5JkCoFSuio5KrcHwmHEbL7E+LiN0B7wDlV+zw/O3SyG5aHgfJw
	4ryOa8IXyPewj4cwB0njzoTcSX9/pOW7EJ0HbW+hoaymK46h1h3N742ys8wZvJ3c1xSkQGNKH9cyh
	djUCfRBPFYirwhGeW2AqKbrtNwQEdJath7j5UfVb8dNPfw/Sv+IcsKauNfU/Vgf5Q/ug5o4ams9Tj
	rHvDuoq7gU1v0jIDD3BDHSmlAsN50TbfDPNIhB/3IWBoWbuqeWp/95Gvhgn9c4a51ZXQkQOszmscI
	DjQT4hScxU/TcLoIjKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8FY-00000005PIt-1fI5;
	Tue, 08 Jul 2025 13:20:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ86I-00000005Nfd-0DMi
	for linux-mtd@lists.infradead.org;
	Tue, 08 Jul 2025 13:11:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-453647147c6so41113335e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2025 06:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751980268; x=1752585068; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5CFLZ9hcT/AZXle1Nxn26WgUyX/jArf2iyT38bDQ0Js=;
        b=UzH8tOJls3FPF4KXNq/DQbIL4P08oqMbedFKgvgA0nXRkDLSARYdvvRlPUolYgRxNd
         /QZL/R3WHFaqtw+rJVEGNhbKyQYDpHJsmw2gNoFkKOy9XVYH8bixsJIKUO4URuc2Kc1H
         xhBX2G8zYeZqW072qzQAyE6ErPG3qM5ljKcCaI8qiIvfdclUgM59dQFnLEs4EZtvvqE+
         t5qTib81Xwjr5j+7mmeDHxomtDEMs2NKI5NA7vWJUEWbjbLgmZnNzXEYwJ5+GRC6Ppmq
         ejO8w0zkMoyDnfNkeBXushWpqVd4bjtkgklzmVa6+4+SNnCywl97RsmvpSQfP+I2nlkn
         AJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980268; x=1752585068;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5CFLZ9hcT/AZXle1Nxn26WgUyX/jArf2iyT38bDQ0Js=;
        b=tUIUDJNc7qky5UMZ1nY03Sj9B27beZkm5reUh4jbCDU8vv2KmJIu2KG6WuydJOm620
         361FD5GM2MmDYWmtHH2tBI0YupsmwU0OCW8oCn/VfLu9J96ZbdEh86L+uIJifD976B6V
         T8LdhpxhjsSPRq3q63AA1sUftkHZt3TGV3JxFgh491LB5V628jvrwri+twphAkTgsCnS
         /Lc6aGNJiVDtz5DYzPX3Nc5vcQegQwRGcLJ2JLDYFbdU/VRlDFZo5hChMm2jfZMxZSbe
         i/nImiIDQIp1FO1hRq6arS+cEjQWwNtTX0iMyXTjbGs47xaOOEWohAhuVAkQaf2tA9uY
         K9Ug==
X-Gm-Message-State: AOJu0Yydn2U+gJfEvV5R4ZohD1KN9NzLw53yvKQkwkRWrCrQ2+xv7uni
	pXsGCJAsMPmh4X5BuBokN4+pXJgNvgiSvA00yHr5FIIwArmnPCcpHj3IgUVmNA==
X-Gm-Gg: ASbGnctfPTbaOAoi8LSwbc955GHL5b+CavFQw7W+as8UiOEX6cRVSea+e8C7FJzWBMe
	MMRQ2ntU7L5KG29SsUP5dGxqtFFVtoIH0eTijjPGiMrn/xZlKPjI1XN5VhqJDRYYZE8BXkernIK
	6DFGJyAdUFN73n9g+7VUx6lZg25JAp07YIJnu3MGApiGDDb2IP1kwUi/BL88O4eKWRioVarxglZ
	fIpOqP0gvYnUU7c+3s+LTVnD3PVUpM5IhiruJ82yn0Z/JI4HGEPz+Wg1LfTzc4AtnXPASV311dB
	S2+6mDNEiQj9yCRRBkBfQ1wtm4lGqP9UEobaN4XdYXuL/mfxJv/z3czi23VlTsW0/8MK9+ksHQD
	ZqtS1GvFQu7dkMIs=
X-Google-Smtp-Source: AGHT+IEw8waJ1n6TchLNXUJJCQV+wy9/oOutx8uhq1vVBJiT8Q8NsUcWDS8GrB5YyK2e0IKXMjNFMQ==
X-Received: by 2002:a05:6000:41f8:b0:3b3:a0f6:e8d0 with SMTP id ffacd0b85a97d-3b5ddecceb2mr2682773f8f.54.1751980267698;
        Tue, 08 Jul 2025 06:11:07 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b471b97339sm13123119f8f.64.2025.07.08.06.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 06:11:07 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 08 Jul 2025 15:11:00 +0200
Subject: [PATCH] mtd: spinand: propagate spinand_wait() errors from
 spinand_write_page()
MIME-Version: 1.0
Message-Id: <20250708-spinand-propagate-wait-timeout-v1-1-76f8c14ea2d7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOMYbWgC/x3NwQqDMAyA4VeRnBfIMqTiqwwPQaPLYW1p6xxI3
 93i8bv8/wlZk2mGsTsh6c+yBd/wfHQwf8RvirY0AxP35GjAHM2LXzCmEGWToniIFSz21bAXFGI
 mFTe/mKFFYtLV/vfgPdV6AbziQeBwAAAA
X-Change-ID: 20250708-spinand-propagate-wait-timeout-a0220ea7c322
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_061110_098253_86816762 
X-CRM114-Status: GOOD (  12.87  )
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

Since commit 3d1f08b032dc ("mtd: spinand: Use the external ECC engine
logic") the spinand_write_page() function ignores the errors returned
by spinand_wait(). Change the code to propagate those up to the stack
as it was done before the offending change.

Cc: stable@vger.kernel.org
Fixes: 3d1f08b032dc ("mtd: spinand: Use the external ECC engine logic")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 7099db7a62be61f563380b724ac849057a834211..8cce63aef1b5ad7cda2f6ab28d29565aa979498f 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -688,7 +688,10 @@ int spinand_write_page(struct spinand_device *spinand,
 			   SPINAND_WRITE_INITIAL_DELAY_US,
 			   SPINAND_WRITE_POLL_DELAY_US,
 			   &status);
-	if (!ret && (status & STATUS_PROG_FAILED))
+	if (ret)
+		return ret;
+
+	if (status & STATUS_PROG_FAILED)
 		return -EIO;
 
 	return nand_ecc_finish_io_req(nand, (struct nand_page_io_req *)req);

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250708-spinand-propagate-wait-timeout-a0220ea7c322

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
