Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC14C61DD6
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2026 12:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=51yLFymGzv/hY82Cz3i29ga7vNHH3GREMC75l6OKdc8=; b=2bN1bPSqycEq0z
	HL3tz//W5lQDAJ1RfX7suUvzrZunSlYtq70PJh0JiGzAJFEEb2RmrsjE3iLO91rz0ZNA9RUMhYsDw
	QnVTh89YAvwkasxd44+afFWWEMdMzAukcPR0zlaOLFE5xBE4ULrKsUrY3Z1acS5dVzGNJvvBN8zNa
	8bJsRPOtfXcGk8zl4gxbxaDvugVXd5qjfkOQ7g6tZhwDm04POMHtWWHJYHerN2C5ZTo4ug/TEItSE
	WjL9BJsu5KS2O98BbPOyDyW5W2JuSc23sNYCQ9HV3umA2mxJuxFSehXh2nxz+zE36eGz4XB94fTl3
	+byfGqCXzizwowe0d7Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kH2-0000000EhYS-2LSj;
	Wed, 02 Sep 2026 12:41:04 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kGy-0000000EhWr-1qh9
	for linux-mtd@lists.infradead.org;
	Wed, 02 Sep 2026 12:41:01 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso1231415a91.3
        for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2026 05:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352859; x=1788957659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z+i1+hLinUt3Q2bK2ZT3Wc0emmUMZr61lAfSOzdane8=;
        b=rtqz/g/uK+n/k5BNGVb/HJ18y4vW78NNOZS2klC2mYuqPCDJ3uUGPTBhSnzJVgeSiQ
         H6oWk4a7W4OCt1yJnHAiROgGqTEUE7JDN2PViTOA14p2R41BE5oXYdHOoWeVGcRG6dQb
         PIMjKOkzWSwiOhJxpv16S22qJlSzJSvY8zf90iIYy+EUi/VqSiwjQLYZBjDDF3lY98QW
         v14VL4Jle5rv7tGXHNk7K2U30zFu6Wlc0N87iuBr5KgqNasjAiBm4tBO5DAJFupdbuii
         M2eWPmAxI7eVcOAVBpfuw22zhzBmuJpzBHcL2/fcxjqkOMZYZqrscH0BK9eil1FBjvjQ
         ynMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352859; x=1788957659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+i1+hLinUt3Q2bK2ZT3Wc0emmUMZr61lAfSOzdane8=;
        b=Nx0XfHogr7Fh74sLZifuzc0GP9gJlHNCPoeRXO6SOCW14SezqAbeIyagbGv2UxFvtj
         uGT7sNPVK2R2aEeVv3dzywOR0RaaxxL4sO+4LdQQVqbZ6oxK8V07UkJStztsFiUn0Xh4
         oRPr6YmaHNx4c43rgkjoPr/gH6IhRs9JArno4M5NcDXj4IeIt04VyN5h50VwsS/sPGzc
         Hphbk7xH6rQh+3lXmBXEJDorC3jf0Sxy+pEI3pEeqG7GzPdin/OMeecy9vi+gi7n1wXl
         gwkOIhrC+xNNd0Jvg3xk+BlDqPyfzCQ7kVd24QI0r+Ko7UQwcm9jTkcnQW00m+BputS7
         Pf4w==
X-Gm-Message-State: AFuF++nHD892+lMk9cSIBEaOaax8bbtKX6Qhflzycrg+YzjS+BIKPzCf
	GH94qCJA04gSB6J9KpPx34tdTGovJdFQ2fvz/lYl8NhsyA7UcuRVqeIyb2OL2w==
X-Gm-Gg: AYBFou3TuBrmHtvDZNDTe9Zgji3Bvx/JwUd68G8yg91OFPPWYIUDWOs+CMUDoCH7EFX
	mqzhQ5jDQqCNwyi8CNm1zJfksAS+sYuj8AyG3ZgqBQ0PMjWq203L+H/ooieSZAtMES3FQaqQrcA
	R9PFy+21VOFPVIbnQ8ob+2NEN9GUtWqIIX2MEF67XQpaMJjbg1G/PYt2SINq89wHzlr4JU/ueA3
	B5obLecd9KGPVh3vlPiLg+gXd0botrDHugKqKdfJ/dRWhnwZOR52XYQsOdrujzTPtQOoY/dG1hh
	hOjZEmCEOjo4flFPi3CKkD7ji+Lf1HoWBtf+3Lxl/t98PMQF2uxSt8An5kP5HDZbqKTSNGWF1HC
	+pFVleZEkRAw4fF/cAedAiXK9ItYyI13EHDuGuq2hEE0SJ3JxaSzAQQkHVSRlvbzwRlFE6ljBVw
	HtBDX2kiUy7oz0pCKi2VzsFeNr+kxwKoTnXbVBRS0jSVqBz61tu5BliNAHfUTPhG6KS9FIodrUh
	qMYMCoq+BMPupkIjys8aTclPxnqAKZwjQ==
