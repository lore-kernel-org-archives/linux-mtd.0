Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2E3E63F2A
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Feb 2026 07:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:From:Message-ID:
	Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2uLQcJPuVHGkoXwTbkyUV7NO3ZBaiBMAH8EqtWAXYtU=; b=TyIaHiKH6pM17o
	k3n633ciim6birQbPdSlWfYROnOD5fDLEozU/fXvWviRqbAv4qBYmUwISdVsBzTCVvSj4bq11hfak
	0MlUUnGaYkIb2+aKyH5IE3Pc+5iavK4xYYvXrOP8Zywqj3BqI1Z96cSGCLJ6cXwnarCcFpC4FmeaQ
	U8b37vtJByWHYpy3H0zT48HFLdBbg6Kb7fHtViCWV4m+q7djnhr1jUuKZqzKlAiPO9mkcgH3XIE0Y
	USGETa7Bh9GmQZR+a7w43QTDH6YAMTo62PuFQNJbNvVRBocAeBuWuURH2oRdmVjZ0Ik9eZ4ocM4Ne
	5uNtY3pYwcJ0diJi6CBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrsfe-0000000641E-29gl;
	Mon, 16 Feb 2026 07:05:26 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrsfa-0000000640p-3Xqx
	for linux-mtd@lists.infradead.org;
	Mon, 16 Feb 2026 07:05:25 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6445C14000B2;
	Mon, 16 Feb 2026 02:05:17 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 16 Feb 2026 02:05:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1771225517; x=1771311917; bh=SqSMnR1aNHeLFEbaIrIJdQySfKhX
	CHZWc8Vomx9GKhE=; b=aeS4tgojApQXR2hzTYJTvi/eh5mPAyi0sdjCOrRaeEYC
	CmohH+mqxYzTxws4fv6JtyXD98tDnz3gBwS3gSHUHiTPTLLSU1rdvYlNgxe5+yZE
	xn+1mx4jS/Ac30NAhiZZ2DhnAN/99ApOa/zjtqCEkJGgFJbGsUo6JhtpapBhBaHr
	gpKBFNTWEV+MtNge3KZMJ4gO8syPRLxB058XSnkabLCQ49rD/TlLxM1q1ko6SEA+
	MDJ223ZbMwT7o7LPd9GBX4TL6XrAxtVhMkacmifj99CSvhu96A4c/+Fi0gNnsfXY
	SFMxjrPiKTnE3WsutsP+OSqAkJdbmXAdYoGQ+of4aw==
X-ME-Sender: <xms:rMGSafu06X_84LrxxZa5HPWSYAAf82VRziHSiAnwbyPrE0gGNQ1fFw>
    <xme:rMGSaTBxMyMhkEPl-2bi64wIDxL8ZJmc-SfUm8tkCigLnelpkYWSi85c7TzwSL38Y
    AIQ7qBuuD8Z-E_XE0PXYJ9OJ4TG60jIoOE90QHi7c5VVNeGJ_i06L8>
X-ME-Received: <xmr:rMGSaWYm9rPmoQ-4qrRoZFxClK-O9TrytPapaH0PAsh-PvHqW-shO9OSoytkT5WDPio__C3LzzBVPRzoygpEvtdd94nk-JVXA0s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudeivdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepvfevkffhufffsedttdertddttddtnecuhfhrohhmpefhihhnnhcuvfhhrghinhcu
    oehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekffejgfehheehkeekffffveekteevvddvveelhffgffetteefgfeutdehleetheenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdp
    nhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhiqh
    huvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrihgthhgr
    rhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtg
    hpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhhrghruggvnh
    hinhhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhht
    ugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rMGSaeWy4q1bRth2zeRvN7PhjhaNZeEFtDfXBmts5lsf8Q39VRBwdw>
    <xmx:rMGSaVMZ3LjNHQ_ZaV0lSrmopi-jfDeyZnBFB3i6de38won0740bnA>
    <xmx:rMGSaYYQndhKMHGWEULjbW-SyiiQ8vWEufJgLPkjV2BBOvcYmFrhnA>
    <xmx:rMGSaU9pR5BptDKGzFeE4Fdc3OveaPopGEBXQpEyB6rsL8EA_DnMoQ>
    <xmx:rcGSaZg5QLDK6SeihI8K5VyTZIwYmT7GmkAPYxnb8XerNDJ_31VJSmw3>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Feb 2026 02:05:13 -0500 (EST)
To: Miquel Raynal <miquel.raynal@bootlin.com>,
    Richard Weinberger <richard@nod.at>,
    Vignesh Raghavendra <vigneshr@ti.com>
Cc: Kees Cook <kees@kernel.org>,
    stable@vger.kernel.org,
    linux-hardening@vger.kernel.org,
    linux-mtd@lists.infradead.org,
    linux-kernel@vger.kernel.org
Message-ID: <e11761ba31af4fd1d310f40f9b6a1753a0227025.1771225290.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v2] mtd: Avoid boot crash in RedBoot partition table parser
Date: Mon, 16 Feb 2026 18:01:30 +1100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_230523_133724_14013315 
X-CRM114-Status: GOOD (  11.82  )
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

Given CONFIG_FORTIFY_SOURCE=y and a recent compiler,
commit 439a1bcac648 ("fortify: Use __builtin_dynamic_object_size() when
available") produces the warning below and an oops.

    Searching for RedBoot partition table in 50000000.flash at offset 0x7e0000
    ------------[ cut here ]------------
    WARNING: lib/string_helpers.c:1035 at 0xc029e04c, CPU#0: swapper/0/1
    memcmp: detected buffer overflow: 15 byte read of buffer size 14
    Modules linked in:
    CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0 #1 NONE

As Kees said, "'names' is pointing to the final 'namelen' many bytes
of the allocation ... 'namelen' could be basically any length at all.
This fortify warning looks legit to me -- this code used to be reading
beyond the end of the allocation."

Since the size of the dynamic allocation is calculated with strlen()
we can use strcmp() instead of memcmp() and remain within bounds.

Cc: Kees Cook <kees@kernel.org>
Cc: stable@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Link: https://lore.kernel.org/all/202602151911.AD092DFFCD@keescook/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Suggested-by: Kees Cook <kees@kernel.org>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 drivers/mtd/parsers/redboot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index 3b55b676ca6b..c06ba7a2a34b 100644
--- a/drivers/mtd/parsers/redboot.c
+++ b/drivers/mtd/parsers/redboot.c
@@ -270,9 +270,9 @@ static int parse_redboot_partitions(struct mtd_info *master,
 
 		strcpy(names, fl->img->name);
 #ifdef CONFIG_MTD_REDBOOT_PARTS_READONLY
-		if (!memcmp(names, "RedBoot", 8) ||
-		    !memcmp(names, "RedBoot config", 15) ||
-		    !memcmp(names, "FIS directory", 14)) {
+		if (!strcmp(names, "RedBoot") ||
+		    !strcmp(names, "RedBoot config") ||
+		    !strcmp(names, "FIS directory")) {
 			parts[i].mask_flags = MTD_WRITEABLE;
 		}
 #endif
-- 
2.49.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
