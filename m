Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43DCC10F00
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 20:52:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B420E2082C
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 20:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XovvCB/U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="fenpSTcD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B420E2082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:MIME-Version:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0JPc+TWeXRaBesVaLeKbZ0YsdPFGK36PUv6L19auUJo=; b=XovvCB/UT35UV9
	eu8Dw6d7DAqnial/eE7eLQMxJxjRx+cVmGLdz83d/U5N1DBdnKmTHV9gRqzdojpikBHdAKtfJwCTZ
	wz3vMplfu0DrmkmwO76KNPzdDAsbtuW2zSWEJdYG/VKWkEQypK9ArAJ9Fch6QETTN5+vCFrQkjppF
	QyQxy1//BXhSSdyqVOj3krNSSWpv8jsJTu0t35jCW2/OhvKalxVU5agSSy97CuBy4yF2pDUw2hQRB
	O999mAit8nJuA8yvfp+D+ixU9brZ6vYUx9CzpOHAmDHsfBT9TMwpGmQiHErZqbsCpJ6NVmcbHTAWM
	KVNodXASS3Cxty//OXgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBQOL-0003Wj-RP; Tue, 02 Apr 2019 20:52:21 +0000
Received: from forward501o.mail.yandex.net ([2a02:6b8:0:1a2d::611])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBQOJ-0003WP-DV; Tue, 02 Apr 2019 20:52:21 +0000
Received: from mxback16o.mail.yandex.net (mxback16o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::67])
 by forward501o.mail.yandex.net (Yandex) with ESMTP id A72041E80609;
 Tue,  2 Apr 2019 23:52:15 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxback16o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id T1lxURypq6-qAkWCI5r;
 Tue, 02 Apr 2019 23:52:14 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1554238334; bh=Q4Zr+6SB7d9tkoTBUWJxh8Nzv4LeMGuXGuFdCIzZgWI=;
 h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
 b=fenpSTcDtzwNaIjzwh45QitoHHj9y+79AuYmuwkSR5ygs8KWAZvlHlV7QEBNA1fj4
 9ihqwg+uBgaGZs2zACPAaSGgbRQSM+obi9CrTLKhR+a1c3B1NC9B92HUQ/BH2tOfM0
 S/WWUzhWh+o+bklTTGQghItd1mAYF+i509BmJX5M=
Authentication-Results: mxback16o.mail.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by iva8-b333b7f98ab0.qloud-c.yandex.net with HTTP;
 Tue, 02 Apr 2019 23:52:10 +0300
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
Subject: [PATCH v3 4/5] ubifs: find.c: replace swap function with built-in one
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 02 Apr 2019 23:52:10 +0300
Message-Id: <1002111554238330@iva8-b333b7f98ab0.qloud-c.yandex.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_135219_824161_F6EA437F 
X-CRM114-Status: UNSURE (   7.64  )
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
v2->v3: nothing changed

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
