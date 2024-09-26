Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54F2CCFA15
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 09:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xiJrgnWVL4nZJCUVYoXJ4txSVbfctvErQrheg0OxnCE=; b=TLJlfdFBFLG5Ph
	YPcnLS91SfB3Q3uGfRnsC1c1b+2rvXX1bxnGfno8Su6lfYv5SQUmue91QJ+zEXUo+G5Q/uEgy2cUl
	fRXDwBs7aWBGPnnaK6fdSmQ82XZ6wZFiGaYVler96l9ySe+jbhL0AVzgo5nbgvJqLmq6f794JDHln
	CcW6LuRxsoNGIrulGOZm8nQOn4C2hFtO0HjZtYeCpjvAy200blkob/6cEGMgBTryEqbwLLJpGJl7a
	Q8M4OEZvLR8ZefVIHf/A9ZwxY/79jIhMYBwy4ZCJEP+b2Zbi+TknJeDfgXTxqS6dDk1sykmEIVKYm
	G7a2EcRuHOnRVF1bQUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stlC4-00000007ySu-3X8Z;
	Thu, 26 Sep 2024 09:53:52 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stl86-00000007xFM-3nxa
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 09:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727344167; x=1727948967; i=markus.elfring@web.de;
	bh=hOHEk4EFX3thBPSJCG19L99hsawAOI1Zr0gYqbm9Nic=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FGZIcpoXoUGEtfGzoOtlaYHO7fZUwVlz/pLNnKQ7weLPEztJMWHJ8OI54pSz7J5l
	 YrF2La1+2ZfH4esWu98SkIQ4v573j1IZXrLY0Oqy6UzU2vkY9NsGItab5Ojxhnl0Q
	 1zdvI7ehFBhqf7HP8YD0dA98DzzhXIbhrf1x3ZETos2iDWaIdLkLvIRKykKTVAxX1
	 CIeJuwGMrfD/RT8jtUXgSFCGm+/KooVayCKnGUSd10Z+gr0SDQ/ehy2QfL34jG/zB
	 mHCnuxB8nH/cwIW83ru0stcFd33qkQOUqimY5zhoF+TJaj/acfHli+N3IpW0W4ml1
	 G5SYFVW0fSnd0E0gCQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MZB07-1sOjsF3o37-00XYKK; Thu, 26
 Sep 2024 11:49:26 +0200
Message-ID: <c5bd9bb7-2636-4c48-9623-4c93ded3469c@web.de>
Date: Thu, 26 Sep 2024 11:49:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] ubifs: Call iput(xino) only once in ubifs_purge_xattrs()
From: Markus Elfring <Markus.Elfring@web.de>
To: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <ff787fb9-a9fc-4798-8460-3ec310e6cd9f@web.de>
Content-Language: en-GB
In-Reply-To: <ff787fb9-a9fc-4798-8460-3ec310e6cd9f@web.de>
X-Provags-ID: V03:K1:vpgE/5iekYk8NTAf200bwBBju3y0tsqloprET8oIqGfXy4pqgUL
 bJ0+s97WyUsUZ3nqZigCX/KhxuvygeHpwP7LZjgJfP/4LSxzb9o4eLQ1iGyjEEtVl46f4ip
 p0YbjfKRQ2jKcUK1+hZ40UrwbVMtBfu40hey0OG0S09S3jCer6RlH0olF2k3W2qruN0Ka+M
 TviNhZ8ird73w+DmJtOzw==
UI-OutboundReport: notjunk:1;M01:P0:nCr9OlfvGMk=;9o41UjHyQrjeEH0YURHJa9Mz5B5
 dsoXKaw5azo1TlXWdX428deCnw4hRn+xuOYo5eOsnVu27j0nw3ZpJs3jNb2irDm+avn7IaXxA
 mffaKO+ZbZVQc3I2rw+9J7SjIUhtd/aPOKOKipKjLEcd9m38n3bKIqYtnYcKEzqNBw9cMzo98
 qmNMV5JczdXht2+XG2KShmngs9I/r/GWbxWXf7eU+2xWdw373bYvsliwpIBW4FmEZWsZc6gyK
 DcgJNInxupKcmwWCaC4lk1V9bEMIFvBF+GhzGdOVxo3CjgZP1iSO19iP3IRAUOVomUb+WNhnw
 z+qlLQRoqwXLttI6x550eVTZcj24u2GzRBJPdEn7bT1o98D32Z8YpgtTkjpc8JOt19vmK4krT
 S3MsyGJd2jOpVMPQu+LJSZTUegE5HwRoGv4bsqm4rVIIWgD98gwXEQdr5GArY1FGMPZzhCLYY
 D33cxvFyWTBx0mkRMvfJl2NHCRZe7TZhhKX7l3QTWgnK8iQqPRtrQADLyu4ssBGzLngaq4rBU
 YA/2bNCght74+R0Sl9MlrgH8UIuUq6p2aHctdHSb2owBzouYF1TldSmIMMBn+t6nPzYGYPFYm
 fIwNa+P31mksksBOQu57SoaNlEwnDA2AGQUHj/NzvWZP11aQzIWzLvkEFjoCvvVvqEO1jb3Ci
 Cid1BW7mda8DCALepzZ9hI0BSnH7MTQsZZgAS/I8SV0l4L3Bv2UG7pHGYpbcfNZMGBS3ZBZFj
 SE9ZISG8Pu2uZPSCSPgiTBMwJPsfb577i4CAOQg1s0+EDqfqE3IHBRliv+OquAVrQ+OguI4gC
 SuVK8bwpQWZPgdUbF3tuNJYQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_024947_268369_1128E15C 
X-CRM114-Status: UNSURE (   7.35  )
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
Date: Thu, 26 Sep 2024 11:05:29 +0200

An iput(xino) call was immediately used after a return value check
for a remove_xattr() call in this function implementation.
Thus call such a function only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ubifs/xattr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index f734588b224a..7757959e9f09 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -541,16 +541,14 @@ int ubifs_purge_xattrs(struct inode *host)

 		clear_nlink(xino);
 		err = remove_xattr(c, host, xino, &nm);
+		iput(xino);
 		if (err) {
 			kfree(pxent);
 			kfree(xent);
-			iput(xino);
 			ubifs_err(c, "cannot remove xattr, error %d", err);
 			goto out_err;
 		}

-		iput(xino);
-
 		kfree(pxent);
 		pxent = xent;
 		key_read(c, &xent->key, &key);
--
2.46.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
