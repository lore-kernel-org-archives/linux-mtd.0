Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60983C5B572
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Aug 2026 02:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ky27iG1uKaJ7Isz+PmDdB2OrWZes8anPvp3lYzzcSLE=; b=GU5jtbYbfXFa+h
	U0QvGiWQwkp8a27TPlc77OsudL1y+bl3/KktThAqnBdPx0VSjOGgT4x0kRI9AhhblOSLzk8H1vqqZ
	xMoa9J4TiB0fOai4bHC2dHEoWs8OAFqUtxbIomLYWepnzY8Qeji4eXTpaD9ZQKrxMYBQ34LKD0HfY
	UeuorhiFnJIlfzAnCaOQErYY90dcPm3qrVQFVQ/SKyJ+3OFHC3vPGK3kEYIQmcEHRiI3NxI3cCk6t
	G94V/xnvC5e449nRwGNcxs8ZWq26rQp4bIxhuyRF/Lr3D3M7qEkE0VfUbwfmZ7lNratlqFr2DinX1
	O3+5xi2Wm4ncmqJOcWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9HS-000000075IJ-03S6;
	Tue, 18 Aug 2026 02:10:22 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9HO-000000075H4-0Qq2
	for linux-mtd@lists.infradead.org;
	Tue, 18 Aug 2026 02:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1787019016;
	bh=Ix1zjxj4eYL9/VS5Wq53zDMooCyEsxJIqXZutJWL2yA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wdE9TJpbR+kCy3XJuJgu80IDBB/Y3iYGJiSlEfVvnCiUEsiYHAy4Lv2oPt2wurl1p
	 Qe6WOoEoUTcGAqmfyMITUJsvqtcwOJXfffSOzDIDAFUbSDeizCYsGEqi4mwkUP7xzP
	 xYKNgsn8QxneTMeppzQknnb2VpNcGqLfKJDrZ2Gs2CJzYiLMZu6Ym/rhhYZSYfLbpy
	 Rt4yT01sRRSA4Ae3++J8OayFbQ5LMT1uEI5vOVrD4LolCAP7FqAgB9E+p3yHs4cBT+
	 GxX0SjOTG0Rln4d93yHNWjGTBTSzFhwb52QQIWiT3qJ+nTwgtCiZZwXBXpML7luRUi
	 CAmXyLV86JtVw==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id F004C433
	for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2026 11:10:16 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=FFozEDX+;
	dkim-atps=neutral
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 1BA97936
	for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2026 11:10:16 +0900 (JST)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so6097933a91.0
        for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2026 19:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1787019015; x=1787623815; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hi7xHirHoUw4IoNwrufN13NNn3nrIkfX3xAtdGuYP9I=;
        b=FFozEDX+wbUM5zB3MP61i58aFHXx5RrzDR0AkmvcwYFQBJ28iV0tb1gvLgQ0fjdZrA
         aAhQYz+W9djcIK5KokJYjChlH3bYSAIwchOfGColkPVRifzBzl4/1jR9JRZX25Azofqw
         3fFzI5/kfHs/L1U8nXplnlhp7QKwqlHoND2kvmwjXwUcx9S668RE/n5I5z6gkjmTMd7F
         6wkjw2LDH90DnQV8Y+2VaZEUuBIdSAfWswCD6X2w0CJuVugkMLmmkfsen05bf89YLIFn
         zVsJ7E+K1L5tFLBRt/9IqTyf7kw3xjo/+zzpQi4l9O3nWBX2I635Q9GFKsulZOkjVv+2
         9UcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787019015; x=1787623815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hi7xHirHoUw4IoNwrufN13NNn3nrIkfX3xAtdGuYP9I=;
        b=CRwDBNVBHhkRlXUqbK8HZZiIuDahPn/OuTyRmfBEr1vnUx/oISYocV5xp4JdO3Cw0W
         PxtVoNaZOD1NzK3LN7BsQdBEpc7nnZKB9T1j2UD/+L39EltNyJVWv32OLarFzBTkIos1
         olKavcXpXvgU9TOiAjbpDo08kWAzfwYI6lbEHYzLqt9kx8W9k4yITfgp/B1KDBNJeAdi
         RAQU0N9rQqx6iMrukAZt4ef0+mg996y9Y4Y8WcnnPXX3emT839r01qCp+Nq88pfWVLOw
         lnnQ03xB7Y01C1ypoqCq3HAgW6gys5Tia0Q7LdjJpVsjQHXW0bOqRfTFqw9JY4d4ojWp
         fJaA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7qnDdXbfe0A+uQ3i3ZztcaWP7pqK9DIU+1kZn4sbwqVpHWFFV79VHCnBs2XGAeUWJ74GbBwTzy2U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7TNmcyKBfAlFCJQIE3er8a6M9lhbSRvVXyjOYTBO5Y3TcJkcC
	RD7aJgEREbgbSfTkHba6Plbu5w16dT7pR7QyHu0bhnULSdiEzgzW9J+Zl++LH59l7QNflTFDAKd
	IVDIQj1fup1cMmdQKREnSADLlXSZz4zEe58fe/ZS/DlMBLKSvhQxOnupmOC2IF4V19x7H
