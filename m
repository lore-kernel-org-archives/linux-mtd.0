Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EE3C98328
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Sep 2026 04:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9WDuqMRC/9uYp3uAuPIMOZsQyD1Tr2oqYqt0RD08utg=; b=0Pw58lZ6YlTFXf
	npRO54a4A7Sc1wnXXKQupc5GO2JIJj7i8yn5yN2JFODkQHsmGnY9AhAhvOanNNOr9UXTM5SWokyl2
	LEmn8Bpk+drPTYeR3on8iGH4h7iVnkcMCWANMk7JW7oRAMZyZM423r8i89xTlzjAuBM930T96hlf8
	qwBiCQts8LsCWJqY5Un0vynbIFhQUAnaxHW0UVlPdn+dosVkjzgqlAYbERTcp/fau/VLoPZsahOF/
	L+3L0EimNbqBh23PANtPoF4MnDpHedAfSQSXYsXWYzGmTqZqcmQOtDiBH+adllg2NWfMcljc/e/2D
	QpRBVewPaWP2MhGpCdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAK22-0000000Ex4c-1H3V;
	Sat, 26 Sep 2026 04:29:02 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAK1z-0000000Ex49-3aIQ
	for linux-mtd@lists.infradead.org;
	Sat, 26 Sep 2026 04:29:01 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398beb616f5so798134a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2026 21:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790396939; x=1791001739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZYtb7HyZs5jwg8H8lmzZlpM9HbrBErAFFHpko/rscE=;
        b=Ywufosf7UvYIBnp5UTc6gIyXjm0F6sFoC2UwGX5HvalfG6YVrskwBvIVGqgkitKjDq
         lMR+0V56piH7Uof5pXqP53E/M6XtcHpkYNGVfSm3JnzGxdLZV2y9EbH/ViuR9iEmPizV
         ++08hyT8tqYepF7JX+ZFj1Jcwa6H2rBr9TSDkXb0xZKbSCkAGm7/ysgpUK/A6jTm5J14
         Zc/gVtkqIw0F5n7l0BC+R4huvndhycUHjltNL+sKtLOyrGD841xrVpT32YlzVhlU9T9N
         bOuelUhtaXOu9sXijowEGDVbUSM/zgOQaINTRLjEmgSiSW+VfzamBONZt5J8pz4GRxcJ
         p6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790396939; x=1791001739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZYtb7HyZs5jwg8H8lmzZlpM9HbrBErAFFHpko/rscE=;
        b=HTHN/TxsDC1+3HnRPrKhaAou/CTv3BoRrRBRYQNJpsN2lO3UoTR4gd6tYrkkW4h6QY
         /ntD91zgm4Zwh2EohN64lrMgfhzggKSLKTc+CNTT+jTCecoywJ/osWTXF4BvF4et0Vym
         vOcHPXWN1pPbZ2cSL8/u5KMJIWpqKBJdBosO3Ww6/RZHeUWs7Ney4mOB00ZXrYO0F7Ga
         EACuYvPDF7NlFU6apm4/+iA813bS3obDVC6GqJ4nE7Ki1zDYq7UyguB1ntXu/Mg/1qvr
         GGJZRELFNWX3gSDWNWR8l9AMpt/01GRXUbQEkb6ewlqm05EkVJQqv9CEy/42mQ+OQbzH
         ciJQ==
X-Forwarded-Encrypted: i=1; AKwUvBye8I1uXYsvByp7ngC39VgutBMbjL5DclLQNzMlaM9GCWTOZmCSC6VnEb0izjYfLw8ogOjzmPQqJxQ=@lists.infradead.org
X-Gm-Message-State: AFuF++n3XYzREhxjKM1B1658hLtM5AiQvieq57gkkvz2NUviFovK14T0
	hBvIfixb27VbVXL1rXE9dY+rbHlrmPn+EJ+nRcspfu23kBlGctuVp6C1
