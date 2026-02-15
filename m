Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A030EEF584D
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Feb 2026 00:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:From:Message-ID:
	Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vYmlppmc38aBfHuVJ38/B/YUxe3yZpYifSiD4uU9rCQ=; b=mC3OuL3QLkFLw9
	OMrL2wWJgBV3h6sLLJhtfUzE1F1Jt5Naogmq31gT4SihEBZ88CdEmQA5tG8TNKlijEtLAtAhzQCnn
	6AUz13T1z0zSE5vhOZqmbHuO27kt/OkFEyxut0mFSoayJcihjMx2oKWJIDG0AxlpAhCaOov4FOS7V
	JZUfBVqpO9aq99Bqk5fytpypP9BbzSYqjzryf0y185v276wnomr7Dr/HyK2XZKFxh2H9mCNyaQZg5
	/jRevCGa9RUyn91tL2UbqlaaXJBUCbuLV7y/kc9sBFgDQvPvfHRClXhn2dPQt5c1qj35PG+mJYKmy
	Fp5nHAAPgs3jNBKTatCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrPul-000000052ye-0898;
	Sun, 15 Feb 2026 00:23:07 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrPuf-000000052xx-1Um4
	for linux-mtd@lists.infradead.org;
	Sun, 15 Feb 2026 00:23:03 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EEA6F7A0010;
	Sat, 14 Feb 2026 19:22:55 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sat, 14 Feb 2026 19:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1771114975; x=1771201375; bh=hc2F8xxBgw9KFLMT7GGYPqWvc2/v
	LKLhR9u451GcYGM=; b=fAzw/vJoD4OA++mzSv7rPKdhnwXiJFxFF8L1eN2Lnsdp
	8dsGqWc/v5Iny/jI+26i/HYJIVmk5QIDNGp8wjvDNSlCayGxAb/433cq06R6xVC8
	zpVFirCnEOeXk89Cd2KiS+eCjCPsK6frOKVx/hLb/aKmQDt7/eewhAQYQFZNPOCf
	T+Wa+cT7OyHAD9ZvIsYO5fquQVPcWsoflpy2mf5YsXCN0T18QUshBD/o5r9HEcKD
	93Mtde2G+1JTdYeOSjfmTlgyCUfeKHgHt+FNBQzSMhnioSLdMgc8oH1jV/9KfiGj
	bKDVQBH2ABn1FtRO4rw7SFnSqrYl3Manie1Z2D8J1A==
X-ME-Sender: <xms:3hGRaRFBSZ-wixRZ882PFQBCq2seclqI1OwLrLEFrBn-QN8M7LTf5A>
    <xme:3hGRaS7hHdQ99m5LFmr7hxVm8vtf2aLv52B7DbfklWFfxVvOTEpa5j4eHuw6mZ_CM
    EaE6WuCm7wM_hnqmEXlS51YnHjriSOmfUkbQ9UHTK3sXYdiZSXaG74>
X-ME-Received: <xmr:3hGRaXltFhfl8XPh2kMrmcBs_-93fWCVLJPVDy5dwIgtlpYHP-hJBHLJjsQK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvuddvheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepvfevkffhufffsedttdertddttddtnecuhfhrohhmpefhihhnnhcuvfhhrghinhcu
    oehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ehfffggeefveegvedtiefffeevuedtgefhueehieetffejfefggeevfeeuvdduleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinh
    eslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeelpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrd
    gtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhi
    ghhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshht
    rggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqhh
    grrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplh
    hinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3hGRad5T6ATE_vJgdFk5xWyKGWNArPEh3uG-VxlbzGzXHQBrgMJrUg>
    <xmx:3hGRaYQBCwOjV2BkMkwFfAROFHD_LTYiyvZ7sO69rVRcueGOomu-sg>
    <xmx:3hGRaby0vuUEW5XKErtaLXaxmE82IPweYfpI-MLPDCYgK6yxjzsfdw>
    <xmx:3hGRaQpFpGG7GUnYK-oOTPa_ewvSwIusT5iIAeCYQRRmFRm-4Yr8oA>
    <xmx:3xGRad8IAf8GkErZGecpHHYgVU64nmYTMllA1M_rYIj9p3VzcKTMgAGL>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Feb 2026 19:22:53 -0500 (EST)
To: Miquel Raynal <miquel.raynal@bootlin.com>,
    Richard Weinberger <richard@nod.at>,
    Vignesh Raghavendra <vigneshr@ti.com>,
    Miguel Ojeda <ojeda@kernel.org>,
    Kees Cook <kees@kernel.org>
Cc: stable@vger.kernel.org,
    linux-hardening@vger.kernel.org,
    linux-mtd@lists.infradead.org,
    linux-kernel@vger.kernel.org
Message-ID: <92af570970aadee773f2b0b18179efef0f34be93.1771114891.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] mtd: Avoid boot crash in RedBoot partition table parser
Date: Sun, 15 Feb 2026 11:21:31 +1100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_162301_440078_B4BAEBE0 
X-CRM114-Status: GOOD (  12.48  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Given CONFIG_FORTIFY_SOURCE=y, and given a recent compiler,
commit 439a1bcac648 ("fortify: Use __builtin_dynamic_object_size() when
available") produces the warning below and an oops.

    Searching for RedBoot partition table in 50000000.flash at offset 0x7e0000
    ------------[ cut here ]------------
    WARNING: lib/string_helpers.c:1035 at 0xc029e04c, CPU#0: swapper/0/1
    memcmp: detected buffer overflow: 15 byte read of buffer size 14
    Modules linked in:
    CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0 #1 NONE

I couldn't see how memcmp() exceeds the buffer here, so the simplest way
to prevent the regression was to perform memcmp() on the original name
rather than the copy.

Cc: stable@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Fixes: 439a1bcac648 ("fortify: Use __builtin_dynamic_object_size() when available")
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
I put commit 439a1bcac648 into a Fixes tag because git bisect identified
that commit as the source of the regression. But I don't know anything
about __builtin_dynamic_object_size() or its limitations. So perhaps the
real bug lies elsewhere. The compiler I'm using is this one:

$ armeb-softfloat-linux-musleabi-gcc --version
armeb-softfloat-linux-musleabi-gcc (Gentoo Hardened 13.4.1_p20250807 p8) 13.4.1 20250807
---
 drivers/mtd/parsers/redboot.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index 3b55b676ca6b..6e253f6c45c9 100644
--- a/drivers/mtd/parsers/redboot.c
+++ b/drivers/mtd/parsers/redboot.c
@@ -269,14 +269,14 @@ static int parse_redboot_partitions(struct mtd_info *master,
 		parts[i].name = names;
 
 		strcpy(names, fl->img->name);
+		names += strlen(names) + 1;
+
 #ifdef CONFIG_MTD_REDBOOT_PARTS_READONLY
-		if (!memcmp(names, "RedBoot", 8) ||
-		    !memcmp(names, "RedBoot config", 15) ||
-		    !memcmp(names, "FIS directory", 14)) {
+		if (!memcmp(fl->img->name, "RedBoot", 8) ||
+		    !memcmp(fl->img->name, "RedBoot config", 15) ||
+		    !memcmp(fl->img->name, "FIS directory", 14))
 			parts[i].mask_flags = MTD_WRITEABLE;
-		}
 #endif
-		names += strlen(names) + 1;
 
 #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
 		if (fl->next && fl->img->flash_base + fl->img->size + master->erasesize <= fl->next->img->flash_base) {
-- 
2.49.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
