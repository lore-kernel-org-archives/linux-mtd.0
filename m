Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3310AC5DF8C
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2026 01:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2UyFCe3oJhwiBnjylzKaMyusQ+cf9dyO5i2vxrtzti8=; b=FbfMI99h9bQv0D
	d3mZ9sbLOsbjlPi8JZ7LQs1nHwR9Rd0i0rhWcvLU70dVjteXPn3Jnqoa+9mPTRSvDX5DP0IQJnirP
	wlSFgg34GfNkdQZMqkw1NJMC/NESBuAIWpsvUORC02YFliDlXUqhb5HjYvyPkAOoiCFB7T7JRpWnF
	Et6q5VeqgFh7YmUhl9m1u0bmb+XkZIS+TXBeww/0/W/HJ8WpPApGIpIHkqC4Ci47AQF5x3gFEMG5I
	vPGs77WwjBdaa/zQkl6GswzRUYei5t52Nvn6qOmgiBT3S+HvTbOokIAGQckD+kjjusDziZg3Xix+1
	BNvCOf2Idg0yY0nZYNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyJmb-0000000FkWd-21Zm;
	Mon, 24 Aug 2026 01:47:29 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyJmY-0000000FkVy-0MHR
	for linux-mtd@lists.infradead.org;
	Mon, 24 Aug 2026 01:47:27 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c15d111ca99so340696166b.0
        for <linux-mtd@lists.infradead.org>; Sun, 23 Aug 2026 18:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787536043; x=1788140843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7rz8dgykUp+ozQhFiKOeiCPVDIWYM2DLnaQT/Ow0S90=;
        b=ShmDkYOUc+EmFX24NIaXdA382SW6t83DgL/33akJXYzuyyJAxa1m/4UHZEevrN5Cy/
         GwF8glr1ZgpsG6rF2wR++2QG89QB4SYZK+SYnr0q29jb66xbNMJp/NaxrjeKIBoBZp8h
         ut8jKKw2YIXLftqkn6rYWOeytgyWaCXwmzIELGk8ysl8F4rKANaEc2FMznZDrbek1cIJ
         SgdkLQle71CDE+n72r4y/XFehv5fUnTtkHPfajFKTc5inVdw8H2Slue49Thk3E3kQaYF
         9J8v8eDRGRa00UIs75Czv2icSri4/KkNeC7NUMX8WsqJYWMFM3HqYOrI5YzDa+q8Ryjf
         XiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787536043; x=1788140843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rz8dgykUp+ozQhFiKOeiCPVDIWYM2DLnaQT/Ow0S90=;
        b=gcYT9lIOhYQNCA2BnB0VA9nEr7jFCzxKDT9HGKHRuwYPIedniLo+0aHRFRkYAfGqG+
         yE5YFY2xQorq3CPfOyDyU0uUqpgtK4CEgrutFH9ZBKMXcMWi/+/3PlMFZALPwEx7GsnQ
         JjDfVIQVd0sIM7jSliOa4p3DeVbNLvcupnjQpjQXVHZWt7xOzCLXeScK6+FLzhA6iDfb
         +VN81R7oJP1JukkHN6bYcYh4EKH8zPGykBxWNTiRM+DMLBEmUwyKiHZJVRyO2Dlfd5sP
         wsC15GzSiYvoW6Ue/Sjg62wJvfHVYw38TccO32JudOTGgb9/kDZv1ha72SeUTdlGv2n9
         SqfA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6VMUKLFtdO+kySS1/vRUAkFThxyNDevFj4NrOZ/JOGwMRQ5OOUfnKnuiDLLtUxtmiA9IV2NdsftA=@lists.infradead.org
X-Gm-Message-State: AFuF++k+/ADpzNaDA6ntaEVq0TqVqd9WTTAp8VmLYlF5HTloAOxGpi1z
	ztdRMEgp1w49z69+gTqMf9GwqBj5/+5FeZqevskJ1VwOU+Yyqy2Sfftj
