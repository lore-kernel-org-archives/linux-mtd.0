Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29FAFD2D71
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVubVHGi8xasZjUyJsVq6Qghyvuf20XuFJim/7e/DUg=; b=iTStG9PxCMhdtf
	WnxGbXeTdNDQGHdeuFMW9gihip8kiECtYwFcPUKqzHZyTx3nhwA+4IrkrZ0iiHS9Wqc7+ZlQ3ZmML
	fzgY71m7XY48BBoCeoxfiFj67Sg0VCvnlasUZWOu28hL+y9xuoiSMCJsDCJ4KNFIFhoiBSgFO8CXw
	bkV+lZ6WGsaXZs494iUXgLz7xH+hI0dTAdi/SBAB4IXGJc0+GRvVcYvsbVmLOVcvWj7a/K/3G9b6e
	q7dCroWejPmCejXGJ+jh94ejBqS5/lHye90VnGw51A+0+3pGSkJZrbDaSquc/uoTvXNM0MgAXrMIg
	fA9ffsvCcctMxXkKLFLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvj7-00000009P2W-1VaV;
	Tue, 10 Mar 2026 11:58:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgk-00000009Kp0-2ClF;
	Tue, 10 Mar 2026 11:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aTXKOI3Mh5/vrUWd7n6fziwiH0BpgJQteVCBFTyW0PA=; b=le8QMtbxRtjQaBUs29OLRazYtd
	4zPUHhvdZKTZ86ilAr/qISvec5X7famFZo3qC+8kJ9CiGTA6wrsa4sbVsYeakMN+7j1nFD6YATgHt
	QwruY+9ie+hLOKTddGQp29GW39noxgC/xXhxWGSIPAygVPvYw1FjNDeG7aLPisH8R7aihQhhPuwB+
	xDobI+it4j81Xb6uwoxyU3psVk4fZN41PFOP9wwoyePyKyYfGnhk8CZE+XAmnJ+PfQbTCrjQfkn4n
	YD5y8mIphWclRDEvLjuEfOodnmr4CDzvIWiAycp8w0OwbEVJECpW+B6tl0brLm8lfYXmmZJ6FfrHQ
	1Kl/LBEw==;
Received: from mail.avm.de ([2001:bf0:244:244::120])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgT-0000000EQ7X-3ygg;
	Tue, 10 Mar 2026 11:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143726; bh=xZ7JyJZFZn3iuOZoe5h922zZ5R4/JN/dDbwKPDTDpVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DinAmxq0LdEBHgGBL7yN+mThFn/2Jhu9YOuH2jhyjRCQP7wX2xayjWDIl59Rrb4CK
	 4PIJ1T+7hTwTj8CuijTOHG0Dr5+uZ6nhOuL9PA+MuH5Ju5mtqzXJbLzXEHHZ0RMdiv
	 vPLvy7MaYVqTlmV0GJrDdkzJ4sI8MLKN5uuQ6tUg=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ac-b734-7f0000032729-7f000001c02e-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:24 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:24 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:50 +0100
Subject: [PATCH 24/61] net/9p: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-24-bd63b656022d@avm.de>
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
Cc: Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=xZ7JyJZFZn3iuOZoe5h922zZ5R4/JN/dDbwKPDTDpVg=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAYnEtzR553dJZWqu5r4IUgVMywPaNyCn2Kl0
 rArZNDCQ6GJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGJwAKCRA0LQZT0ays
 22Q3B/0WDcaxg22CSV3J2yK2YCh66cZH85KFq38ggbwHyd5a8WjqQnka33Kdtc08oHARsU9ozqE
 P4ub42oqVPDyOyAfaW0nuVYHNlcCbmh/bxnwLHvjz7DvZynqqfi+81IpwDPL+nf3OHCqA45W3el
 wXFHM9DZ2DjwYG4MfnrZOmjwML1Qt1LKYUAR5WbU3bIh/t6NofmRATpZci0AEY2ACgSBKNBZ+xC
 yT5B0+MsE+np/c9UPC/BM2BZX3AZEATfPCVPaM5j6SGQ910wEhLc3aOja8ish65RkJANbgaQX9X
 HjK5HDFDjBbvCnKAA71XMeOX3I4/FbTzAL7Ez+9Tosk9xWKL
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143724-D2DE8A3D-E8744539/0/0
X-purgate-type: clean
X-purgate-size: 2019
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115541_505926_EAE33EF6 
X-CRM114-Status: GOOD (  11.31  )
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

To: Eric Van Hensbergen <ericvh@kernel.org>
To: Latchesar Ionkov <lucho@ionkov.net>
To: Dominique Martinet <asmadeus@codewreck.org>
To: Christian Schoenebeck <linux_oss@crudebyte.com>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
Cc: v9fs@lists.linux.dev
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 include/net/9p/client.h | 2 +-
 net/9p/trans_rdma.c     | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/net/9p/client.h b/include/net/9p/client.h
index 838a94218b593f3fb19e6827c472753380193461..4bde6bd716f323c819745e64c7aac0dea7beb72f 100644
--- a/include/net/9p/client.h
+++ b/include/net/9p/client.h
@@ -364,7 +364,7 @@ static inline struct p9_fid *p9_fid_get(struct p9_fid *fid)
 
 static inline int p9_fid_put(struct p9_fid *fid)
 {
-	if (!fid || IS_ERR(fid))
+	if (IS_ERR_OR_NULL(fid))
 		return 0;
 
 	if (tracepoint_enabled(9p_fid_ref))
diff --git a/net/9p/trans_rdma.c b/net/9p/trans_rdma.c
index aa5bd74d333f3b5e6fd1e4344d26bc0201ff7f7f..60461344b536bcb6e94112aace75a88b6a99ad86 100644
--- a/net/9p/trans_rdma.c
+++ b/net/9p/trans_rdma.c
@@ -252,16 +252,16 @@ static void rdma_destroy_trans(struct p9_trans_rdma *rdma)
 	if (!rdma)
 		return;
 
-	if (rdma->qp && !IS_ERR(rdma->qp))
+	if (!IS_ERR_OR_NULL(rdma->qp))
 		ib_destroy_qp(rdma->qp);
 
-	if (rdma->pd && !IS_ERR(rdma->pd))
+	if (!IS_ERR_OR_NULL(rdma->pd))
 		ib_dealloc_pd(rdma->pd);
 
-	if (rdma->cq && !IS_ERR(rdma->cq))
+	if (!IS_ERR_OR_NULL(rdma->cq))
 		ib_free_cq(rdma->cq);
 
-	if (rdma->cm_id && !IS_ERR(rdma->cm_id))
+	if (!IS_ERR_OR_NULL(rdma->cm_id))
 		rdma_destroy_id(rdma->cm_id);
 
 	kfree(rdma);

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
