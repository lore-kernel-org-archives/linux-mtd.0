Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E92C3402A
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 16:12:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90507215A4
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 16:12:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rUgbp5oC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90507215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJcwF8qIRzc5wjJ6Ol5cAPkdlcPsRqFWHR9PS6eZ8BM=; b=rUgbp5oCDqYM/q
	2wBbBqcwceIQ39Yff6t9/jZ7l/NLLJcxk33P66HwcZm6lFNUEOixjQXsboNUctvur5KZyorZAyIcr
	NIFNFXCvLnpGyg0MOd5ai/Fa1KpNgqubTH61cbyK4NB0Zcxfe22aDLbm5LOFh3msM2Pwx112xeLbh
	gPyc/Re9y/tt44GVysPXtHoxYo5pc3uBPcle5SOZAWKgNdXqcIvSbE55Exns21d+MlYgCYbU+48Wt
	00A2uUFOqqTTEd1LywQ9QyeIinckkRXsddj5DxDxgeCDrlQBOQ8A6Y2p83y04dtDMWoKP63t0KX0J
	ARlu7CBe3tI2UyUjDHXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3j0f-0006zP-Sk; Mon, 17 Feb 2020 16:12:37 +0000
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3j0e-0006uX-2H; Mon, 17 Feb 2020 16:12:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1j3j0b-000fcJ-EL; Mon, 17 Feb 2020 17:12:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 42/44] docs: filesystems: convert ubifs.txt to ReST
Date: Mon, 17 Feb 2020 17:12:28 +0100
Message-Id: <9043dc2965cafc64e6a521e2317c00ecc8303bf6.1581955849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581955849.git.mchehab+huawei@kernel.org>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

- Add a SPDX header;
- Add a document title;
- Adjust section titles;
- Some whitespace fixes and new line breaks;
- Mark literal blocks as such;
- Add table markups;
- Add lists markups;
- Add it to filesystems/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/filesystems/index.rst           |  1 +
 .../filesystems/{ubifs.txt => ubifs.rst}      | 25 +++++++++++++------
 2 files changed, 19 insertions(+), 7 deletions(-)
 rename Documentation/filesystems/{ubifs.txt => ubifs.rst} (91%)

diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index bb14738df358..58d57c9bf922 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -90,6 +90,7 @@ Documentation for filesystem implementations.
    sysfs
    sysv-fs
    tmpfs
+   ubifs
    ubifs-authentication.rst
    virtiofs
    vfat
diff --git a/Documentation/filesystems/ubifs.txt b/Documentation/filesystems/ubifs.rst
similarity index 91%
rename from Documentation/filesystems/ubifs.txt
rename to Documentation/filesystems/ubifs.rst
index acc80442a3bb..e6ee99762534 100644
--- a/Documentation/filesystems/ubifs.txt
+++ b/Documentation/filesystems/ubifs.rst
@@ -1,5 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============
+UBI File System
+===============
+
 Introduction
-=============
+============
 
 UBIFS file-system stands for UBI File System. UBI stands for "Unsorted
 Block Images". UBIFS is a flash file system, which means it is designed
@@ -79,6 +85,7 @@ Mount options
 
 (*) == default.
 
+====================	=======================================================
 bulk_read		read more in one go to take advantage of flash
 			media that read faster sequentially
 no_bulk_read (*)	do not bulk-read
@@ -98,6 +105,7 @@ auth_key=		specify the key used for authenticating the filesystem.
 auth_hash_name=		The hash algorithm used for authentication. Used for
 			both hashing and for creating HMACs. Typical values
 			include "sha256" or "sha512"
+====================	=======================================================
 
 
 Quick usage instructions
@@ -107,12 +115,14 @@ The UBI volume to mount is specified using "ubiX_Y" or "ubiX:NAME" syntax,
 where "X" is UBI device number, "Y" is UBI volume number, and "NAME" is
 UBI volume name.
 
-Mount volume 0 on UBI device 0 to /mnt/ubifs:
-$ mount -t ubifs ubi0_0 /mnt/ubifs
+Mount volume 0 on UBI device 0 to /mnt/ubifs::
+
+    $ mount -t ubifs ubi0_0 /mnt/ubifs
 
 Mount "rootfs" volume of UBI device 0 to /mnt/ubifs ("rootfs" is volume
-name):
-$ mount -t ubifs ubi0:rootfs /mnt/ubifs
+name)::
+
+    $ mount -t ubifs ubi0:rootfs /mnt/ubifs
 
 The following is an example of the kernel boot arguments to attach mtd0
 to UBI and mount volume "rootfs":
@@ -122,5 +132,6 @@ References
 ==========
 
 UBIFS documentation and FAQ/HOWTO at the MTD web site:
-http://www.linux-mtd.infradead.org/doc/ubifs.html
-http://www.linux-mtd.infradead.org/faq/ubifs.html
+
+- http://www.linux-mtd.infradead.org/doc/ubifs.html
+- http://www.linux-mtd.infradead.org/faq/ubifs.html
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
