Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7499C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 10:56:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23A3564DCC
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 10:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23A3564DCC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UGxM17L4u2p5vF7vT8ixUKYhspljZtRUt0VeWVhE8rE=; b=tAx6HWptxIWdM4+yoTBoOHYeq0
	IVi1AI8S1vQU+uP25hmvuIfPDwhGO9fZa/0wRYWs5ZNIxXE2Hmy90YFdxbN807IsgMxDMA+q/toW/
	3sVoiiUqj4R/QYDpwoLN2g/NazARHnlsR2MtEkVHKePSzfFPiv4A9b+z7U0n0s9ZaTFcXZpQ3mqCf
	t0mbDSE/5mBtf0yBGrT/eZ6lSx1GS2rctN62SrK8gLxJo7zSSKlAokwCZUaSsJczYOCYprJtqV7/7
	tetK6kHnvxXxD4yyPzAQe9dnqg/ilRJ0Sk+EamHNByNJ0l4FsB0FW9vJFD0qX+ujsSe+vUMj+4nPC
	CzW4XC/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l54y0-0006L4-HK; Thu, 28 Jan 2021 10:56:00 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l54xy-0006KK-5l
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 10:55:59 +0000
Received: by mail-pl1-x641.google.com with SMTP id b17so3112803plz.6
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jan 2021 02:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f/W8U0bQIHa5GKUt/WPMmEx9gyM4ao9W0NLGedSTZKI=;
 b=YgRvvCJU82FxEFYYvkucqYGubJMzsecaRcI/QeQgEAZrmbrgILelxqBiMuPyhyIcPK
 wB3fRlfo3tKWH4ErJ1tQE9QrHj0wQl67rsyHOf0B8jfLpoFwWKnxy02pobSiNhUQcxa7
 3vfi7bbd04UEpLeCGg2aOAqV2l48tK0IaZ9ptLPzcMTZD6KA72g/vJrhnRSHaJ1siyx9
 iGEegxrM6KvKqULXHmLcmgjr5qPww2lFR2iLpZSJtFcAajSU52KUwtO2a6FNgM2UxY+8
 bmjQB+SZBEPEDlo9mf1FOilojRzfuKXZrdTXTkzHYnBcw6TEoQqeevWSfCDRntmVsmxa
 1zTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f/W8U0bQIHa5GKUt/WPMmEx9gyM4ao9W0NLGedSTZKI=;
 b=o1OMXpXrRWa9ZkPF1AO347CdcszcjhTTUU0kFbCU3imeplcS/gpBj+Tal0nArThCmf
 f9vLltcAcazAoNN3x3nUfbNJvBEATqzT8B0mn3k/F+Dq8MTs3GXnIMsZkLiEFFB1pAEj
 8QbRrO5WoWtFA1dK8kZqB/06bhJfhM/dhQVEdloFxLAbAL69GhIWwy+Ttrdk34E1D1cu
 dhPVGlFkzUFrpd3m62mOJrYh9HLmVTTkduEskVUFowsues0wHJ+k9OENEYdhd5MCD4e0
 QdvtaGHG91tEM577wLkrL7FJqF01iy69SQfIl1wfj9H8HPZJ9uPjCzaYDYox53B7G/xI
 hGSQ==
X-Gm-Message-State: AOAM5325WnsyOBj/F0XYA/zJ7viwcGHhthpIeKhiQjRHOGA+sccWfZOQ
 4tgoZY4ROrknsv+4Zy60Ry7GVU4gyuXqCg==
X-Google-Smtp-Source: ABdhPJy9LOELd1U5MGNpya0BrTNkr2QpCCK/dMPlGvpZw95ob+BeyANXjUimvNm+bzW/Sk561oWqGg==
X-Received: by 2002:a17:90b:602:: with SMTP id
 gb2mr10413949pjb.170.1611831353453; 
 Thu, 28 Jan 2021 02:55:53 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
 by smtp.gmail.com with ESMTPSA id r15sm5391451pgh.39.2021.01.28.02.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 02:55:51 -0800 (PST)
