Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA0EC10F03
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 14:54:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C53F2175B
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 14:54:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VO54ev3c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="r7tggnVb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C53F2175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Y8JceTHTl9mDv6vgfh2bZzHjELUZxmSubZG7F+12VAs=; b=VO5
	4ev3chmwB9l3WE2N3d0M8hdpgXq/gkUJzCjgWlqzop72qLaM/cUiQjFxaB//AyZc6Ssc3yEeyTh6W
	h7EKeG3V12evL81tgq+yVn3AibFLTEeJKuCvFsNbuFP74xQmCW1wZPHjvucwG0/0HHwSv/tOyPfkQ
	BShhOHFb8ehiDURDLhOR5cC8li/iRnzY9UmvulARF7Egbu00fjlsLDZXMyjHt01HNuMYJYn2oNkGm
	E1EwN84vudUUQHYYXL+gmUFzXrzdBxBGMrdT6S4TBDlkXPyR3nBzrIA3P0tm5jclZ4BYU/nr18cQQ
	OcOJJ5aKLZdh1Eb2hm6vfLMEIfrMUEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6G8G-0007wQ-3O; Tue, 19 Mar 2019 14:54:24 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6G84-0007gE-PA
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 14:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1553007248; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jlgCJ4Dau1v9odAPFCbEkuDwahsOl1J+W7P2eCMBdsE=;
 b=r7tggnVbpgDXjcd03x75PaXvnRYWdBt9uro/g70Yn9x/QNC/2jeMyCnay2XrYGUCrKMZT+
 AQDNU+NKBgcP8xBfU2KnMzeyaky17rBMaS7FPdYfkitU/ZOmwSdEeDQ7aXkhrfr1v8GWfG
 KlGdd0XQD69JCeHBO5U6K4P2Woxi0Ik=
From: Paul Cercueil <paul@crapouillou.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH v6 00/13] Ingenic NAND patchset v6
Date: Tue, 19 Mar 2019 15:53:50 +0100
Message-Id: <20190319145403.31627-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_075413_007346_55132035 
X-CRM114-Status: UNSURE (   2.55  )
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
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Changes from V5 include just a typo correction in patch 09/13, and the
introduction of the patch 13/13 which is new.

The rest is untouched.

Thanks,
-Paul


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
