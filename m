Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCAAC433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 16:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sff9gk/RehUXbkMv8c1DWMChky1A4odC55DTmyoKP7A=; b=zs0m9REBgTjtn/
	mflt3NnyD9XDh72MTIQd3THBxBPu1SomUP+uIKFbSiUI24FvgfNeJ0a/Tt1jKRnPr1Tb2Ut+khdUi
	x3LwAs4p+bFX4uDZLYCKFroCeutFUtXhCY4voO/e03RMCym/PO5YrvPebU/VxTBani9L+ned1/VTz
	9CHvwoeQEBdgm2r3LVsrwcA/I8l2ca4ZFCj9htQXvoPtWLvAfBIZIEVbZoj4jU5Jbnt95ASvQzEKN
	G+IxSzjWk6TKGCQd4FXKZWysq6TF6Sm9/U+oG3RSu5AlL4c3fvuCbIC5qOHhcRVeRouGpjaABYFRK
	DfFCFK1ei/NFw7nvW3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlYl5-001gQ5-UI; Mon, 02 May 2022 16:18:47 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlYkz-001gP0-Ho
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 16:18:45 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1nlYkw-00088a-Sx; Mon, 02 May 2022 18:18:39 +0200
Date: Mon, 2 May 2022 17:18:33 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-block@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Tom Rini <trini@konsulko.com>, Jens Axboe <axboe@kernel.dk>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/5] partitions/efi: add support for uImage.FIT sub-partitions
Message-ID: <YnAEWcSCxO+1TXrn@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_091841_624260_E9561B90 
X-CRM114-Status: GOOD (  10.94  )
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

Add new GUID allowing to parse uImage.FIT stored in a GPT partition
and map filesystem sub-image as sub-partitions.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 block/partitions/efi.c | 6 ++++++
 block/partitions/efi.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/block/partitions/efi.c b/block/partitions/efi.c
index 5e9be13a56a82a..b8a88601ff5780 100644
--- a/block/partitions/efi.c
+++ b/block/partitions/efi.c
@@ -716,6 +716,7 @@ int efi_partition(struct parsed_partitions *state)
 	gpt_entry *ptes = NULL;
 	u32 i;
 	unsigned ssz = queue_logical_block_size(state->disk->queue) / 512;
+	u32 extra_slot = 64;
 
 	if (!find_valid_gpt(state, &gpt, &ptes) || !gpt || !ptes) {
 		kfree(gpt);
@@ -749,6 +750,11 @@ int efi_partition(struct parsed_partitions *state)
 				ARRAY_SIZE(ptes[i].partition_name));
 		utf16_le_to_7bit(ptes[i].partition_name, label_max, info->volname);
 		state->parts[i + 1].has_info = true;
+		/* If this is a U-Boot FIT volume it may have subpartitions */
+		if (IS_ENABLED(CONFIG_FIT_PARTITION) &&
+		    !efi_guidcmp(ptes[i].partition_type_guid, PARTITION_LINUX_FIT_GUID))
+			(void) parse_fit_partitions(state, start * ssz, size * ssz,
+						    &extra_slot, 127, 1);
 	}
 	kfree(ptes);
 	kfree(gpt);
diff --git a/block/partitions/efi.h b/block/partitions/efi.h
index 84b9f36b9e4797..06c11f6ae3989c 100644
--- a/block/partitions/efi.h
+++ b/block/partitions/efi.h
@@ -51,6 +51,9 @@
 #define PARTITION_LINUX_LVM_GUID \
     EFI_GUID( 0xe6d6d379, 0xf507, 0x44c2, \
               0xa2, 0x3c, 0x23, 0x8f, 0x2a, 0x3d, 0xf9, 0x28)
+#define PARTITION_LINUX_FIT_GUID \
+    EFI_GUID( 0xcae9be83, 0xb15f, 0x49cc, \
+              0x86, 0x3f, 0x08, 0x1b, 0x74, 0x4a, 0x2d, 0x93)
 
 typedef struct _gpt_header {
 	__le64 signature;
-- 
2.36.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
