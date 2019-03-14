Return-Path: <SRS0=YFz0=RR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B87C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 17:18:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80541217F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 17:18:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gk6Ux/fd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80541217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFtmD/S8HQP0TxriTL5J2bzTtDm9Vd1PsfgzATfeknM=; b=gk6Ux/fd6q7T3n
	bxSCjTLLgpKc8DMq1FEWM05Vq8gCuCqM62TxSLQohwkv32+hSki5x7lkizeHM4+kqQwHkgZnoqfiB
	FkAxa7gQU+iMOX0LnhkTvI1SdcLqSRiASMNXqO8ZNyU40N1xK/0kohFoIcpavuzJlvVjR5J37nZB/
	9Pq/1ZDKmh0sMfobRwGyAibKv+l50hcYW/cnO3Zi6aMVKJPE3wI9PmN1z8GlkksxrOK56KWGV4ewQ
	NT2O8SvpfnRWWKBaug5H7MxNebAX87rK74FQCnGkA6tSnOH2hwVwMtNJ1N6+cMJubTypJyHy7qdaz
	ydV4RFuPQ1aJKH18nNig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4U0C-00027A-Bl; Thu, 14 Mar 2019 17:18:44 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4U03-00015W-Sz
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2019 17:18:37 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 4FA5B1802DF7B;
 Thu, 14 Mar 2019 18:16:13 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [RFC] fscrypt_key_required mount option
Date: Thu, 14 Mar 2019 18:15:55 +0100
Message-Id: <20190314171559.27584-1-richard@nod.at>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
References: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_101836_253727_10A8D33A 
X-CRM114-Status: UNSURE (   8.64  )
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
Cc: tytso@mit.edu, miklos@szeredi.hu, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 paullawrence@google.com, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series is an RFC, it outlines how an filesystem, in this case UBIFS,
could implement a mount option to disable filesystem operations on encrypted
files where no key is present.
The desired byproduct is that in this case ->d_revalidate() is not needed
anymore and VFS folks are in less fear about the dcache implications.

Thanks,
//richard

[PATCH 1/4] fscrypt: Implement FS_CFLG_OWN_D_OPS
[PATCH 2/4] fscrypt: Export fscrypt_d_ops
[PATCH 3/4] ubifs: Simplify fscrypt_get_encryption_info() error
[PATCH 4/4] ubifs: Implement new mount option, fscrypt_key_required


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
