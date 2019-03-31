Return-Path: <SRS0=WHT+=SC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5AEC43381
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 18:47:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE1DC2085A
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 18:47:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HJ6pfn52";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="KR/9Pgyv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE1DC2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:MIME-Version:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ga3DJjbbNgzKBuzE+FplrvaphGkI0SvInw2/+s5tEL0=; b=HJ6pfn521RKP7M
	OThZjWEh5xAISC29zwK8ed5XETrbpAnsSPCF9RURHKwYCeuVyHV+zXwb8ptlS079Twbh/kF1LpVee
	NJkFwWRKuXoPYgck4FqPiBAYgu6oIJUfOlT2U2zSwcjzCGoD9FRIbAAfOffeSTbtnqK3dlXCqRTOl
	ASXi3/8aClweY7qMhDP+wGTFb5i/LgYUQo3t8SFKPA+b6izMh3j4HP5sFxRMVYSYnYe35z5bKUVad
	+AloF+H8zr9+gZE9wPQuvsnnSuFDSiXx75T4rof+iV0HNWi3iRKGOnpz92o+OHVLGSGkwyY0ZAkyG
	2VTlv0BQ3Vm92XUyxdIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAfUP-0003zl-HK; Sun, 31 Mar 2019 18:47:29 +0000
Received: from forward100j.mail.yandex.net ([5.45.198.240])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAfUM-0003zN-Cv; Sun, 31 Mar 2019 18:47:28 +0000
Received: from mxback15j.mail.yandex.net (mxback15j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::91])
 by forward100j.mail.yandex.net (Yandex) with ESMTP id 7D44E50E1079;
 Sun, 31 Mar 2019 21:47:19 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxback15j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id L6VCaIh9S0-lCCiIYvM;
 Sun, 31 Mar 2019 21:47:17 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1554058037; bh=CvMm3lipjJCZVe+tg7OeO3ubYd3age6TWJlLoSQtQIU=;
 h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
 b=KR/9Pgyvs+Texg5Pd3+9LFEM58rQYu/XBh3NzEyq+rDFOZAR8Z2CrqLzg3cyx+Cad
 tWqzOdWeVsY6d4wZ3qSyxX0pfCaCZHhjJFBYqzvZHFJZcf5KGQpal38rgzHDFLCFkK
 disOKvd8RSXrq4mmV8NUzULEeLPMiunrIASgL0FM=
Authentication-Results: mxback15j.mail.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by sas1-fb8a605c4548.qloud-c.yandex.net with HTTP;
 Sun, 31 Mar 2019 21:47:12 +0300
From: Andrey Abramov <st5pub@yandex.ru>
To: vgupta <vgupta@synopsys.com>, benh <benh@kernel.crashing.org>,
 paulus <paulus@samba.org>, mpe <mpe@ellerman.id.au>,
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
In-Reply-To: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
References: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
Subject: [PATCH v2 4/5] ubifs: find.c: replace swap function with built-in one
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sun, 31 Mar 2019 21:47:12 +0300
Message-Id: <20479221554058032@sas1-fb8a605c4548.qloud-c.yandex.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_114726_797374_3E300E54 
X-CRM114-Status: UNSURE (   7.70  )
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
Cc: gustavo <gustavo@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Replace swap_dirty_idx function with built-in one,
because swap_dirty_idx does only a simple byte to byte swap.

Since Spectre mitigations have made indirect function calls more
expensive, and the default simple byte copies swap is implemented
without them, an "optimized" custom swap function is now
a waste of time as well as code.

Signed-off-by: Andrey Abramov <st5pub@yandex.ru>
Reviewed by: George Spelvin <lkml@sdf.org>
---
 fs/ubifs/find.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index f9646835b026..5deaae7fcead 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -747,12 +747,6 @@ static int cmp_dirty_idx(const struct ubifs_lprops **a,
 	return lpa->dirty + lpa->free - lpb->dirty - lpb->free;
 }
 
-static void swap_dirty_idx(struct ubifs_lprops **a, struct ubifs_lprops **b,
-			   int size)
-{
-	swap(*a, *b);
-}
-
 /**
  * ubifs_save_dirty_idx_lnums - save an array of the most dirty index LEB nos.
  * @c: the UBIFS file-system description object
@@ -772,8 +766,7 @@ int ubifs_save_dirty_idx_lnums(struct ubifs_info *c)
 	       sizeof(void *) * c->dirty_idx.cnt);
 	/* Sort it so that the dirtiest is now at the end */
 	sort(c->dirty_idx.arr, c->dirty_idx.cnt, sizeof(void *),
-	     (int (*)(const void *, const void *))cmp_dirty_idx,
-	     (void (*)(void *, void *, int))swap_dirty_idx);
+	     (int (*)(const void *, const void *))cmp_dirty_idx, NULL);
 	dbg_find("found %d dirty index LEBs", c->dirty_idx.cnt);
 	if (c->dirty_idx.cnt)
 		dbg_find("dirtiest index LEB is %d with dirty %d and free %d",
-- 
2.21.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
