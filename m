Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D33DCA5FED
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2026 20:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f3Xk4rRSiaYBi7ESD0WCscTbUe0OoW20i5sV3IVWvd4=; b=F+POLuQZaU2SuU
	hwEKxnJ1vh+Ntgy5a1VnsjrfH4sumI6Aju26srcg+C8dObuNKYY845sKFQZyPUI/NjMejFbgd60C9
	y6jfON4dcjfSAmtdRFKDoqXW4ZTGVRe/dBgDZUzRbOLWyZlb6+zBz8FcWbMb1RFO1H0kXY5F38DAC
	ChkDPN6A8wJQKBHkJ6IMPvD7B+7S4DJx6IvnGtNiaoLyUocP6xHd7kvNq2z3xe14MpqqqQuJBQDdu
	gFDKHOhjdg2rS6OjKbSvrTpRT+F3OdwXaZO0es9TJmdpuJwIbblP46CX7kj7LFxuXsR+FGg3Czw8P
	shlUglugTbVaiwhkMXnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBLG-00000001LYE-3o3G;
	Tue, 06 Oct 2026 20:00:50 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBLE-00000001LXg-3xvY
	for linux-mtd@lists.infradead.org;
	Tue, 06 Oct 2026 20:00:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so10359885e9.3
        for <linux-mtd@lists.infradead.org>; Tue, 06 Oct 2026 13:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791316846; x=1791921646; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o3DAyDVHNrcV6GLzUE6mqYOVGNLRQA+er+Rt7Tx0w2s=;
        b=jofIQTU0W/s3Ef9FfMYBAW2HQ/+O6b1MKR4MJOlz5PFV3Afb5Camy0MKt2uuLkB1pS
         yCKgTwgsgmKgNV4vuyMhgAA/YVrlJuZgs/wTzll6qTHdZAswvuRpwOnLmn6vnWjhCKoy
         tb8FHgVgM9iyMJBQAvqjp0r9+ejtj4paenwhpA92wcLISzSF3I1JK8HClc3eDPhopk50
         GZkUTPb9W4rabj5PhmuwA5tKZixUf7ptW37Qban8PGGTwMwvZSJuvNnKdFSNR63IvuDR
         KrX//zn+j50WSwfTgedpAAtjBhCgXoP69Y75Nnc4tAze0b4iH/HEZXVktV1dtdtiCqkB
         AGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791316846; x=1791921646;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o3DAyDVHNrcV6GLzUE6mqYOVGNLRQA+er+Rt7Tx0w2s=;
        b=AAN01nKBbgpesZCb5m32SmG5zSj0mXzuL5WZ7EvI/NV9DRI7Dl/bndFaEW3H1GT10E
         4nYZ3ct/bGp/AG+pVJXH5cDjvkfmu/L0Mi9rWvWgimhlI4c5Rq1GJlZqdE584mGQPSkx
         41ufUiKQod83XpCSOmBnSWPBfd2K01yMfE/eyAv9drTskX0am3QGEZ32DMx0AuyG2yiY
         M7nX+bgF0O4GZ3cuwDnhls06Dtz5r5Znx9iOpLTCkIp72dxxY1h1ANATLJXwQ7geblId
         AORQ+sddBhrdi9Tnn1ypFR6WYbZO46eOQlb6lbkp9HaY0YaP3SVoWp2JWbz+jBuJDfQD
         /w+A==
X-Forwarded-Encrypted: i=1; AKwUvBzzNRHzr8QvCPR7pLghVdtBpNPOLlwYRjIq3uOww0j6PpZdS9+wr9wzsvquxXiVQr/GvuiSa0C1HKg=@lists.infradead.org
X-Gm-Message-State: AFuF++m0cr/M70hxBfM5a5DAvv7z8SvZpotzP6vXFO4s5X8rzFNdb+1X
	nk821aROvfED+NNUwV/yKUBnjI4PoWfmKm0gdkZHraqjZj5BfMDKqlnc
X-Gm-Gg: AYBFou0ENpLjcYFMEfjb0tFrgIJ0TsbwlmgHDhPK1LyRS7Rmm+BG2EXdtEUFQ0UQjcA
	51Sgbjru2MVUnEcrT6jPTFPE84prpGLzQXQHyoybutagH5+aWeqNEPuZJrfLpSfwa0s/TEBRIFI
	WBFkPH/9hQVyWAnXN277AyjvjU0+JVGM4iCFU2zuSKVeEOFi7ZtLlrR0VRyBOXKfD4RPCPfMuuI
	LrcpVGZe1fVuO7xL326wEmIJGztbYKcm8nb0vt5rAvetpa1UR7aHDMBIlp8mmLUWNmUx3EWVc6n
	M1w+7/NRrqFT523bGv7OMqhQIzFRo05NlqagtaRVs8IV2wGF7E1R9/um6Lc32NNTePDKO939Ur5
	axJ38/g8SxE9CSjjUmhRBUthSskc+IywFzPcqL65MFMzsrEaqRphk1Fdk5R5id+DiNEhpfxFNJD
	E0jk0T5VZH124t5UjL/CA5PiHeO6pWH6f8iFGDhSWECgfYfEeyFOfQCOeG2N8u6E2Rr3v77Z9JX
	sIqre61pZ4zOqlDyhcVj6VkTe8=
X-Received: by 2002:a05:600c:840e:b0:49e:645e:2616 with SMTP id 5b1f17b1804b1-4a17b5365d6mr54722065e9.5.1791316846361;
        Tue, 06 Oct 2026 13:00:46 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a17f692cf4sm16366515e9.3.2026.10.06.13.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:00:45 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 06 Oct 2026 22:00:41 +0200
Subject: [PATCH] mtd: parsers: qcom: drop setting of partition's mask_flags
MIME-Version: 1.0
Message-Id: <20261006-qcom-smempart-ignore-mask_flags-v1-1-a48d9395b21b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3N3QrCMAxA4VcZuTaQFZ0/ryIioctq0LZbIiKMv
 bvFy+/mnBVcTMXh0q1g8lHXWhr6XQfxwSUJ6tgMgcLQEw24xJrRs+SZ7Y2aSjXBzP68Ty9Ojqc
 jxXjgcN6PBK0ym0z6/R+ut237AW0ir+1xAAAA
X-Change-ID: 20261006-qcom-smempart-ignore-mask_flags-870cc5a294d0
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_130049_049752_D3BF69A1 
X-CRM114-Status: GOOD (  13.63  )
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

The 'attr' member of struct 'smem_flash_pentry' is 8 bits wide,
so it is only usable to mask the lower 8 bits in the MTD flags.
However the MTD layer does not define any maskable flags in
these bits at all. Additionally, the meaning of the bits in the
'attr' field is not documented, so it is not even possible to map
those to the defined MTD flags.

Due to the reasons above, remove the 'mask_flags' assignment code
since it has no effect anyway.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/parsers/qcomsmempart.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index d4fdc46a0073..cd562514f88d 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -144,7 +144,6 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 
 		parts[j].name = name;
 		parts[j].offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
-		parts[j].mask_flags = pentry->attr;
 		parts[j].size = le32_to_cpu(pentry->length) * mtd->erasesize;
 		pr_debug("%d: %s offs=0x%08x size=0x%08x attr:0x%08x\n",
 			 i, pentry->name, le32_to_cpu(pentry->offset),

---
base-commit: 55c5b6d5f59f59a8c98a7effc3195226cc20175c
change-id: 20261006-qcom-smempart-ignore-mask_flags-870cc5a294d0

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
