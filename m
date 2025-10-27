Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6239CCF9E5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Oct 2025 22:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YHaORBXqrf+DOs96aGYBGIDSHLuGl/x6XB1W61v1Vjo=; b=1CFRpobTdFUZkW
	ms15fhxz6IVCGzs6O/shGYr3diEXZd/VIxDNjrAn4rJoLROK0ZTsOogBB0yqgjhN9ATI8Ab/ur3UK
	v/cjwXXFJimbbrnvQ8yHaMhjLSeXjOiYkvRgQnlRCSstRmSWoqhoPypWZeoHwG4oyVC05c+HJ9a9G
	E/wjps26a7zU6NXTklgaBSAa3g3M2580NY7OyV2G4O6lWFI9eQczFnXGkQzpMKH3EAc4reYftOmRs
	qE892ez9d6JfWMDmsTwesbhE5UI1A6Kw9Qk4Fuy1JUuNJZq2wbaZKmx1KMy3M5iZvqsIOk0mLJrU9
	+GNItuSHajbV3EHYjexw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDW31-0000000EteP-0XMh;
	Mon, 27 Oct 2025 22:50:43 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDW2y-0000000Etdw-2kpi
	for linux-mtd@lists.infradead.org;
	Mon, 27 Oct 2025 22:50:41 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-59303607a3aso3169447e87.0
        for <linux-mtd@lists.infradead.org>; Mon, 27 Oct 2025 15:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761605438; x=1762210238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1w+AX96aS3x9N22VGR4gmKULyw2nyqcBZvR0VnAWPM=;
        b=k9uRBdOsETemh3T/ng8UGChWSnNoxrLxtjvA0pc+9EMs0UjziPeSJlnKl+rNi/9nIQ
         xiFUx0SwuM4Qkk53SiXuwFPQ5cRG6B1Rge5ydwYQ3rf44p4Qo65H+KbAaIsHSzplXq0z
         KIrqDrAikoYPlx90pmVjFsABAsfqf6VDV7DCQ4t0KTkYLzgTJXNybI3PZOH/mcJ16Mq2
         D3zAmvzHoHeDKCAVLLBB88W9jmfcI5NSg/C27cbePM+eI8I7wktKtBXhsI2Uz0KHw5r7
         dbDuJE3njw/3fYQB3sIyquERKVKFPi4UiPBFgCIJaH7GJkkp2X7mXKL52y1w/mStrjKz
         vPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761605438; x=1762210238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1w+AX96aS3x9N22VGR4gmKULyw2nyqcBZvR0VnAWPM=;
        b=nHHdH2HZV0WtvQODiPaarQcn+74oERtKEtAPWAxJmFWVxzW4ouqCKrbt3pxHCRd8IR
         dEl1ybTkW0BhbELdhk/Aybi9HFFC7qYsjANtTLdsZu5+42ALA/MHb4EaWdoND63tCMCB
         jziKxBdRqtNu8kS9iMA8XlT2pTuuu7TTPgs4YA+J3wwNZnT6e62P8tDpBOw/kNbHkStV
         MjHwVjG+MOSWShxa9EmsconloeGZ3JvtkDaN40GPMPo6VLPbwn3U+Ma0v6KCJY6O9FbV
         lYZXmsMkMEM0KyzurJA4x9rZ2m2xbjIRYNPl2gO3DUO8d7CuufKUU1jzbDfL8zdoYodT
         3fdw==
X-Gm-Message-State: AOJu0YwckiKKLCyyVfAP5eqiu3PruUSriufb7b9PQ4tkVQvEHkc6spYn
	FnywFN+pP6xsh9kHZiAxZ6vbDUzuM5kfE+SRiBPV4A7mK9zRayOQFcJSdFKLTGh5xR8=
X-Gm-Gg: ASbGncsVRoAcpOMbiFg2g1vyE3wEFUCLAW6R23LCi+Up3/8bhX70QSe4QWF0UB1/LLA
	b9PlTwTORi+xwp4EX3tY9qakJQ2kgvSYMcEiFPMFrS0LZ0f0mgSp4ONps/qpZf+SB3ff239eE7O
	Nc/w9fveMTQ6ucts74D5dCj2wNHAB2mg/Dv6ReNHPMOi7+0xYEAUh7cCiiISfKBiMqkh3KJ6Nlc
	nMsIFHX9W2cuKio2gp4IxGs4aSGnPCZv3zBCARPNzG1tCG95HDyj0xbZVECA4wZNy0NcN20/d8k
	3D93FNHE56OgVCeOqDAdgP6CicVUWUE4IvYSwUx3Qu6Iu80I5G2PoDfNnZPLU2TAeSdEeCvOudC
	QD24j+oRHeFqFeIJ0NKUdvaRVuKLbtnbvLsVxwub79GIXlOCFlVHgdkaROZw1TJbkT0PDBUrKGv
	nPUWAldh2g+9wPF2K9lpq9CIPDpsxu/WXyNjRULTPsCIxTfmlBNA==
X-Google-Smtp-Source: AGHT+IGKY98KGB4eMhON8edDaKLIqG4SI6Ptx5N4o6L3TDTOPJKzY4c9nhjKEqlMKGBqOezwPWgS7g==
X-Received: by 2002:a05:6512:1087:b0:57d:a8e6:6574 with SMTP id 2adb3069b0e04-5930e997b54mr558897e87.20.1761605437820;
        Mon, 27 Oct 2025 15:50:37 -0700 (PDT)
Received: from lnb0tqzjk.rasu.local (109-252-120-31.nat.spd-mgts.ru. [109.252.120.31])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f74b9bsm2659315e87.88.2025.10.27.15.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 15:50:36 -0700 (PDT)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH] misc-utils: docfdisk.c: fix potential integer underflow in partition size calculation
Date: Tue, 28 Oct 2025 01:50:32 +0300
Message-Id: <20251027225032.45788-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_155040_727255_5F081A62 
X-CRM114-Status: GOOD (  12.91  )
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

report of the static analyzer:
Possible integer underflow: right operand is tainted.
An integer underflow may occur due to arithmetic
operation (unsigned subtraction) between
variables 'totblocks' and 'block', where 'totblocks'
is in range { [0, 4294967295] }, and 'block' is tainted { [0, 4294967295] }

correct explained:
Added validation check before calculating remaining
space for partition. The issue occurred when setting
the last partition size to 0, which triggers calculation
'totblocks - block'. Without validation, if block >= totblocks,
this would result in integer underflow due to unsigned
arithmetic, potentially creating a partition with enormous
size and leading to device corruption.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>
---
 misc-utils/docfdisk.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/misc-utils/docfdisk.c b/misc-utils/docfdisk.c
index 486ce29..47e4ff9 100644
--- a/misc-utils/docfdisk.c
+++ b/misc-utils/docfdisk.c
@@ -253,8 +253,13 @@ int main(int argc, char **argv)
 	for (i = 0; i < npart; i++) {
 		ip = &(mh->Partitions[i]);
 		ip->firstUnit = cpu_to_le32(block);
-		if (!nblocks[i])
+		if (!nblocks[i]) {
+			if (block >= totblocks) {
+				printf("No space left on device for partition.\n");
+				return 1;
+			}
 			nblocks[i] = totblocks - block;
+		}
 		ip->virtualUnits = cpu_to_le32(nblocks[i]);
 		block += nblocks[i];
 		ip->lastUnit = cpu_to_le32(block-1);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
