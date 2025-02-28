Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6B7C282D0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2025 18:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CnewRkiApUt6+GGZjJGhwODWYYqZjSTuuHjqgr2zHfU=; b=hg4NLnCDHOsXrU
	ptCTM/VAGbx/SkdFyHgDFupUtMJs3XD+w8l/tN3CT3Bkvo0z+4cJMU+7NzWd/qTcyVPZEvCgXMu70
	/Py0gbDVjo0iKgeNVnuRxGjzidiFsVHZc9V76Qkm9jJpMqwC7DuOf+lEGW5TzsDWm5CuhDGsgoG28
	jR36xwVcP89LMUSgLz48cItW/LFb21sPbBAWPjjCK2h1+f3v5Fy3Fhg2YeCzDcz8LTawiZl8fFo7b
	Jdg21J12v6rRdH34ZrhjRScQliitz52NsSkGQUUyfNH+dWJAANOviYvBI+v1jhysKP6yOaphhbMDI
	wSGU+ut9pKJUjHRkTjJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5RS-0000000CEmD-08JP;
	Fri, 28 Feb 2025 18:50:34 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5Ay-0000000CAHh-1VuS
	for linux-mtd@lists.infradead.org;
	Fri, 28 Feb 2025 18:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1740767593; x=1741372393; i=markus.elfring@web.de;
	bh=P+/3PbJZn1fNerf6m6udrxAYpGzCGltY+949KWMWnUA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GH0WjZvWMDfzdKS7OGG50dI/ZnB4XKn2xj7wBB+HvIjlSAqvIBI/W6AyxzwAW2e7
	 4eFiwlbVyhexJ0r4kiLtFvkStqvmIS31nKqjNOWTLYL36yGIQS6ylhaN6UkmeFchr
	 vtz7GX0iynSmP4xjp5hfGoTOr4cO+K8NNz7ntVb7CwYKcd/08saQFbXX2rSXDgU93
	 zIYmE5m0XLpZh1a0SkGuNrmA71CzWTA5H0gth1JHThAgJlOYm3ZRKdsfQXSFUCd8F
	 t7U/zYV74uQ2UlvtPUYCWEsI/FVh/ehq7fKHwGWGZEXhM2hlQVT42gOkpb/mc5Kzl
	 VGC6eNj/UztHACqCbg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.27]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnFyI-1tOxcT2sOC-00i452; Fri, 28
 Feb 2025 19:33:13 +0100
Message-ID: <d564cafe-d45a-40b5-9a91-a2e2b97c80d6@web.de>
Date: Fri, 28 Feb 2025 19:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Lucas Stach <dev@lynxeye.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Stefan Agner <stefan@agner.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Qasim Ijaz <qasdev00@gmail.com>, Natalie Vock <natalie.vock@gmx.de>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] mtd: rawnand: tegra: Simplify maximum determination in
 tegra_nand_setup_timing()
X-Provags-ID: V03:K1:hWGNMTeSFiMmmha5RneunFk1Fm60pvlO4UxmgUHnGkA2Qz8LPAX
 AlAGnXxSQrhN/iURP92oQy69SzFM7LWzFoIyX038jdfHsUaVzZfJtK6GX/EgS7IN+R3Vlub
 SWVfWfm3Nwxzo+ZgOE8agHY3UPPcJp3NQylvg/WfH4SN9BLpM1SwHDb/g6F2LAicne8EjH9
 rs3qMX50pqLMH/7nvOPUw==
