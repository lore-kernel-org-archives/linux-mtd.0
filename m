Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F992C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Nov 2022 23:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pHHNNIsrG8MVTXokRUnHYHnLs1dscCrLfAdR866fZvM=; b=GStLrDCXg0ksl2
	UaOmiBBMNuC6fmz4E+0ELghcYmug7ixEbAU+Ou9ECIXH8mRfHLhr0w2WLknB8xV/n8WCeMwCo+sMP
	qiqf23Eb6H3naJ/g3ENEMZ9Vd8ol2iowo26rlSRHNIuUU/pHSey5tZXxnBW/ma5V/4wJKwjO2hE7i
	riERihntxlaRec1NcrKrTH/xL8Y2GHzlE5zS0sr4Y1BefbwydvoTabC2jhggmw/hHhTvIZeYEfmgo
	r25of/LBoqokt44OP9SZau3EdzOK/7tVQSMPQZ2P/bGo6LIu1S5sBSWMBs0VGOlDQPDPi5m+88Py6
	s0GvK2T2XdwYQZbikkkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osXep-00928U-53; Tue, 08 Nov 2022 23:05:27 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osXem-00927Q-BZ
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2022 23:05:25 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1osXeZ-0005vA-Rm; Wed, 09 Nov 2022 00:05:12 +0100
Date: Tue, 8 Nov 2022 23:03:48 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Matthew Wilcox <willy@infradead.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-efi@vger.kernel.org
Subject: [PATCH v4 3/5] partitions/efi: add support for uImage.FIT
 sub-partitions
Message-ID: <Y2rgVIbtuDsySzBr@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_150524_398549_4248BF99 
X-CRM114-Status: GOOD (  10.01  )
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
 block/partitions/efi.c | 9 +++++++++
 block/partitions/efi.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/block/partitions/efi.c b/block/partitions/efi.c
index 5e9be13a56a8..bf87893eabe4 100644
--- a/block/partitions/efi.c
+++ b/block/partitions/efi.c
@@ -716,6 +716,9 @@ int efi_partition(struct parsed_partitions *state)
 	gpt_entry *ptes = NULL;
 	u32 i;
 	unsigned ssz = queue_logical_block_size(state->disk->queue) / 512;
+#ifdef CONFIG_FIT_PARTITION
+	u32 extra_slot = 65;
+#endif
 
 	if (!find_valid_gpt(state, &gpt, &ptes) || !gpt || !ptes) {
 		kfree(gpt);
@@ -749,6 +752,12 @@ int efi_partition(struct parsed_partitions *state)
 				ARRAY_SIZE(ptes[i].partition_name));
 		utf16_le_to_7bit(ptes[i].partition_name, label_max, info->volname);
 		state->parts[i + 1].has_info = true;
+		/* If this is a U-Boot FIT volume it may have subpartitions */
+#ifdef CONFIG_FIT_PARTITION
+		if (!efi_guidcmp(ptes[i].partition_type_guid, PARTITION_LINUX_FIT_GUID))
+			(void) parse_fit_partitions(state, start * ssz, size * ssz,
+						    &extra_slot, 127, 1);
+#endif
 	}
 	kfree(ptes);
 	kfree(gpt);
diff --git a/block/partitions/efi.h b/block/partitions/efi.h
index 84b9f36b9e47..06c11f6ae398 100644
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
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
