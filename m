Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A1CC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 10:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bS5qGzS1xFShzXxQyGPnG3A+7lUaTIhVybeV1OR/T2Q=; b=nm6MM5lhoVpEhP
	71AftbPn9pXzpx/FA/9jl+AFLctWZ0hfTIz62TrRq1psXf8/IpZz724UisddMJVnDczhiW8gyoSxu
	GSiYDLaWDYexfkNPSosdD+VrG8EjB3NN1HilhLBJlDLeuCHmIrzkN9rkpov3vrfMBEz4HOWXPRjZR
	/ps0ZQUJISgofA6tySSZW4YzsLstKaCK/Iqf+MV2HGhtsZ/qbZTgLfjdFJIGh32hHb6DYsLnBVrg/
	2260PEqfPZ2BzwCUTaiepRRu9m48qm0pSm5bb5DP2RJKrQTBVrntjYBv6KLYcmwXTzhj6x5wMV8Qi
	HBGp7YrYjaHost2uUjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8K8F-008lxW-Gb; Fri, 14 Jan 2022 10:48:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8K8B-008lwL-PU
 for linux-mtd@lists.infradead.org; Fri, 14 Jan 2022 10:48:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C94CA61ECB;
 Fri, 14 Jan 2022 10:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1C2C36AEA;
 Fri, 14 Jan 2022 10:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1642157306;
 bh=Juz0pY8LSJErwzrSSYzBtkgWGFYcSVutMWjyQ8i708I=;
 h=From:To:Cc:Subject:Date:From;
 b=NlrF9rbt2g1bnk+A1BHC2MomkZu1nzlePi6dqEs8gpIOPP185DvrNFuccbb46vE3+
 g+y+gDbtReNUt5/v3ovJeygmD8ymZnHcQkRIN5Kn0VfZpofddeWw7u2ubFVdBVfrTk
 Fw2NhvbOV/RJYqfgjssGiv3FBHWLDpmi6fRvKwW0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Richard Weinberger <richard@nod.at>, Stefan Schaeckeler <schaecsn@gmx.net>,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2] ubifs: use default_groups in kobj_type
Date: Fri, 14 Jan 2022 11:48:20 +0100
Message-Id: <20220114104820.1340879-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434; h=from:subject;
 bh=Juz0pY8LSJErwzrSSYzBtkgWGFYcSVutMWjyQ8i708I=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDIkPQ95OvBMkcfb+JIEU/f81j06m3VRK1gmY4q9ltvW2/PrV
 lT9edsSyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBEZhszzE+PPNTxKyR3wZpH+c8S+d
 ad2v3O/QzDglX14estS7KyHWKzzLvTlJ937W1pAgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_024827_890414_2F3E3C25 
X-CRM114-Status: GOOD (  14.28  )
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

There are currently 2 ways to create a set of sysfs files for a
kobj_type, through the default_attrs field, and the default_groups
field.  Move the ubifs sysfs code to use default_groups field which has
been the preferred way since aa30f47cf666 ("kobject: Add support for
default attribute groups to kobj_type") so that we can soon get rid of
the obsolete default_attrs field.

Cc: Richard Weinberger <richard@nod.at>
Cc: Stefan Schaeckeler <schaecsn@gmx.net>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: fix up the changelog text to properly refer to the ubifs code
    instead of some other subsystem as pointed out by Michael Walle

 fs/ubifs/sysfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/sysfs.c b/fs/ubifs/sysfs.c
index 7acc5a74e5fa..06ad8fa1fcfb 100644
--- a/fs/ubifs/sysfs.c
+++ b/fs/ubifs/sysfs.c
@@ -42,6 +42,7 @@ static struct attribute *ubifs_attrs[] = {
 	ATTR_LIST(errors_crc),
 	NULL,
 };
+ATTRIBUTE_GROUPS(ubifs);
 
 static ssize_t ubifs_attr_show(struct kobject *kobj,
 			       struct attribute *attr, char *buf)
@@ -74,7 +75,7 @@ static const struct sysfs_ops ubifs_attr_ops = {
 };
 
 static struct kobj_type ubifs_sb_ktype = {
-	.default_attrs	= ubifs_attrs,
+	.default_groups	= ubifs_groups,
 	.sysfs_ops	= &ubifs_attr_ops,
 	.release	= ubifs_sb_release,
 };
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