X-Gm-Gg: AR+sD11XM5LYBJW29eO5+X8QxEHy8eZ7SLJtMrYvW4jUPPuuiuHAQKA7mSFteq+Y62b
	n3d9Gh9PrTPCihocshtMUZcjba23FC/76RgK2+AzfLlvZTGMLlnIaGxH3Kdd24WnUnrYEgZCCpk
	rzJ4gVOgEeQ2nbBVJUGmLGFHYckxWD/CYwoXHnOg5oCuw5OELvcM9V2nK7U3s2xEWIS5fg1QvvF
	IEZiVFD1HGfLVKTT+noACnDWDqIN6oU2uEWV79CJqQJHvpSLCnkcRXB50u/aw1OdptmPE+eBC4a
	xF/x/Qna0Zmqtg7GWiNCG7qzDxaJClENIEGSF9HWbMNy8IbzMEfsBwa9P9frfKPKGjShKBGHL/v
	YOf1KyYcocjql3lGVYsamVoyb7VCu2tGEcU29pNA6kn6YNE9E
X-Received: by 2002:a17:90b:554d:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3955a7b15e0mr5097004a91.11.1787019014975;
        Mon, 17 Aug 2026 19:10:14 -0700 (PDT)
X-Received: by 2002:a17:90b:554d:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3955a7b15e0mr5096927a91.11.1787019014405;
        Mon, 17 Aug 2026 19:10:14 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3954d2b8080sm4232945a91.4.2026.08.17.19.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 19:10:14 -0700 (PDT)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Tue, 18 Aug 2026 02:09:35 +0000
Subject: [PATCH v6.12.y 2/2] ubi: fastmap: fix ubi->fm memory leak
MIME-Version: 1.0
Message-Id: <20260818-ubi-backports-v1-2-324d6816d2ae@atmark-techno.com>
References: <20260818-ubi-backports-v1-0-324d6816d2ae@atmark-techno.com>
In-Reply-To: <20260818-ubi-backports-v1-0-324d6816d2ae@atmark-techno.com>
To: stable@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>, 
 Liyuan Pang <pangliyuan1@huawei.com>
