Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79BBEB1055
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PmiPEV8xWgpo43YMJOpCAXNaOAvnvqyV8yonLLnip+g=; b=o4bLQCRRIIHAM2
	gWl8TOIJZIjwNyRmXUoONi2fPVoxRUn5iD8GOB+j6GipzrekLiHlgU5vO+hAjMS3pDuV2v5w0kdVd
	JtvibjDB3wrlK4HjCU9syJUFt7UpEfvueRkH/g4RQTJlnbVS/3JHHWhQzNpQFhIwsBdNmpnirGShu
	MhxfhuiFjuMfwwu93o6gkdnt434STotMSn7hf7CNK6W+SD3zXy2Uiv7rrN2x8iO3kWBF690y5t/an
	cLHEX0BSSv+DTcMxtOZ3J9tbu5SGOa1emkvWnKmULcRfjHMLWL2YhRLnd2+y0eCgw0k+PC9rQ3aSO
	R2TQ5ZtSJAlQ176USCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvhM-00000009LlD-0KIk;
	Tue, 10 Mar 2026 11:56:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvga-00000009KXq-47Vi;
	Tue, 10 Mar 2026 11:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=RkVJJN6s61vqv/oYn7Rklty5Kyy7/KKuT2I194xYAyU=; b=CinRNcpzUFNMgqa0/94EViidbB
	IC+XUOmnylcj5NJLZwM5NJeoAJbByABVSOLCE2B6dRUVFfw4jVV0WVLRrX7m/Wnob/jv80ztHpawW
	aDAeXsqXHoQE+T7bIpOPJxD5F2ldBZwjH/Lgi1RbFeKkdgcJLTTyI3ppNCE92mc6BCwBhxjkPYfN7
	vV3tiB4ijU0NA8m9RH0fklwGldYP1nyAwevjNnPXe31yJf+uzBWlFh/jtz686TNoTEs/ylUyej7Wg
	fLYQQK+IaHfLRo6WZmB0LZ6k4Zl3loiAw4K2JviDFly1cnNjI1Pb6sFVrp9HPKIAV0l8nfVpwDFnM
	a4CIhLcg==;
Received: from mail.avm.de ([2001:bf0:244:244::119])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgX-00000007ldH-2jLP;
	Tue, 10 Mar 2026 11:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143725; bh=x2oaB0qg8CghMqZVE4wv6e6u03uqEA8RFTswQdfTK1Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qDt+eOK17tgbgqdmabp3KToGWo0cL117JvmRPKJVxtawLwwb7ps7z1wEd3vWO7I7I
	 4b7B5Oqe+82BCygMvdbmbm7KFHTrarRdpcpv9cxBTuo4h8o6I4dLLRK4rlBY6AdxnJ
	 EBWBkLJwSKE2HvUxw9o04CGzwbSOLqvvPPh3XW/0=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ad-2367-7f0000032729-7f0000019d98-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:25 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:25 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:52 +0100
Subject: [PATCH 26/61] net/core: Prefer IS_ERR_OR_NULL over manual NULL
 check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-26-bd63b656022d@avm.de>
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
Cc: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=x2oaB0qg8CghMqZVE4wv6e6u03uqEA8RFTswQdfTK1Q=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAYuz1CTGrbQpXzwm84r9mgKg2KIh9nV8i33X
 Xzcah43D7uJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGLgAKCRA0LQZT0ays
 231ZB/0bxZ/Qbs9IAD9kpPvo4QA+XnJGKWUdztF9j621/TW306I8+ggVrnqlG+FNuG2wVrw0WhJ
 ixcD9BMxptD/u4aa6XFjRfTlj5zAYq7AiLoV88hQ2zukJ0WZTgZ9ho7LLdTHbtDdQJg3IZi/ib8
 fJneCHe6P6SZ1m2EjqIO05fxr5kL7CgbuXZRdzSHe3+MgFHVghSrb0gT6dh9+gXstARt02FCx1t
 CbFc8t5W3HCfOWn15oLGczjOwJcE0jsoiVRPvvyO1awUr0bgUV2AJDFjkVpAz2ZTueHBx4ee0oO
 uXTsT9eV0KkVBz5xaaOgAyF5s8m06WIrMfH8OhTYPEwluE5m
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143725-7ACF9E1F-2B37C654/0/0
X-purgate-type: clean
X-purgate-size: 1269
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115537_769376_E2AFB90F 
X-CRM114-Status: GOOD (  10.42  )
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

To: Alexei Starovoitov <ast@kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>
To: "David S. Miller" <davem@davemloft.net>
To: Jakub Kicinski <kuba@kernel.org>
To: Jesper Dangaard Brouer <hawk@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>
To: Stanislav Fomichev <sdf@fomichev.me>
To: Eric Dumazet <edumazet@google.com>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org
Cc: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 net/core/xdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/xdp.c b/net/core/xdp.c
index 9890a30584ba7b08b246dacb984b639908f16242..c92cac2ccdb759457c7ce6a38e04e20190dff2a3 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -101,7 +101,7 @@ static void mem_allocator_disconnect(void *allocator)
 	do {
 		rhashtable_walk_start(&iter);
 
-		while ((xa = rhashtable_walk_next(&iter)) && !IS_ERR(xa)) {
+		while (!IS_ERR_OR_NULL((xa = rhashtable_walk_next(&iter)))) {
 			if (xa->allocator == allocator)
 				mem_xa_remove(xa);
 		}

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
