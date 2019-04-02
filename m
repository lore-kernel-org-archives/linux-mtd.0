Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC45EC4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 20:55:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB0D22084B
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 20:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ILWueWm0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="FrZdRMWu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB0D22084B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:MIME-Version:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdzscDBs/Hha+KLu7jqrIJJdJwosORVfuy6rpNgOESI=; b=ILWueWm0tVB4a6
	kRvvqqSn0QLflD1amSu4bn61ojzhL3sjpHB7vFBnvmk3FaOTjidyKfH0S7QjsvO8ZbxPYGPIZLduZ
	IeYU6mVMk4vMEhwbp5V0aL1iXngtk3sKbcPFDrXC7IkpoE0M6S7N4427Vn9uSTakhh9yyvuCLeAku
	jvC8Bxsko2DWMcs8eehE5s5tSEDNC3k4ceiPGEDw21wvrw7U7NSXDNHPt38K/WLUG1dpmyFZDaIEO
	SGVs8lXBQi9kcG+Y/3O48VzIkDdRmXxkkbPqt4c3TKKsh5wf3GNDyqrp3HRfr7fvGw5/LlOm+c+pP
	Rzfv6Qrxs2WLukbjavfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBQRX-00058n-FY; Tue, 02 Apr 2019 20:55:39 +0000
Received: from forward500j.mail.yandex.net ([2a02:6b8:0:801:2::110])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBQRU-00058R-HL; Tue, 02 Apr 2019 20:55:38 +0000
Received: from mxback1j.mail.yandex.net (mxback1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::10a])
 by forward500j.mail.yandex.net (Yandex) with ESMTP id A87C811C137F;
 Tue,  2 Apr 2019 23:55:29 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxback1j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id PUHWzjSrkC-tPiuJD2H; 
 Tue, 02 Apr 2019 23:55:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1554238528; bh=vwRxSdvqCt0uzAJjamUTHIW3pMc+Mjgbh6NRf409VFE=;
 h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
 b=FrZdRMWu7fZIuwFjUT+SD4CtNP99eiai+1Iijmbv74PA8UtjFTRr9XP8vxqHs2I9y
 c/1hfVkODcCdvca1F/Js1WNnDe1BgV1p1YNMCTdZ9qDsDhU5sul7YN8R//beYyDv4F
 fmm/fhetrYxMke1/N8CUQgPBg9/4Doi66t89LHBg=
Authentication-Results: mxback1j.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by sas1-87f9feb8d943.qloud-c.yandex.net with HTTP;
 Tue, 02 Apr 2019 23:55:25 +0300
From: Andrey Abramov <st5pub@yandex.ru>
To: vgupta <vgupta@synopsys.com>, benh <benh@kernel.crashing.org>,
 paulus <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 tglx <tglx@linutronix.de>, mingo <mingo@redhat.com>, bp <bp@alien8.de>,
 hpa <hpa@zytor.com>, x86 <x86@kernel.org>, mark <mark@fasheh.com>,
 jlbec <jlbec@evilplan.org>, richard <richard@nod.at>,
 dedekind1 <dedekind1@gmail.com>, adrian.hunter <adrian.hunter@intel.com>,
 gregkh <gregkh@linuxfoundation.org>,
 naveen.n.rao <naveen.n.rao@linux.vnet.ibm.com>,
 jpoimboe <jpoimboe@redhat.com>, Dave Chinner <dchinner@redhat.com>,
 darrick.wong <darrick.wong@oracle.com>,
 ard.biesheuvel <ard.biesheuvel@linaro.org>, George Spelvin <lkml@sdf.org>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 ocfs2-devel <ocfs2-devel@oss.oracle.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, sfr <sfr@canb.auug.org.au>
In-Reply-To: <824481554237711@sas1-23a37bc8251c.qloud-c.yandex.net>
References: <824481554237711@sas1-23a37bc8251c.qloud-c.yandex.net>
Subject: [PATCH v3 5/5] Lib: sort.h: remove the size argument from the swap
 function
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 02 Apr 2019 23:55:25 +0300
Message-Id: <793311554238525@sas1-87f9feb8d943.qloud-c.yandex.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_135536_928125_446A42A3 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: jannh <jannh@google.com>, peterz <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "yamada.masahiro" <yamada.masahiro@socionext.com>,
 Morton Andrew <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jslaby <jslaby@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Removes size argument from the swap function because:
	1) It wasn't used.
	2) Custom swap function knows what kind of objects it swaps,
		so it already knows their sizes.

