Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A80BEB1054
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3sLLzKWIHDCydEWCRGwXK7r8LJnhlecWcRh88X8wQo=; b=AqfjNp2ropxbuH
	8f2wgIfGECMwnJD4LV+/J0YzswGDVcWJH9Go5oaFVpIk708jIdZq5a/xGyu7NBjmaYAfpZtl61mwd
	ftlWvBinD7+q5p/Zuj1RinmnBRSRp93ytcEGPFt1du6Ev0vBG9MJ8FBcyWxSZOW4iIyqNylTO257t
	dGDvgCrufMlVG1LPHsmYf3xR7BZOiKQ+fYj1/1A5a04Cg5WSEisLxM2h452r51uEtiXPHLTFMEtBG
	Oy/6KZL9KefiA6FynxwALLN41yuwNsWboAv+gU1tXFqPcPDAyg6nBmAT8Xuzg3GHss74H6xBfVeUJ
	13uD7zCsPl3rXS+JFn5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzviD-00000009N7U-0KAu;
	Tue, 10 Mar 2026 11:57:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgf-00000009Kfv-3BER;
	Tue, 10 Mar 2026 11:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gy402GJXbgyAJ+YKb8LodXTXPBtJ8ptnh7Eq9VEeyMQ=; b=cds7Er5HGCB05t9xE84Z1oyYro
	T0u8ENugRcuyTxz2D8nyU9EW2vRHeyMxP/VvxA6mpjg/5PWknG9D0DGCZUH5QNJnXhjnBnmWRVhGx
	Sy4BcI13RRzT6PaRwWgjaNfsxmnodpD83YpxdntTps5y7VrHxANs1ogGE/fLHLuHmlCE1OcnC/TH2
	+PPIXjVkaypD7+tY+iiQp8LMh3vgFybz3K6dLfyjIM1ldM/3UZq2EWu97ueMtVyF7DNxSk7KVOdcF
	u/MlwsQsjErwku3rj0LsdtXBCj416m8ZIvmUJkOJ4hGUvAQcdha7My4YBkTakKaujt4Yjx/2xUA7Z
	RP9J+1aw==;
Received: from mail.avm.de ([212.42.244.94])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgS-0000000EQ6j-3nKx;
	Tue, 10 Mar 2026 11:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143726; bh=ObADPYZ6pJh7dF4ZtW/umhCREHwhUDWMyq9N6rBcVwQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dw1nuFFWpVVdrKOfBC8Dj4wKZMjU9ddsg9cir5xT91Je3Qc4zdD9Tv9d84zEGU77U
	 bneXu7o4d3sJr/YNLcP9VRF/8FE25ShEW6LPrPIHkFN36JlEXF0VOvnj++ND2duaOC
	 CYWW988mCr9Su8D1d7S5dskAeFMN3TEqL7EVGhxg=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ad-e21d-7f0000032729-7f000001da1a-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:25 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:25 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:57 +0100
Subject: [PATCH 31/61] net/tipc: Prefer IS_ERR_OR_NULL over manual NULL
 check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-31-bd63b656022d@avm.de>
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
Cc: Jon Maloy <jmaloy@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=ObADPYZ6pJh7dF4ZtW/umhCREHwhUDWMyq9N6rBcVwQ=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAY/UcXAwJovG6A4nB7YjchfS8dWMTKJR/2Zu
 MZwvRUzfSuJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGPwAKCRA0LQZT0ays
 2xl9CAC38JfIZK13/o0jdZIM8Gu3hUV57MgGCpPmPgAkgZQzEtBGs2FDO8Fx54b796heUI6C17z
 ZbGY2wRKWGjXSBCngfD+Y2a/1jCSzGEuQ4jVEtxbgFKGiVGPc8zPo3j7RIqGt+XkDfXhUJV/WGs
 +J2xRVA9B3RKAYgO58tDVBDDKVuZmX4cu+ETIaOpu3+o52epJyZqzezdrVwvwMz+c005iQpPVgY
 LKvEVu+vfw1C/S2Bm6+j0K7soEoH7Q1wM0z8TR821F0SvZ3KgnganCVQOD062Ix1eouKRv0CD2a
 gtvYCJFRo6JoTu9p/1jJVnIebiN1A5uUYXaP+Bibs/sNVbrI
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143725-2FBCCF2F-19F0E4AB/0/0
X-purgate-type: clean
X-purgate-size: 1123
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115533_767031_E31BF9D6 
X-CRM114-Status: GOOD (  10.04  )
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

To: Jon Maloy <jmaloy@redhat.com>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org
Cc: tipc-discussion@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 net/tipc/socket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/tipc/socket.c b/net/tipc/socket.c
index 4c618c2b871db681e69f7aec8f660d6130a13346..0d9cb21ffbf1539b7740e76521e3aac5fde322e3 100644
--- a/net/tipc/socket.c
+++ b/net/tipc/socket.c
@@ -2971,7 +2971,7 @@ void tipc_sk_reinit(struct net *net)
 	do {
 		rhashtable_walk_start(&iter);
 
-		while ((tsk = rhashtable_walk_next(&iter)) && !IS_ERR(tsk)) {
+		while (!IS_ERR_OR_NULL((tsk = rhashtable_walk_next(&iter)))) {
 			sock_hold(&tsk->sk);
 			rhashtable_walk_stop(&iter);
 			lock_sock(&tsk->sk);

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