X-Received: by 2002:a17:90b:4407:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39aee219427mr6732990a91.18.1788352858942;
        Wed, 02 Sep 2026 05:40:58 -0700 (PDT)
Received: from localhost.localdomain ([180.101.244.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd21e9dsm11879576a91.4.2026.09.02.05.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:40:58 -0700 (PDT)
From: henrymei <ljp1205831794@gmail.com>
X-Google-Original-From: henrymei <henrymei@tencent.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org,
	Aohan Mei <henrymei@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: inftl: validate MediaHeader partition geometry before allocating tables
Date: Wed,  2 Sep 2026 20:40:19 +0800
Message-ID: <20260902124044.3942821-1-henrymei@tencent.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_054100_582025_BC79A37B 
X-CRM114-Status: GOOD (  16.56  )
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

From: Aohan Mei <henrymei@tencent.com>

find_boot_record() trusts the on-flash INFTL MediaHeader partition
fields without validating their relationship to each other or to the
device geometry.

The sanity check

	if ((ip->lastUnit - ip->firstUnit + 1) < ip->virtualUnits)

is evaluated in unsigned 32-bit arithmetic.  With lastUnit < firstUnit
the subtraction wraps to a huge value and the check passes.  Control
then reaches:

	inftl->nb_boot_blocks = ip->firstUnit;    /* loop bound */
	inftl->nb_blocks      = ip->lastUnit + 1; /* table size */

so PUtable/VUtable are allocated with lastUnit + 1 entries while the
boot-block marking loop writes firstUnit u16 entries:

	for (i = 0; i < inftl->nb_boot_blocks; i++)
		inftl->PUtable[i] = BLOCK_RESERVED;

A crafted MediaHeader (e.g. firstUnit=7000, lastUnit=3) turns a
kmalloc_array(4, 2) 8-byte allocation into a ~14 KB out-of-bounds
write:

	BUG: KASAN: slab-out-of-bounds in find_boot_record
	Write of size 2 ... 0 bytes to the right of allocated 8-byte region

The MediaHeader unit itself is also marked through PUtable[block]
without verifying that block lies within the described extent.

Reject inconsistent partition geometry (lastUnit < firstUnit, or
lastUnit beyond the device) as each partition entry is scanned, and
reject a boot record that lies outside the extent of the selected
partition.  The existing virtualUnits check then subtracts values
that can no longer underflow.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Cc: stable@vger.kernel.org
Assisted-by: CodeBuddy:Kimi-K3
Signed-off-by: Aohan Mei <henrymei@tencent.com>
---
 drivers/mtd/inftlmount.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 87e246a6f488..b0f01db95280 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -192,6 +192,23 @@ static int find_boot_record(struct INFTLrecord *inftl)
 				 ip->lastUnit, ip->flags,
 				 ip->spareUnits);
 
+			/*
+			 * Reject inconsistent partition geometry before it is
+			 * used: lastUnit < firstUnit would make the
+			 * (lastUnit - firstUnit + 1) check below underflow,
+			 * and lastUnit must stay within the device as it later
+			 * bounds the PUtable/VUtable allocations.
+			 */
+			if (ip->lastUnit < ip->firstUnit ||
+			    ip->lastUnit >= inftl->nb_blocks) {
+				pr_warn("INFTL: Media Header "
+					"Partition %d sanity check failed:\n"
+					"        firstUnit %d lastUnit %d "
+					"(nb_blocks %d)\n",
+					i, ip->firstUnit, ip->lastUnit,
+					inftl->nb_blocks);
+				return -1;
+			}
 			if (ip->Reserved0 != ip->firstUnit) {
 				struct erase_info *instr = &inftl->instr;
 
@@ -233,6 +250,18 @@ static int find_boot_record(struct INFTLrecord *inftl)
 			return -1;
 		}
 
+		/*
+		 * The boot record unit must lie within the described
+		 * extent; it is later marked through PUtable[block].
+		 */
+		if (block > ip->lastUnit) {
+			pr_warn("INFTL: Media Header "
+				"Partition %d sanity check failed:\n"
+				"        boot record unit %d beyond "
+				"lastUnit %d\n",
+				i, block, ip->lastUnit);
+			return -1;
+		}
 		inftl->nb_boot_blocks = ip->firstUnit;
 		inftl->numvunits = ip->virtualUnits;
 		if (inftl->numvunits > (inftl->nb_blocks -
-- 
2.43.7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