From: menglong8.dong@gmail.com
X-Google-Original-From: yang.yang29@zte.com.cn
To: dwmw2@infradead.org
Subject: [PATCH] jffs2: check the validity of dstlen in jffs2_zlib_compress()
Date: Thu, 28 Jan 2021 02:55:35 -0800
Message-Id: <20210128105535.49479-1-yang.yang29@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_055558_251497_E7F841EA 
X-CRM114-Status: GOOD (  12.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: yang.yang29@zte.com.cn, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Yang Yang <yang.yang29@zte.com.cn>

KASAN reports a BUG when download file in jffs2 filesystem.It is
because when dstlen == 1, cpage_out will write array out of bounds.
Actually, data will not be compressed in jffs2_zlib_compress() if
data's length less than 4.

[  393.799778] BUG: KASAN: slab-out-of-bounds in jffs2_rtime_compress+0x214/0x2f0 at addr ffff800062e3b281
[  393.809166] Write of size 1 by task tftp/2918
[  393.813526] CPU: 3 PID: 2918 Comm: tftp Tainted: G    B           4.9.115-rt93-EMBSYS-CGEL-6.1.R6-dirty #1
[  393.823173] Hardware name: LS1043A RDB Board (DT)
[  393.827870] Call trace:
[  393.830322] [<ffff20000808c700>] dump_backtrace+0x0/0x2f0
[  393.835721] [<ffff20000808ca04>] show_stack+0x14/0x20
[  393.840774] [<ffff2000086ef700>] dump_stack+0x90/0xb0
[  393.845829] [<ffff20000827b19c>] kasan_object_err+0x24/0x80
[  393.851402] [<ffff20000827b404>] kasan_report_error+0x1b4/0x4d8
[  393.857323] [<ffff20000827bae8>] kasan_report+0x38/0x40
[  393.862548] [<ffff200008279d44>] __asan_store1+0x4c/0x58
[  393.867859] [<ffff2000084ce2ec>] jffs2_rtime_compress+0x214/0x2f0
[  393.873955] [<ffff2000084bb3b0>] jffs2_selected_compress+0x178/0x2a0
[  393.880308] [<ffff2000084bb530>] jffs2_compress+0x58/0x478
[  393.885796] [<ffff2000084c5b34>] jffs2_write_inode_range+0x13c/0x450
[  393.892150] [<ffff2000084be0b8>] jffs2_write_end+0x2a8/0x4a0
[  393.897811] [<ffff2000081f3008>] generic_perform_write+0x1c0/0x280
[  393.903990] [<ffff2000081f5074>] __generic_file_write_iter+0x1c4/0x228
[  393.910517] [<ffff2000081f5210>] generic_file_write_iter+0x138/0x288
[  393.916870] [<ffff20000829ec1c>] __vfs_write+0x1b4/0x238
[  393.922181] [<ffff20000829ff00>] vfs_write+0xd0/0x238
[  393.927232] [<ffff2000082a1ba8>] SyS_write+0xa0/0x110
[  393.932283] [<ffff20000808429c>] __sys_trace_return+0x0/0x4
[  393.937851] Object at ffff800062e3b280, in cache kmalloc-64 size: 64
[  393.944197] Allocated:
[  393.946552] PID = 2918
[  393.948913]  save_stack_trace_tsk+0x0/0x220
[  393.953096]  save_stack_trace+0x18/0x20
[  393.956932]  kasan_kmalloc+0xd8/0x188
[  393.960594]  __kmalloc+0x144/0x238
[  393.963994]  jffs2_selected_compress+0x48/0x2a0
[  393.968524]  jffs2_compress+0x58/0x478
[  393.972273]  jffs2_write_inode_range+0x13c/0x450
[  393.976889]  jffs2_write_end+0x2a8/0x4a0
[  393.980810]  generic_perform_write+0x1c0/0x280
[  393.985251]  __generic_file_write_iter+0x1c4/0x228
[  393.990040]  generic_file_write_iter+0x138/0x288
[  393.994655]  __vfs_write+0x1b4/0x238
[  393.998228]  vfs_write+0xd0/0x238
[  394.001543]  SyS_write+0xa0/0x110
[  394.004856]  __sys_trace_return+0x0/0x4
[  394.008684] Freed:
[  394.010691] PID = 2918
[  394.013051]  save_stack_trace_tsk+0x0/0x220
[  394.017233]  save_stack_trace+0x18/0x20
[  394.021069]  kasan_slab_free+0x88/0x188
[  394.024902]  kfree+0x6c/0x1d8
[  394.027868]  jffs2_sum_write_sumnode+0x2c4/0x880
[  394.032486]  jffs2_do_reserve_space+0x198/0x598
[  394.037016]  jffs2_reserve_space+0x3f8/0x4d8
[  394.041286]  jffs2_write_inode_range+0xf0/0x450
[  394.045816]  jffs2_write_end+0x2a8/0x4a0
[  394.049737]  generic_perform_write+0x1c0/0x280
[  394.054179]  __generic_file_write_iter+0x1c4/0x228
[  394.058968]  generic_file_write_iter+0x138/0x288
[  394.063583]  __vfs_write+0x1b4/0x238
[  394.067157]  vfs_write+0xd0/0x238
[  394.070470]  SyS_write+0xa0/0x110
[  394.073783]  __sys_trace_return+0x0/0x4
[  394.077612] Memory state around the buggy address:
[  394.082404]  ffff800062e3b180: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
[  394.089623]  ffff800062e3b200: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
[  394.096842] >ffff800062e3b280: 01 fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  394.104056]                    ^
[  394.107283]  ffff800062e3b300: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  394.114502]  ffff800062e3b380: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[  394.121718] ==================================================================

Signed-off-by: Yang Yang <yang.yang29@zte.com.cn>
---
 fs/jffs2/compr_rtime.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/jffs2/compr_rtime.c b/fs/jffs2/compr_rtime.c
index 406d9cc84ba8..79e771ab624f 100644
--- a/fs/jffs2/compr_rtime.c
+++ b/fs/jffs2/compr_rtime.c
@@ -37,6 +37,9 @@ static int jffs2_rtime_compress(unsigned char *data_in,
 	int outpos = 0;
 	int pos=0;
 
+	if (*dstlen <= 3)
+		return -1;
+
 	memset(positions,0,sizeof(positions));
 
 	while (pos < (*sourcelen) && outpos <= (*dstlen)-2) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
