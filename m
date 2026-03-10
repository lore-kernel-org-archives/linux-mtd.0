Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7456BEB1058
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qm9xWdXcSlPMJS6BIidFGwTwSWtc39X7sKLwfpjhYLk=; b=RfW9BhYYQ4JGqK
	CCQEvKjxO9t1EsoMiFDGAVFFY98sNff3b5fToo5xQhh+qe6ziA9IBoVxGYx/bSsvUSenLikhHM/Iq
	tiXuYIrzGsaQb1siYnkZHu0usrDaf4iucmJQXyl3Y9mBqXaXzuMUu0pYeQsq2Z/7bva4TmgOmO8aI
	yBRLcpot6iMwjebnBFodNG4i+dYYYwrVN9q/ptQ0SxFClPHeNHKZU9LPELG28ctijYJ0IZyQhPxVl
	ELNyVXnbbZIBAxiggAm1r+EZ6vaUImwNa7IhOofxN9RPgFSgTy59+fiNjkYvRFtYHZV1KNuayD7iO
	ck/pV67kJr84ujqoSypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvhT-00000009Lvo-1FoU;
	Tue, 10 Mar 2026 11:56:35 +0000
Received: from mail.avm.de ([212.42.244.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgZ-00000009KUa-1CIh;
	Tue, 10 Mar 2026 11:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143725; bh=c7VqPpX5FOMjU1fomf/slDzrk65Fe9+ZUNfqosDKTdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IViq9CY9kXhTGFn2wUsXBESaNCGz69a5nG3mhGowHHuPZ1SldVYsbRj6+GmFeE33Z
	 /voEH0js7pDgeDh21Z+MjLukbWz6LUMqpwiLZaBJ7bgJ90kdMj+qEaksFeCP8FnFLU
	 ahCh3Altzen7MVBVZyzIJ7pSy8eLwZR3MIuEFpPs=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ad-2367-7f0000032729-7f0000019d84-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:25 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:25 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:49 +0100
Subject: [PATCH 23/61] net/ipv6: Prefer IS_ERR_OR_NULL over manual NULL
 check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-23-bd63b656022d@avm.de>
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
Cc: "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=c7VqPpX5FOMjU1fomf/slDzrk65Fe9+ZUNfqosDKTdI=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAYkT2ujfxBt0/qzL4FNFAkOp+gWHYFk2Lkit
 DIh+cvm64iJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGJAAKCRA0LQZT0ays
 28wAB/9/0/0cpf5vUgxn9MJJYzgxi6whlUVZ+hEx14I9GPhNabUzF2GH9pZZve+bNpQXnutoTyU
 +K2sycG7CaZHe4KrWGw/XkousnHUY+/rbl34+pCGgHYhtioeCxrYnt9GpyhiDjCITZjPGFnwVQd
 tZoQ5ZBU+ihaHpCBS+WuTGNPnpJCCDmn98dooJV56KJmahzsCdhoR05xOLdt45OLH8bgiYvcsMo
 XA7dPRY2ZqI4sORPZUvgQgkReuo3OWATKHpGF0IEcgG6WPoIcp2tLoXu42clOKjzJCoMFBALo5l
 /DTaIDOUTWpiOr9bQY0VQkO8G6JfVgMRTCJghvSt33zKNrUt
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143725-85C93E1F-A15B4641/0/0
X-purgate-type: clean
X-purgate-size: 1560
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_045539_533710_E0CAAB6C 
X-CRM114-Status: GOOD (  11.64  )
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

To: "David S. Miller" <davem@davemloft.net>
To: David Ahern <dsahern@kernel.org>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 net/ipv6/ila/ila_xlat.c | 2 +-
 net/ipv6/ndisc.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/ila/ila_xlat.c b/net/ipv6/ila/ila_xlat.c
index 8991805fc3d60cfd2499146e522da142f33ddc50..c5e3954488ab7a1b1c07aff86385f5000945f1e4 100644
--- a/net/ipv6/ila/ila_xlat.c
+++ b/net/ipv6/ila/ila_xlat.c
@@ -545,7 +545,7 @@ int ila_xlat_nl_dump(struct sk_buff *skb, struct netlink_callback *cb)
 	/* Get first entry */
 	ila = rhashtable_walk_peek(rhiter);
 
-	if (ila && !IS_ERR(ila) && skip) {
+	if (!IS_ERR_OR_NULL(ila) && skip) {
 		/* Skip over visited entries */
 
 		while (ila && skip) {
diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index f6a5d8c73af9721741c11b543e5abeecdbf2079f..ab340f2489c0c7555f48c1f3f5215cb1d0b5b341 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -1083,7 +1083,7 @@ static enum skb_drop_reason ndisc_recv_na(struct sk_buff *skb)
 		}
 	}
 
-	if (neigh && !IS_ERR(neigh)) {
+	if (!IS_ERR_OR_NULL(neigh)) {
 		u8 old_flags = neigh->flags;
 		struct net *net = dev_net(dev);
 

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