Signed-off-by: Andrey Abramov <st5pub@yandex.ru>
Reviewed by: George Spelvin <lkml@sdf.org>
---
 arch/x86/kernel/unwind_orc.c | 2 +-
 include/linux/sort.h         | 2 +-
 kernel/jump_label.c          | 2 +-
 lib/extable.c                | 2 +-
 lib/sort.c                   | 7 +++----
 5 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index 89be1be1790c..dc410b567189 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -176,7 +176,7 @@ static struct orc_entry *orc_find(unsigned long ip)
 	return orc_ftrace_find(ip);
 }
 
-static void orc_sort_swap(void *_a, void *_b, int size)
+static void orc_sort_swap(void *_a, void *_b)
 {
 	struct orc_entry *orc_a, *orc_b;
 	struct orc_entry orc_tmp;
diff --git a/include/linux/sort.h b/include/linux/sort.h
index 2b99a5dd073d..13bb4635b5f1 100644
--- a/include/linux/sort.h
+++ b/include/linux/sort.h
@@ -6,6 +6,6 @@
 
 void sort(void *base, size_t num, size_t size,
 	  int (*cmp)(const void *, const void *),
-	  void (*swap)(void *, void *, int));
+	  void (*swap)(void *, void *));
 
 #endif
diff --git a/kernel/jump_label.c b/kernel/jump_label.c
index bad96b476eb6..6b1187b8a060 100644
--- a/kernel/jump_label.c
+++ b/kernel/jump_label.c
@@ -45,7 +45,7 @@ static int jump_label_cmp(const void *a, const void *b)
 	return 0;
 }
 
-static void jump_label_swap(void *a, void *b, int size)
+static void jump_label_swap(void *a, void *b)
 {
 	long delta = (unsigned long)a - (unsigned long)b;
 	struct jump_entry *jea = a;
diff --git a/lib/extable.c b/lib/extable.c
index f54996fdd0b8..0515a94538ca 100644
--- a/lib/extable.c
+++ b/lib/extable.c
@@ -28,7 +28,7 @@ static inline unsigned long ex_to_insn(const struct exception_table_entry *x)
 #ifndef ARCH_HAS_RELATIVE_EXTABLE
 #define swap_ex		NULL
 #else
-static void swap_ex(void *a, void *b, int size)
+static void swap_ex(void *a, void *b)
 {
 	struct exception_table_entry *x = a, *y = b, tmp;
 	int delta = b - a;
diff --git a/lib/sort.c b/lib/sort.c
index 50855ea8c262..8704750e6bde 100644
--- a/lib/sort.c
+++ b/lib/sort.c
@@ -114,7 +114,7 @@ static void swap_bytes(void *a, void *b, size_t n)
 	} while (n);
 }
 
-typedef void (*swap_func_t)(void *a, void *b, int size);
+typedef void (*swap_func_t)(void *a, void *b);
 
 /*
  * The values are arbitrary as long as they can't be confused with
@@ -138,7 +138,7 @@ static void do_swap(void *a, void *b, size_t size, swap_func_t swap_func)
 	else if (swap_func == SWAP_BYTES)
 		swap_bytes(a, b, size);
 	else
-		swap_func(a, b, (int)size);
+		swap_func(a, b);
 }
 
 /**
@@ -186,8 +186,7 @@ static size_t parent(size_t i, unsigned int lsbit, size_t size)
  * it less suitable for kernel use.
  */
 void sort(void *base, size_t num, size_t size,
-	  int (*cmp_func)(const void *, const void *),
-	  void (*swap_func)(void *, void *, int size))
+	  int (*cmp_func)(const void *, const void *), swap_func_t swap_func)
 {
 	/* pre-scale counters for performance */
 	size_t n = num * size, a = (num/2) * size;
-- 
2.21.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
