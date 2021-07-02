Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34663C11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 06:56:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05C2861410
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 06:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05C2861410
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOmHVGeDsDraU/TLjFigsVKDU/QqlgRx3aYBxcjVGW4=; b=aDsRK3b74bHU/O
	LDoJvRrXBuwMrbFMm2GWTIFdLLFzflnhkSogjDq2r8ATDlaaHKHMd+r5rifOzZAejyFrf+VfKXkvP
	KnYuT5eLWtQmbUbzWagVSVEcQmW/WJaB1lFfB9Vc70mT048oEWtWCKlG4DxXe38iENPnCigOgIjP5
	xiTa7NP6uFra87EquKoaL8JNTPltitIT5jPWsWJoLQGW5bHXlWll/DqVuFUC3UiERUXY0eEY7Y0Ea
	PKs1lbf8xlkzbPJXZ/EUsP0thOpTgEOTQ8r1527AC5Xw2YTlK5+deP9lUm+OPFsX/xuaM20yHj/Ls
	NT6oPHUDTM9i/1H9QrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzD5q-002JSe-Mm; Fri, 02 Jul 2021 06:56:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzD4f-002Itb-H8
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 06:54:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1F366141D;
 Fri,  2 Jul 2021 06:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625208892;
 bh=ayeoPIhe+1s08/UaNpC3a37YFzxNe7bjxypfKHgUNos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M6Yn1TVluxIn/JJFYkOy5+lRoF9vC12KdanEUnM4zrAZOprYGMps7cdmMLWxJavhD
 mMsIbETp12zPxypnUK3ATnelRJfK/ziY6z+UE8cqwU6O5PwhfIgQwQoU14hm6uLind
 jSCdBg2kpZbttNLOu6/+b5gWEVfB37pTDtV2r6pwVIqmr9j0vEv/C8lO6rTVTUJE70
 vWyUq6mQq8ieMYQzHcrz86OZ2WaGZO9Pqf0r5et/J7ZN9XolFqdOt3blxktv9kqDMn
 X75GJK3n3UB3SvY/yPEU/IFeYTarVVr3ncwxhxGL9/z3fyGvleNhmJpv0MU5ie0DPm
 ykMU84u2xEGUw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH 5/5] fscrypt: remove mention of symlink st_size quirk from
 documentation
Date: Thu,  1 Jul 2021 23:53:50 -0700
Message-Id: <20210702065350.209646-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210702065350.209646-1-ebiggers@kernel.org>
References: <20210702065350.209646-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_235453_630182_7D65C6F5 
X-CRM114-Status: GOOD (  10.01  )
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

From: Eric Biggers <ebiggers@google.com>

Now that the correct st_size is reported for encrypted symlinks on all
filesystems, update the documentation accordingly.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fscrypt.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 44b67ebd6e40..02ec57818920 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -1063,11 +1063,6 @@ astute users may notice some differences in behavior:
 
 - DAX (Direct Access) is not supported on encrypted files.
 
-- The st_size of an encrypted symlink will not necessarily give the
-  length of the symlink target as required by POSIX.  It will actually
-  give the length of the ciphertext, which will be slightly longer
-  than the plaintext due to NUL-padding and an extra 2-byte overhead.
-
 - The maximum length of an encrypted symlink is 2 bytes shorter than
   the maximum length of an unencrypted symlink.  For example, on an
   EXT4 filesystem with a 4K block size, unencrypted symlinks can be up
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
