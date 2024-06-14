Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEC3C27C6E
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2024 18:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eLAc4e0FeHVnzCEUWrgHk8v+PcgGk3Rdx0Sn1PKxlt8=; b=Cu/gRDFPYaMYVV
	B4yo3JCYOhqWHG4A+rfZSOnqOjS4Suq1Zy5Lg3lT6ZZ3taA6kUSAZ8pPiBoJKXbnfB2kQ8ky6aNXk
	iCEL+Bw/Sb1wCb0e6QCAi992kSXDlI1LvmpINjX/jgG+sfk1FL5NJxIGOD/plNcc4LkDKFtuRsZYu
	Ccyxa30lIGMS7lqamo8lykJaFIT8ClieTN7kM8OJmT5wxkoXf2u8eGWoU+7vaq2ulRwh+CThkYRLs
	74gFgBUV5W7oaCVkHJfkphibsEbnNjTkGhS6uHmL3sMA8uAodj9q7YHUHyiF9PoyA/pPPkhyVmk0M
	vNgSxMSbi8e6C2boHvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIBr9-00000003myb-3o6Y;
	Fri, 14 Jun 2024 18:40:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIBr7-00000003mxN-1NM6
	for linux-mtd@lists.infradead.org;
	Fri, 14 Jun 2024 18:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718390455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vbHnjVCMgPLHGeY6k4yg5XvdLWsbsFGovk2aBHxfGoc=;
	b=iOvWJRXgg04rAv7qfEW+fIW9+/suApH/vyG2QEF9hs5GxUgFeHqwwjk5Ma5NzXSsKEQhx/
	jnr1e9No6k9k4qwHat8sCnkyhJOMe+uuZE/h3QXVCzzKw/H5QXKQirbhSLR/QdLRE4pbtD
	CZfzdZyHn4xfR4lqpk7sGG/JvtWQYEU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-nA-l2EvuNieQ2sPCHOqdTg-1; Fri,
 14 Jun 2024 14:40:50 -0400
X-MC-Unique: nA-l2EvuNieQ2sPCHOqdTg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D3861956083;
	Fri, 14 Jun 2024 18:40:48 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.73])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D570F19560AA;
	Fri, 14 Jun 2024 18:40:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-doc@vger.kernel.org,
	Alexander Shiyan <shc_work@mail.ru>,
	Olof Johansson <olof@lixom.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] Documentation: Remove unused "spia_*" kernel parameters
Date: Fri, 14 Jun 2024 20:40:41 +0200
Message-ID: <20240614184041.601056-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_114057_460467_FF68B7F2 
X-CRM114-Status: UNSURE (   8.33  )
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

The kernel module parameters "spia_io_base", "spia_fio_base",
"spia_pedr" and "spia_peddr" have been removed via commit e377ca1e32f6
("ARM: clps711x: p720t: Special driver for handling NAND memory is removed").
Time to remove them from the documentation now, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ff02e1a02e12..dd8436c98735 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6273,11 +6273,6 @@
 			Not specifying this option is equivalent to
 			spec_store_bypass_disable=auto.
 
-	spia_io_base=	[HW,MTD]
-	spia_fio_base=
-	spia_pedr=
-	spia_peddr=
-
 	split_lock_detect=
 			[X86] Enable split lock detection or bus lock detection
 
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
