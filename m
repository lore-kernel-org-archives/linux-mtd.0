Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84470CC6B38
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 03:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+Fifx0njlroUNc/ZvxCs3G/6D1cSRgdAHxCd3M7Oz8=; b=d1iaC8dmMneEtj
	ywMevs5ftElZJbPKB8CDoN5ZjqINsGIJDkYylOrNSZWSo0eyaiKxd26icho0bdJfuvyY+IUaNK2ce
	lUNZn8ZmlSJIwzgE4wY8UdqgkhvYcKQM1X/vWnXnozaDriZGmAgMVMJecFPcMKmFDKw1jK/mP95nJ
	BzejXAl+tRcWWKyZz9LCwS+IGHYhV4FfRU/wA5zPT85n6ePfyEhrfGYXWrNiWJm/DsMi/EphozaSg
	DoRykeziK8/q5itd9p8Fgey6ns99BYV/D1FY4RQRnJcr7+uav1W7GZ4jppP48aWKnd2tSqDZ6i6jM
	moLO9i89U0h4BPnU5vSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtM-00000001srq-13Rh;
	Fri, 16 Oct 2026 03:46:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtB-00000001sXd-2C6Q
	for linux-mtd@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CSHtLPHY+Puvgtw6ujh03ffVT/c3YjQWJScgGpszE50=; b=QizGIFss2acrFHDoynuSiUXVVF
	2fYRrbqEV+6PET9oEPzMD7M5n4P/TlLpKHhFo/CQ28N9KmaKBUORfnnDyvAvZW1dtaf0jNk/d7NrO
	kHdZbGqHwPsikd352nL7ApcQbT42p+8B8IpQmXlRqnw/ETDjLS2BeVE8iy1nfBqMPPBu+8Dvvhgzp
	3BAt9JVe/MU8d4DAEQtAJugxIdaKGl97tFYQr/ptN9CzIIPR/W7G16nM2XmiUNlPIttRWHKCrad4l
	9QXufxjYj1SxesJFVawISlo8SEQiD48iNEZYOYkGZlUKgGki/RbeledRXgc6/7l9Keghf+OXgryJ0
	zqGjUbmw==;
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYt6-0000000144X-2XnY
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:47 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6dd7070699eso1929675eaf.3
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 20:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122342; x=1792727142; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSHtLPHY+Puvgtw6ujh03ffVT/c3YjQWJScgGpszE50=;
        b=L66jCCDeU/mNCQD45R/Wjkwacp+Rk3RomH2gC6qjP6uPh+ApsCFIF5ypNCAnWQwCqm
         PqBig0xVmFLk0E6yocL/oZXvswhS5g/aAGhFz7A9CiD6uSGDXoIeeWRFJjnrxrwgdnZz
         CWbcuZuqZjOCD5CWD8APqmsWC/JxOsApCW6zJNxTKC2L+MiRb85Wz8yRiPPy1umDkj4x
         bJvmhDQeIG5YH4EplC2akbtWqnhqjCnFbC5xSA0bHMP1zfhYA7dUrOfWi+1viJ35xF34
         pGXdnTDRJYpsX9kEANws8wR+ozjxm5/7ZJk4BBhbCNhWbSI2TAQKCJ2QMrWIXHg/k4dN
         Bu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122342; x=1792727142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSHtLPHY+Puvgtw6ujh03ffVT/c3YjQWJScgGpszE50=;
        b=x9SyKgwxoZj3II4sp5iKuQF8Wk5kaucpU0yAhFP2Uv635jDv322L29vQiyN0YuCgAE
         VmHhP6C9vhX4DmWopjeurFR2MzhZgWuqax9ryiT5t/4uFmInFqfNSEAdh9gh/lCqVlXW
         +LTF4v5n6nyz2bK7sp3WEHVRjuGTc3RFrqY2jfV9JDrp31wFrU3TKf/hYupyz7pfmZuC
         5/aExG/lTIQiMkKdHEqj89pCEDrJBqiZU/v3vkXZF/VjIK+aNSZsQMWaP//jmmkTE6Zv
         zOdplEsQLInfwbrXdqVvdObE/kmNtoKudJvWBv86m0PePs58ZArs9HpDYeGNMWMWSFQP
         77DA==
X-Forwarded-Encrypted: i=1; AKwUvBwBYGbRFQhAjfVLRt4f03ShciS2FsRZrDzVUX8V1c81T5jY8CpY4PX7QTt9RU/NuUUlCvoQpSjgnXw=@lists.infradead.org
X-Gm-Message-State: AFq9FYIwRjmMcXbhGAVLqGl+Y2zflQAZFKEELYpxtHtNdMvEZkxHeKxn
	Exlto4zDf/DB8Q8xGvKw7dazhSVDGvrCB3jrPJYlvCyyzsf8nZqwkSav
X-Gm-Gg: AYBFou0vhxfg+zF9dUrkootqGz0zf6ehdo9MgWWBU+kjMLrgfbqn9zWgRy+jBjY5jpS
	/+uUGO10st7ox7HWnBJ+8l8hvErnWV+4J7eKhf/eBUYBqEyGw94lF9YvLmbWSFjV6I1BukS2ZN7
	KxIyDh0pIpxN8dKfOJn2S6sct/A8+XU+Qz1f2SWBO6UHynMBrXVzdJ34JMx/b/nn6Tg6yykPV6S
	4L5mazdQpxj9p3/w6+TYfIP92/O+iQ1JNNb3BI6tGQSIqxgqcm7vdoW4j1yGkEfAR7832LuMmJb
	iMEd84ush2JYEdYHeMv18AN+9alyjMlllqRtLrURroJEx5sALP8QFGxa00viCvlC2PrOw2/M/d9
	80xqa+wWumA0dEpjJbw7WeA7fg0uZZqSIwY6YQil0SXdgRP+pq9XGz1roPWb6MQnGihKZIcWFbq
	0fTG3LndPZ/MDhC1MnugfmzsPVvfj27FtKkb0eHor+unQ37090nhJsypKyW1H8PYcGYUB6Ui5al
	7Djss2oSf1q66wj4yCqhSA5Ufn/ksiyjRW4iIZYBnu4/arFAw+1TxGvv8OP1R0yQKel4sGWZaq7
	iO44333bHfDT/nO6iKZmWygBckDBcM0iRsUr27PPoP3Xjw0yWy4It9x7J0IzStAHiw1VFM+PP4J
	/OPVcX3hSgoWRSyoYjKNGq80fZShavT6W
X-Received: by 2002:a05:6820:4c14:b0:6c8:fb02:527e with SMTP id 006d021491bc7-6ef102aa365mr15532787eaf.39.1792122342481;
        Thu, 15 Oct 2026 20:45:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:24 -0600
Subject: [PATCH v8 09/17] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
MIME-Version: 1.0
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-9-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_044544_816356_4ECC7495 
X-CRM114-Status: GOOD (  14.78  )
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

The hardware-ECC OOB writer fills the main-data buffer with 0xff and
calls the selected page writer to program it together with the requested
OOB. Both the PIO and DMA page writers already finish with
nand_prog_page_end_op(), which sends PAGEPROG, waits and checks NAND
status. The OOB wrapper then calls that helper again, sending a second
program confirm without another setup or data transfer. A failure of
that extra command is returned even though the actual write has already
succeeded.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index fcb017f048db..9f03ba22b4b7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1832,15 +1832,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
