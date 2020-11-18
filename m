Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6E0C56202
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 07:58:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A9022080A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 07:58:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zh/g+CfF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+6dqvcT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A9022080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X5L82fX7n07gq9tUEU33msNvjcw23f77dAo04oGWo5Y=; b=Zh/g+CfF35Za4TYDwy6nf4ulvF
	I9wmC7kcEnjmXPOfIBQJh8vFad7lYx/3J74z53VjqRV7QeGzo3mByc1GlJEabJ0+iw7KhBVMn+hvf
	fe2Y5xrt7AGaP3WO6ng8td1IhR2vLxBkC0yHiv0PUa0XwJGcFTIAvQOjOjVSfL6ys/kH9/gDsRBjL
	Er//9GIyQpbMq7Jt+Po5tZ3e/YZ4WU2Y3qfGi2b03uiFOTxMxZLoTyEFhvp5y5bnyFLg2wsSqplYR
	24c5j1rZTEbekZfndQ9Jy/tQeDWwvaoBYsSgpN0lXSuOEp6x+Y+zFDtx9B3ntsjcletgAcbJScIVx
	y0+NqXpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfILX-0002l8-Qo; Wed, 18 Nov 2020 07:57:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfILU-0002jH-H4
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 07:57:41 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F55E2080A;
 Wed, 18 Nov 2020 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605686259;
 bh=RIC5mu+TPEgksMKT+f1TM2ePCUTrxlaadfpm5VMsKc8=;
 h=From:To:Cc:Subject:Date:From;
 b=A+6dqvcTRZ0pE0gw4wXXN7TtjV668JBEprEGLRRtaSe1TUym2p46zV8cyYiudUEHp
 eL2GK9KCkRG7AtMzZZ0NWXHxhG842DV39eUgIk1EyM/F/3uDDg2hd6ex1aLRM+K8DD
 qaaZ8Xz/2laZctKUbSMDbJkN6K4gTVZZ6U9x2dgo=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH 0/5] fscrypt: prevent creating duplicate encrypted filenames
Date: Tue, 17 Nov 2020 23:56:04 -0800
Message-Id: <20201118075609.120337-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_025740_835416_AB73C8DD 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series fixes a longstanding race condition where a duplicate
filename can be created in an encrypted directory if a syscall that
creates a new filename (e.g. open() or mkdir()) races with the
directory's encryption key being added.

To close this race, we need to prevent creating files if the dentry is
still marked as a no-key name.  I.e. we need to fail the ->create() (or
other operation that creates a new filename) if the key wasn't available
when doing the dentry lookup earlier in the syscall, even if the key was
concurrently added between the dentry lookup and ->create().

See patch 1 for a more detailed explanation.

Patch 1 introduces a helper function required for the fix.  Patches 2-4
fix the bug on ext4, f2fs, and ubifs.  Patch 5 is a cleanup.

This fixes xfstest generic/595 on ubifs, but that test was hitting this
bug only accidentally.  I've also written a new xfstest which reproduces
this bug on both ext4 and ubifs.

Eric Biggers (5):
  fscrypt: add fscrypt_is_nokey_name()
  ext4: prevent creating duplicate encrypted filenames
  f2fs: prevent creating duplicate encrypted filenames
  ubifs: prevent creating duplicate encrypted filenames
  fscrypt: remove unnecessary calls to fscrypt_require_key()

 fs/crypto/hooks.c       | 31 +++++++++++--------------------
 fs/ext4/namei.c         |  3 +++
 fs/f2fs/f2fs.h          |  2 ++
 fs/ubifs/dir.c          | 17 +++++++++++++----
 include/linux/fscrypt.h | 37 +++++++++++++++++++++++++++++++++++--
 5 files changed, 64 insertions(+), 26 deletions(-)


base-commit: 3ceb6543e9cf6ed87cc1fbc6f23ca2db903564cd
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
