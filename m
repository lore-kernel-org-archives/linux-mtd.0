Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C67C4360F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 21:19:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2037F2054F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 21:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TQ0MOGkL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2037F2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CtiJEd12AsRw9yvbos5CZceGWXTTRurUh9bVqoOVhlk=; b=TQ0MOGkL5lVatl
	PPxlhA1vAh8jOZiKJKA777rE07pR0zb6UuhVSYVpAycEU3W3rWf0eEakT6zJ4Pd9Q4k2PXcTX46x4
	YulOczhtDJLUDMgepvJv0bwotowPGNUvDBWSMfpYTB8y2bIgBz+XpnK5HNwB6vzPx6TQLVxO0dXOS
	z9g1QEMytyK8ovvSNK0oIc7Odv0wsnn6a0K5agdYpIR/+A3CBciIj/8LWrVin2I5w190947+9aQbt
	rA6N1NgAiVuVv/MnUW4erJRpejaqjuqb8Vu9Z33blpE8xppwklvNqXn5I0dj6/OBtY6eXhTr7Y2Fm
	HaQ1gAlF/QNsmJCvRx2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4BHP-0000TE-Kz; Wed, 13 Mar 2019 21:19:15 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4BHM-0000Rp-CR
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 21:19:13 +0000
Received: from wuerfel.lan ([109.192.41.194]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M7v18-1h96xg2oHy-0053RH; Wed, 13 Mar 2019 22:19:02 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: physmap_of_gemini: remove extranous __xipram annotation
Date: Wed, 13 Mar 2019 22:18:41 +0100
Message-Id: <20190313211901.607575-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:PSiCUDZrfAOmXzVkNHBWpcVsfSrPq6bcIJ4o6GeithrHVOrDjf/
 zlnwuy1TjXlDCOdwkRBsZ8Jbb6jpzL/eKsw/Nb1LkRBLGkJ4UIMcbZYmH2CFWR7hjAEXnFK
 0ux9dYucnTSy+vDBcR3yn2bFmAwt8rBoZMr42aiPCP8DSBzXMIrgqTOlA4NxK687yK4lELn
 hMCwKT1d61ax3tsBIvljQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GN4jpDl2SIM=:RI5QiI4aPz+acogZfiVqwH
 hZEPFnPy6G+FsyzVnYHPnnJUEr8AlhYH9SG+p4G41ThhhrpkBicoSTR3SwtxVvSV6ANjislPz
 jgKr/FZLLHMPfM4XO7Ev84UzAUNs45p68/ifl/s6IoULkg1/0MjOUMROahKVolyquWE2TFcv9
 cEsrKqgVeYPuomZCpZtw+Xe+NnYmyC2eu5GkNSRKKrozCBz3Jpm3d2QHaRI9v0pMvSmT3vVon
 zJBp6l2TA4sBr834XIyu9yZdXBqwhbOav9Xmk88DmfrdcPfbPUPE87N5teAqH9iFPkjvjcy6t
 ng8Wrd+FeaG+cNH4ufPGb6MOKtrYtGbHwM4+xiXbJzRUI0cwXWAlm8JAwY2lFNshIuhhlEuyh
 HP1lcP+NhK2qe1tgCE85OjjPKl5HQHA4xrQtWN/ofb+YtDEz9Gzonn1s0DbBiaKZqrvc3lsWa
 UsYH40K8Z461FL+720+HWB1ySDjMmEqPMR8uwDJlpomnPgR7DSWjeUtyamKkh8YzUe9ZvM/pk
 kG8HEO8c94rUfVj2fQrA8etuglddtTnxODQH9fe+06wRFVD7owNPJMbFRhyuuMSiBqAi7k97S
 nEK8lgI2jRjzVhQCtYqpdoJvXuh8YEk5Cpe57AADa2mC0gnQ7A030otPtHWhu7WljLAUwJSeb
 bdzkDPVBqLgE4qSnE01Dl7uUwDuitgNEUrmq2e9W2dG5YWdf89jsD6Jtqv+Qwslq7JuqdxgeJ
 wNLQsj7tb2SC0fuzgDNGCg/pquYE/X3JMnjtew==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_141912_726718_8BD8C3E0 
X-CRM114-Status: GOOD (  14.13  )
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
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Marking a local variable as __xipram causes a warning because of the
noinline attribute:

drivers/mtd/maps/physmap-gemini.c:89:11: error: '__noinline__' attribute only applies to functions [-Werror,-Wignored-attributes]
        map_word __xipram ret;
                 ^
include/linux/mtd/xip.h:34:18: note: expanded from macro '__xipram'
 #define __xipram noinline __attribute__ ((__section__ (".xiptext")))

I can't see any reason for the anotation anyway, so just remove it here.

Fixes: 9d3b5086f6d4 ("mtd: physmap_of_gemini: Handle pin control")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/maps/physmap-gemini.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap-gemini.c b/drivers/mtd/maps/physmap-gemini.c
index 60775b208fc9..a289c8b5cabf 100644
--- a/drivers/mtd/maps/physmap-gemini.c
+++ b/drivers/mtd/maps/physmap-gemini.c
@@ -86,7 +86,7 @@ static void gemini_flash_disable_pins(void)
 static map_word __xipram gemini_flash_map_read(struct map_info *map,
 					       unsigned long ofs)
 {
-	map_word __xipram ret;
+	map_word ret;
 
 	gemini_flash_enable_pins();
 	ret = inline_map_read(map, ofs);
-- 
2.20.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