X-Gm-Gg: AYBFou1A0C1D8yu+7UdMHjph0RUpnVsCJoPAyIbmhik7kvwowqmHRZQLs0lUOhr8K9v
	jFSYZoDzIemUsrOhAC6LIQ4+TYMvlLlYtSxqe3YrTOVzN7uXb2xrFiebnIymzF+zNakFlTAPHoH
	UPPo2Qj++U1gGkke4z2ZTGVT8iaULiTzEsC8T9vDdAKVmjTWq/fHSDzcxOrNer0LUe3NI+JLnUV
	S9EQPRuxCT9irCKI7Y6G9QrORn2Exezj2HfIAmsIFLH/Wcisl8TpekKyu8EC4reawrA82aJo+M4
	MdhmDluHoKFb7dGl3/i/qeI61SRLGjNBzavfYjmrWnifPrFYTAnay0B8/f5FhFxKkT2ycRzNM2E
	GzMGAG0VygTRkzRCtqrnlZgOr+YdmAl6hHO2hZSO9ksewaHVjkN4JO1DhxaaW0bGCzBKKHv+xWT
	LUtIP1IMDzt9ZAkw9HkHbdDITtxDVcoqN21U+t8JeX45J+WEKHG9kdJWUkdtoQkJE5I6VwGK1r0
	y0cN3HLEFWIoiDu9JBeP8k3A73lUGy+PAcN5I3ySgnN2qOYoC2pMmswLCsy6gC5QBz6HEyU2odn
	71WLWWBltvgYRejziDDNg9fD5LTYC/7ayjRMkA==
X-Received: by 2002:a17:90b:2645:b0:3a0:c85a:ee12 with SMTP id 98e67ed59e1d1-3a0c85aeef6mr1436224a91.41.1790396938711;
        Fri, 25 Sep 2026 21:28:58 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09773e7c3sm13841518a91.17.2026.09.25.21.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:28:58 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: parsers: qcom: fix offset/size overflow on large partitions
Date: Sat, 26 Sep 2026 14:28:53 +1000
Message-ID: <20260926042853.2209428-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_212859_896380_1789FC10 
X-CRM114-Status: GOOD (  12.28  )
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

In parse_qcomsmem_part() the partition offset and size are computed as

	parts[j].offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
	parts[j].size   = le32_to_cpu(pentry->length) * mtd->erasesize;

Both le32_to_cpu() and mtd->erasesize are 32-bit (u32). The multiply is
therefore evaluated in 32-bit arithmetic and the product is truncated to
32 bits before being widened and stored into the 64-bit (u64)
parts[j].offset / parts[j].size fields, so the 64-bit destinations are
never used at their full width.

The SMEM partition table is firmware-provided and the per-entry offset
and length are not bounds-checked against the device geometry (only
numparts is capped). On a sufficiently large flash, a partition whose
(offset|length) * erasesize is >= 2^32 gets a silently truncated
offset/size and is mapped to the wrong region of the master MTD, which
can overlap or extend into an unintended area.

Cast one operand to u64 so the multiplication is performed in 64-bit and
the result fits the 64-bit fields without truncation.

Found by static analysis tool CodeQL.

Fixes: 803eb124e1a6 ("mtd: parsers: Add Qcom SMEM parser")
Cc: stable@vger.kernel.org
Assisted-by: LLM codeql
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---

Notes:
    Compile-tested only (ARCH=arm64 allmodconfig, W=1). Not tested on
    hardware, and there is no reproducer.
    
    The CodeQL query behind this report was synthesized with LLM assistance,
    and the fix and changelog were drafted with LLM assistance; I have
    reviewed them.

 drivers/mtd/parsers/qcomsmempart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index d4fdc46a00730..1591aea48b280 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -143,9 +143,9 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 			*c = tolower(*c);
 
 		parts[j].name = name;
-		parts[j].offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
+		parts[j].offset = (u64)le32_to_cpu(pentry->offset) * mtd->erasesize;
 		parts[j].mask_flags = pentry->attr;
-		parts[j].size = le32_to_cpu(pentry->length) * mtd->erasesize;
+		parts[j].size = (u64)le32_to_cpu(pentry->length) * mtd->erasesize;
 		pr_debug("%d: %s offs=0x%08x size=0x%08x attr:0x%08x\n",
 			 i, pentry->name, le32_to_cpu(pentry->offset),
 			 le32_to_cpu(pentry->length), pentry->attr);

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
prerequisite-patch-id: c5a3be8688fd8e88a00352acb1374e91fcb52a03
prerequisite-patch-id: 67693e2c08624df0841619cc085ce9200f4385fc
prerequisite-patch-id: f3d73f7c19be7e952aa8061303f53f9a08576a88
prerequisite-patch-id: 541e578709d048f4c8115f1d926be2f2c03ecb0e
prerequisite-patch-id: f23f8e0693435497645805822d98a92e57fb46f3
prerequisite-patch-id: eae82895db8ba67018a777a91a283ad6bc4a55b2
prerequisite-patch-id: aed00f7502865e3f9262959d828eae4a4021108f
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
