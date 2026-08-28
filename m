Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A908C61DCB
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2026 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/8HvrFlSRmOzZPgaaMR3uonbEbuJR96JsMyciF8/Bc0=; b=vNpbqB6jBrLsLE
	8JztmCYIyUVTxm+J1+0lcj7E1GPLU/hwAeLNVDjIdlWQnaofscOOSVaYcqOEg618Gc+9lm2BbA56P
	OpEqFHydOREl81y4rMPUWMfIUhWJs9V2+prV80bIoOw0SavGhob/w9EHrpvwFmOWk46EB8EHb+BLK
	ouROcTs7wreBOKi2c2SCxQEDGR6Cu+B92tfXdQmHLZJ3MNanlqFM25nlLJf5YxmH4wabborA58QSt
	Fuvl1+7/12FX03hF8/mBvSMspQ+OqSqpCkNwd9WPDWATtdLZQqQTpzEv/Ej6Yfiwg2a6d4s5TplNj
	txTXiMz+Z8yfkFgoPZ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy4K-000000062OU-45iG;
	Fri, 28 Aug 2026 15:00:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy4I-000000062Nr-1hVd
	for linux-mtd@lists.infradead.org;
	Fri, 28 Aug 2026 15:00:36 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-482e257a23aso595475f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 28 Aug 2026 08:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1787929230; x=1788534030; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfZiElKe4UXrl5NCjFGN4jGVtfkor6YAv1JvkWiSTSM=;
        b=SMd7nYQLnYVPAB6WSj/2WZYJF/dHQrwag+KmlTxL8NJ4FBEAjdux+KlTFwsJaQklCV
         Cteqg7/EVryShyVjTl1Y840DAfNLzPik3a1FjHhU38jYoAg00hCrT1Lqex1XHfyksEX4
         dXfk1GV2alj18uQ+xpaYF6p+0byrSoGrBcmX41tQ0ZeVmv3gA3V+BHz8MwdjI4VUJOUu
         hKFt8By4KL02e3H+5I4pqmoOdhdd7T7LAJwC3i6RFZOMlMoMoQMBykE4e6TVvEBDtvL9
         c2u2ZFfl9PdOHMTHWKz4SJLeJ4zJBGVOWpKo9gnLucQZw+XkCBLZC8nransz1NuBsMGx
         FLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787929230; x=1788534030;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MfZiElKe4UXrl5NCjFGN4jGVtfkor6YAv1JvkWiSTSM=;
        b=Zd21Cwj1zNWm/Gj7zVOK6QdUiSM58BfsFJMYO84Ygb7C9ZzjIiJgRDu8OUepDTs0SX
         /4hUsjuExzRKOkJ2nwuI8EuXisYfqnVp0HRS72vewmMxPzUymrm9sqzsoebUvAHl9D7x
         ++WzakyoVSHPioY5dEdMZc4mAK4lHwtqp+Fow5OUQZT/jBOd7zbMOq0vezuoSTJVA9rn
         aiie34YKvItyOvlRgc0AkjoRmWuGrTvEox4YAZWlHYruiA3AIYBQzvBvThZh62rkcg3G
         M6NgznPyy2W6zVqdiSefbU+Y8h+/tqDtBeeOeSZNIJnka5yeNPC2Ho7usBLVBhjBnRtr
         XBtg==
X-Gm-Message-State: AFuF++nrVJziGqxFa7NM4NT5qTzaR1oP7HMqommeKxgSWgk2xNGFRifL
	xWKoPlZzoUlxATzAVWyjikIqDLPVCitZ+sZ3M6g8XEiqRdbxrLIyUY7pZldknbt5cPk=