X-Gm-Gg: AR+sD10YDoi8MhQWeUzWH/TuFjP25ZtWq7awuLiiHPBl2f+WRDfDx3zpp0QUxI2R+qo
	MKc1gh3qThn9W/VkTfAteaQNGbTCi+CEDUp71MpOmWT5VqbfQpbWlkEJIfWPtM5CoIlFbFFGTIs
	jx4GQOCWiQ4dOdZXGXgT4mcAPUEtSdwfix+ivaneuKHTRsvBYNWf2cOTpMhLu4CyKqSepWohmSH
	HCvB8r4FF+6KeGn1gLyiP4t4PtPNaX9vfYcjYzWYJN/ircdqEFgj1ytlvIBgsKzdMEZPqozmqBd
	JI6FlpG4w8H50m8fGbt9go9yerG0hsdUx/kT+My5RJDwJ4QLg0t1Mr+BKHOnWrNYWKN7fI0QGzL
	C/uZMDiqoJ4zyz447AOegl+KoNT77VBA0z00YxwyMdwEWS7Cbp4/yKh+ODCxANfSsSgKevZ7cEs
	lpk7i8vwn2+hzDfEK74JJR8NyUviyw9skz8tPIXTJEZ0J46jO5Pu+Bka+jXe6M47NJa5lPDQMwB
	uRfVLGPf6dbKCXLgikbaJFde50k2WW9u8t3kBt0EM4C5nDedJx4AEP4eI6iHW9tkc6b8/JwWg0+
	gsMwHkcHZNV9zXLYuJ9UGtKs5CJ/L+LqlWG1bhEoi0S5LVejQLgY5KyDoH6NV+ayoav3
X-Received: by 2002:a17:907:9999:b0:c20:fda7:1856 with SMTP id a640c23a62f3a-c24925a76f8mr1728156366b.8.1787536042970;
        Sun, 23 Aug 2026 18:47:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b027-cd01-554a-ffde-5279-f351.310.pool.telefonica.de. [2a02:3100:b027:cd01:554a:ffde:5279:f351])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f6b48sm1006377166b.33.2026.08.23.18.47.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 23 Aug 2026 18:47:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Laight <david.laight.linux@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: cfi_cmdset_0001: shrink do_write_buffer() stack frame
Date: Mon, 24 Aug 2026 03:47:03 +0200
Message-Id: <20260824014703.56502-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_184726_183974_2A7DE03D 
X-CRM114-Status: GOOD (  15.86  )
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

arm32 allmodconfig fails to build with gcc:

  drivers/mtd/chips/cfi_cmdset_0001.c:1883:1: error: the frame size of 1296
  bytes is larger than 1280 bytes [-Werror=frame-larger-than=]

With MTD_MAP_BANK_WIDTH_32 a map_word is 32 bytes, and with KASAN_STACK
every temporary gets its own redzoned slot.  do_write_buffer() builds a
map_word for each of the twelve commands it issues, and those temporaries
dominate its frame.

Issue the commands through a small noinline helper that takes the
command as a plain value and builds the map_word in its own frame.  The
sequence of reads and writes to the chip is unchanged.

The helper must not be inlined, and reusing one map_word local is not
enough: clang cannot assume the callee does not observe the local, so it
still returns each CMD() into a per-call-site temporary, and the frame
grows (1760 -> 1824 bytes in cfi_intelext_writev(), into which clang
inlines do_write_buffer()).

Frame sizes with MTD_MAP_BANK_WIDTH_32 and KASAN_STACK:

  gcc 15.2   do_write_buffer()      1296 -> 520
  clang 21   cfi_intelext_writev()  1760 -> 896

The helper itself takes 168 (gcc) / 160 (clang) bytes.

Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Closes: https://lore.kernel.org/all/20260408211407.2295175-1-andriy.shevchenko@linux.intel.com/
Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/all/87ik9cfm6g.fsf@bootlin.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 42 ++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index b73596a8e021..a7c77c4e76ae 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1716,12 +1716,24 @@ static int cfi_intelext_write_words (struct mtd_info *mtd, loff_t to , size_t le
 }
 
 
+/*
+ * Keep noinline: inlined, the map_word temporaries put do_write_buffer() over
+ * the frame-size limit with MTD_MAP_BANK_WIDTH_32 and KASAN_STACK.
+ */
+static noinline void __xipram cfi_write_cmd(struct map_info *map,
+					    unsigned long cmd, unsigned long adr)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	map_write(map, CMD(cmd), adr);
+}
+
 static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				    unsigned long adr, const struct kvec **pvec,
 				    unsigned long *pvec_seek, int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	map_word status, write_cmd, datum;
