Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EE4C46CD4
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Dec 2023 14:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOp5lCHozvOQvwx9Rzqhnq29dXiD3NN1KyT/t2NbU8Q=; b=SYkVykdSalf1jc
	0Eg3TtGiCkCHN9kBQG+w8gt3KZ4c4eA1Rw2SVbBCaejAgEposa8FXn2fQix43l645/hh5BNAZbYdk
	gSAKqvkIHIdLZ8LiCBgiDPkIrJ02GzYTpQwd24roF25s4C3iFUYXU6ZXsNAV/31zck+SN8FD2xmWm
	BS/4z+/OaoKSInzs5Q/3wTlQ46sINr3v8TMMCKMDx2QPtT6OWNP4keTKwL5jBGGcKpg5mse+ULe00
	twYjxpnrr+E7o4gKXb+MRKgzJol0pXqHw0/xVkYnei2VgYVl/AxlAGbq6rzXBeFPvY4kyhZsVEWkU
	uPRtKeh8IeiuTlMihLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIVDe-00ErKu-1a;
	Wed, 27 Dec 2023 14:49:14 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIVDc-00ErKT-17
	for linux-mtd@lists.infradead.org;
	Wed, 27 Dec 2023 14:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1703688548; x=1704293348; i=markus.elfring@web.de;
	bh=IYQuEfayrUaxsfx/Jht5MY0p8docH+bqlNNlyCEIxyE=;
	h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
	b=B+BAbipeP3KqINA7LfE2N8dYMBZhYSXCLNfpEZBSeWcwAwn3E70QkJTZVye4RHwA
	 LlNtzog6M/rH7TpsaARxjMRPf6zEhOFWmE/REWFJhwm0l7REkHswEAeeVbT7TtP88
	 9+9Qbqj39RnbtUfTNvSc9I5aa87VoADWiYs6dBpiGjw6I8xvg+TzpjLP88fvqB6ak
	 292GKHQ6CUVLinJSSITcafrSD0Qhiu50HhWUXEEQAe121BigwuQ+MAo8OhtjhG+KK
	 BnLB1cTpw17P+OqWFqr/NzngHNGt7+XUXCXLr3FXWvF/TjWYPW/YJ29McTFZRPcLL
	 zGt4ReFjlvTnmUzfNw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MXXND-1rkq6N0OPH-00Ytas; Wed, 27
 Dec 2023 15:49:08 +0100
Message-ID: <b7ee7d1b-49a2-41d8-9c8f-3674f1aecc43@web.de>
Date: Wed, 27 Dec 2023 15:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/3] mtd: ssfdc: Improve a size determination in
 ssfdcr_add_mtd()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <74183091-4c8d-4c92-b3f9-cebaacb41efd@web.de>
In-Reply-To: <74183091-4c8d-4c92-b3f9-cebaacb41efd@web.de>
X-Provags-ID: V03:K1:8zji5qAAe4LlZRke0P8vuGVQD1GEZcvLMVstcHnKSL9+IC5mgZP
 ycBVYSZGO2wxFhfFo690DMK1AghOhBKC1a5WAdSxQ5XxrzNo+WGtaP6SdUmsPnhA4nxl7Zg
 t22zyHSgm9VugNHesdLoQLSkTDy8+bZ1LV2AqP0Dm9Q3tI71hiiFNqBAuWYLnb8qIYHY1J8
 42BIvwpyv5qFEcXCAZ8+Q==
UI-OutboundReport: notjunk:1;M01:P0:qc2cGMeCaNY=;Kg8y9r64w9GnWCG2j/y2tgEmmCG
 n2ca4F0FCHJl7udoLTAbxgmKI4+Jy6fwTixt09F1OUqCdim90FuQxx6+HmNoDsPMLF5J8JbX9
 MxNP4YluwxAHizivU+Iqcv2C1dw5eP1prOPOn1UQ9g+nN82WYU08P+9cRVkTbzRhgWh7XsKaT
 vvgdDsqAw9bPSiRTwauE5vm3KQgMmWaQZSC3dm6XsdbNlsnGmp4w2CTrFW6p+wbq3kUROk/l9
 C+5YuVdJMRA5pzd/c75VxDm7RiA86ccKUhjyv7XKeW1Ba6Al+U3rwzZ6mobGm6ah9DVh/gwuu
 vaONvm3NL2PBm6O9eEkOf4iBnv4sU56YL9hSX64hRb10MNFbyTEBwXed2tS20GqI1hHmFkE+m
 RBsjnkEnpX+pQVb+4oIsjtBxXGhXCof9yLqoYBKfsAFDreOvhOUI3OSk1E9Y4Nxd3MOPZL8AF
 5frOekBsKpNz8nFCGFcHNaUnJH57q4zTU8XLH1NzjvYUayeCDgqMfJwn3LJ5Ns/Jclgdj7jjd
 jVRFgss+2RCm63+xSN/4VMICXb2BqZghFwJWWlvpL7NmZq55botFn0DdBECgfECagO9npjvK7
 IZl0yaXygiP0hAyIRbLzMgxK3jZRo5LSVabkulACO8c8orKOyywra7qUCSN1OIfWxiynHp6GG
 jZHsekzzMLhqHPtp+moZMYQRW45XnR+rg1UkcVf81tr7nYZXQbNliEoiOlgmQ10mK77DAtzwl
 0R3Y3t143Q883AJSQmxrdq1UgDPPle7Lmsg37BEq9+zwK6o9Mx6XjQfFKRUjeaCuXgPtZD5uV
 /XzXR/OTtJ+IGwm2d1o/Zy4UZ3j4TxpfhTt1H36DSJP05gDOVjWQBljkSUNddtOhLPNw6TuMO
 lN7Y3X1QiC6oyClIBbIbXv4AhRo4eX/Det8uFfJe5fD60tbwltaEwtKfgduh8Xg4vgB+aNtjg
 X40p8A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_064912_666002_ECBEF13A 
X-CRM114-Status: UNSURE (   9.62  )
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
Date: Wed, 27 Dec 2023 15:30:06 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/ssfdc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index e6de25087647..46c01fa2ec46 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -295,7 +295,7 @@ static void ssfdcr_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	if (cis_sector == -1)
 		return;

-	ssfdc = kzalloc(sizeof(struct ssfdcr_record), GFP_KERNEL);
+	ssfdc = kzalloc(sizeof(*ssfdc), GFP_KERNEL);
 	if (!ssfdc)
 		return;

--
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
