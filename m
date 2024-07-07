Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E5FC30653
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Jul 2024 09:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fh8i3ZujIzSHaVl2+IN5XDj0ZdKHRNCYZSS5zXE9Xp4=; b=1SFVA3H/113KTc
	Xj4YNWiUkNP3s6fVQz5X1xMEDe1SijSfLRRjoTQ03piEyLiKlg2Mrl6qOucpVmRLT7u4I9y6es9om
	ixryuRQ3HS3/fS25AMELn89zaryQEqQTX5zuWKurt2XZQzGSpYA8VxFiHVZQzbkAfsbwA+cm4NEfG
	VomfTPDjDjNY0JBU/9SLyzL7C92DQkmZ/VsxGFJgd7lsnaurkvm7E1orM4djaktqq7szJUzvGsy4m
	zkLryYP9BBFlODvcspJnpP3MIA84SP6OohDObk26Cgt3fc44dkIAYXGFjUpZyyMHuxiDr8vLdgp3Z
	bag+uRLXZ1lhW9PK4zBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQOQO-00000001bPd-2AIL;
	Sun, 07 Jul 2024 09:43:16 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQOQK-00000001bOX-05uq
	for linux-mtd@lists.infradead.org;
	Sun, 07 Jul 2024 09:43:14 +0000
Received: (wp-smtpd smtp.wp.pl 7759 invoked from network); 7 Jul 2024 11:43:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1720345385; bh=sWhQn7uhVSBsy0cQPSzL+KpFMsoHdTR8s6pTkJVXcSI=;
          h=From:To:Subject;
          b=HGFVogR7PISmSWEvsYUepG+ck0Ne3OHFG4rD5WBY4ZdcNeSDGzjFMw/tCV6Z2QoLb
           IxiQJcVzHwOGmIFAsvGMfRSQiKhxoB2grlrzoD4CC3fqQxVHTJQ4Gi5lONNLGA/NkI
           cZ/3a0LIr3VdpsUkP8K8nh5J4MRuMiI4NTRGHrmo=
Received: from 83.5.245.171.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.245.171])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <ms@dev.tdt.de>; 7 Jul 2024 11:43:05 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: ms@dev.tdt.de,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linus.walleij@linaro.org,
	nico@fluxnic.net,
	olek2@wp.pl,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/1] mtd: cfi_cmdset_0001: Fix compilation error if FORCE_WORD_WRITE is 1
Date: Sun,  7 Jul 2024 11:43:01 +0200
Message-Id: <20240707094302.784948-1-olek2@wp.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-WP-MailID: 4b7de137d175a33030cd5034704572ee
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [8dM0]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_024312_550569_6629D020 
X-CRM114-Status: UNSURE (   5.33  )
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

This patch fixes compilation errors when FORCE_WORD_WRITE is set to 1
and CONFIG_WERROR is enabled. CONFIG_WERROR was enabled by OpenWRT
a year ago and this patch has been used downstream since then.

Changes in v2:
- Rebased on top of the master

Aleksander Jan Bajkowski (1):
  mtd: cfi_cmdset_0001: Disable write buffer functions if
    FORCE_WORD_WRITE is 1

 drivers/mtd/chips/cfi_cmdset_0001.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