X-Mailer: b4 0.16-dev-a9e92
X-Developer-Signature: v=1; a=openpgp-sha256; l=5399;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=Rq6t/hYpg1RyNp9DwzyGXOvBRMwbHlqH4hMASIwQb4A=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBqg78BSbSrWtBI8J25bEZy7VSwp01/XxwlIYIU0
 +V9J17cSK+JAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCaoO/AQAKCRDyimB/1oxx
 BwzCD/4jLnvNtg6zBHE+Q7dSHaPc0f4p0IQzhtS2u3f0jxRqKaY1IeALuhVhoO6xgEAXwTMQBo/
 RTG7MCAMlIFnyasf3aIBv6TOPsqA6EjkqcCcB8faNIdyh4t0KLeP2g9IbpPxTGxrLCd1LdOFB7X
 G3NLsZvybLqRBKanzigKUc88GdXqOZfQUbRpW7xVgjXkEZRphGpmDxGQxh+NyFk9R4FL812XXGB
 32MmZ/Q3uPUhC/jJb0veyiCbQrCRdlZyj/psQXg0fwdD97kMWvst1thPDfXT3/a+aA5c24ESsof
 TxRyDMXzpLEljGFinXLAmvlipDaPppDpfGi6ZSqPEwXajSGwnxALMkdUaHBWQ/rsR7kxV1BXrNk
 w5Bw9nUY8HqI38PhwB8Ju+3KZRN8j8wYyrqh6Dg7FpfB/j+0KZiaxNxKQ0NVxUKPLaBcg+5rjTi
 LEjxcWlQzUhnLYydJoqnmkDKFD+k/T63Gf0s+U86aToGZd9V9MxlqFGja0K7b0uGBqkpjy7eeO7
 7RbKUvxBkiCp2V50OG9xmrio+/Y+Q5MbKP2HLB98CE8a4oZbLy38lXXWrXMl8eOHH6b4LVriZ7E
 9soJT7dheh7smtbp2K3EngDI2EFAT7Xd/yYlnTfMDL3CokEFikF4q07c2fj5dwnwV3d/1ZruEk5
 xhMz/oeTbMiGgpA==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_191018_390511_154E0E98 
X-CRM114-Status: GOOD (  18.87  )
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

From: Liyuan Pang <pangliyuan1@huawei.com>

The problem is that scan_fast() allocate memory for ubi->fm
and ubi->fm->e[x], but if the following attach process fails
in ubi_wl_init or ubi_read_volume_table, the whole attach
process will fail without executing ubi_wl_close to free the
memory under ubi->fm.

Fix this by add a new ubi_free_fastmap function in fastmap.c
to free the memory allocated for fm.

If SLUB_DEBUG and KUNIT are enabled, the following warning messages
will show:
ubi0: detaching mtd0
ubi0: mtd0 is detached
ubi0: default fastmap pool size: 200
ubi0: default fastmap WL pool size: 100
ubi0: attaching mtd0
ubi0: attached by fastmap
ubi0: fastmap pool size: 200
ubi0: fastmap WL pool size: 100
ubi0 error: ubi_wl_init [ubi]: no enough physical eraseblocks (4, need 203)
ubi0 error: ubi_attach_mtd_dev [ubi]: failed to attach mtd0, error -28
UBI error: cannot attach mtd0
=================================================================
BUG ubi_wl_entry_slab (Tainted: G    B      O L   ): Objects remaining in ubi_wl_entry_slab on __kmem_cache_shutdown()
-----------------------------------------------------------------------------

Slab 0xffff2fd23a40cd00 objects=22 used=1 fp=0xffff2fd1d0334fd8 flags=0x883fffc010200(slab|head|section=34|node=0|zone=1|lastcpupid=0x7fff)
CPU: 0 PID: 5884 Comm: insmod Tainted: G    B      O L    5.10.0 #1
Hardware name: LS1043A RDB Board (DT)
Call trace:
 dump_backtrace+0x0/0x198
 show_stack+0x18/0x28
 dump_stack+0xe8/0x15c
 slab_err+0x94/0xc0
 __kmem_cache_shutdown+0x1fc/0x39c
 kmem_cache_destroy+0x48/0x138
 ubi_init+0x1d4/0xf34 [ubi]
 do_one_initcall+0xb4/0x24c
 do_init_module+0x4c/0x1dc
 load_module+0x212c/0x2260
 __se_sys_finit_module+0xb4/0xd8
 __arm64_sys_finit_module+0x18/0x28
 el0_svc_common.constprop.0+0x78/0x1a0
 do_el0_svc+0x78/0x90
 el0_svc+0x20/0x38
 el0_sync_handler+0xf0/0x140
 normal+0x3d8/0x400
