Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961D7FF8862
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 11:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+a74LREE1oNR02RO+iRUHQ8leGmb+to2ieC1iCGm5Ew=; b=a+egJ1BU76ap6n
	MdPCh4ZnRVWccvHg2MIiSpAo9W8xCJhYUvxxRwoUoQ7qpozgp99pyPi6IliMl3rbE4tVXpIK6/T3C
	43XmOauogMLP8C4GHRENPe3BzppsPsqcmQziLJEiE9xJPBmn/f/MpcpGtnFr4vYsCiSQCM2Auh09Q
	Zn5J3aK6AdM3WsY7vgXsU7GfuDlygLsIvW+7mVgFFA6+skGEDGNtw0PGshI7yT0G85FRQDGd/BZcD
	So43T1fGRdTlbu5h+P77t78Qz+JPe+DVJBjaulTftiyjaWIjALQ0M3d1SYeQq11WGM8cHq0Y0kHjd
	nd5YhtYxbuViO69U2M5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKUm-0000000GpQQ-10xP;
	Mon, 27 Apr 2026 11:51:24 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKUh-0000000GpOS-2Oou
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 11:51:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43d64313c39so7954902f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2026 04:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777290678; x=1777895478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+Y2aORcPSf7njE0+UeLtYLV0kJ/K7uIhbGCNhCftsw=;
        b=c+PfZUi4KIavABXhfZ8V8TNe5WRvlMBjPBxX2eoVurryzjPPZoR6Sqv7bo4mtpoe3d
         eg1mr9e0iu4wcPGBAGOi7Oru5YUOOKzt4CfiVPRO7pL0iT6zkEj010ZrquCSQiHNBrgF
         DE6H/D1YHoTLUtTCPP+Bj71DdkwJC82bgcSHOa0ifT6T3mLCZilKMdEglav9MlSoCVti
         Gl4gAzz/mj/MMgWYUgGucUKvpsDBBa2HCOSeL5C8HpOJ36I6Y51zPgX6WsmWWL6ONc4K
         cSDhdRMvq86281BkEIkNiW52PU0F4qiQIkDF7ogUG217kfUQxbcUmVnxMLksBZW+vIhA
         4c9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290678; x=1777895478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B+Y2aORcPSf7njE0+UeLtYLV0kJ/K7uIhbGCNhCftsw=;
        b=ed7Wo43xrSsEVm6YclYZxD+MKuYCWsSCnSJthPDn618vYmUphYuDSSV2R6DDfu6bPu
         c34ESJr6bpBDrVafTDFZeTaF9/4K9tr2a60q/yvDXN1/x5FKv/T9VGvynTHaiW5wTa13
         5X0RkfAd/itQy4q/wD5wdPk4+4ZBz9pRkT/jmAVyuSMlQ5P6s46viUcvVQ9sMUYcZRV6
         5C5Yo+Jj1r2bROWrEV7QG5dYTMOsRi8w3H9ww9PePjXykQGgxNYF7wvCe6eRxCLJkYzM
         JzGpTLyUT4qnAA8//3XumBv2/h8BW25h+RvxywVb/VPBqsImZ+ewAHcNJKqYYVxLvJgc
         r6oA==
X-Forwarded-Encrypted: i=1; AFNElJ85Zq4jurdimVJIDK3OsE/SKmkDcaWJfRZCsNtf5gT0P+FepMLEMMpyMwB00VnpUtTU0Vb+uz3oLOw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiN0INbgIA4/Y4WREORX2tqhtbYYIbEMf6sSHUHVUFgihkzTn9
	5mBJc8VdHd6kAwCf8yA/aZ/xEN1k7WWG6lArNNzflvhsu0FPBZlwRqo=
X-Gm-Gg: AeBDievWECVvlR7xB903ggavlc8xtz5/LvSOgHu8/g3PcXUz+2f14x2CCZm23tvs+bu
	ansBxTHe8QaNHvmnjdK9295OFUiF17xbxcH2pZua+Zq+nw7+HxPl61CqW3wT8lWxjDzaCXOwsos
	t7PJmNUBXNsH/FDMFL+W+gkNdfHkCmfSQw/fHLF6O3HkAlWa37Ms9mNA/FkkPrqMooszgYtbqxz
	ierr0FOU4eO2v3Br6A7jOl+s5w3+5rERvJtsRDWmYOFHhHzDorEgA3EyPbNMhC6NXREPQopfq0c
	Vxi7/YnveixbIammEzf/hB2VmafMF7/8rc33RR7oELBOHfhxmxaUMsQJXVRTkDrYu1H5HfX2+YG
	xZ3dtpZ3n418FoH1mQPaqbd/KM46xvSDyzciYLKIFXRDOyuf6jqcw+NAMwgUkygeVOz1vszR6+x
	SecOowcVhoOIBD5zcgQ7/CB7lHvPIDAbEhdJg9H2HZwiHrWqgOQ1Xavkzu8+3S0dDeh2NSRsMXh
	oNpHGAjZ2bE7rPyLH0f+DpPLZ2a/w==
X-Received: by 2002:a05:6000:2dc4:b0:441:37b5:fc04 with SMTP id ffacd0b85a97d-44137b5fc4amr15581103f8f.14.1777290677589;
        Mon, 27 Apr 2026 04:51:17 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:3c87:b0bc:8c35:1ba0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4412150a071sm43651490f8f.21.2026.04.27.04.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:51:17 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Florian Fuchs <fuchsfl@gmail.com>,
	Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v2 2/3] mtd: maps: vmu-flash: fix fault in unaligned fixup
Date: Mon, 27 Apr 2026 13:47:49 +0200
Message-ID: <20260427114750.2480900-3-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427114750.2480900-1-fuchsfl@gmail.com>
References: <20260427114750.2480900-1-fuchsfl@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_045120_376789_0E159F61 
X-CRM114-Status: GOOD (  11.34  )
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

Use kzalloc_obj() / kzalloc_objs() to allocate the memcard structs,
instead of kmalloc_obj() / kmalloc_objs() to prevent access to
uninitialized data.

Fixes runtime error: Fault in unaligned fixup: 0000 [#1] at
mtd_get_fact_prot_info.

Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
v1->v2: no functional change, just rebased.

v1: https://lore.kernel.org/lkml/20251117224408.498449-3-fuchsfl@gmail.com/

 drivers/mtd/maps/vmu-flash.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 75e06d249ce9..b76d0609d1b7 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -609,7 +609,7 @@ static int vmu_connect(struct maple_device *mdev)
 
 	basic_flash_data = be32_to_cpu(mdev->devinfo.function_data[c - 1]);
 
-	card = kmalloc_obj(struct memcard);
+	card = kzalloc_obj(struct memcard);
 	if (!card) {
 		error = -ENOMEM;
 		goto fail_nomem;
@@ -627,13 +627,13 @@ static int vmu_connect(struct maple_device *mdev)
 	* Not sure there are actually any multi-partition devices in the
 	* real world, but the hardware supports them, so, so will we
 	*/
-	card->parts = kmalloc_objs(struct vmupart, card->partitions);
+	card->parts = kzalloc_objs(struct vmupart, card->partitions);
 	if (!card->parts) {
 		error = -ENOMEM;
 		goto fail_partitions;
 	}
 
-	card->mtd = kmalloc_objs(struct mtd_info, card->partitions);
+	card->mtd = kzalloc_objs(struct mtd_info, card->partitions);
 	if (!card->mtd) {
 		error = -ENOMEM;
 		goto fail_mtd_info;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
