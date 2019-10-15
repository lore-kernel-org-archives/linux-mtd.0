Return-Path: <SRS0=fWin=YI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1DBC10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 20:23:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34A6520663
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 20:23:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G6NblMxy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ug7K3bxC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34A6520663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pFrkdOAp1xkuZjoWuKjtzGgQLLrFTEypUHisgeOlRFE=; b=G6NblMxyK8nupT
	0FgmPDa5+v0UbpeO0HWcMllu+3++jdjItyQlOcf0NNG57esDMobubgYE1iPTcmFetWBLT/Qd8MDSt
	mfvyIBd9QqQvDVhgETeUXsrlAz11HimJXeog7hWxhS7kCUE8R36fq6mopKaI1nCm8UhMieI7iXJid
	wGs3KWPRco1XWSJIXxxYdLRiZdsK+qyAwUvl0CsuWg+oOFkL7NfLHTqMcGSQS9CZeaDTmieF1y+wy
	QZ7E9kZcOmBrNXFDFOYZknRfaKuToG5b2O1JxywElqF1ShHENxBHPgXeXOoetEtTyamEuCVlW4RBp
	vyeFcKem48IZsc4TwPrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKTLi-0003Ac-BQ; Tue, 15 Oct 2019 20:23:18 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKTLf-0003A6-7n
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2019 20:23:16 +0000
Received: by mail-lf1-x144.google.com with SMTP id u28so15512674lfc.5
 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2019 13:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=y+ijVER/5+jBcanAQFE4W3mrHROdEJXq88q8x377sw0=;
 b=ug7K3bxCDEFGGX8MNwTlQWWJBB99j2C7yDM8H+78/9IRV0rfq57EAEqOXdvuGbAKqv
 QnxdP31UlV+INsKEIRKo9NGr4r9w2ZOdi4Fe1paX4bMJ9DrVG8/cuGE/d3xwxFJNLDUX
 HrcE/M7tkXpB6I4//82Ufek+K7RvyhkwMr5c2JPgG1bOFr4QZ+WvS476oPRWTJp+7sUr
 bhdBbXc2ZBZvsDANL2ugv3DwtvsJALIMXQdFqQLiCaRDVVM6/5ZH3FAT872GBNs0rHfs
 +d2usj4VTHuBAzb8m0ldu9qQ1f3dYE9zNVWuZfWuB3oCTfVw1wsp68+2qg4JaEEOxqLX
 /mdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=y+ijVER/5+jBcanAQFE4W3mrHROdEJXq88q8x377sw0=;
 b=P2Lx6LL+j9kJK/qSjC+FcFFujctEcS8x3Zsfk056rBq9MCMy64GcQHCoIthlt1rlAZ
 TQbQ9QUTEIXkWcW2rWeKatQG6xr7hJ2T5kQf5mrSKgMy1T4KWB7sR/EWCQ7ihZ07InTQ
 KBAQSebXi1Cs+F4VXeIHEshso0/x6n/io4E2d7WsDqaaxamvBk/3WB6rzSPcjPf4aI8R
 AbfJjOWCZuJZxneDGssk5Xrzd5WL0Lp/PZptKGrHoaqLzHLPxW07W5YYKabMr0lWJk0g
 a1n2T5nxBhAxKq6LiHAJDtu7WXqWTfQcyL5hrDVdttQeE5FAMMf+U9nDOVtGEXTJvaMQ
 wlcg==
X-Gm-Message-State: APjAAAX9QwUcM9VKmWH3oUMAbVfsp/VJXY/CjFeVh2GLkEqu6oxf5vRH
 v/4MCGuun/CQzaSMYOTAi6ZP/3ck9mk=
X-Google-Smtp-Source: APXvYqyAPPlsRI/lVCpvuLwGHO1+L41h5ce+ZtJhKPVfESXXzFnblbi5d8wduBUMcBV6ITQOyCxtNg==
X-Received: by 2002:ac2:5a1e:: with SMTP id q30mr22053384lfn.30.1571170992579; 
 Tue, 15 Oct 2019 13:23:12 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:682:331b:9b5d:1e72:4c40:4c22])
 by smtp.gmail.com with ESMTPSA id p3sm5288159ljn.78.2019.10.15.13.23.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 13:23:11 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] mtd: spi-nor: fix silent truncation in spi_nor_read()
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Organization: Cogent Embedded
Message-ID: <72e77a25-fe33-b88e-bfe2-654e10281fba@cogentembedded.com>
Date: Tue, 15 Oct 2019 23:23:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_132315_458954_F639F27B 
X-CRM114-Status: GOOD (  15.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

spi_nor_read() assigns the result of 'ssize_t spi_nor_read_data()' to
an 'int ret' variable, where the silent truncation isn't really valid --
ssize_t is a 64-bit type and *int* is a 32-bit type on 64-bit machines.

Fixes: 59451e1233bd ("mtd: spi-nor: change return value of read/write")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against of the 'mtd/fixes' branch of the MTD 'linux.git' repo.

 drivers/mtd/spi-nor/spi-nor.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/mtd/spi-nor/spi-nor.c
===================================================================
--- linux.orig/drivers/mtd/spi-nor/spi-nor.c
+++ linux/drivers/mtd/spi-nor/spi-nor.c
@@ -2544,7 +2544,7 @@ static int spi_nor_read(struct mtd_info
 			size_t *retlen, u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	int ret;
+	ssize_t ret;
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
