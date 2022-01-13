Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878BDC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jan 2022 18:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nicSR3YMK1XTVOzuKWuldh5Kap84nA1g5uX+rR9L/XQ=; b=rtPVwjzxrhYxUt
	nle9UdqHcOcc+xQcpHJeVOEFWaAR3m9WEWDSgv85+hDxTgqzKYEMJr/n8vR3KSvAvtO/e35Ee/Ja5
	5s3o2PVu2msiUe0f17L+MjDPl1q9slRq0tVVnB4zi8VnLhZV+ae37y6C6qpRKU/MsPkAVHX4AX7tz
	ivI7HOKkzVv8cHR9YMYtoSatAbYYPkoUuL+9+1mcXkAH8Z4jX4m8By5j5001VcSnoikBqHnoSlKd2
	nxBx5fQZ2bzbDRIIwFxLwUGrKFmQoH+XMGrvgwE/hxG0Qzj0pTtl7oHIpIhgssl8VHg1vRp1Rv5Rt
	fdj2C0Z4bpVg4c5yMurg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n84XE-006qMe-9u; Thu, 13 Jan 2022 18:09:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n84XC-006qM4-5d
 for linux-mtd@lists.infradead.org; Thu, 13 Jan 2022 18:09:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3A481B8233D;
 Thu, 13 Jan 2022 18:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6173BC36AEB;
 Thu, 13 Jan 2022 18:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1642097351;
 bh=gRt42SMj1lCizKzhlJnYu7AY+4d/+Mx8SK+T64O9Ob0=;
 h=From:To:Cc:Subject:Date:From;
 b=JUy/9Mx62mGlaxkgP6tNkMx9KBYlsQuCHg4mwdwjRu3eg37uFkqZyEPdEkk9vyMlP
 Z/CEC0E1EBB9f2Gn7Sf+9kY2e7QPrY/xiVlJLQqoIwOb7TnH41Ii1s1EmyclkfpB3J
 wyXvBX94rlq/BU31bwbRsbbgvO7+uyopf4O0yl8Y=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Richard Weinberger <richard@nod.at>, Stefan Schaeckeler <schaecsn@gmx.net>,
 linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: use default_groups in kobj_type
Date: Thu, 13 Jan 2022 19:08:57 +0100
Message-Id: <20220113180857.2158974-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298; h=from:subject;
 bh=gRt42SMj1lCizKzhlJnYu7AY+4d/+Mx8SK+T64O9Ob0=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDIkPsrbtfpdY6byh4cWL3OdPK54u1V2/U15P32txOhf/IelX
 FSEvOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiLjMY5pmENK7plCkpPGQW8vaKeH
 v2rmUbOBnmJ16NcYkQ8Nm7bMmboJQN5W9v1ZzsBAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_100914_397044_E94BA26E 
X-CRM114-Status: GOOD (  14.03  )
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
field.  Move the AMD mce sysfs code to use default_groups field which
has been the preferred way since aa30f47cf666 ("kobject: Add support for
default attribute groups to kobj_type") so that we can soon get rid of
the obsolete default_attrs field.

Cc: Richard Weinberger <richard@nod.at>
Cc: Stefan Schaeckeler <schaecsn@gmx.net>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
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
