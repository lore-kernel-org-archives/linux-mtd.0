Return-Path: <SRS0=ZMxb=VF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EC0C606AF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2019 12:50:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD15320665
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2019 12:50:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q+ydQ8f8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD15320665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ULAh5Y6qxnOTYcNpkbkaTQ8C6B/VemCgnfACVo+vpjI=; b=q+ydQ8f8M7e2tJ
	EAxsmDHNgXcqHsnCP8rGO7SaMz36rM0IvJXu7rC+e0eJ23oOnHLb/NiMnMVpWDGAw9HtoAjWmHGZA
	zl3x6NCd4SgFf/oR16jFYXCnTBAJZcXAuCFWjY7i2oRio7E5kyVOU2QXCbMlDqB3tUcOqHCyiUP0r
	cVxW1jGRgRgmzax9tt4HdwGwB+qYXqFLo9Es1FRgCyzCrRIMFfsWGcu6pVJgRQOWGC7MwfYbx0o82
	ogmBVi3G7dG31fyqcu1TqKdN4nBCqGW5B8FtnAhYxZHwODHsSBoYp/dG7VH0bqq3fpxwzu/3obibG
	oRaNZDdSBcTIif/670iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkT5s-0001fY-Ci; Mon, 08 Jul 2019 12:50:08 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkT5o-00011D-FL
 for linux-mtd@lists.infradead.org; Mon, 08 Jul 2019 12:50:06 +0000
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MiJEc-1iOjn82v7G-00fPdg; Mon, 08 Jul 2019 14:49:48 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: remove c++ comments from uapi header
Date: Mon,  8 Jul 2019 14:49:39 +0200
Message-Id: <20190708124946.3679242-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:+uOHU+4UEMIQVvG6sZZ0WG9SxeOsI22+BEimc3g+pGD2B7re0/y
 LDaqKR2IuOWj4qaciN49K2yV/BwkXGGzw2fEcb4B/VJkusXCDXCI0o4Jvf8COGeLWjtcpkX
 rN0ddo2ar0utLTm5EkXhvD+bzBHGHRFuyBdmQCs7Fo9TG4ECUyA0ISNsOhufuk51zaOR4CA
 iiIG0TvMEo/22HxZEoBcg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w6QPbdb0Tmo=:BkMCVwQoKFaKbeBRhtHXJH
 AcbU8Nh+P4l4ZqIrqnKTXrus6PNlSMQWfPUjpuSPAjQRLKz45Ph02n3v8yokNTgW8FZBKtSQK
 iPLHpZPKNnB9TgBF3hBuEc3GSYV52N831Zg4Wpc/BaUXSdNdZGBHnvoivcFwDpt3KrxCIK1Hp
 z2WYG1lbYj0G/AaUBBOkE8Nw3LqSrhaIf12rY8iDfzcW+83GpaCgix6RX/rjkFOIYC8cTZEUI
 m1bJ2SChv53q0tnKLzRSLsokXfO3Ik6ZaniUkdMXe5A8s4S9xM+bEuFo4ZLdkoakc4hX8WSKH
 b9r06yCbMlUv+dFvxVhwm8tegCUslJhz004VrMbeuxtjh3+yfbth1Uc65mFv1n82mKuIqBZSA
 1diHk3ZJDZuqxSK9pPlPTBf92iyj7jycyrYX9UhmoH6mbkhBAU3ldpGQNV+YV7yHgzDCdFtAg
 cPQlXfC5qkqwB72n7ndLj884P2Le/dkeD8K1qoXHQXiNanxGCbn2kW8Kkk/gNeZZeuFRby7uB
 Ww8z95kzX2JJpJ6HmIT6w3TJADjQt19tWwP1g8PrsJCYX/IyXqq5dJEWWkRDODeQFtThQkVy1
 aJnnXiB4emR+DctDntBUNj1lkWJ5hMjpaqyGbcRSTgnkBJjJ2IlUWxRr4gYBDutJFAuH1GZ9j
 LJlrLat+jQLCbZpLgj0qJwRN63GqMFRkM/TdwkLe5f/+rnolWa+v/1vTWAgq4+68GrXAXY5Bs
 MbkiuvX3I1IB926e16ysoVBPezIKSJrE0BOuQQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190708_055004_817323_8416D446 
X-CRM114-Status: GOOD (  12.60  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Checking the uapi headers now produces a warning with clang:

./usr/include/mtd/mtd-abi.h:116:28: error: // comments are not allowed in this language [-Werror,-Wcomment]

Change these into standard C comments here.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/uapi/mtd/mtd-abi.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index aff5b5e59845..47ffe3208c27 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -113,11 +113,11 @@ struct mtd_write_req {
 #define MTD_CAP_NVRAM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
 
 /* Obsolete ECC byte placement modes (used with obsolete MEMGETOOBSEL) */
-#define MTD_NANDECC_OFF		0	// Switch off ECC (Not recommended)
-#define MTD_NANDECC_PLACE	1	// Use the given placement in the structure (YAFFS1 legacy mode)
-#define MTD_NANDECC_AUTOPLACE	2	// Use the default placement scheme
-#define MTD_NANDECC_PLACEONLY	3	// Use the given placement in the structure (Do not store ecc result on read)
-#define MTD_NANDECC_AUTOPL_USR 	4	// Use the given autoplacement scheme rather than using the default
+#define MTD_NANDECC_OFF		0	/* Switch off ECC (Not recommended) */
+#define MTD_NANDECC_PLACE	1	/* Use the given placement in the structure (YAFFS1 legacy mode) */
+#define MTD_NANDECC_AUTOPLACE	2	/* Use the default placement scheme */
+#define MTD_NANDECC_PLACEONLY	3	/* Use the given placement in the structure (Do not store ecc result on read) */
+#define MTD_NANDECC_AUTOPL_USR 	4	/* Use the given autoplacement scheme rather than using the default */
 
 /* OTP mode selection */
 #define MTD_OTP_OFF		0
-- 
2.20.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
