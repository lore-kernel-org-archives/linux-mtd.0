Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67D1606A328
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2026 07:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zhaEiO5J;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b=Qo5+2f7s;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jpksZjVX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Y0RLZ8e4IBGOcIjiRhl0s/O6XNu4Mo6rKISMgY+fn4g=; b=zhaEiO5JbQtQATwcFpuuuD85QW
	Dc/VtpZa5fyxFESGSaXc4ysfdtovNTgnBLlUoJj+oOhhj4FImnUcxeoJQo7EMrHO3ha2vAEooaMCs
	MZ/Nop7citv84j83h8mUODr1dBBy622SJwFA7eLDjJ3ityH3ArddI5r4/KZNxqWRb9aDovs0/6QaU
	3QCVe5SFIuBf2F6F/JcaSVWb5gneHoO25OFQBQHCNlQ9XJjaFyLtlwjRZkXMNmxz6dQqtXM9m6bts
	D+XtCxLzPZwju9cZj1DNVvhGv3hLak4yfACkmtbc4a1c5Pbq9pyKTm9XmK1QbOhUwCcnyELiqCYbH
	zeO0Cprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPED4-0000000BQdG-057X;
	Fri, 06 Nov 2026 07:18:02 +0000
Received: from flow-b5-smtp.messagingengine.com ([202.12.124.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPED1-0000000BQcH-12ZF
	for linux-mtd@lists.infradead.org;
	Fri, 06 Nov 2026 07:18:01 +0000
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailflow.stl.internal (Postfix) with ESMTP id 00A0713023F4
	for <linux-mtd@lists.infradead.org>; Fri,  6 Nov 2026 02:17:55 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 06 Nov 2026 02:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1793949475; x=1793953075; bh=QoZ/ne06JK3eIUX8iXVkb
	XJS2m5jitLoavGyx1etNyw=; b=Qo5+2f7sJv9ANSJluL6zh7y5PfyEU4vjYmVbH
	jos/pm8nJu5AUG8v5zSzolmGyZTkmpNA2en3DdBNVeRXfBd/T1tL9v9AsltS6bt8
	puRg9aTXv70uax5Z2+REvJ96Fc5FVqTnT13SdFsXhKdwqgMwztM+1yhhv+iyZDnd
	ruvcgIJ/78yfgroba70llTMFOSc3v/B//f+vfQITu38KolBzjj7PurdGKU7ixrRZ
	h5TE/c0GEhownSscaWF02hOu9V1YVqX5+nVCDk1xxXOoMuEcd51z8j6u4uxnDecI
	RrHh101cCfkmHWtu/cIk/mMM5VVM8ueKjfsw3lSVM4K7ImkIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793949475; x=1793953075; bh=QoZ/ne06JK3eIUX8iXVkbXJS2m5jitLoavG
	yx1etNyw=; b=jpksZjVX0oxuNP8KjD6sgUX+nwQq4UDwG+Z7RBwAhyIvMlNGVnU
	M/3hHbYgeupnj+xeDhyg+BQZPi+TTA5wwCBQQgJjMY1q0ccMiEunTZbz+PtLoZRN
	SzgyFGG880EKkgOmBwwCu+tZEx7mfiVv+TkRjAQTcFXXMHZbbnXCN/2oJsBNBXz6
	5RjTWemHZy7srAuiHeDEDTJTvyWqWM9KCb3WUxyALwsMd6xmkFv6tcgBLxReFFkU
	mrm3Ke3uvMI2rkr5aDDso957UP2PUW8ocDgzYqOdHSn3mwjc+InnRe6OOsM0iT0Y
	RxMWffDjQ7Le/NjJl8atkL+bNtZ0y81+R7g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pobox.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793949475; d=pobox.com;
	mf=PG1ucEBwb2JveC5jb20+;
	rt=PGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPg==;
	s=fm2:rsa-sha256:LSk0ZqkuWdWLkwdy0iMyfuVZ8X08RqhS1lqGXlTMvFRjJcZ
	+Rf610NQCUthJGQcd5vRkjp4qL4XETyettpE2gh0BNKwb6Eb/3tu2RB4KYBb1zu0
	KK/4cqyZ5CngljTqdEYQ47qokrSzkPnuovh1OxHcU+j1hs7t1XxvBp2RMLQYKLIC
	5QWoMuZWBvbr9oXXtyQC6uNZs1Qu58X5l7gqUdxv3NIsgOPeXwbQNwIqorNEVsYc
	Bq5Bq8hyyUKgB2e8+g5UGHGqofyLu1/fA8cPCIhlMj13LEPJZornOaWyFQ32TBik
	bczjceopnSDYZ7oYIyKnXEFOta3IuujsVtqAOpw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:15dDf4Y0g1fWChhKhRnf/IZQ1qXw/+/2Mvs86IIyt8M=:H4SNGWbTrsXvTior3l/nEZTKtXoe2h8waAOk2TY/6u8=;
X-ME-Sender: <xms:In_tasgnR-NiidilCboZh8Z1zAk5SF1c3GIqZzApiFB99_43bVVb4Q>
    <xme:In_tahCeIbAwXrbQ0gS9gQHaUk1U8_-9AgbFKbsXpJad22B7lTQyzbafV6xjZFgvY
    nQaQj0aHtjOGzyGyqk3YUfHulqM1S7tSC7ErbacKKJL2SR7mXyZZbA>
X-ME-Received: <xmr:In_tamT91UtePJQ_BtH79V_Or3nNl7EGGrSIRk5hSzzcQcexL-FwZC-sHQN-iv_qj4AWl8Pt8w>
X-ME-Proxy-Cause: dmFkZTGlCztvlMjvAmpB78f2p1N35vckEhhpDHoEToHd3P+g9c5a5eSfxQf9+VB6QlyPkf
    2/xNIQhyqVDRM6qMDwz7U0K/neFLSojnWmCP+EDdgN+R44ipysueea9RdzMILHA1IvPSL1
    ya3xaErVGX1qQz4T0deRsHPJlIygESsz5nX7BY7A5DZha2iTKT0gs2W6NqYmrnEKeioTfT
    AzgixfZK/PL8CtXS1E0ixeTdFNT7feBSWkzC++xdl8okijZenDgvJdKMBGO01KLyFE1GwD
    z/F/Z+TJt9uZto2OTJmaMHHc+mRxOBjaSYibuE2+GeksmrW9OJlUeEXfCv5UUsrDY6FoGT
    UnCOqW5WUEo0fqdTocLaeoCKcaUvf9xCTflIwjwT6qrJCeypLZ7fPYcF4ud6+rMsLS2Syj
    HUdA0wVrnx0pNeGyvdS1NcTWwWAbL+1KQ1hrwbPlCwq8bOQTpvW7va0rUP+YuM2Uk+2nYq
    8QZswnNHNgJUNJbQ2bSHb+zL23/hGjmSGS/XHcxcVjzeVcCXqSoo0xswbd9jBb97pUbSsU
    GOuiKLwZVwSy746pPaxdqMYez/g7Hz+DYIw6WjCbKc4/k5Tg7OqvvAMMpP/C0uWRHFX9tX
    HXiQWlwcLeU9HuPAKb4ZHU+jaZmgDbrAuN9AT2KaA4Ny77HYnejOELmZUy/A
X-ME-Proxy: <xmx:In_tauWbqA6XSkKVjyl2HcZu8d2EPZ5xDvCvQh0GVlgCUBq7DL52ww>
    <xmx:In_tanfzE46ZvDAl3LO-9o8_xR4AVTE1qROMPZON-26tcSP2jKodtA>
    <xmx:In_taiJJfBycwtvRTI7QXuq59Yz8ihIcMFBaxnOo4gRy_qkkKiL1Zw>
    <xmx:In_takzfdzNof6TBwY3Mmo2HXHWw7K2B94RWMpPATh_gw0tcECN3DQ>
    <xmx:I3_tau0JZ1TxpEZZAH58UTuvH1IPtdlUVnQmGl4j4P0tTrlfkZbfSeOK>
Feedback-ID: ie71e4a86:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Nov 2026 02:17:51 -0500 (EST)
From: Mark Payne <mnp@pobox.com>
To: Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mark Payne <mnp@pobox.com>,
	stable@vger.kernel.org
Subject: [PATCH] ubifs: fix integer overflow in pad node length validation
Date: Fri,  6 Nov 2026 17:15:03 +1000
Message-ID: <20261106071503.4333-1-mnp@pobox.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_231759_709286_520840FC 
X-CRM114-Status: GOOD (  15.16  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ubifs_scan_a_node() validates the padding length of a UBIFS_PAD_NODE
with:

   if (pad_len < 0 || offs + node_len + pad_len > c->leb_size)

offs, node_len and pad_len are all signed 32-bit ints, so the sum can
overflow. ubifs_check_node() has already bounded node_len (28 bytes for
a pad node) and guarantees offs + node_len <= c->leb_size, but pad_len
is taken straight from the image. With offs = 0x20 and
pad_len = 0x7fffffc4:

   offs + node_len + pad_len = 0x80000000 (INT_MIN) -> passes the check
   node_len + pad_len        = 0x7fffffe0 (positive, 8-byte aligned)

so the following alignment check also passes and ubifs_scan_a_node()
returns 0x7fffffe0.

ubifs_scan() then does offs += ret, buf += ret and len -= ret, leaving
buf 2 GiB past the scan buffer and len negative. The trailing
empty-space loop (for (; len; offs++, buf++, len--)) dereferences buf
and faults on unmapped memory:

  BUG: unable to handle page fault for address: ff799130402f9000
  #PF: supervisor read access in kernel mode
  RIP: 0010:ubifs_scan+0x24f/0x2a0
  Call Trace:
   ubifs_replay_journal+0x13e/0x18a0
   ubifs_get_tree+0x5f7/0x2410
   vfs_get_tree+0x2a/0x100
   path_mount+0x36d/0xcf0
   __x64_sys_mount+0x12b/0x160

On an unclean image the same wrapped length reaches ubifs_recover_leb(),
where clean_buf() computes c->leb_size - empty_offs with empty_offs ==
INT_MIN; this sign-extends to a huge size_t and the following
memset(*buf, 0xff, ...) writes out of bounds. In practice the read
fault above is hit first.

Bound pad_len by the remaining space instead:

   pad_len > c->leb_size - offs - node_len

offs + node_len <= c->leb_size already holds after ubifs_check_node(),
so the right-hand side cannot underflow, and the comparison no longer
depends on a sum that can overflow.

Built and boot-tested on Linux 7.4.0-rc1 under QEMU with nandsim
(128 MiB Samsung, 128 KiB PEB, 2 KiB page). On the unpatched kernel,
mounting the crafted image oopses in ubifs_scan(); with the fix the pad
node is rejected ("bad pad node at LEB 3:32") and mount fails cleanly
with -EUCLEAN, while a normally-built UBIFS image still mounts and scans
without error.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Cc: stable@vger.kernel.org
Signed-off-by: Mark Payne <mnp@pobox.com>
---
 fs/ubifs/scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index cbff2d800e27..441b2f04a0ae 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -86,7 +86,7 @@ int ubifs_scan_a_node(const struct ubifs_info *c, void *buf, int len, int lnum,
 
 		/* Validate the padding node */
 		if (pad_len < 0 ||
-		    offs + node_len + pad_len > c->leb_size) {
+		    pad_len > c->leb_size - offs - node_len) {
 			if (!quiet) {
 				ubifs_err(c, "bad pad node at LEB %d:%d",
 					  lnum, offs);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
