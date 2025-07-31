Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102E8C83F17
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jul 2025 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Fsho173Zlz8C7Dsfov6OE5wnw+ZTtUJDYo2xdgGQMs=; b=0uMucjgGGa07HH
	ee1jzzzvbXW4QiY9H30PmISjWlApce4GQMMBp0GYZsSac6jHOokCSAck5ZKJMPZ2Eqci93Zh8Zjcr
	W0FPgMAB8fetXcjJnCa2XDkopj1qQvDWgUnCSi+ao0NyIsVM3ASK/Ep8p1j/yMGiv7J8s1YfR+/6N
	TgteEr4J/lIq9yD7alR++i1uKScBO8GEn6JYwFuv6TAPs57hRuLIWEPgof7ZMtM+Ym/toU7v+n5Nq
	N++khJ/7EcKNiJm1Bdh04KSuwPlRMzNZti3nmLDC4qgPAJmCQ5Cb1waHwVGHBpviRd9aejGi8//lb
	sNHXdYE/A/RndydapaPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQ0l-00000003Jvu-0P2v;
	Thu, 31 Jul 2025 09:55:43 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPyV-00000003Jnc-48gx
	for linux-mtd@lists.infradead.org;
	Thu, 31 Jul 2025 09:53:25 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3b7920354f9so630786f8f.2
        for <linux-mtd@lists.infradead.org>; Thu, 31 Jul 2025 02:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753955602; x=1754560402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HsMG0i3+AqfjEpu+Gh56Ls+b7M6/eRJtSrOLqrmM+JY=;
        b=e55J383d1CamJ3mTFsHc8EA21hO8iNt8ZXUz0zhbnd0QvEM8Kp0KICZRMjYfwtsraO
         mYqmo6oALKy5rSRGguPnuCn6LqufLWPDvTwRrvw7DEl7JnEQ3FLW3HKvKMbrIfyhvpxo
         TqkNJJHY89VdLMeFhBrTdrWiKuUFctTp8O4ABagX2+Mum1NK61kxgINQZkBJxlvT4NDN
         ZXFNY2ZadLH4zNdNM5pC0cGx+KVc96tqvzv+C9ofb+u3wwX9TEvSdeaEq8qRc1spUgLU
         Bo2ZAsXUOgl8VYahV1/kLO0VWA5nlpvqPdfAkUCMkEW4XF4I5bHE1YB6m1Ozsumbo8pI
         438g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753955602; x=1754560402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HsMG0i3+AqfjEpu+Gh56Ls+b7M6/eRJtSrOLqrmM+JY=;
        b=F7HuJd4lpLt0h+K/j00WCY2TMYiglKb46tsqVmrGUKTptRO2fhYkFZ7TDUUnR1bGmK
         h1xNbK2E7lGOAp94CvBLcfdpNo9AJKUdkQXjBMJU7kNoM6Nu2AanmmikoPcu2JxQ53pn
         qwt/AxCnOMcA9fozEj8MeJchdqPoaNoPcgoDIWOgaGVH4dTv+BEkiOJsrbvspWbuk5e9
         g9rXnRDUi0UmTuUH/W1v7pohF0/psOhWk9FWkvWzUYpJwO2NCZv3lOuaZo7b33SzCc2j
         gAwnwXBYUQqV8K6RxgVibDeXB7fakfY86zPMn30+bB5IH5b8M6iHOofN/+GoEpCOTauu
         ZaRg==
X-Forwarded-Encrypted: i=1; AJvYcCVtT1/0iiXKnT+q/NzCQ7XgnvT+V9ImV/biZH0ESMSHZZrde1zjsCo61yMiedcjiy5zUtaV8eQEz5Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4GEBTsQVeimuh61YW5wAjKT2OBkS20yPB8/W5D8B7OeKE4WBm
	JSGInbWnKlvv6mCz3Hzm2U01/tk5/vyCQboGWa3VKcIjd0BMd8q/pi5O/ACtLjvdbqFQ0A==
X-Gm-Gg: ASbGncuXP236blUe6wqttBPmhUbQtdtG42XCMrDLxYjr1CF9o4VI3rAFTgKGxPJIHa5
	iYK+jiiBL9CZPOq+NmTS2Izi926/F7GE/zB9GW1wupjlWqBuZhcyQSyJNZIFix+NB3iNDQsSfWE
	1CCy2BIw8yV656lZDsE6xWIXtNYAa5hM8XrVoXdFOyDn2a6L6vT3D+S40T47iyFMiLZYbCGKOVX
	t0ROaWyKh+yaYBhoNDBpiMSLCQGKTNTt8t6MurA2Adg1bBFL3vfdRTrQfkUCuH6iaW3eORUYHAU
	MpIgW20+6WK+4UQlNfGf6T8MWu2cND2T7RhypXmOD/KbNfcZhn66601jcV32DDqww3Ds2pEhNqd
	0lAP0YxMOmuoM53a2KDO5mMl3JGi1Le8=