Object 0xffff2fd1d0334e68 @offset=3688
Allocated in ubi_scan_fastmap+0xf04/0xf40 [ubi] age=80 cpu=0 pid=5884
	__slab_alloc.isra.21+0x6c/0xb4
	kmem_cache_alloc+0x1e4/0x80c
	ubi_scan_fastmap+0xf04/0xf40 [ubi]
	ubi_attach+0x1f0/0x3a8 [ubi]
	ubi_attach_mtd_dev+0x810/0xbc8 [ubi]
	ubi_init+0x238/0xf34 [ubi]
	do_one_initcall+0xb4/0x24c
	do_init_module+0x4c/0x1dc
	load_module+0x212c/0x2260
	__se_sys_finit_module+0xb4/0xd8
	__arm64_sys_finit_module+0x18/0x28
	el0_svc_common.constprop.0+0x78/0x1a0
	do_el0_svc+0x78/0x90
	el0_svc+0x20/0x38
	el0_sync_handler+0xf0/0x140
	normal+0x3d8/0x400

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220744

Signed-off-by: Liyuan Pang <pangliyuan1@huawei.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
(cherry picked from commit d133e30aabc7c8eb8206827f8fbe0f3679adb911)
Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
 drivers/mtd/ubi/attach.c     |  4 +++-
 drivers/mtd/ubi/fastmap-wl.c |  8 +-------
 drivers/mtd/ubi/ubi.h        | 12 ++++++++++++
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index adc47b87b38a..884171871d0e 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1600,7 +1600,7 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 
 	err = ubi_read_volume_table(ubi, ai);
 	if (err)
-		goto out_ai;
+		goto out_fm;
 
 	err = ubi_wl_init(ubi, ai);
 	if (err)
@@ -1642,6 +1642,8 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 out_vtbl:
 	ubi_free_all_volumes(ubi);
 	vfree(ubi->vtbl);
+out_fm:
+	ubi_free_fastmap(ubi);
 out_ai:
 	destroy_ai(ai);
 	return err;
diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 9bdb6525f128..e2bc1122bfd3 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -530,8 +530,6 @@ int ubi_is_erase_work(struct ubi_work *wrk)
 
 static void ubi_fastmap_close(struct ubi_device *ubi)
 {
-	int i;
-
 	return_unused_pool_pebs(ubi, &ubi->fm_pool);
 	return_unused_pool_pebs(ubi, &ubi->fm_wl_pool);
 
@@ -540,11 +538,7 @@ static void ubi_fastmap_close(struct ubi_device *ubi)
 		ubi->fm_anchor = NULL;
 	}
 
-	if (ubi->fm) {
-		for (i = 0; i < ubi->fm->used_blocks; i++)
-			kfree(ubi->fm->e[i]);
-	}
-	kfree(ubi->fm);
+	ubi_free_fastmap(ubi);
 }
 
 /**
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 1c9e874e8ede..450a7b9a5bd7 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -970,10 +970,22 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		     struct ubi_attach_info *scan_ai);
 int ubi_fastmap_init_checkmap(struct ubi_volume *vol, int leb_count);
 void ubi_fastmap_destroy_checkmap(struct ubi_volume *vol);
+static inline void ubi_free_fastmap(struct ubi_device *ubi)
+{
+	if (ubi->fm) {
+		int i;
+
+		for (i = 0; i < ubi->fm->used_blocks; i++)
+			kmem_cache_free(ubi_wl_entry_slab, ubi->fm->e[i]);
+		kfree(ubi->fm);
+		ubi->fm = NULL;
+	}
+}
 #else
 static inline int ubi_update_fastmap(struct ubi_device *ubi) { return 0; }
 static inline int ubi_fastmap_init_checkmap(struct ubi_volume *vol, int leb_count) { return 0; }
 static inline void ubi_fastmap_destroy_checkmap(struct ubi_volume *vol) {}
+static inline void ubi_free_fastmap(struct ubi_device *ubi) { }
 #endif
 
 /* block.c */

-- 
2.55.0.dirty



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
