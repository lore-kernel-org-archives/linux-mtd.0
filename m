Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5770CCAC5A7
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 07:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rX9uE5Dw8eydjjC6Sj0zVfljzVFjOYli7G+uAO5GwFI=; b=Z6fxUkKTHt1XSm
	e17aGD3M2Fthen6tTy+wq6bHTvCWlEWEGZ8LmOTSli9gT6wd0/g5erDw7s5CKiVox36pt/1GW6BYL
	6L2uL3RnxV+narP1oFIOXSwp/X07rSD7lFxSdYbawvFTOGrWdAAdbqN05jkBQNCYWrApZvkHzHn41
	wv4BkfWBO0WaaOALQGzrqLKWYfi1WntPeZJL0G2i8ehyGEGWK2JD+H6t8Euk96jjyWOkKxKceihst
	pMJ6ORdJyhzF+arxq/jta/F9GhUihHsNv5Jlvlv7vza8b4PdNRTeIVk7xeyw9qXcud/31rs2NOjjZ
	EX+dkXdZsfh2AuKCveBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aiS-000000097ps-0LsH;
	Mon, 22 Sep 2025 07:12:04 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aiP-000000097nH-2bPE
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 07:12:02 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-77f318e12a6so465502b3a.2
        for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2025 00:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758525120; x=1759129920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L51uGeNa8nacgso8hnxd+eYLYxlc+LmoJqaI+35rjr4=;
        b=Uhf3VxAe87Rfv0F46WkK0zR/l/nFtkwTU4Xtl6FLVU4aF4CIQJmKhAQ0P6IFyO/06Q
         cz0V7A1jlJorqTRkutHDs6c3mA1wO2e1VpqksWvfwwiWXZUYbpb0gZKaegTwdyv6lxGd
         z/qPs/GxqLfzTa8SOd7NunzrKvTnNQ56CYJAT1deezRnOg0J/nmgU177gB3o7Y/VpjqC
         lCOf9XZxJxdcWo7ZVF1Cvyh/UivYDnQqtIbbdj1PJ7SQ+ahVKRyiBMQbg15mDnveb7op
         ME54/c1gn0th1lOaA018xV5pjc8sHPE4c67FFcNIJPtJW8N1tlD783h/8pZfikJpTxTh
         63yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758525120; x=1759129920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L51uGeNa8nacgso8hnxd+eYLYxlc+LmoJqaI+35rjr4=;
        b=jtrKlMjNtqropZJhtHbiX8MvqqkwT1D0Ua4uWUFDqNqqLSBuyTxmhPQLEXI2tQMMLM
         zVxTW5aOuwejHrGj1+MzZAs08BCXPu5HW0JH9i4Yo3qUk8Fh9RhEdgcfcDO/6EyuI7jX
         w71vLZBvxQh6YfFo6q2AvW6hgvvsY93Mq2c2/xUCVlgkCCAcd9mEwD3aouD7vOP85eaf
         qbpBtde48sr1V9EttBdo7YYitQ6FdBVBNPkUjSPprG6iFGBO18qLMSTk1BAGNk9K+Cyu
         KPxtlVlqR/5lc8tnUX2pXK7K46sC4orfMfoAAKyUNQVraRd7j9eoFMZ6g2EarR+5rxP4
         6Smw==
X-Gm-Message-State: AOJu0YzH5UjTfcotDTurhYqUQYzlHwzIzKICsEsI5sTuBgn4DAmi0IoZ
	ukt8pVYNJOimXehN/e4RPmSDL0WGfbGxbH7cNsSqAXLpaOfDkx/KotM3
X-Gm-Gg: ASbGncs46gse7XnXtVt/bT/DS+t022ojlvNIuRGXjp/wTiOOEc1gWu4wlf41fu2cOFv
	GP7FX7BF+aBd7QDWv/7mq8IGcwAQ+AGoOOrWIZ2NKqSutnQjQsKZ+xsNtpOeWumb5jI0Wezkhk6
	QGWV1gy/GLj3I2oRlCXmS+8iuXuxJzAdyHKBCbfiZRhQjAirz8xzUc17df/6rs9u25pxETsxhwB
	BUT+vMm8OYJ3uWKUKjU4qqHDtiIYz87t+lB8ypWUFXnFMEfGE0ulV/auzCtnPrs6Z5xNEtlqhlA
	Hmze5FpWel9ngIUnp+P8stw/Qoilb4ZV4UciHvWyb07WUl3o+gNicJ4BWkhIfbnfJIJ1pDOZfWL
	traz3Fk09LzQjxN+TRuhJiM6qQG/DFQCrvE7H
X-Google-Smtp-Source: AGHT+IGwWT3qJv0Y4pAO24DRMgTrXx/7yCgl6MFgRf/c+ull4dMi9MomeuBzlvjoE4YW64QkG7MHMA==
X-Received: by 2002:a05:6a20:e212:b0:254:b352:6479 with SMTP id adf61e73a8af0-2926e37bea9mr16802983637.32.1758525120401;
        Mon, 22 Sep 2025 00:12:00 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55149526cfsm9017341a12.36.2025.09.22.00.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 00:12:00 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	rk0006818@gmail.com
Subject: [PATCH] mtd: jedec_probe: use struct_size() helper for cfiq allocation
Date: Mon, 22 Sep 2025 12:41:37 +0530
Message-ID: <20250922071137.900508-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_001201_660656_DE0EA83A 
X-CRM114-Status: GOOD (  12.12  )
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

Documentation/process/deprecated.rst recommends against performing
dynamic size calculations in the arguments of memory allocator
functions due to the risk of overflow. Such calculations can wrap
around and result in a smaller allocation than expected.

Replace the size calculation in cfiq allocation with struct_size()
helper to make the code clearer and handle overflows correctly.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/mtd/chips/jedec_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 23c32fe584b7..a5d1137ca5ab 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1985,7 +1985,7 @@ static int cfi_jedec_setup(struct map_info *map, struct cfi_private *cfi, int in
 
 	num_erase_regions = jedec_table[index].nr_regions;
 
-	cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
+	cfi->cfiq = kmalloc(struct_size(cfi->cfiq, EraseRegionInfo, num_erase_regions), GFP_KERNEL);
 	if (!cfi->cfiq) {
 		//xx printk(KERN_WARNING "%s: kmalloc failed for CFI ident structure\n", map->name);
 		return 0;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
