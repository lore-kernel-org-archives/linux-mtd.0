Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCC0C77B7A
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 19:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sdqHC/8pn85IXv0bDQsSNjBNbC4cM6sCmFzD++UBjMs=; b=cIxj0jZOhHLFIS
	q2kRcrmJcVtBXNvQ0lp4EabgdTW0pgf0SGkPxS90Anlpd47BH0bh6bmd63ozisJtxNzPSGkawWrN7
	ujEo/qqtWljcTWC0mta2BK+nVXAjJqEbRdnsniP6TLJ9uzgN8flU3UzwTv/nt381jM/GQ3meOHooi
	ZKmqcFbqLdllFj/LKcGvrb2KNpToX4nKz619QUoKHuUHMzRt15Yr2zNmPQUnFeLqy65aeMY0nxBmA
	qR42g6cnwDDKEA0qx08BnzsPiSBeNkrZUVjj8as2YRCX4S+5Csw8NCcsiY9pTC06XxU2VcU/03+iZ
	yrhyqDJoBXoW5K4isWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4oAv-004lGr-3C;
	Thu, 01 Jun 2023 19:41:33 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4oAs-004lFu-2l
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jun 2023 19:41:32 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2afb2874e83so18824221fa.0
        for <linux-mtd@lists.infradead.org>; Thu, 01 Jun 2023 12:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685648488; x=1688240488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=07Cs4CQ5DO1E16iWtYpBiJJQS/hY2lJCobeGVpSPz14=;
        b=BNbaGYUEPpkIx4sUkDST9v15mLetC5t+6DrHUStkqsmV/6rOnG+1WbUPV6OEC2tk4M
         0ANOn1pt0ljW6tJDUFNzzKmbLNf0BKPd7SHcemjWpYUfbUgBnGOnKK8nAYtqmcS/4jvI
         Tu2p5csWgqIX78821O7KDys6arNlhUbw0dXpSkU5W+mcS+KPt/1gUj4nr+aaO6gHtUUx
         F+f5fM2U+aWWK0QhsrzsMlodirxPsmxVSQmNDnQbSIwvXcsyURlrG7BN1uB9PlfFNBOr
         M7oyDZFFdGUv9yCZzabZmNwpOib6rgQ7heO2QAWiQOoay2JCCggkefwlefyv9zi6ry11
         Gs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685648488; x=1688240488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07Cs4CQ5DO1E16iWtYpBiJJQS/hY2lJCobeGVpSPz14=;
        b=EkY4g53KfQSz+X6us/nPu70EXpaIPcbPLa9Z3njkVvdkki3mtsZbjw5+6LGE8LeZsg
         DYpH+0a5H4EI9lgUfZ//DzF58mplA5Jt2fx8TJ6ec/oeeYt1ACAXecg7uYkGbC21gxYy
         o4YCFFiigLKUWlwHx5zDfefqUaDrb3K9KuWDlMRTr07hYL4CBMnfGrrKuRDfp6rWGz1a
         uSrvG93WAdmW+q/zHYc1ByETAa8U8WEoYJHT3szZvCsh3ca2d7kKFwry0TxsIa+FaMc/
         upFSx+S9hdW8leILyebtC7EfPIV7YuooDqcg3E507kMIOLumVD+ns7MEbOkWHeMoueSA
         aKQg==
X-Gm-Message-State: AC+VfDwB78sCNioUHa9ykhPp/Gsko/U0qDj/oto/511eQR21VbAAQpia
	XtMKMlp3ziauX085+M8gL/tx+Q==
X-Google-Smtp-Source: ACHHUZ4h/V0ZRBer47FFwyNEFzpKTVp1xztDqVg7voJCoqd35yq/sZCaCdokL5wLaMjiqXVRAM00nA==
X-Received: by 2002:a2e:8048:0:b0:2af:228a:8670 with SMTP id p8-20020a2e8048000000b002af228a8670mr307386ljg.2.1685648488245;
        Thu, 01 Jun 2023 12:41:28 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id v21-20020a2e87d5000000b002ab59a09d75sm3879222ljj.120.2023.06.01.12.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 12:41:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Pitre <npitre@baylibre.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: cfi_cmdset_0001: Byte swap OTP info
Date: Thu,  1 Jun 2023 21:41:23 +0200
Message-Id: <20230601194123.3408902-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_124130_903719_ADFE01A9 
X-CRM114-Status: GOOD (  15.03  )
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

Currently the offset into the device when looking for OTP
bits can go outside of the address of the MTD NOR devices,
and if that memory isn't readable, bad things happen
on the IXP4xx (added prints that illustrate the problem before
the crash):

cfi_intelext_otp_walk walk OTP on chip 0 start at reg_prot_offset 0x00000100
ixp4xx_copy_from copy from 0x00000100 to 0xc880dd78
cfi_intelext_otp_walk walk OTP on chip 0 start at reg_prot_offset 0x12000000
ixp4xx_copy_from copy from 0x12000000 to 0xc880dd78
8<--- cut here ---
Unable to handle kernel paging request at virtual address db000000
[db000000] *pgd=00000000
(...)

This happens in this case because the IXP4xx is big endian and
the 32- and 16-bit fields in the struct cfi_intelext_otpinfo are not
properly byteswapped. Compare to how the code in read_pri_intelext()
byteswaps the fields in struct cfi_pri_intelext.

Adding some byte swapping after casting the &extp->extra[0] into
a struct cfi_intelext_otpinfo * pointer, and the crash goes away.

The problem went unnoticed for many years until I enabled
CONFIG_MTD_OTP on the IXP4xx as well, triggering the bug.

Cc: Nicolas Pitre <npitre@baylibre.com>
Cc: stable@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Drill deeper and discover a big endian compatibility issue.
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 54f92d09d9cf..7603b0052a16 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2336,6 +2336,11 @@ static int cfi_intelext_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 		chip = &cfi->chips[chip_num];
 		otp = (struct cfi_intelext_otpinfo *)&extp->extra[0];
 
+		/* Do some byteswapping if necessary */
+		otp->ProtRegAddr = le32_to_cpu(otp->ProtRegAddr);
+		otp->FactGroups = le16_to_cpu(otp->FactGroups);
+		otp->UserGroups = le16_to_cpu(otp->UserGroups);
+
 		/* first OTP region */
 		field = 0;
 		reg_prot_offset = extp->ProtRegAddr;
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
