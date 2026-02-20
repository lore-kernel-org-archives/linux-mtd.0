Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95094C55175
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Feb 2026 09:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZndxL1ovc2ZlRoNW9I5/jU7pCpQ5l+fJfXOTtAvjmPA=; b=1yeieO0SyTo6yo
	LE/wL25UPSDH7TRwDMkh4fJ6x/5I5d9S6AqJ+HmwFW+Vgb9Afugujdos63OV1B4Erbf5YZ2ARCHKX
	6NIneo9WdId2K8S+h2bEGjfBSqao2zI3QqPRQnkaWLOlWvWBi/SbHv+FQFQ3cUEu1Nbw6dP52RbmF
	oRFkS8C7OxARUr2Z3mfvQcvDZwwM8Ka4mSgimslcQIm5XXN22DYRVLY7KGOEFKjQC6FY0/zR1i24S
	e2Usu0BI9BwrrnThYeGKjRapivZBQSQ0FvwxKcvukanUoQSUtpGjN8VJNlnkykDS85YbZ7WJbklzj
	B/5LcpkguSPSJwbKI9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtN3U-0000000DcAk-1fZb;
	Fri, 20 Feb 2026 09:44:12 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtN3S-0000000Dc9T-1CDb
	for linux-mtd@lists.infradead.org;
	Fri, 20 Feb 2026 09:44:11 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so1202775a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 20 Feb 2026 01:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771580649; x=1772185449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxR8y+DDVU/sD2lLySC6/WbxsSmg5U6pRubVnyPkrSo=;
        b=HZ5YT5K98uM3jkQ7LVC8JvbMz6rHql9ST4u9FowP6FCJvb+FeMDRVbHg8QB2RgWNSt
         841BFjqeU+1OUvhg4suJsjuAXWXUwvXb3Ww0UYdbsWfeyokX+RMeCcL6CK7r7ssaI0vr
         wTw/X53H3aDYH+5y8yFps92/EkLPY/TlKF/BNoyJwPWU9ikS5q79pqY3zf0SOpNJruKH
         eHHfvd5+NCWDilrrvfHCIJUNYxPqdgItnoZUAs4qX69NVhl/XfJljXUKQUi5sr/Pua1b
         ar2u7Z47pI4M22MzGhtKq29/QThfK12yt/DTAHvfqPRMvRN67634ftrDTcGX862RZVmn
         xeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771580649; x=1772185449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZxR8y+DDVU/sD2lLySC6/WbxsSmg5U6pRubVnyPkrSo=;
        b=O7nMAdbNC+SSf2mxC3a5Ylr2j7xVxAgZUs4iKl+iYZYJgv1qhIHbD50RQ0n2YofAgO
         uoJlSH9ta1XhssUvUY/jYOW8dHQic1T03s1QIjK/Xz9bC++PtcbNQc8mkVUHywOD5z89
         k+hEvp+w7rshIm/Xrve7rFaBG8JTs3SUgNBPS8H1aOSTdvJCAbP0e0I8bcqCC+PBeoNS
         vTpFT5S1v+wEAs+7RecrmtkvXr3EegCeAXFlS9ISArUJrIc1bmAfcGzw2k0o/TqEU/ZB
         Zxf/rqk4NAhBI2DHVlLYeKRbLQwRXP4YdpQnAUY5cNsGVkc06xe2dh+mmu+eSQNRGMcM
         NyWw==
X-Gm-Message-State: AOJu0YxJYbZF2Bl2B4mGlbdgySV/LK5FEfy4y6MBbv7cQuVzZb1pljqN
	19dlt0KAxbWxLP6uWHdEemd2EGAWFMJhxG8f/Sg1XWPLU6IkGg6Wq0+R2J2hOw==
X-Gm-Gg: AZuq6aIpUIl8gQvMPkRgAYdmpTisAZZwZ/KhrPlzkdyHoHa7inEcNWKHtTG/0iUzxaB
	Ky/8hX0Nrv9ioBcdhOfTBrQHvasnxHjl3LOZuYXiS6AHlgaJgJqWoNKzQt1oe3PrQ8agKu903Xm
	JinIwElkSl1Og+XqARaw6ISi5XdId275NYQeR1TcCXjJnDG4X9fYYPFuTfNr2YG6HRMPaZXVLZB
	r8dwywl4HR4/AEVbsZ64sQ+lT/DXS4K7nPRiZWNKaM9zFiIm8E4wDcrV97NrGifPOWLR1CCvH3S
	awi8Ba0CldUZ4ZP62hmTYV10zPW+T0PlJrT5eE0GPpcUP/RZCy4ITEt0tcrqS4NdHM1x4lcdaHL
	tV+ho8glwVthHdCAczPbRbSU+1KS5tO+tgGucWUSTikOkZyzqOzgyDb6yAryApD0Mq5cEQkvZVF
	h4e6m7SWdmby/SCevoO2IBeDQvMZexFw==
X-Received: by 2002:a17:903:228e:b0:2ab:2bc5:4365 with SMTP id d9443c01a7336-2ad1747b69fmr212269585ad.19.1771580648956;
        Fri, 20 Feb 2026 01:44:08 -0800 (PST)
Received: from f0d65881db18 ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1ace5e25sm185309555ad.91.2026.02.20.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:44:08 -0800 (PST)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org,
	Sanjaikumar V S <sanjaikumar.vs@dicortech.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] mtd: spi-nor: core: Fix AAI mode when dirmap is not available
Date: Fri, 20 Feb 2026 09:42:36 +0000
Message-ID: <20260220094236.28-3-sanjaikumarvs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220094236.28-1-sanjaikumarvs@gmail.com>
References: <20260220094236.28-1-sanjaikumarvs@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_014410_326133_90F612E4 
X-CRM114-Status: GOOD (  12.13  )
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

From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>

When the SPI controller does not support direct mapping (nodirmap=true),
spi_nor_spimem_write_data() calls spi_mem_dirmap_write() which falls
back to spi_mem_no_dirmap_write(). This fallback uses the operation
template created at probe time with the standard page program opcode.

For SST flashes using AAI mode, this fails because the template cannot
handle the dynamic opcode and address byte changes required by AAI.

Fix by checking nodirmap and using spi_nor_spimem_exec_op() directly,
which uses the runtime-built operation with correct AAI configuration.

Cc: stable@vger.kernel.org
Signed-off-by: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d3f8a78efd3b..7caeb508d628 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -281,7 +281,7 @@ static ssize_t spi_nor_spimem_write_data(struct spi_nor *nor, loff_t to,
 	if (spi_nor_spimem_bounce(nor, &op))
 		memcpy(nor->bouncebuf, buf, op.data.nbytes);
 
-	if (nor->dirmap.wdesc) {
+	if (nor->dirmap.wdesc && !nor->dirmap.wdesc->nodirmap) {
 		nbytes = spi_mem_dirmap_write(nor->dirmap.wdesc, op.addr.val,
 					      op.data.nbytes, op.data.buf.out);
 	} else {
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