UI-OutboundReport: notjunk:1;M01:P0:mma6z8WXO8A=;Ch2aVyeui5h/mnQ9HePSBuxvJC2
 7XXdJh1HWUW7j+i750YByjCpVJsVmTs/dzKMbcfSK3OUUMPRKBcgqFSaPZzItEcYniwJvm3wp
 ih9T4pw24nzwWj8YL5vzYipAqp9h40WFQeyAeO4X3xYpYi5dL3CPju6psH2v9qsudha6fleMA
 rZv59kyrq0odiTrP9P78umRkJIxkdUZhb7zyhw9ehahsl6IqAFd5R67Ku89jpmXJ47A3O2nAe
 ZZ0FnbJWfkH4Pv4WAdeXhfSbjx3TlNQhnRgMX909AzO/O9aqSNSAf4PadX0MA7I7MJB5lBYI5
 g8C7TMSB2IdiOw7NjWZNa+rh4Hp7Qlcx4QOICYmaKzXW6qZ09PdZSvZ2PnbB2mHEz8QxIGrCo
 RQM2O4AXLrMaZ+6Ytrybgq7ETd3+0x/DnK3khs0gavKX1pvcvtaExA7dF4kO2ofgt34GEOJg7
 00yhC+DbLNMliUImRNtJeiwPn6mC1WG7zhwp70olRjs8Stl+MB7bOMOt8axS0k90Db37zI1AA
 XAPuMBRfAP25PHGqyB+AkHKM83hI6uXjvWj/JWEs7Q8twMqFhvTotyGJt90adRgbRYOZiQ5TH
 VaJax72H/QOK/w81jxfoozfIy2Ch/XfZpGLgz2doIDMh5ORAwdguEorYH0gnaOqwbZlmwEKr0
 GHiYS78LcjXieU9dtTTUsLrmIW+JNhCvobwU8CEM5vZMFWI/4yjMjtr6SuMWFb2X6VVeylbq9
 j6XFjaCIPwVR/PRLPcoKb582Yepi4Bs4wGdEllrINGYjmqiIUX/yDOfVQnLgWt+9Ab4c90C0c
 sxkovclFpKVB3vj+hxkCKr3Z5o5Eln0tjUkKQOHOc06cKn8880IvoTLRdmsbwzNibDADxpaqU
 q24ut6O5gDN9f+5/LsbDyd1YNnH+08V9otIlRulIp3cAD6+x8nVy4vdSKZqgiWcMc47tKKjy9
 +1bv6LTI1crQ9SeK9ckXlGGvNeNJreSzQ5Ew1+/XvZeJK1jZurujNNM5Gb8chdtgIFoIHrCkK
 EbetAQ2wN8F3GPZ963qBRM/amlMmZ97gaKHJS0vBediC9b5kCgdZJCy4RQIvXU6Tr0+G3OwP6
 mJf/C/B97/fIUOcRQ/UC7x+Pgn0nm2o2Ku/6AC730RbUpNrYtL+8TQpPmgWss9je6t7wQTnvb
 eE28rnxTKHInsQg3Ah4nBNkZZs15xh6G6RDzSFcWuE9XZhOBZd7xzor+l45ST/ws/nq3iT6lh
 x4ocTXZR11G2UlPfv14hBo7eh1859zDGQzsXGhZrMW6fbxMatHTY2b6LT0W1bftqfpncO7/Re
 i7hEOIWTP973s7LH+POd55SQZd4HYpyfL515nSYLVXo3G9XrHPYpmwOhDDgZzOHzBFv7/DJj1
 snd3/EZZVYZhrOMLyQdQvFfURHHAr3XXDXW6RiHplhoETVue/WpaD9J5xGGOoy/PawDLOPuN0
 GP9SihA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_103332_694826_23BC8C95 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Feb 2025 19:19:45 +0100

Reduce nested max() calls by a single max3() call in this
function implementation.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/nand/raw/tegra_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 7f9eb5f042a7..c03f11e5e18c 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -793,8 +793,8 @@ static void tegra_nand_setup_timing(struct tegra_nand_controller *ctrl,
 				timings->tRC_min), period);
 	reg |= TIMING_TCR_TAR_TRR(OFFSET(val, 3));

-	val = DIV_ROUND_UP(max(max(timings->tCS_min, timings->tCH_min),
-			       max(timings->tALS_min, timings->tALH_min)),
+	val = DIV_ROUND_UP(max3(timings->tCS_min, timings->tCH_min,
+				max(timings->tALS_min, timings->tALH_min)),
 			   period);
 	reg |= TIMING_TCS(OFFSET(val, 2));

--
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
