Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6B8C5B543
	for <linux-mtd@archiver.kernel.org>; Fri, 30 May 2025 18:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DkvmARRlPa8OqGg9eoMZ0BlSiUMyjDqLWtPThMtRO9U=; b=nWz4fmx7Awko5o
	2euOae8MnGpOZlrUzZVApbcazOoPhG8C+rxOolMdQLreq8zB2FFLAQEC1JWG54teXXc75W3ebqUXK
	pNnlabi8lt/GdJU4JtbiaHMBWrTYIfV2XVyq1ikCvJTNVVCxr3Z3ihTCkG/waEJcLrlNY7UQL1Z0Q
	XczI1+tF3Aqxi6HhQCVKnJ11vuun2I2clsJvlw4y6HJ4grprQ2dyX9jUjHc1s7lNoi2rGImXfP9tX
	K+2E7x63CRg7jJprEK6qJl0dPZUtLY46TIuegicTuUrzQ4W9uFSeujkEqhA5b7k9RPony90IKF0BW
	jV62XP/bBtpEbkcbRUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL4WP-00000001W6t-2Xzh;
	Fri, 30 May 2025 18:32:01 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL4WL-00000001W4n-2ncq
	for linux-mtd@lists.infradead.org;
	Fri, 30 May 2025 18:31:59 +0000
Received: from fedora.intra.ispras.ru (unknown [10.10.165.16])
	by mail.ispras.ru (Postfix) with ESMTPSA id AF14940737D7;
	Fri, 30 May 2025 18:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru AF14940737D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1748629910;
	bh=B3qXNkFbAswOKirneD5Jj1fcogqx8AXyxFQGEq7IB5A=;
	h=From:To:Cc:Subject:Date:From;
	b=Q3fyXEzX3U8aLoqYT2QYT8GaTS5hr6/rDjap504s5w64q6ec66x37CwpjYoy+Ptvi
	 ng2N5ZZZEluJDyzkN/S3l7+Cxr1jr7gBgdwpRbh3ntg//lH96BoUO1ywKmTdICxim2
	 /fcACrdumtrYp841kPRKAoVYBbdn1VG02O79OE2o=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Richard Weinberger <richard@nod.at>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Wang Yong <wang.yong12@zte.com.cn>,
	Lu Zhongjun <lu.zhongjun@zte.com.cn>,
	Yang Tao <yang.tao172@zte.com.cn>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH resend 0/2] jffs2: fix a couple of uninit value errors
Date: Fri, 30 May 2025 21:31:37 +0300
Message-ID: <20250530183141.222155-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_113157_868553_19052F8F 
X-CRM114-Status: UNSURE (   8.01  )
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

Link to initially sent version reviewed by Zhihao Cheng:
https://lore.kernel.org/linux-mtd/20241117184412.366672-1-pchelkin@ispras.ru/T/#u

There is a couple of places where uninit value is touched on error
handling paths in jffs2 code. Fix them.

Fedor Pchelkin (2):
  jffs2: initialize filesystem-private inode info in ->alloc_inode
    callback
  jffs2: initialize inocache earlier

 fs/jffs2/fs.c       | 2 --
 fs/jffs2/os-linux.h | 1 +
 fs/jffs2/super.c    | 3 ++-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