+	map_word status, datum;
 	unsigned long cmd_adr;
 	int ret, wbufsize, word_gap, words;
 	const struct kvec *vec;
@@ -1740,9 +1752,6 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	if (is_LH28F640BF(cfi))
 		cmd_adr = adr;
 
-	/* Let's determine this according to the interleave only once */
-	write_cmd = (cfi->cfiq->P_ID != P_ID_INTEL_PERFORMANCE) ? CMD(0xe8) : CMD(0xe9);
-
 	mutex_lock(&chip->mutex);
 	ret = get_chip(map, chip, cmd_adr, FL_WRITING);
 	if (ret) {
@@ -1759,7 +1768,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	   So we must check here and reset those bits if they're set. Otherwise
 	   we're just pissing in the wind */
 	if (chip->state != FL_STATUS) {
-		map_write(map, CMD(0x70), cmd_adr);
+		cfi_write_cmd(map, 0x70, cmd_adr);
 		chip->state = FL_STATUS;
 	}
 	status = map_read(map, cmd_adr);
@@ -1767,21 +1776,22 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 		xip_enable(map, chip, cmd_adr);
 		printk(KERN_WARNING "SR.4 or SR.5 bits set in buffer write (status %lx). Clearing.\n", status.x[0]);
 		xip_disable(map, chip, cmd_adr);
-		map_write(map, CMD(0x50), cmd_adr);
-		map_write(map, CMD(0x70), cmd_adr);
+		cfi_write_cmd(map, 0x50, cmd_adr);
+		cfi_write_cmd(map, 0x70, cmd_adr);
 	}
 
 	chip->state = FL_WRITING_TO_BUFFER;
-	map_write(map, write_cmd, cmd_adr);
+	cfi_write_cmd(map, (cfi->cfiq->P_ID != P_ID_INTEL_PERFORMANCE) ? 0xe8 : 0xe9,
+		      cmd_adr);
 	ret = WAIT_TIMEOUT(map, chip, cmd_adr, 0, 0);
 	if (ret) {
 		/* Argh. Not ready for write to buffer */
 		map_word Xstatus = map_read(map, cmd_adr);
-		map_write(map, CMD(0x70), cmd_adr);
+		cfi_write_cmd(map, 0x70, cmd_adr);
 		chip->state = FL_STATUS;
 		status = map_read(map, cmd_adr);
-		map_write(map, CMD(0x50), cmd_adr);
-		map_write(map, CMD(0x70), cmd_adr);
+		cfi_write_cmd(map, 0x50, cmd_adr);
+		cfi_write_cmd(map, 0x70, cmd_adr);
 		xip_enable(map, chip, cmd_adr);
 		printk(KERN_ERR "%s: Chip not ready for buffer write. Xstatus = %lx, status = %lx\n",
 				map->name, Xstatus.x[0], status.x[0]);
@@ -1800,7 +1810,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	}
 
 	/* Write length of data to come */
-	map_write(map, CMD(words), cmd_adr );
+	cfi_write_cmd(map, words, cmd_adr);
 
 	/* Write data */
 	vec = *pvec;
@@ -1837,7 +1847,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	*pvec_seek = vec_seek;
 
 	/* GO GO GO */
-	map_write(map, CMD(0xd0), cmd_adr);
+	cfi_write_cmd(map, 0xd0, cmd_adr);
 	chip->state = FL_WRITING;
 
 	ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
@@ -1845,7 +1855,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				   chip->buffer_write_time,
 				   chip->buffer_write_time_max);
 	if (ret) {
-		map_write(map, CMD(0x70), cmd_adr);
+		cfi_write_cmd(map, 0x70, cmd_adr);
 		chip->state = FL_STATUS;
 		xip_enable(map, chip, cmd_adr);
 		printk(KERN_ERR "%s: buffer write error (status timeout)\n", map->name);
@@ -1858,8 +1868,8 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 		unsigned long chipstatus = MERGESTATUS(status);
 
 		/* reset status */
-		map_write(map, CMD(0x50), cmd_adr);
-		map_write(map, CMD(0x70), cmd_adr);
+		cfi_write_cmd(map, 0x50, cmd_adr);
+		cfi_write_cmd(map, 0x70, cmd_adr);
 		xip_enable(map, chip, cmd_adr);
 
 		if (chipstatus & 0x02) {
-- 
2.39.5 (Apple Git-154)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