X-Gm-Gg: AR+sD13I+SNimBUv2Y/wEGJ/Dt24dLpktGUOXYnRJzamv9Lg0CZUTSvkOZNLA4wn8aF
	0dm5TyX0gr+adQMWR4XySMqKBHnA0VcOFdsioHg5lSDOpBTRcFWjgEkxTtpGswYlalIAl35ngTI
	pBahZ938i7Yb4gIoYlFs3tYG3xUwdpGbNxDiTIzGzFAxY2Sz0TCuuopKIAHjcXg+CCQ/SclJt50
	xAr6ujVJxtNqV2LSx6mWAwbtdDd+5tk2ElKM9Jd36pv9kxfGLDb7jddyi75d9zCtpNi4XKB/bBl
	vs+DtK/ze66ADYG6t2Ij2Ytn+6++EzZOrz6+4qjEAVEu4nSt17twFnqZNolTWa4Kv4E7b1/9Mne
	gKqylEOYfNWmp9au3QvqeeqTG1MF6QhkcO6/zfy5GP2bM1J2brw9o/8+KhcjAOX8u/exGdL+KeS
	n0CNITOvKdA8UYVkcyXnwD1frDvd+ta0IT7LrIwB4Q9uZ2EaMIU7tjRSPb6w==
X-Received: by 2002:a05:6000:4693:b0:482:f5f6:d253 with SMTP id ffacd0b85a97d-482f79b0528mr9587670f8f.12.1787929229177;
        Fri, 28 Aug 2026 08:00:29 -0700 (PDT)
Received: from somecomputer ([195.65.134.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20737sm3989620f8f.22.2026.08.28.08.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:00:28 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] UBI and UBIFS updates for 7.3-rc1
Date: Fri, 28 Aug 2026 17:00:27 +0200
Message-ID: <7545938.rdbgypaU67@nailgun>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_080034_804570_9F8FA4AF 
X-CRM114-Status: UNSURE (   9.16  )
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

Linus,

The following changes since commit 075b74841bd0065a3bda3440873c747938e69b68:

  Linux 7.2-rc6 (2026-08-02 16:24:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-7.3-rc1

for you to fetch changes up to a5e0055eac837a1168c781653943d4a0d9920af3:

  UBI: support per-device wear-leveling threshold (2026-08-12 00:08:54 +0200)

----------------------------------------------------------------
This pull request contains updates for UBI and UBIFS:

UBI:
- Support for a per-device wear-leveling threshold
- Various fixes and cleanups of error paths
- Correctly preserve torture flag up wear-leveling

UBIFS:
- Various fixes and cleanups of error paths and kernel-doc

----------------------------------------------------------------
Ibrahim Hashimov (1):
      ubifs: fix out-of-bounds read in signature length check

Ran Hongyun (2):
      UBI: fix two issues in the ubi.mtd MODULE_PARM_DESC
      UBI: support per-device wear-leveling threshold

Randy Dunlap (3):
      ubifs: debug.h: fix kernel-doc struct prototypes
      ubifs: key.h: use correct function parameter name
      ubifs: ubifs.h: clean up kernel-doc comments

Yuho Choi (2):
      ubi: Fix rollback for explicit UBI device numbers
      mtd: ubi: Release device reference on busy detach

Zhihao Cheng (2):
      UBI: Preserve torture flag when rescheduling failed erasures
      UBI: fastmap: Pass to_be_tortured when reusing old fastmap PEBs

 drivers/mtd/ubi/attach.c     |  4 ++--
 drivers/mtd/ubi/build.c      | 48 +++++++++++++++++++++++++++++++--------
 drivers/mtd/ubi/cdev.c       |  2 +-
 drivers/mtd/ubi/fastmap-wl.c |  8 +++----
 drivers/mtd/ubi/fastmap.c    |  6 +++--
 drivers/mtd/ubi/io.c         | 11 +++++----
 drivers/mtd/ubi/ubi.h        | 25 +++++++++++++++++---
 drivers/mtd/ubi/wl.c         | 54 +++++++++++++++-----------------------------
 fs/ubifs/auth.c              |  2 +-
 fs/ubifs/debug.h             |  4 ++--
 fs/ubifs/key.h               |  2 +-
 fs/ubifs/ubifs.h             | 20 +++++++++-------
 include/uapi/mtd/ubi-user.h  | 10 +++++++-
 13 files changed, 122 insertions(+), 74 deletions(-)




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
