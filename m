Return-Path: <SRS0=TiS6=47=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CD9C0044D
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Mar 2020 20:53:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8117520828
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Mar 2020 20:53:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KP8/+SNP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZfFkIOM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8117520828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1Hk4TU/ek0UrnXy8mmxL7XAbFjTViq/nK7MdZcUBcg=; b=KP8/+SNP3Au2jX
	mDJrZQX+sSR9GeR88xU7UJs4qXXgOe+rGdY9wgsmUsYKzqxgdNNDys5o7chMy1FjXk+eyL0K66e0K
	PNLS/CRVgJ0Y5MT/qGtW3hY4NFSw8xnjHLKHVgzIllThgpUvWflwz85OUT0f6v1LL6iM443UDKNWp
	6lHJzubudEhbXIATUcETFbc9zjm5bsMEk2U0I3PFW+I+ZoeMSfr8+W8eRPoVuJOrfThIBXnnKntap
	PNkOLPFy5uQC8/mb2t7LHjsrV4Ub/vl93t/iHUyO4OWaZmFTcpCtIXjaITO6v4SW/c7sLaCcCISGi
	WxVi19VR2Qabqx47clyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDDmb-00035x-RN; Sat, 14 Mar 2020 20:53:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDDmU-00034Q-Hj
 for linux-mtd@lists.infradead.org; Sat, 14 Mar 2020 20:53:15 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A95620790;
 Sat, 14 Mar 2020 20:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584219193;
 bh=CmnZSp1cD9W7GBGuNrZlONVYibn7gCqqoj6gfIP9vA4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gZfFkIOMgxmssruP+ea9EmjgNTu0xB1lPyOJtKrZoCw0s+W9sImhe8b8XapQ7wupz
 k50I7OFwE0y6DZSyUAaqAE1YEnztPP4sMCFh4vnyxj01ht3I67/QjbWDkGypsH3cxy
 winlpMSIqpy6GLkVeR2z71N6lCVDH7b4zg7GOjn8=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH 2/4] ext4: wire up FS_IOC_GET_ENCRYPTION_NONCE
Date: Sat, 14 Mar 2020 13:50:50 -0700
Message-Id: <20200314205052.93294-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200314205052.93294-1-ebiggers@kernel.org>
References: <20200314205052.93294-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200314_135314_606770_F3BBCDDE 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

This new ioctl retrieves a file's encryption nonce, which is useful for
testing.  See the corresponding fs/crypto/ patch for more details.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ioctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index a0ec750018dd3..0c1d1720cf1ae 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -1210,6 +1210,11 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			return -EOPNOTSUPP;
 		return fscrypt_ioctl_get_key_status(filp, (void __user *)arg);
 
+	case FS_IOC_GET_ENCRYPTION_NONCE:
+		if (!ext4_has_feature_encrypt(sb))
+			return -EOPNOTSUPP;
+		return fscrypt_ioctl_get_nonce(filp, (void __user *)arg);
+
 	case EXT4_IOC_CLEAR_ES_CACHE:
 	{
 		if (!inode_owner_or_capable(inode))
@@ -1370,6 +1375,7 @@ long ext4_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case FS_IOC_REMOVE_ENCRYPTION_KEY:
 	case FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS:
 	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
+	case FS_IOC_GET_ENCRYPTION_NONCE:
 	case EXT4_IOC_SHUTDOWN:
 	case FS_IOC_GETFSMAP:
 	case FS_IOC_ENABLE_VERITY:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
