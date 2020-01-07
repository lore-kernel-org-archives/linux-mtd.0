Return-Path: <SRS0=PPpL=24=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFC4C282DD
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jan 2020 21:25:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D26C52075A
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jan 2020 21:25:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uADg1LTr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D26C52075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NfiGQLMZVt1qaq2ra7j8wYyLtzOkcUO/fK9cKFp7g28=; b=uADg1LTr9dqTEB
	eWxTOsIHE348nV3GahP2e0dxb+WHZZZHLgo/f26lklhW84Dl8NoHADSK5Ia7IFNgT8Rzl5qZvFgZ3
	3Mpfrjk/QWFVTZoQ/LsED70lxL11oROFTvWNXY1ypk1fUpZpZepFwn+peSiwSQ8D5NBCycfXoWRF+
	3FDX7ZgaCyyofAPNUidfQDnlpUH0Q46g2AuHoCgjzlIe691rFyGI4cI9+EOsFDALcIXfBOBo413Ej
	vqA4AWJwBY6p9EZrdzkxniSvpZfE7rOtKGUd9c9xNeklKZG+4fNzMSxT3oksR2BRbSt31fiYIQCu6
	x2c3KjXut1Y00woAWluA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iowM2-0006Ll-FP; Tue, 07 Jan 2020 21:25:34 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iowLz-0006Kh-DM
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2020 21:25:32 +0000
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MYedH-1jBdkj2AHz-00Vh2O; Tue, 07 Jan 2020 22:25:10 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: sm_ftl: fix NULL pointer warning
Date: Tue,  7 Jan 2020 22:24:52 +0100
Message-Id: <20200107212509.4004137-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ncIFui4ErDAl4vN/oGEZXMNgEj4j+k+9hJ4pY48nu5RbLc25IKy
 wvT+1dVpVSXAjxr8JMNEH6BWU5nmzh0RpjqzFua0sIzGAqz6fYLPTHVL9cy70ikbrSVcjVS
 5ifk2tLrlvqrjRbvrxX+6Li7G68QFpqz3mBI7ar3+fzpkJgnJB3GeyN8ryWzz59jxNB3CQA
 JD2S+j3ILJZXPHyrGrhqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K+zk6N/AoxE=:gW0Osoe5f1+X5N4GWTz8yH
 w09mbUEW7a5i6/6NjJMJXCa3EaTI4K+XKu60VSsNh3oCxpvYc5dJItw4A8U2/7wlRMJolwvq8
 Sx3lwS/7mYRyca1pMXr+uTcxrv95i4po1Gl4qEsdSVy5GLG+zE+JsZEtIwhYcIGzvOE6iAk7F
 CFEQlXNoSsBmTl5TNyVZxi5ezNux8js1DQ5kCXW1QZPTjjrXUg+yZr5bTA9RkP2/UwhH4oWuC
 lNeoYSyqvSi9t2h8Ry/YIJlccaM1SoRjOWZmAFOBpJTvF956eLJx+giGcTt5pltxzKmzuUtJ5
 LWvm0k4eC6+5bQ08yQLBisDHsavX8aeI3z/N0ZHehgDxIlfvba3YnA2pQY4K+70UBxJbRO5BG
 GNHkur5QivKFDnuXo18fT8SpSAG3DbUblO3fp1/XLBP6nlvJLHW0gaN+ThkdFJG1KBTNkLky8
 M4P1QWVLqAIcKFN6qzUXnr+R57zNY35+ljt/n9WSpFqR1Q1FkFo9XK7thUoEvpOzkOouYQP5s
 VDitBCjgwQ3ipLT8/CpG6WpWrps/mn0TJPP8wW/wr0uvD6/ODlh4Zhj1/ZEbYn/1FN8R9RT/Q
 WPIhTMJ5wGle5WysYqUEm86bxoAY5ZpnQ36ObV930La/Y5Q92keUnr+9i7dlYCWAjNgctD0mx
 5a5lB5+BhjHFAE5JfoBUuj14CvXWphSOEX2lej0HRD9Wd8h4aw26i+IkdxRhuERYNm5UamKRh
 nLFMu2zHexaw77cpJAm1xuo15mZxG502vpIbapME1JyHcku4fnkIHIIbPvQffE5eMv9X/p3EZ
 oSNfpG3/DNr74QuMpnFvFXO2c7hbxRWbiBzhGI1agyoi3bfEUBD+IhnNY3AltaaXpdfA7/Cia
 DTWUY+bxhNAo7K10gfww==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_132531_746450_F3618652 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: Oleksandr Natalenko <oleksandr@redhat.com>, Wenwen Wang <wenwen@cs.uga.edu>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

With gcc -O3, we get a new warning:

In file included from arch/arm64/include/asm/processor.h:28,
                 from drivers/mtd/sm_ftl.c:8:
In function 'memset',
    inlined from 'sm_read_sector.constprop' at drivers/mtd/sm_ftl.c:250:3:
include/linux/string.h:411:9: error: argument 1 null where non-null expected [-Werror=nonnull]
  return __builtin_memset(p, c, size);

From all I can tell, this cannot happen (the function is called
either with a NULL buffer or with a -1 block number but not both),
but adding a check makes it more robust and avoids the warning.

Fixes: mmtom ("init/Kconfig: enable -O3 for all arches")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/sm_ftl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 4744bf94ad9a..b9f272408c4d 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -247,7 +247,8 @@ static int sm_read_sector(struct sm_ftl *ftl,
 
 	/* FTL can contain -1 entries that are by default filled with bits */
 	if (block == -1) {
-		memset(buffer, 0xFF, SM_SECTOR_SIZE);
+		if (buffer)
+			memset(buffer, 0xFF, SM_SECTOR_SIZE);
 		return 0;
 	}
 
-- 
2.20.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
