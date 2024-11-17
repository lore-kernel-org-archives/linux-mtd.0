Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73597D10F27
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Nov 2024 18:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YLyXeC6tI/n2Fur0xwE8kbbGzPHdTQSKk476VfYQ+NA=; b=yyXQe7PgB3gkGe
	lQ/anPRp/klEvgWCjENzfFlrD8PG7+T/PWzhEWm32hdGGpxPBbP5DziiMSDdtIZrtemxpd6hX48S3
	T5mbIQr7jxTVmdMuUU3NKEsYr7XJ6KCoDnR2GSdprsNETJr4atVKM+P42iVnl4yIjcNRvSzem2LTd
	Skg7X6aLHYlXqSdSxkUDFyJz59cvnrZ29dppvs718mKESLdJQAj8gXlwFR/gmLTvLGZwrN+k3Rcn2
	aSophSX/GKEpSoxq+bZEgHSI8oNQXF2lQ/L7ss9Yy/h9q6xe6VwV43YW0b/KUl29F7fwOZdp4aS4F
	c3fWycg0So20Z6naqroA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCkGE-00000007gfi-1wYd;
	Sun, 17 Nov 2024 18:44:38 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCkGB-00000007gdP-07EE
	for linux-mtd@lists.infradead.org;
	Sun, 17 Nov 2024 18:44:36 +0000
Received: from fpc.intra.ispras.ru (unknown [10.10.165.6])
	by mail.ispras.ru (Postfix) with ESMTPSA id 2FBC1518E778;
	Sun, 17 Nov 2024 18:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 2FBC1518E778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1731869067;
	bh=ZfOJ3PpDEgEr9Zel8CG5ZDup6WjpmnQFHw2f6/BApFI=;
	h=From:To:Cc:Subject:Date:From;
	b=KtkQIxayYNhqUiSE/e2qdEjmr0Ov5PDq6l8Plza3soLEpAMndcyjl78R0okRttA8e
	 Ka1Mjgs510jInDqGeSM4ZVh/Arn+nqDmGL5+vAZ3SKzYHQuxwVyBwnQklyO9NfWvSg
	 g8C6Ufxm8hRixG5ITD6GNahvNnoC5t4vXiuoJ7VY=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	David Woodhouse <dwmw2@infradead.org>,
	Wang Yong <wang.yong12@zte.com.cn>,
	Lu Zhongjun <lu.zhongjun@zte.com.cn>,
	Yang Tao <yang.tao172@zte.com.cn>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 0/2] jffs2: fix a couple of uninit value errors
Date: Sun, 17 Nov 2024 21:44:10 +0300
Message-Id: <20241117184412.366672-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_104435_586698_959FC9C7 
X-CRM114-Status: UNSURE (   7.62  )
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
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
