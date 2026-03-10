Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74CFEB1053
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gngKPYmULzuoWpp2X6mswa1TU45HAf+YoYpIBfQK2RY=; b=uf1XQygGGFhILx
	lxncfGOy1rGaUQNKLSF/00lABs4C8DveZZMjPIGuwS3jKxEhHqQX84RT1eMTeKrzz+Lkuesn3SHyc
	z+gYFF0jav3f9bqDon16l+g8hXHIHFBJ9excklxnW8k6LtSLJig+s2Ns+gqPktmAnFwKy76Beh/vh
	Kpxv00F7iTU24mifQFP0mQcf7wbVHCCNvYFK5ePobClcW08WH53Qzu9aM9kI54n6+H2NjJyYWiabZ
	NzPzoX5zUWe4ueqTei69yUWPHEoU9TiftL+OFN8zBBzyvI8BuSIld3hSGQFOhpLrFM9/o4vhsyKKD
	mDOx6APKvLUyBRuAD4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvhV-00000009M0J-3jqu;
	Tue, 10 Mar 2026 11:56:37 +0000
Received: from mail.avm.de ([2001:bf0:244:244::119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvga-00000009KUc-1TZO;
	Tue, 10 Mar 2026 11:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143725; bh=uPgyjK+s+NGMdE+cG5MPshRhc7ZZgUWwr7PoRjCZSpk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EmfqFdXEdiCWqgoXgX8BLevw6sTpNgfg8llLMS9eEaTKVg51Kp8K29SjBZVEdIV/s
	 M7bvI3BPyHpPb6vMRi2BheqpUIfCWQ/6jm+gYuX79PpwCNDjLncHrcFsaokOkzLrgm
	 dBKJjX9bdtP/6DkQEVr2DPx5QPmWYl9+WXcAxUUE=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ad-2367-7f0000032729-7f0000019d9a-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:25 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:25 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:55 +0100
Subject: [PATCH 29/61] net/sctp: Prefer IS_ERR_OR_NULL over manual NULL
 check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-29-bd63b656022d@avm.de>
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
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
 Xin Long <lucien.xin@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=uPgyjK+s+NGMdE+cG5MPshRhc7ZZgUWwr7PoRjCZSpk=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAY4baP8me9X19X7pKru5bhCt+OcLVsbTz9gw
 3EXL2x+9HiJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGOAAKCRA0LQZT0ays
 20eCB/9R10a8QtWnOE8FDIK68et8w+x4vBIl7DAH3ljWsVvEsJtllIM7WoriXoMKcy69weBfdTt
 udsIaDDf3FpSbi6d23LNVWvY7/j8StHi4Mb7YRTkDtjVuH7qFkxhMIEkO0P72RZbdjNmUsWZOT+
 4yfdZZ4sqiFeE73LKQ05t8sm9/1XHgZKcnk5I6ebEYNeQeVfoiugFSvaTmWSBPUItBis/2y3N1h
 19AfztgUerK/fadW7Y/vZ3pDRpIi5ZAslPLWaCgGa6B5OoDoVAvOz5XPc/Ut45LGyZkJYA2qiTr
 TmaKunQohnKINyK0THlxz9DBNJM47y+p9em5r+zCNMTJFQSn
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143725-73CEFE1F-39E0F1CD/0/0
X-purgate-type: clean
X-purgate-size: 1171
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_045540_672427_B59E066F 
X-CRM114-Status: GOOD (  10.12  )
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

To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Xin Long <lucien.xin@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
Cc: linux-sctp@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 net/sctp/socket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index 05fb00c9c33576d1e18ee31c34974d8b76efa768..a0596c94be4ad6afae6be13adb3bce17140264e9 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -5349,7 +5349,7 @@ struct sctp_transport *sctp_transport_get_idx(struct net *net,
 	if (!pos)
 		return SEQ_START_TOKEN;
 
-	while ((t = sctp_transport_get_next(net, iter)) && !IS_ERR(t)) {
+	while (!IS_ERR_OR_NULL((t = sctp_transport_get_next(net, iter)))) {
 		if (!--pos)
 			break;
 		sctp_transport_put(t);

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
