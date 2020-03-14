Return-Path: <SRS0=TiS6=47=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037B6C1975A
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Mar 2020 20:53:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5D6B20828
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Mar 2020 20:53:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L2GffO/9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0iSH8Q5D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5D6B20828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UgnWEHtu88+1Wwm4n6DymTucNBP8TTF2J1+Qgarwk4o=; b=L2GffO/9wJsKrQ
	wwEhHDBa95b7eGwapK1nRg/PfnILDiVv2L0pvWhZ+gl9PCuymF56gopWTzkqog1ay8NcGDRQrXOm2
	H1vwMy1CoE7ejG7zUZohppW3Y1snZUMpAkse6L912GciEMqdnArsuhf36EWsqaZCbpTJ3SMeCpmbt
	bwsTrhu1lkVUA2lNQfWBTgJkoEdSzujYLivJO4IgF8/WkSmWfhB9aOB7Zlf7VgbizT+DHtbkAXSPh
	oDqwqBRUweE1SToWEw/gKzxEMuOceOudaT3FDLWNDzp/UkpZVsUJB1qC7v801UZSimC9kxT7Cam1l
	a2Je6I3kj6k5y9mPdIkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDDmf-0003Ac-J0; Sat, 14 Mar 2020 20:53:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDDmU-00034O-HV
 for linux-mtd@lists.infradead.org; Sat, 14 Mar 2020 20:53:15 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E76F22071B;
 Sat, 14 Mar 2020 20:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584219193;
 bh=nlaaveyfQbhFKfwiAaphWpQDQEdEAujbuJUQUWFnHF0=;
 h=From:To:Cc:Subject:Date:From;
 b=0iSH8Q5D+Ml4kWit103vNhqqB1ao1wz8fX85tuNaSR98NmuiY+2hC1jyJD/ruJ/V1
 199VRhsa+r9bu1MzO7xz9Tr7s0TnpAj5smS4RburSHj7ylnB0x9tbam9/SzEee07yX
 pQtOWhG8kxmo09f3EZX3BsptKW71I9wsopcIgkek=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH 0/4] fscrypt: add ioctl to get file's encryption nonce
Date: Sat, 14 Mar 2020 13:50:48 -0700
Message-Id: <20200314205052.93294-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200314_135314_604937_482378B7 
X-CRM114-Status: UNSURE (   6.95  )
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

This patchset adds an ioctl FS_IOC_GET_ENCRYPTION_NONCE which retrieves
the nonce from an encrypted file or directory.

This is useful for automated ciphertext verification testing.

See patch #1 for more details.

Eric Biggers (4):
  fscrypt: add FS_IOC_GET_ENCRYPTION_NONCE ioctl
  ext4: wire up FS_IOC_GET_ENCRYPTION_NONCE
  f2fs: wire up FS_IOC_GET_ENCRYPTION_NONCE
  ubifs: wire up FS_IOC_GET_ENCRYPTION_NONCE

 Documentation/filesystems/fscrypt.rst | 11 +++++++++++
 fs/crypto/fscrypt_private.h           | 20 ++++++++++++++++++++
 fs/crypto/keysetup.c                  | 16 ++--------------
 fs/crypto/policy.c                    | 21 ++++++++++++++++++++-
 fs/ext4/ioctl.c                       |  6 ++++++
 fs/f2fs/file.c                        | 11 +++++++++++
 fs/ubifs/ioctl.c                      |  4 ++++
 include/linux/fscrypt.h               |  6 ++++++
 include/uapi/linux/fscrypt.h          |  1 +
 9 files changed, 81 insertions(+), 15 deletions(-)


base-commit: 98d54f81e36ba3bf92172791eba5ca5bd813989b
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
