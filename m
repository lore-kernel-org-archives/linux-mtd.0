Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE3AC4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 20:47:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B0712082C
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 20:47:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qsUG1DAF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="HPkQWz6+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B0712082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:MIME-Version:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uHf3eoCoT0QlBVf5/YXixS0W2gu3ZdeP7pQ8DTu44Y=; b=qsUG1DAFl+ofpg
	RF2Hldsv9ZlXibnaeOCpukN3W65BQ1WLLv2nTTp3WDiAGFV0Eq2xLGvi2rDVmMB2/9R5aVB2dr5eh
	qwk/qUn58XoTIA2jVCQh8QeOFupo2x2L3Z/goQLsMIDtae2S/UOmtjN847d0YJHoCDU3jtwxsRGrN
	G8qEsLOqmAW1I5RmAhjViMl89lvmq5DdzXNMlYXOm1T0atR/+QZvAg8lZWah1me51JDyzGTUSO44b
	TemozY2wSnp/iXM5DZSMRGwBu0k+FZ5mKFULIZNdIvLkWiyIQMfkVCR2pZbTM66TKBJSJRLTOuutg
	2Kpb8znIgNq6GGOpIVnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBQJo-0001Xs-Le; Tue, 02 Apr 2019 20:47:40 +0000
Received: from forward500p.mail.yandex.net ([77.88.28.110])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBQJl-0001XY-Ck; Tue, 02 Apr 2019 20:47:39 +0000
Received: from mxback11o.mail.yandex.net (mxback11o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::62])
 by forward500p.mail.yandex.net (Yandex) with ESMTP id 498B8940636;
 Tue,  2 Apr 2019 23:47:29 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxback11o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id ts1rVg2WiC-lM7iKRvA;
 Tue, 02 Apr 2019 23:47:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1554238048; bh=THhA4iYx1mlmYH8MJ7BZaVU4UIyCdDLth+errTX31Jc=;
 h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
 b=HPkQWz6+REMRODCfKBojCOW1Nxhq4K/RAKT+dDIdmBELMTemMr/weUTPULQatXV9w
 yIyya/iOw1iqxin4coG3FVXRE6yFoFkp9M9YYEsNTXua6lHEHuqRvJZMhkFidQAGcp
 GyxEOPIbhFyLrsRMJo1Arss+oHRcwpD/hkMOK1w0=
Authentication-Results: mxback11o.mail.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by iva8-b333b7f98ab0.qloud-c.yandex.net with HTTP;
 Tue, 02 Apr 2019 23:47:22 +0300
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
Subject: [PATCH v3 2/5] powerpc: module_[32|64].c: replace swap function with
 built-in one
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 02 Apr 2019 23:47:22 +0300
Message-Id: <994931554238042@iva8-b333b7f98ab0.qloud-c.yandex.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_134738_031980_661FCAAD 
X-CRM114-Status: UNSURE (   7.29  )
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
Cc: malat <malat@debian.org>, "yamada.masahiro" <yamada.masahiro@socionext.com>,
 npiggin <npiggin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Replace relaswap with built-in one, because relaswap
does a simple byte to byte swap.

Since Spectre mitigations have made indirect function calls more
expensive, and the default simple byte copies swap is implemented
without them, an "optimized" custom swap function is now
a waste of time as well as code.

Signed-off-by: Andrey Abramov <st5pub@yandex.ru>
Reviewed by: George Spelvin <lkml@sdf.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
---
v2->v3: nothing changed

 arch/powerpc/kernel/module_32.c | 17 +----------------
 arch/powerpc/kernel/module_64.c | 17 +----------------
 2 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
index 88d83771f462..c311e8575d10 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -79,21 +79,6 @@ static int relacmp(const void *_x, const void *_y)
 		return 0;
 }
 
-static void relaswap(void *_x, void *_y, int size)
-{
-	uint32_t *x, *y, tmp;
-	int i;
-
-	y = (uint32_t *)_x;
-	x = (uint32_t *)_y;
-
-	for (i = 0; i < sizeof(Elf32_Rela) / sizeof(uint32_t); i++) {
-		tmp = x[i];
-		x[i] = y[i];
-		y[i] = tmp;
-	}
-}
-
 /* Get the potential trampolines size required of the init and
    non-init sections */
 static unsigned long get_plt_size(const Elf32_Ehdr *hdr,
@@ -130,7 +115,7 @@ static unsigned long get_plt_size(const Elf32_Ehdr *hdr,
 			 */
 			sort((void *)hdr + sechdrs[i].sh_offset,
 			     sechdrs[i].sh_size / sizeof(Elf32_Rela),
-			     sizeof(Elf32_Rela), relacmp, relaswap);
+			     sizeof(Elf32_Rela), relacmp, NULL);
 
 			ret += count_relocs((void *)hdr
 					     + sechdrs[i].sh_offset,
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 8661eea78503..0c833d7f36f1 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -231,21 +231,6 @@ static int relacmp(const void *_x, const void *_y)
 		return 0;
 }
 
-static void relaswap(void *_x, void *_y, int size)
-{
-	uint64_t *x, *y, tmp;
-	int i;
-
-	y = (uint64_t *)_x;
-	x = (uint64_t *)_y;
-
-	for (i = 0; i < sizeof(Elf64_Rela) / sizeof(uint64_t); i++) {
-		tmp = x[i];
-		x[i] = y[i];
-		y[i] = tmp;
-	}
-}
-
 /* Get size of potential trampolines required. */
 static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 				    const Elf64_Shdr *sechdrs)
@@ -269,7 +254,7 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 			 */
 			sort((void *)sechdrs[i].sh_addr,
 			     sechdrs[i].sh_size / sizeof(Elf64_Rela),
-			     sizeof(Elf64_Rela), relacmp, relaswap);
+			     sizeof(Elf64_Rela), relacmp, NULL);
 
 			relocs += count_relocs((void *)sechdrs[i].sh_addr,
 					       sechdrs[i].sh_size
-- 
2.21.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
