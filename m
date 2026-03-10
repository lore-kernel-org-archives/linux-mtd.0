Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AF4EB1054
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qoVvB1cuV0xvhDtXrwNNqxfxBi9XCLrs2Ts1/rNni2M=; b=NgjCYWy6hkjwhR
	/PptRg1YqEB8hpbPy5IgjTp8JbT5MwmTtqiiSg/GiynWUuU2AVqMUtaHb3VqvxUnb2cYuKKqhHxCH
	Nx1Fj7Xcjh7cSqVD1ynwaJ/vlBpQkbaHxkP84fRm69CwGVGAQRtWxuaknsnyBKGbvfTXCU2Fp86bx
	o9vYm25RuQJl0JWljKdmSAJr+WFXLQJ28GxUvP98G1McBCFU2YaU4loUbYalhOMz71cfg+oUiF/Hx
	7PYfgy3+253cq9qqoFAc+UMqiHbA4V7g/jjvzQPZGkYVtxHNLO0Q6FPNnH+JHv7FLtN7QnEbbRA19
	57In3nG7rCL+7hfKiXmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgT-00000009KQH-04Ue;
	Tue, 10 Mar 2026 11:55:33 +0000
Received: from mail.avm.de ([2001:bf0:244:244::94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgP-00000009KMJ-1VwF;
	Tue, 10 Mar 2026 11:55:31 +0000
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ac-e21d-7f0000032729-7f000001d9be-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:24 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:24 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:36 +0100
Subject: [PATCH 10/61] gfs2: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-10-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=OPqqHdKZkEBOTA9s0xCv07joTtAqSJfXU2nXlSYlnvo=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAX4/dv49K4j89zI86N9JpAw6t8eU0kmPVDxm
 PT/7+a10hGJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAF+AAKCRA0LQZT0ays
 2zIKB/999m4RLBdXe9kckM0CjKr4GcE3BeYjqHOf9Mb/fXRspIYiRhfK/0d76B0wUZ9vMlV+kHN
 aPugbL3mxS3VAKy9S9eV+9mHhq2ovSgAXuPOSy8/qOTGHUqDaNzk/2uQki9ZfnbI3N1QVu0zj5x
 8blYFqhhVL5JzTcz+RG+KziT6t1xXKbIKoya+t7T6UrNg4H5H2bWy4EaQ7+S0qT/OwwuCndJ5uT
 z17dIMTDIfQoeXt9rkvrr2Ft1Brl0Ry1Iiv5kD+CcJTipZJNdlQgICgttnzL/8iG0G6ksTSjehE
 819EPypp6/ZxNz8oLOAo07gCKojS6jLLwc/BvUWqoKOgacEb
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143724-363F1F2F-29C6BAA2/0/0
X-purgate-type: clean
X-purgate-size: 895
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_045529_549567_BBD69880 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 fs/gfs2/glock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 2acbabccc8adf957e02845041193502a96370a6d..8ed6b4535a728e217e5cec7b64488583b5737c58 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -2013,7 +2013,7 @@ static void glock_hash_walk(glock_examiner examiner, const struct gfs2_sbd *sdp)
 	do {
 		rhashtable_walk_start(&iter);
 
-		while ((gl = rhashtable_walk_next(&iter)) && !IS_ERR(gl)) {
+		while (!IS_ERR_OR_NULL((gl = rhashtable_walk_next(&iter)))) {
 			if (glock_sbd(gl) == sdp)
 				examiner(gl);
 		}

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
