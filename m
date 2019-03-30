Return-Path: <SRS0=1krx=SB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EADC43381
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 16:43:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2BE0218D0
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 16:43:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DQ7foN4o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="QTkIh7Rx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2BE0218D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:MIME-Version:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XNGEnsbNf4mf6vgwusVX1buWZAJnD1ShtL+FTRSuheE=; b=DQ7foN4o8pBN8F
	rhmO2scV5H6/R7pHsTfGIPhq2P3Ar8LsdNsa52SD9oLRKoA3BnWHWilCnRQ/NtxrJDaTY5C53oYQ6
	EouGkyxuRrXC3ntwwH47scx5Sk3InrE+TIvjsH8eg5jL/sAfNCa4lblF7/eEdniiWmOeVh/UB24TB
	F9N8MVYviVVLCPqcGnf7MwOwbmHpGu946GIRMhPv2Aqsgez7eTA6yjux+GLjdXPzJK+SNdneui6Rg
	u1j/V7+CwoOYkpFHtSx5NIqqcFwMy+7cLXGBn/TEs1h3oErBauTCVxGVrPjPraAPyIyFCD15QityC
	Vbf7JiKOcAzd8m8sIxTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAH4g-0004FG-N5; Sat, 30 Mar 2019 16:43:18 +0000
Received: from forward500j.mail.yandex.net ([5.45.198.250])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAH4d-0004EZ-FG; Sat, 30 Mar 2019 16:43:17 +0000
Received: from mxback10o.mail.yandex.net (mxback10o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::24])
 by forward500j.mail.yandex.net (Yandex) with ESMTP id DD3F311C1158;
 Sat, 30 Mar 2019 19:43:08 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxback10o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id LJUEnkYk4E-h1u0KTbQ;
 Sat, 30 Mar 2019 19:43:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1553964187; bh=OUonaHqNIuKuUvrOfReQxgIYdywNfRwJw0ekJZnpMB8=;
 h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
 b=QTkIh7RxhBsvpIf8O9AskAid7JET1vywlk3mWjJZ+vvwnNW2lcsBj20bonUUwHwJb
 oxG/xWjFYIB4W//uLG9oQZbZQhZl6SM7CKb4uotorQlzAqMl1ik23ffFVW1XI+HxEQ
 QcR+IpKMGPfzhq5RsGNRYcx5WIQLKMf9S7uPhPms=
Authentication-Results: mxback10o.mail.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by myt5-f1576e7b5bad.qloud-c.yandex.net with HTTP;
 Sat, 30 Mar 2019 19:43:01 +0300
From: Andrey Abramov <st5pub@yandex.ru>
To: "vgupta@synopsys.com" <vgupta@synopsys.com>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "paulus@samba.org" <paulus@samba.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>,
 "mark@fasheh.com" <mark@fasheh.com>,
 "jlbec@evilplan.org" <jlbec@evilplan.org>,
 "richard@nod.at" <richard@nod.at>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 Dave Chinner <dchinner@redhat.com>,
 "darrick.wong@oracle.com" <darrick.wong@oracle.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 George Spelvin <lkml@sdf.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
In-Reply-To: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
References: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
Subject: [PATCH 4/5] ubifs: find.c: replace swap function with built-in one
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sat, 30 Mar 2019 19:43:01 +0300
Message-Id: <16620851553964181@myt5-f1576e7b5bad.qloud-c.yandex.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_094315_876249_D64B28AC 
X-CRM114-Status: UNSURE (   6.95  )
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
Cc: "mhocko@suse.com" <mhocko@suse.com>,
 "gustavo@embeddedor.com" <gustavo@embeddedor.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "amir73il@gmail.com" <amir73il@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "kamalesh@linux.vnet.ibm.com" <kamalesh@linux.vnet.ibm.com>,
 "piaojun@huawei.com" <piaojun@huawei.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "jiang.biao2@zte.com.cn" <jiang.biao2@zte.com.cn>,
 "jslaby@suse.cz" <jslaby@suse.cz>,
 "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "ge.changwei@h3c.com" <ge.changwei@h3c.com>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "jannh@google.com" <jannh@google.com>,
 "ashish.samant@oracle.com" <ashish.samant@oracle.com>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "jiangyiwen@huawei.com" <jiangyiwen@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "lchen@suse.com" <lchen@suse.com>, "malat@debian.org" <malat@debian.org>,
 Morton Andrew <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Replace swap_dirty_idx function with built-in one,
because swap_dirty_idx does only a simple byte to byte swap.

Signed-off-by: Andrey Abramov <st5pub@yandex.ru>
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
