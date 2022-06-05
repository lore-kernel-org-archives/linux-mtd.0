Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE784C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Jun 2022 07:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NX1x6teJdfRsEp5OpQ8lk1BhR49TuCylo0BB4Ozqpo0=; b=wq7qs2KXh45G0u
	sseQibsG6FuFaGoZD4sdwkfQMCdIX1JmbzXsPQNEBIkomd6WMrkcbyJpdz42jpK1TBnIgzB2Kj1OI
	pogM/e5pT4z5PA4tFWgrzjbz8BwgVb7FPElhPD23ELZnwYsg7EimDBWnf/Io8JKFzsDfsfZ8CIo9U
	x9zyo4+771WI6nrc1xzm0lxphU8RP4COxjX0LxZFFNJ2M+rBquWlmwNZkh0UyvibouSzFWQ7NCliT
	eV5tVF/o4qLakv9XGCZCT+iWHurfcgOMNdA1V4QAQOEnaQJd1K5nc9Stq2gQyH7BwZ+kl8+v/o9K2
	YCyWcGHwV3IikYvDBaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxkMN-00Dsl7-In; Sun, 05 Jun 2022 07:07:39 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxkMK-00Dskf-OV
	for linux-mtd@lists.infradead.org; Sun, 05 Jun 2022 07:07:37 +0000
Received: by mail-pj1-x102c.google.com with SMTP id l7-20020a17090aaa8700b001dd1a5b9965so10226106pjq.2
        for <linux-mtd@lists.infradead.org>; Sun, 05 Jun 2022 00:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IXhtIIwrHhpC545+iRgGHYieqqcWvvqmIcwI7xt4Nsk=;
        b=iR5Gf7A2/kjLk8Exxps3G0dFRVC1OZjJzS+j2VngWMWquMTrT0tMlu+kwyY+F7EMMI
         lGoZzbndHfDZ4cObymGJCKclk4t2eUSMdCQReDhUxzX4pRTRhUECii4OdVqCZo7/MLRv
         syITFdMzOJw61554abpUPmNjaYgNN1bo4ZoAP1ymyoWSietZE/1pr3cfS252SQh558kG
         qEFZLPguUBe4DBV/fZx4ZTTdbY5aE4vCY3KgmuQJB+9LM1igdu3RLOoRkqSbocJiCNdC
         b7+HeRs4HzS5LATNdkmXyFN/8d0xEiEYUFaV1hSLyycfFxdH5gv+B3pf1d5C3OcMs9YS
         PU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IXhtIIwrHhpC545+iRgGHYieqqcWvvqmIcwI7xt4Nsk=;
        b=DgaoakJMaTGlHJlksNyx4q8NwHgVAlJpKkEl9Zjhl0npKA1xBN2yn/tCH3cLekjARm
         tg0OmXUF+AdynmJxaGQJHAKJxy490xhaQEicWmCnED5LjPondTt/krZxJjn4hIsRcVfP
         j6sYCQbNxg14pmPlP5dWee//5rdWOX0oYZT8h4EyZVAlAAdOylyc8T9UW+mFxVgYonT9
         wKsOmOthzdruIUXqeecZIxoVFqVtg4d/pciEsEdFDNdtTP+6jyMfCJNw1H27aBScPd6Z
         71FAnEWBRvwy4GUP1SjGsznQrxU0jn3O3YNhTgJtDigy0/s5+ivKYW+dZcVNjoyvA47n
         Ex6Q==
X-Gm-Message-State: AOAM533UTgYLr4/89JDG9k0h8r0TOVk0H2LhYytT4Rue0NT3I7hCZiJy
	QCVp3zd7oFs10ItTyxpQ+Q8=
X-Google-Smtp-Source: ABdhPJyMTGLeCNNm+FCrSgXi3l1iw0Qz5IzzU1+Oa/PBBWrms0PoJZlcnhW8wVTcnShhAvR8SNJp+Q==
X-Received: by 2002:a17:903:210a:b0:167:78c0:dd70 with SMTP id o10-20020a170903210a00b0016778c0dd70mr700900ple.157.1654412854448;
        Sun, 05 Jun 2022 00:07:34 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id x28-20020aa78f1c000000b0050dc7628196sm442504pfr.112.2022.06.05.00.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 00:07:33 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: parsers: ofpart: Fix refcount leak in bcm4908_partitions_fw_offset
Date: Sun,  5 Jun 2022 11:07:23 +0400
Message-Id: <20220605070726.5979-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_000736_833242_A7AEBAD6 
X-CRM114-Status: GOOD (  10.39  )
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

of_find_node_by_path() returns a node pointer with refcount incremented,
we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: bb17230c61a6 ("mtd: parsers: ofpart: support BCM4908 fixed partitions")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/mtd/parsers/ofpart_bcm4908.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/parsers/ofpart_bcm4908.c b/drivers/mtd/parsers/ofpart_bcm4908.c
index 0eddef4c198e..bb072a0940e4 100644
--- a/drivers/mtd/parsers/ofpart_bcm4908.c
+++ b/drivers/mtd/parsers/ofpart_bcm4908.c
@@ -35,12 +35,15 @@ static long long bcm4908_partitions_fw_offset(void)
 		err = kstrtoul(s + len + 1, 0, &offset);
 		if (err) {
 			pr_err("failed to parse %s\n", s + len + 1);
+			of_node_put(root);
 			return err;
 		}
 
+		of_node_put(root);
 		return offset << 10;
 	}
 
+	of_node_put(root);
 	return -ENOENT;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
