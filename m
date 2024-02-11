Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133BAC48260
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Feb 2024 00:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e0TaBPBF7xApaFvxErhmLGEfO0u/Q33G7KqwaszLEtI=; b=fUTF0241AHybqq
	WdKKEevjbVS6oUZaP9lkHSHMWv7FiZH8M36oni14dB5hte3UgzV8P7XpvGtY7v5ISBALTRgN6Kz96
	hHJJ4GKczvnVueO1o4IlFmZiEpn8rT2ARm2oHYi44uK722YRecB8OxNGAxDh+qGWC6nq8xCFqTBPn
	WT+C8W6T7OxI50yfcZ1+5lIjxbJplGbSG/w8Kvb04D01/JKsLpBM6PQpmJFeHUwXRoFB9RO3nD06F
	vt74gdxMqGl/dNPI95MugB6lJZDbtY7DNxviwjRwBZj9jSahgi0f6UMX/cguffvu1C0GXEF+a8oL/
	tCZh/qg/SLJZtcFhjEGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYxtG-00000002Cs5-0NOu;
	Sun, 11 Feb 2024 00:40:14 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYxtA-00000002CrU-39oO
	for linux-mtd@lists.infradead.org;
	Sun, 11 Feb 2024 00:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=heusel.eu;
	s=s1-ionos; t=1707611992; x=1708216792; i=christian@heusel.eu;
	bh=wmHERYYN058/RFLczrPeOcXAoo/yUFyAt/tHzV8DLHc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=rYQG8Zxxn37LNmPQ2IrloJg4YF0tYXfeMdJeWAw2NuoTtT2imBfGnmnEhmzNbE9Y
	 mkRJXIqpeEmFTpvCJrpaSZ8chuKyjZZZ6d6S93U/f7NBlWEe/2/aMyJkj2tcRfBag
	 BkyJRCe/3YjPRUXsgFN+un6LnYVO5AMeQFobAxNsIjFMXqfVcmV/TxsbPqDUDqk/1
	 34IJ5X4PDBHhMvS5ZRlCn4Iz2pOrjYl02s7+dpjCcvvRZHKCJSVGtQiYL/9uwBvHU
	 X6eaje5bta3ocxoMOHu2w2/UujYtcbmOEYJcQThH4XK6dyfFd78d/+GXwFA5pEjU5
	 J0FIojCnhYRGHIB3tA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from meterpeter.INF524.stwhd ([141.70.80.5]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Msqpq-1qgBRA1HIm-00tGhj; Sun, 11 Feb 2024 01:39:52 +0100
From: Christian Heusel <christian@heusel.eu>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Christian Heusel <christian@heusel.eu>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org
Subject: [PATCH] jffs2: print symbolic error name instead of error code
Date: Sun, 11 Feb 2024 01:39:04 +0100
Message-ID: <20240211003907.167891-1-christian@heusel.eu>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:mdD+cC108pnAZXbGv+PQh7kUVRHEsQ7+KfabFD+Q5ylCBajXVwQ
 +3RET9o94ZZ71QCJpskyjPJvAMRbY4jidCoz5a7lci+4ts8IwctXPBczn4wJZkX+HmNb7zt
 3JHIDZQ9nyKxYuZXIJ7kW1x0Vr8w/6+Bg70MFNvB+DRKWEUoy7avmZh4BcX8tmLEDUn/T6n
 mZ/tfamT+oPSSc1NIMIEQ==
UI-OutboundReport: notjunk:1;M01:P0:pinJemaaIv0=;vsBcASSi2Z1p+Lp65An5yLWwkcy
 LRfNErQyBdSATIHLfrW3qEeDiDDHmHXrWLlmImFBeQkI3sL4ELNSAnEk8CYvFI2Lk33eZRiYG
 kctBAHBn+Lya0INz4uM/PslB7hJvO0t07zpP/71hEFBDoltvW8OV8Zo11mPqtBc9HQyel358c
 TlVPrsRPqYL+HF5QztoF4+41vDnoZAre54DALKhm47TUOq2ALeMUEPFxCl7mUogno+OSleMx+
 fb6m5DNAu17khHcfffpd8qDN2qaXolV8EEIrAz6Y473MvPE7EE3xV9RZhThxqWUpIdnGYsskR
 TlaiVINg5612ED4saHJGXSvaMiSLDdLe4W/aQRvkwZujHLJWIx/TwrTsUixTLAavF7D+wSf56
 vskI54DQxEbsdI7tmpjaX1mDzs9D3T2i7fi2h47pYKSCemRzhWFAQfLJcGwjDBfni7wMHCsf6
 knzfEffgVGX8EhwvxcT+Yq4SQgVF+2EYbw9BuWBWop66ZS8Q43QabA2OlY8I+YokEV6yvZlnS
 bCvPwdc4IiYBE5+BwoQ94TNf7Jje9vprKuJko/C4qyUozIMYrPcVCMOPCRa51rn9swkVCiQLb
 LQdKpaavG7qM5tPuXJgDHqxuy58OpuyccOxEgjMqt7Jg/4+aLMA7g9sQdMt0h/obSY7jnsXXl
 JiYdMtNCtM21tQ2IGya08B8PAyrYCYyhL8guevNpgXRSL+I44McjTH9qUjtk5tFAooZIzEsN3
 DFX9Eju0oOsUZFtIPNX+rlaSAoRbYs6QSW4V22JRvXc5xhBUiN6Lr8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_164009_261319_145D7281 
X-CRM114-Status: GOOD (  11.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Utilize the %pe print specifier to get the symbolic error name as a
string (i.e "-ENOMEM") in the log message instead of the error code to
increase its readablility.

This change was suggested in
https://lore.kernel.org/all/92972476-0b1f-4d0a-9951-af3fc8bc6e65@suswa.mountain/

Signed-off-by: Christian Heusel <christian@heusel.eu>
---
 fs/jffs2/background.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index 6da92ecaf66d..bb0ee1a59e71 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -44,8 +44,8 @@ int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c)

 	tsk = kthread_run(jffs2_garbage_collect_thread, c, "jffs2_gcd_mtd%d", c->mtd->index);
 	if (IS_ERR(tsk)) {
-		pr_warn("fork failed for JFFS2 garbage collect thread: %ld\n",
-			-PTR_ERR(tsk));
+		pr_warn("fork failed for JFFS2 garbage collect thread: %pe\n",
+			tsk);
 		complete(&c->gc_thread_exit);
 		ret = PTR_ERR(tsk);
 	} else {
--
2.43.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
