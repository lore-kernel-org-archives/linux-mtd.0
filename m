Return-Path: <SRS0=A5yI=4Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1866C10DCE
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Mar 2020 02:38:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729D7206CC
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Mar 2020 02:38:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fT+tTRRa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ZUjBrxbf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 729D7206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptsuFBZ3GD2D72RXgHxztOO3DVINra4936QPVd7Jx78=; b=fT+tTRRaXB27YC
	6Lszd8/rci8UsbvRmi2nMewmq+ZLcxu5NoL2Y28LjVd0zx2NM2QpGcw1bx/tC79oBGuOdLy9uDSC4
	O0oeQupB/RNqBTehMXbw18prdz92k/meiskLDym2vb93mbu4A/DK2aO0ifBbDrt6ziasUBG1uq+8I
	p7k31ly9hfY0HtZgTRFitqk4CQ3turxOECTJtv6FPmgUnqa6J/QsEWNS2f6TYxLwxM69nOabqtdpV
	U3n5KOfSpmr2EC1N/mTMxXrbe5f2o3hTzCGRgmX3nfK/XEfMsc849NRwA35hhmQZpl6G1UkB3rvbw
	ah5wQ+APgZhdmO2N/dCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAPLa-0002nB-NM; Sat, 07 Mar 2020 02:37:50 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAPKa-0001V5-OF
 for linux-mtd@lists.infradead.org; Sat, 07 Mar 2020 02:36:50 +0000
Received: by mail-pl1-x649.google.com with SMTP id p25so2524996pli.7
 for <linux-mtd@lists.infradead.org>; Fri, 06 Mar 2020 18:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=voLmfNHCEAsUj1t7nCxgSA9Y75G0q2ard7Ul69iPgyE=;
 b=ZUjBrxbfMPRhNcKXsujkMfTBsDi7260b6iA1v68ODA6TQ/zTU2NXDbEy5j2fpf2qKL
 fzlr30xIQkO7sFofoDb4XryOVTaSKoEdS2CTxOm3HC7bUwueB8pBc4P/aR24dCLInM3k
 ZX7c0iRim3aAYDsNxcgnSOr1U6vatlMLFlDh3gx6/nF0X6rj90nSenuRGG+m78B3jf9R
 Ep8sLbldqAxEvV+N4ZYRfRSQujF9+jWkPkc7EQDvmfuQkRlRwrTNAz3C5qMhYbCl9M4F
 vl8/SXOqD08TjRAub9L/5GhPse1lBiv4AzzaibZkva36DNVabBsTXOvtaYmQz8ehjIDv
 /bTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=voLmfNHCEAsUj1t7nCxgSA9Y75G0q2ard7Ul69iPgyE=;
 b=focO1g7DrXiPWYD+kF8Z8TmuFNTtjhAcF+HjKaz6N499eLeST1PF878BHbykDqzrrc
 AP51lYf4BfyGNT+5eturj8mhBSShxhbPwW3FBb63TSluyLrd+0ipw0kMwfAMh+67nHSA
 Z46nCkYmqsMTQ3VtLc0Ag5+09FIkn8eXkXwiD76Nn+4k1xHPpEonRizhmj5/gGmftVTe
 Xj+TnUidUJDRpS9R6QsI+w7zjziZgfJpcCRlnJtaj/1jT2PR19xOZKcXHIqINc2fC/ja
 /+VCp5/FGwIXvDD/IFPTexZ/XcgogZLNK/3gkeKf2LbZjU/LkM0OhIhsWzdg0Aglkfr5
 cTQw==
X-Gm-Message-State: ANhLgQ2TzHyKyDnJQWFr/wccW6xe8oLr+UdJb++y5CEBl5vZn19uyf7c
 jbSxdialbj4zCSzdYxLFqGerUHJ0tHA=
X-Google-Smtp-Source: ADFU+vuqkVmleIVLhKPiL1OxVdIlhECjzIJTvPSZbDI75NgCC2aoisXFaecuThUwcuon+CY2/vgKdX0I5lQ=
X-Received: by 2002:a17:90a:37d0:: with SMTP id
 v74mr6656285pjb.0.1583548605689; 
 Fri, 06 Mar 2020 18:36:45 -0800 (PST)
Date: Fri,  6 Mar 2020 18:36:08 -0800
In-Reply-To: <20200307023611.204708-1-drosen@google.com>
Message-Id: <20200307023611.204708-6-drosen@google.com>
Mime-Version: 1.0
References: <20200307023611.204708-1-drosen@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v8 5/8] fscrypt: Export fscrypt_d_revalidate
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_183648_797305_4FE6E576 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is in preparation for shifting the responsibility of setting the
dentry_operations to the filesystem, allowing it to maintain its own
operations.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/crypto/fname.c       | 3 ++-
 include/linux/fscrypt.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 4c212442a8f7f..73adbbb9d78c7 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -543,7 +543,7 @@ EXPORT_SYMBOL_GPL(fscrypt_fname_siphash);
  * Validate dentries in encrypted directories to make sure we aren't potentially
  * caching stale dentries after a key has been added.
  */
-static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
+int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 {
 	struct dentry *dir;
 	int err;
@@ -586,3 +586,4 @@ static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 const struct dentry_operations fscrypt_d_ops = {
 	.d_revalidate = fscrypt_d_revalidate,
 };
+EXPORT_SYMBOL(fscrypt_d_revalidate);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 556f4adf5dc58..b199b6e976ce3 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -176,6 +176,7 @@ extern bool fscrypt_match_name(const struct fscrypt_name *fname,
 			       const u8 *de_name, u32 de_name_len);
 extern u64 fscrypt_fname_siphash(const struct inode *dir,
 				 const struct qstr *name);
+extern int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);
 
 /* bio.c */
 extern void fscrypt_decrypt_bio(struct bio *);
-- 
2.25.1.481.gfbce0eb801-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
