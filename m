Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F39C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 22:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEumw88cQiIBE+UkVcIcRC/24G5/segQxsoO1K3ttAM=; b=lqpwT7oH1qUvLy
	DA77MVE0icFz3PMBvTDb62hDlS9XutAEUM4VV7ja93SgTwXrz/Aan9puMUmGYCPIYr5WDi7cXR1Q0
	mRSkvcLZL0tOJ7Iq4Nbfj95L9lZKaYTUVsvoduexLMQey4ZS9D0pubESPC8g+3ne7gBxMGmsYeKHO
	yfc3LkROBMgYVHIW6muUivpLBycQXYDjyYuONyJQdyfqzyOcr/ohcj2yfFzVu+uEOQccQeYHumfWb
	fi/RF/o74+r534ICP370A3y65UcMAYDQPsAF1i0bCjisNfa/7KJU/oL4hyDxRJbz9OUPZ/L0or/BG
	1cbNfnVLpshyemdde5Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBaX-00GVZa-Hv; Mon, 09 May 2022 22:10:45 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBaR-00GVXC-FN
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 22:10:41 +0000
Received: by mail-pg1-x535.google.com with SMTP id a191so13162072pge.2
 for <linux-mtd@lists.infradead.org>; Mon, 09 May 2022 15:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=alMKmsknHhI0AhJI/0WyOaLnlOsedOXduxWQ3yU+H3Y=;
 b=QHnDHwGsWPYLq/uJABwSAduKBBZJViwCwEhIHKrIAr/d0tk+ssdoitUvhaTCAOS0gb
 nHlviLk5uFpOR5VPA5jwFaZkBXezeiUCt9/3dOYofc2YhRe1Hn8sn0+G4dX7X4QKgWMl
 8HruaUla90Bro/0fIuXe6EdnGmPLg1WxXcbUO8HQc5yUxtr3YlBNPB3yyJFWCED0K9Hc
 p1PYuL0dimzR57825Pct7t49RtxD1GHUJnywtcsUYpWiCURNPOMvXVqaougn0RwOBeBX
 xx0RWhE78ElozqfkjpxfVJ4mdcAyyIpHUN/d9qMRXyo+SXnVRfZYKSxihxo5Sr9qu7hb
 QnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=alMKmsknHhI0AhJI/0WyOaLnlOsedOXduxWQ3yU+H3Y=;
 b=QDvo9IdaeNu54PpqOqEgyx+H28Qyg8zQg+ctCPb1Y0k/BiVt1qPVQzxIS+tR87rIXH
 UXz/wT9gI14/AaPccJMG1HMNG9+K9HlluZIwSNo84TRMbLM4nbOzcbNE1ZlrBotSil5q
 4JVBSlTjjqRtAHj6agEAv7eINWi7kIHxhoKutpRp4JalrSpqg+WeKZ4/RmOeqiVFVIGN
 Au1KK5kR4kVcWbs5RT9PP53gaEc/fBswNB5GfTpmA9brrwGQVYCThZDlyRoGKZZoKlZY
 kvEeQB57Y5e9nR4PhwoVgqKZOuz3652k6ja4WV22RADGOAfLgE7hb9dMG+35CPZL1aGp
 DW7Q==
X-Gm-Message-State: AOAM531XQ4JkIbkrBRMqyhbABoWzWPZNFZ9d9SDLL4f1J1txFr4q4eWP
 KkNLabIdwLcAxiPit9Rfolmhm4Y/Lng=
X-Google-Smtp-Source: ABdhPJwPO8kkkIdATI8ylxXDFv0FUFlFbzygFtKOESAozFaq471WqTJKDUN97ta/REgBFwrRNTyeLQ==
X-Received: by 2002:a62:ce82:0:b0:50d:512f:7b76 with SMTP id
 y124-20020a62ce82000000b0050d512f7b76mr18014203pfg.79.1652134238456; 
 Mon, 09 May 2022 15:10:38 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 q27-20020a056a0002bb00b0050dc76281ebsm9043247pfs.197.2022.05.09.15.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:10:38 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, michael@walle.cc, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com
Subject: [PATCH v15 2/8] mtd: spi-nor: core: Shrink the storage size of the
 flash_info's addr_nbytes
Date: Tue, 10 May 2022 07:10:03 +0900
Message-Id: <fe4cfd3586b9a050c6acde7675a43b8a2d47ea8e.1652063152.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_151039_556190_FF12C41F 
X-CRM114-Status: GOOD (  11.44  )
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

From: Tudor Ambarus <tudor.ambarus@microchip.com>

The maximum number of address bytes in SPI NOR is 4. Shrink the storage
size of the flash_info's addr_nbytes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 5fc3d4a8add1..fe7683fe1b4d 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -493,7 +493,7 @@ struct flash_info {
 	unsigned sector_size;
 	u16 n_sectors;
 	u16 page_size;
-	u16 addr_nbytes;
+	u8 addr_nbytes;
 
 	bool parse_sfdp;
 	u16 flags;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
