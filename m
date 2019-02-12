Return-Path: <SRS0=ca8F=QT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56673C282CE
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 07:14:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21A6D2184A
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 07:14:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZzVOj6wh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="M4k0TZjP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21A6D2184A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iSQmp+Y2v76oaDKt4I+WmuE3kqRr5vicjMdGFSP2Pqo=; b=ZzVOj6wh6XWg03bP4ogGJ2Cw9r
	t03D374F3G6bgwehQ5uzhZvNxlrvuGmIoyWZDSYBtnGB3Nz8wZwXNSY+SglDrE87KudZJLvhz9p4D
	X3OZejk8dDfXH9/IWFd7R0dJgNh54XlMjOba3jDzF3Mi1pK0HWXClyt//OiUmofZ1bw/EfOiBHgCm
	UF2tMz2eMulPmGPfSEAE9vVRkQukIjSG05feocHa6G8jdwANiCgDXa3geuhmSq0eU+NX2j+QEf93x
	V/YxIkrlO2b+Ul9zk2P0elg4hDvsfHujJPasCcsn4UaaZz3OjvUdMnO1E2bjR4N7uTczV/yT35HGp
	pN6E+fyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtSHO-0004Ni-R5; Tue, 12 Feb 2019 07:14:54 +0000
Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtSGM-0003J7-Rh
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2019 07:13:59 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id x1C7DPdV019269;
 Tue, 12 Feb 2019 16:13:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x1C7DPdV019269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549955612;
 bh=Cxo+nXTM0mDOF2OjW40lPL0MRI8BxhjckTRFkxa+L8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M4k0TZjPOGPdeO/Yk6e3L38TJi6a9WG84ecuAVW3uGmjmCk2GEZpj1sqsXQCpokb+
 yg0RHjtXos4agwU0AbO91MTpdgMc65ml0f8y3h5TRZ7Nv/KwLukmCYVTsXIvEfw2aB
 Kvz8gzZfjnWsWtHdwhSX/MIN49ADGBdZ5xFh2PBTAlV5HhtUO72DZh3R+jXHu7iUFs
 e9YJ3r+Z1e29c02v3M9F8OrO76d5He7AuDuQDdvx5qIcV9dztkS56g49O1EFwJPiQ3
 ygQvl/zPGYlOqjuR7yY/uQbtjASGv6ZNbdEH7FGz3AIaLCyIXTYrM6r5oMkasi7hs8
 aoPyjE3mQxk6w==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 07/10] mtd: rawnand: denali_pci: rename goto labels
Date: Tue, 12 Feb 2019 16:12:59 +0900
Message-Id: <1549955582-30346-8-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549955582-30346-1-git-send-email-yamada.masahiro@socionext.com>
References: <1549955582-30346-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_231351_601461_6AE16911 
X-CRM114-Status: GOOD (  11.05  )
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

As Documentation/process/coding-style.rst says, choose label names
which say what the goto does. The out_<action> label style is already
used in denali_dt.c. Rename likewise for denali_pci.c

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/mtd/nand/raw/denali_pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index 48e9ac5..02eb599 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -84,20 +84,20 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (!denali->host) {
 		dev_err(&dev->dev, "Spectra: ioremap_nocache failed!");
 		ret = -ENOMEM;
-		goto failed_remap_reg;
+		goto out_unmap_reg;
 	}
 
 	ret = denali_init(denali);
 	if (ret)
-		goto failed_remap_mem;
+		goto out_unmap_host;
 
 	pci_set_drvdata(dev, denali);
 
 	return 0;
 
-failed_remap_mem:
+out_unmap_host:
 	iounmap(denali->host);
-failed_remap_reg:
+out_unmap_reg:
 	iounmap(denali->reg);
 	return ret;
 }
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
