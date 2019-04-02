Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987B2C4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 20:45:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6858E2082C
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 20:45:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PuWVEZUs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="Wc1t5el2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6858E2082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:MIME-Version:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VLAwZ3OKb3q+23iPvUiiN51gxjYatxUkhY2XgsG2FQ=; b=PuWVEZUs7VILEf
	MXip4jyNdcQDZEJbAXg9N+Sj7dyJfUBpZgNGSFJz3XQBOHp9nkKnNBRCR3+r7Q/B3ifAdm1B70cPw
	Wbd0UHFgltN0YcBFJo7iYDGp474dmkpL6tB79AWKI7IHXNoMqa+6HyhFHOV7bj8PKHWq7Eu0fmdgg
	nOI04K7XCSnd65JouPGBI//Fg0GpUQL0SptuKBeVGYN6sPhO6WpzX3Dg/FDqI9jlf4r9mPT2EYePS
	wQIvnrL2BsbpTlcfQCh7KZQdXnd2nEv/EP41A2YGFLO/4EGDR9/XjTYeifnIItddiDrx+ljosfL4/
	gbGOSZjdsj29AwNJaL+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBQHZ-00014P-0v; Tue, 02 Apr 2019 20:45:21 +0000
Received: from forward500o.mail.yandex.net ([2a02:6b8:0:1a2d::610])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBQHV-000144-QL; Tue, 02 Apr 2019 20:45:19 +0000
Received: from mxback17j.mail.yandex.net (mxback17j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::93])
 by forward500o.mail.yandex.net (Yandex) with ESMTP id D4BEC6008C;
 Tue,  2 Apr 2019 23:45:14 +0300 (MSK)
Received: from unknown (unknown [::1])
 by mxback17j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id VXZZ0N7Vzo-j8Gq0IBd;
 Tue, 02 Apr 2019 23:45:13 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1554237913; bh=Y+yiELVWnULdg8PYZhpakJQ8j91v24utBgtnPwXoD7o=;
 h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
 b=Wc1t5el2k+krNu8bskJfGdQiwrliQaYKqnco1i+dRSllvo+zE2sD2vVq2rwKf34BC
 U/vSTiBpqPnDK2UZKf3iHd7VBnV+x2xdsJ3a761rxUZWfL94yU25ZUclLA6NEVtmEK
 3j4VYeLEGPgLEu2cMF3p36mFhSEiq1XEqJ69WyZ4=
Authentication-Results: mxback17j.mail.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by iva6-3ac3de5fcc31.qloud-c.yandex.net with HTTP;
 Tue, 02 Apr 2019 23:45:08 +0300
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
Subject: [PATCH v3 1/5] arch/arc: unwind.c: replace swap function with
 built-in one
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 02 Apr 2019 23:45:08 +0300
Message-Id: <988881554237908@iva6-3ac3de5fcc31.qloud-c.yandex.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_134518_221247_E43E8B18 
X-CRM114-Status: UNSURE (   7.05  )
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
Cc: mhocko <mhocko@suse.com>, rppt <rppt@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Replace swap_eh_frame_hdr_table_entries with built-in one, because
swap_eh_frame_hdr_table_entries does a simple byte to byte swap.

Since Spectre mitigations have made indirect function calls more
expensive, and the default simple byte copies swap is implemented
without them, an "optimized" custom swap function is now
a waste of time as well as code.

Signed-off-by: Andrey Abramov <st5pub@yandex.ru>
Reviewed by: George Spelvin <lkml@sdf.org>
Acked-by: Vineet Gupta <vgupta@synopsys.com>
---
v2->v3: nothing changed

 arch/arc/kernel/unwind.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 271e9fafa479..7610fe84afea 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -248,20 +248,6 @@ static int cmp_eh_frame_hdr_table_entries(const void *p1, const void *p2)
 	return (e1->start > e2->start) - (e1->start < e2->start);
 }
 
-static void swap_eh_frame_hdr_table_entries(void *p1, void *p2, int size)
-{
-	struct eh_frame_hdr_table_entry *e1 = p1;
-	struct eh_frame_hdr_table_entry *e2 = p2;
-	unsigned long v;
-
-	v = e1->start;
-	e1->start = e2->start;
-	e2->start = v;
-	v = e1->fde;
-	e1->fde = e2->fde;
-	e2->fde = v;
-}
-
 static void init_unwind_hdr(struct unwind_table *table,
 			    void *(*alloc) (unsigned long))
 {
@@ -354,10 +340,8 @@ static void init_unwind_hdr(struct unwind_table *table,
 	}
 	WARN_ON(n != header->fde_count);
 
-	sort(header->table,
-	     n,
-	     sizeof(*header->table),
-	     cmp_eh_frame_hdr_table_entries, swap_eh_frame_hdr_table_entries);
+	sort(header->table, n,
+	     sizeof(*header->table), cmp_eh_frame_hdr_table_entries, NULL);
 
 	table->hdrsz = hdrSize;
 	smp_wmb();
-- 
2.21.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
