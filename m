Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21029D2F007
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jan 2026 12:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7aRsRkxB+NJCzIwq+3CQrNtGODBxqvvMwaQWKP54tS4=; b=f11C9hVBfP/GFv
	qRjBa/q7cbJJrgWIT3gq7ZA6U9JIAvO52Rd6aNfbqKFsE2OvyP/Acp6KS87sPWygQY1egkswnKc/T
	leTfSFKQhRjE1un0v4O6xOMfAmUvXWMsKBlFFfYcVloI31nB9XM2Ckv8G/cfZfw6o+2fCXPbt8eyH
	AXmWgT5AgBi8XxilKOATgKpAGsVat4QZOx3vQuI/2Z9G9itvYNvKLTsSAO8k89RwFBjlbh/OZZPJq
	ZMTTUrnVDIo3c1/8KUsP9SPiJfPLFmXwIgxjiSc4k8oUqLpdxJoLbVW5zEW80wAkdZW+e1piiVy9q
	goHb7F7M4L5gE+7ySDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiE0-0000000EFSY-1knh;
	Tue, 27 Jan 2026 12:31:16 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiDv-0000000EFSD-0BEk
	for linux-mtd@lists.infradead.org;
	Tue, 27 Jan 2026 12:31:13 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-59dd22b9895so6708113e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 27 Jan 2026 04:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769517067; x=1770121867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JINEPCDyT2QanQm/VHLfLa88YrcpPiW2Yh6YxQdESZ4=;
        b=cRxkAUVN58s+ULfWQGsJ8PIWRGWYOiQU3wfA4eNtd8YyIvW9uo/qo9jDRnFsfGV4lD
         6+Z7EtuTpvmigQ7JyimyYGPEbMWwPFwaDPJaOC4YkQGeBv3bJL4H7sYin1og6c1yYVhf
         WCoMyXbKeR3Am39CNkNaZY7XeZAJfETrZDwmrkb/gf/qfIVCIVCfQZDe7GFkX/ZdJXG2
         ICtvlL3V0GcbXEE0204Q9WjksUiUqvvM6AIXvq9m7IJBtOLVhf9/2dSh/OzQXSIWWVDL
         FHZQR38W+rILaWE2g60AXpFQlJ0QGv+e2eJOW0Rl9Ptviz7gvo7bj7gAUmLmjl9ak7qg
         BRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769517067; x=1770121867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JINEPCDyT2QanQm/VHLfLa88YrcpPiW2Yh6YxQdESZ4=;
        b=Jxjtr5xRU2A9E/2aOj0FQdYXuYsC4G33TPA1ItrMxcluEC/Bnqm3ftUYGlJY+JdRal
         6O+r47m1+g7vbfVLloZtKqR3z03wXwAkbD/9+pBmm7byyUKigD4iFSFsrs2fa6EkNnBJ
         Dn5Sp7KP32rXxTN/sXr15pesEYAYRqYck6iJhjEUAbdpzCwqFZNCZokmz2ZGDJ9W5JPp
         rc1MHyCHHvTmRLG+Cql1TsjIqX+tAprh89/zeZZPmJzuPUSJWwtuqwyGB6ZVD6lpDhiJ
         pl4Uru3psx4atqVV7EEiktGdCs6ClAcHN+OgtLCZfDXXSp7AfmHRBHQmz8lTIP6kkLdH
         T7fw==
X-Gm-Message-State: AOJu0YyEs+MF/bvJxLwaY2k64SGLh2r3y4NgXusbOxl5uBQFymgvkTww
	/nsE+8iJQLAYJ7aBxcStEFBzgDdfiJEJDZmFqZHSqcz8/TCdcyo5Typ6gHCJyHZ0Stw=
X-Gm-Gg: AZuq6aJ/MR+SNqiPJ9zjk8ICwkreyaPUaiqL97M7QwJvwAIj2+uzopDh/T9eIId3y7p
	xceBrGy3n/B0zt4qwzxFVNUBmbgMRs7tT78Nj2oB6HH8FsP4dmZfVh3fMlnA35SqYdbGPM5XW4F
	3qVovpO4jrWCCZu1877+vW8QAQKvypXTsT/H8YC8VixqTpVY74lytUUvr3wFFgi94MAQw+UkIM3
	0MTkU6jyFiNhToNsJBXhKMmiVNtlexJ0endl5oaf8Qs3hgpc7JI1/0NCBmbAEk4fGKWg5OdsW8M
	xk2dztD0tJykRK8jcqMhvrELnCxVVDBEGsYfqdXavW2CcvJgPfZSYZRPWV4i8EPjQE5+4aEcABv
	1ubwXAzHUYWvOW6NeHsEEA4xeBk9upW6T5VpzrvYzVlsMzVUGl664cleX64awxbVp4Ytm2knyCk
	GPDEgZdyEPHSuVIgOiM05Uc05SiYI57g/zIDIaFKAZOVvJiamsrkpty81tvsE=
X-Received: by 2002:a05:6512:6ce:b0:59b:b3dd:4675 with SMTP id 2adb3069b0e04-59e04024326mr629904e87.5.1769517066384;
        Tue, 27 Jan 2026 04:31:06 -0800 (PST)
Received: from lnb0tqzjk.rasu.local ([178.66.156.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de49189f8sm3483933e87.50.2026.01.27.04.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:31:05 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
	Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH] nftl_format: prevent unsigned underflow in INFTL virtual unit calculation
Date: Tue, 27 Jan 2026 15:31:00 +0300
Message-Id: <20260127123100.47486-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_043111_091938_625D5C7F 
X-CRM114-Status: GOOD (  10.84  )
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

When formatting an INFTL partition, the code computes:
    numvunits = (ezones - 2) * PERCENTUSED / 100;
If ezones < 2 (e.g. due to user specifying start offset >= device size),
this causes an unsigned underflow, leading to a huge and invalid numvunits.

Add a guard to ensure ezones >= 2 before subtraction. If not, abort with
an error message, as a valid INFTL partition requires at least two erase
blocks for media headers.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>
---
 nand-utils/nftl_format.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/nand-utils/nftl_format.c b/nand-utils/nftl_format.c
index c8b8b50..3667be3 100644
--- a/nand-utils/nftl_format.c
+++ b/nand-utils/nftl_format.c
@@ -371,6 +371,8 @@ int main(int argc, char **argv)
 		maxzones = meminfo.size / meminfo.erasesize;
 		pezstart = startofs / meminfo.erasesize + 1;
 		pezend = startofs / meminfo.erasesize + ezones - 1;
+		if (ezones < 2)
+   			exit(EXIT_FAILURE);
 		numvunits = (ezones - 2) * PERCENTUSED / 100;
 		for (ezone = pezstart; ezone < maxzones; ezone++) {
 			if (BadUnitTable[ezone] != ZONE_GOOD) {
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
