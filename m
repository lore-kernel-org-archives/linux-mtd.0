Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64D1C312E1
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 00:21:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8226B2177B
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 00:21:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LYgf1dg3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8226B2177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zte.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OaRZiiNpmlukHWAxwROKfiTKPyxB20qnGVw3Zu2M8Gg=; b=LYg
	f1dg32MQhl3tL5Qc2m9Lo5zRFldYDNrogDIdhAeeX1RL40IqBym47WAAZFh8qsoGsbabNiUG283/A
	F85Fl3Bc7poYASSp086pibHWfolnRPL0s20j1p2YGgXk92+q5eRkCOHS6MdtnvW03j2JLgXZQWvOV
	8oTBntwKy3EIwNlDxLcF0dKrD3n1iXkWN9opJNE8l1mGM+wagLYWDSmFhqKlo8GZkVvFimJFvjXs0
	QRu+moEjD0Mt3ruznFWV+7Rp5KuHMXtGsphKU1iy6pfz46iCOFkhWhMD+rIInfCqZLk8EDGMfqNvS
	74gki3DBqQsNtW31yCEnU+A1aYkve6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glNLJ-0008F9-EM; Mon, 21 Jan 2019 00:21:33 +0000
Received: from mxhk.zte.com.cn ([63.217.80.70])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glNLF-0008Ek-7c
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 00:21:31 +0000
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
 by Forcepoint Email with ESMTPS id A2E54AFE57E47DE2ED67;
 Mon, 21 Jan 2019 08:21:19 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse01.zte.com.cn with ESMTP id x0L0LDfs050125;
 Mon, 21 Jan 2019 08:21:13 +0800 (GMT-8)
 (envelope-from yang.yang29@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019012108211593-23233789 ;
 Mon, 21 Jan 2019 08:21:15 +0800 
From: Yang Yang <yang.yang29@zte.com.cn>
To: dwmw2@infradead.org
Subject: [PATCH] jffs2: check dstlen for jffs2_zlib_compress()
Date: Mon, 21 Jan 2019 08:21:07 +0800
Message-Id: <1548030067-37105-1-git-send-email-yang.yang29@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-01-21 08:21:16,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-01-21 08:21:13, Serialize complete at 2019-01-21 08:21:13
X-MAIL: mse01.zte.com.cn x0L0LDfs050125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190120_162129_444871_8F67A97C 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: wang.yi59@zte.com.cn, Yang Yang <yang.yang29@zte.com.cn>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 xue.zhihong@zte.com.cn
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

KASAN reports a BUG when download file in jffs2 filesystem.
The board name is nxp-ls1043ardb-ls1043a.
It is because when dstlen == 1, cpage_out will write array out of bounds.
Actually, there's no meaning for jffs2_zlib_compress() to compress 
any data with length less than 3.
In that case, data will not be compressed.

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
 fs/jffs2/compr_rtime.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/jffs2/compr_rtime.c b/fs/jffs2/compr_rtime.c
index 406d9cc..c69f01e 100644
--- a/fs/jffs2/compr_rtime.c
+++ b/fs/jffs2/compr_rtime.c
@@ -36,6 +36,8 @@ static int jffs2_rtime_compress(unsigned char *data_in,
 	unsigned short positions[256];
 	int outpos = 0;
 	int pos=0;
+	if (*dstlen <= 3)
+		return -1;
 
 	memset(positions,0,sizeof(positions));
 
-- 
2.15.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
