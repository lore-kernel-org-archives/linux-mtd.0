Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB893C10F14
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 20:26:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 895FB21741
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 20:26:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YR7ZgSe+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rThJbB1A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 895FB21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z9vLMwLaFwLTgiRV9HmxjGy6T3VzfNfnEuJ+LiX8Ll0=; b=YR7ZgSe+DyiO+A
	x8M3iLCqzDcoCb+1A+SI3BMuICDYA9XeUpFibMrn2+1liBzeWDkUXPIHdO7qWExMpzAv9Tji8pclD
	5c732sxTxfB03iY7DDIukc5sMTbS0V1aU++FPqvxBq7+3j6EChECw4meoYkkrOny61Oq1XCn5vFtc
	9Q1FV91oWDiBQaUtVDhv4Hm34rmo7g8EeiWVRjjmShF3OMrlS/uo9JkXOOsRLQZfh8oZW4fWaaMwL
	3GKewi8EO5ne58sig6zBPEq60SNf1uynk8HjAhkRpuupOIO8nBLTqwzL8da1/bLOVgWhWPke8CzZF
	zMNOHrxuaMImNFs1YstA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEJnP-00005d-BD; Wed, 10 Apr 2019 20:26:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEJnN-0008VW-8R
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 20:26:10 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F83D2082E;
 Wed, 10 Apr 2019 20:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554927968;
 bh=gyyZYzbbhDHtMy/kZVs0+EooltdNhiZvXVja1enYQsY=;
 h=From:To:Cc:Subject:Date:From;
 b=rThJbB1AmEh0utqHL2XB2L12FFyNirVTjT3zMUnaXB49hGdmpbsBO7533r9Zx9kq2
 LTGJ8t0ssNylib0mcoFKorsMooQ816+rvConipvpSpACwj+GAN1pNIg2HlXKLQWTWW
 ml7uJUHUYeT/PB2/psPq+p9hLYHzJjNbOD88EJ88=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 0/2] fscrypt: improve encrypted symlink performance
Date: Wed, 10 Apr 2019 13:21:13 -0700
Message-Id: <20190410202115.64501-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_132609_316233_658DA515 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

This series improves the performance of following encrypted symlinks on
ext4, f2fs, and ubifs.

Eric Biggers (2):
  vfs: use READ_ONCE() to access ->i_link
  fscrypt: cache decrypted symlink target in ->i_link

 fs/crypto/hooks.c       | 40 +++++++++++++++++++++++++++++++++-------
 fs/crypto/keyinfo.c     | 21 +++++++++++++++++++++
 fs/ext4/super.c         |  3 +++
 fs/f2fs/super.c         |  3 +++
 fs/namei.c              |  4 ++--
 fs/ubifs/super.c        |  3 +++
 include/linux/fscrypt.h |  5 +++++
 7 files changed, 70 insertions(+), 9 deletions(-)

-- 
2.21.0.392.gf8f6787159e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
