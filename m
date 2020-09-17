Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A8DC43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 04:14:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A283722204
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 04:14:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OHq9ewh/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuwrpsyK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A283722204
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X6ARoJPrmAoPk9I8ooy2XJeN/khwbI1Xfsi/E4E/AC4=; b=OHq9ewh/+goT6w4ETBjCkcdpZ
	i7Opwqyn1nvnEMRzsWe3TsuK5H3VW3O6nBR98uAVGLQRXRI5iP2FJbrALwOUfN0Y601SUF3zOcB3t
	Zyx3cayA3ZmABI5s9EmItadTflNncZDMZfTDBGGL924dbAEmDrMgJrEbpTL7Cm2H3DtzfWq1tQCaS
	RhC9EDdXJemKhSzbFM6vtvkIr5cRW6i4hUijoCOyaREkJCYzpb8VkB7nGoyI6mS0IXfm68I2PzZ+b
	+l86mYHmCbOPxVRTu/9gyzXpo6KzvvaJi3IRUScCWlocG2AnO+Um4NftK4XLaB6vQ9xKeEZYvkWi0
	GWUI4Vfyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIlIk-0001Q5-Ub; Thu, 17 Sep 2020 04:13:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIlIH-0001G4-2Y
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 04:13:16 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF604221E7;
 Thu, 17 Sep 2020 04:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600315990;
 bh=7wQf9Y1Ge/SR2fWtRDGBHBDQ9VcJIvgAiZJHiDlXVEw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KuwrpsyKR6Az33Os8au9dNORztVK5lPaO//5B4B9GGkqISAfjzCoMKvSaFMdYkK+H
 cTfwdylHR5zS/tWU4yj+Sm4uxrUgf/O1/jB19DUFCvaoNPk/KtcTePbae7Dup7hHHg
 AlchzaMoe4dDGfi2GfcedI9GWx9Qsvh1eLld4LG4=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v3 10/13] fscrypt: make "#define fscrypt_policy" user-only
Date: Wed, 16 Sep 2020 21:11:33 -0700
Message-Id: <20200917041136.178600-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917041136.178600-1-ebiggers@kernel.org>
References: <20200917041136.178600-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_001313_286720_4CF68675 
X-CRM114-Status: GOOD (  14.51  )
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
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

The fscrypt UAPI header defines fscrypt_policy to fscrypt_policy_v1,
for source compatibility with old userspace programs.

Internally, the kernel doesn't want that compatibility definition.
Instead, fscrypt_private.h #undefs it and re-defines it to a union.

That works for now.  However, in order to add
fscrypt_operations::get_dummy_policy(), we'll need to forward declare
'union fscrypt_policy' in include/linux/fscrypt.h.  That would cause
build errors because "fscrypt_policy" is used in ioctl numbers.

To avoid this, modify the UAPI header to make the fscrypt_policy
compatibility definition conditional on !__KERNEL__, and make the ioctls
use fscrypt_policy_v1 instead of fscrypt_policy.

Note that this doesn't change the actual ioctl numbers.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h  | 1 -
 include/uapi/linux/fscrypt.h | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 355f6d9377517..ac3352086ee44 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -97,7 +97,6 @@ static inline const u8 *fscrypt_context_nonce(const union fscrypt_context *ctx)
 	return NULL;
 }
 
-#undef fscrypt_policy
 union fscrypt_policy {
 	u8 version;
 	struct fscrypt_policy_v1 v1;
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index 7875709ccfebf..e5de603369381 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -45,7 +45,6 @@ struct fscrypt_policy_v1 {
 	__u8 flags;
 	__u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
 };
-#define fscrypt_policy	fscrypt_policy_v1
 
 /*
  * Process-subscribed "logon" key description prefix and payload format.
@@ -156,9 +155,9 @@ struct fscrypt_get_key_status_arg {
 	__u32 __out_reserved[13];
 };
 
-#define FS_IOC_SET_ENCRYPTION_POLICY		_IOR('f', 19, struct fscrypt_policy)
+#define FS_IOC_SET_ENCRYPTION_POLICY		_IOR('f', 19, struct fscrypt_policy_v1)
 #define FS_IOC_GET_ENCRYPTION_PWSALT		_IOW('f', 20, __u8[16])
-#define FS_IOC_GET_ENCRYPTION_POLICY		_IOW('f', 21, struct fscrypt_policy)
+#define FS_IOC_GET_ENCRYPTION_POLICY		_IOW('f', 21, struct fscrypt_policy_v1)
 #define FS_IOC_GET_ENCRYPTION_POLICY_EX		_IOWR('f', 22, __u8[9]) /* size + version */
 #define FS_IOC_ADD_ENCRYPTION_KEY		_IOWR('f', 23, struct fscrypt_add_key_arg)
 #define FS_IOC_REMOVE_ENCRYPTION_KEY		_IOWR('f', 24, struct fscrypt_remove_key_arg)
@@ -170,6 +169,7 @@ struct fscrypt_get_key_status_arg {
 
 /* old names; don't add anything new here! */
 #ifndef __KERNEL__
+#define fscrypt_policy			fscrypt_policy_v1
 #define FS_KEY_DESCRIPTOR_SIZE		FSCRYPT_KEY_DESCRIPTOR_SIZE
 #define FS_POLICY_FLAGS_PAD_4		FSCRYPT_POLICY_FLAGS_PAD_4
 #define FS_POLICY_FLAGS_PAD_8		FSCRYPT_POLICY_FLAGS_PAD_8
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