X-Google-Smtp-Source: AGHT+IHS+Yna4XLdm1AXyYdne1Nc2qQhOZVR/XY/PwPIfRBT/zicTIWQPLhsl4HER3UQKSwd/WutEw==
X-Received: by 2002:a05:6000:178f:b0:3b7:8473:31c3 with SMTP id ffacd0b85a97d-3b794fe4fa7mr5105901f8f.9.1753955602212;
        Thu, 31 Jul 2025 02:53:22 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3bf956sm1918578f8f.24.2025.07.31.02.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 02:53:21 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] mtd: lpddr: Remove space before newline
Date: Thu, 31 Jul 2025 10:52:47 +0100
Message-ID: <20250731095247.2165158-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_025324_035408_452D2D26 
X-CRM114-Status: GOOD (  12.64  )
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

There is an extraneous space before a newline in a handful of printk
messages. Remove the spaces.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/lpddr/lpddr_cmds.c  | 10 +++++-----
 drivers/mtd/lpddr/qinfo_probe.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index 14e36ae71958..290fd0119e98 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -142,7 +142,7 @@ static int wait_for_ready(struct map_info *map, struct flchip *chip,
 		if (dsr & DSR_READY_STATUS)
 			break;
 		if (!timeo) {
-			printk(KERN_ERR "%s: Flash timeout error state %d \n",
+			printk(KERN_ERR "%s: Flash timeout error state %d\n",
 							map->name, chip_state);
 			ret = -ETIME;
 			break;
@@ -186,7 +186,7 @@ static int wait_for_ready(struct map_info *map, struct flchip *chip,
 	if (dsr & DSR_ERR) {
 		/* Clear DSR*/
 		map_write(map, CMD(~(DSR_ERR)), map->pfow_base + PFOW_DSR);
-		printk(KERN_WARNING"%s: Bad status on wait: 0x%x \n",
+		printk(KERN_WARNING"%s: Bad status on wait: 0x%x\n",
 				map->name, dsr);
 		print_drs_error(dsr);
 		ret = -EIO;
@@ -321,7 +321,7 @@ static int chip_ready(struct map_info *map, struct flchip *chip, int mode)
 			/* Resume and pretend we weren't here.  */
 			put_chip(map, chip);
 			printk(KERN_ERR "%s: suspend operation failed."
-					"State may be wrong \n", map->name);
+					"State may be wrong\n", map->name);
 			return -EIO;
 		}
 		chip->erase_suspended = 1;
@@ -468,7 +468,7 @@ static int do_write_buffer(struct map_info *map, struct flchip *chip,
 	chip->state = FL_WRITING;
 	ret = wait_for_ready(map, chip, (1<<lpddr->qinfo->ProgBufferTime));
 	if (ret)	{
-		printk(KERN_WARNING"%s Buffer program error: %d at %lx; \n",
+		printk(KERN_WARNING"%s Buffer program error: %d at %lx\n",
 			map->name, ret, adr);
 		goto out;
 	}
@@ -736,7 +736,7 @@ static int do_xxlock(struct mtd_info *mtd, loff_t adr, uint32_t len, int thunk)
 
 	ret = wait_for_ready(map, chip, 1);
 	if (ret)	{
-		printk(KERN_ERR "%s: block unlock error status %d \n",
+		printk(KERN_ERR "%s: block unlock error status %d\n",
 				map->name, ret);
 		goto out;
 	}
diff --git a/drivers/mtd/lpddr/qinfo_probe.c b/drivers/mtd/lpddr/qinfo_probe.c
index 137ae5f0a19b..42281e460c62 100644
--- a/drivers/mtd/lpddr/qinfo_probe.c
+++ b/drivers/mtd/lpddr/qinfo_probe.c
@@ -55,7 +55,7 @@ static long lpddr_get_qinforec_pos(struct map_info *map, char *id_str)
 			return minor | (major << bankwidth);
 		}
 	}
-	printk(KERN_ERR"%s qinfo id string is wrong! \n", map->name);
+	printk(KERN_ERR"%s qinfo id string is wrong!\n", map->name);
 	BUG();
 	return -1;
 }
@@ -112,7 +112,7 @@ static int lpddr_pfow_present(struct map_info *map, struct lpddr_private *lpddr)
 
 	return 1;	/* "PFOW" is found */
 out:
-	printk(KERN_WARNING"%s: PFOW string at 0x%lx is not found \n",
+	printk(KERN_WARNING"%s: PFOW string at 0x%lx is not found\n",
 					map->name, map->pfow_base);
 	return 0;
 }
-- 
2.50.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
