Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F0CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I+/0W/U0+464allp60/JjEj+mT/FZxLONQqE8+9wKgA=; b=dg9zGBHgnz5jrM
	lK7bAhvf2lvsxgptMcXc+9k3KGCg85ecpr7WuDbiG4SDgpT2E/wuj73/PCKAwIWwnNPn+B2ED/d2n
	TBFWjtp7fv8f2b8hd/jgh9X5JFoV8z9psUyljMoTKri1Vx5sKGmhFquU7SboHdkQ9pnaPwXpl/G7J
	TpWSCpZ0DjyXgjp3fE95H9Z7SHUhBsiq9YunSk8dkplvOML8vd+o1cxbSrLvzAQe/Es2keilpv08r
	c9JJOkgEK3B8RWbX2xJfd1hFyOjb3KVVA7A1pTQKb/roWwLsE9TXfy4iloTtEKZEa7CgyECTaZsFo
	esWPviC2ZHIHhm1UPg1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRGzT-00105R-37; Mon, 07 Mar 2022 17:17:47 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRGzQ-00103L-0Q
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 17:17:45 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7848D40005;
 Mon,  7 Mar 2022 17:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646673460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uAiCuWoMbD3fjoAvdv+nrJeK43GJCyewkymDyP5ee7I=;
 b=ipWv51NMK/X6ZXHmPyxKkgw4EkZFEb8BgFqVaqFHvvqo9HGJDteh9OmuEbaCbq4g8VyW3l
 5wm76igc3zZJnz5THFbRm7Wrb71elSSTIAS7HwJlMsv5Vek0BT50LSFuTjgO6J6utZHa58
 k78eVnQGO/4ziObl4ch+5ema4l1yVVqghP54R+5CHaNsE75L5du/Cv06sJM3GIy6MVs9qc
 JVuW9Nu7yeFjNVDqZBmuSavFFG0xTajlABG6R70CaAtlc5lJnxPLJiopUkW9d02awqlwin
 da+Ypihm3Ji7nVY68YtW2SibPAcbYpPp41LWzVuEPRW4PdVPrDEP9H3lzObrWQ==
Date: Mon, 7 Mar 2022 18:17:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for the next -rc/v5.17 final
Message-ID: <20220307181734.750b4661@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_091744_277758_5FF2BC61 
X-CRM114-Status: GOOD (  10.08  )
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

Hello Linus,

The following changes since commit ffb217a13a2eaf6d5bd974fc83036a53ca69f1e2:

  Linux 5.17-rc7 (2022-03-06 14:28:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.17-rc8

for you to fetch changes up to 42da5a4ba17070e9d99abf375a5bd70e85d2a6b8:

  mtd: rawnand: omap2: Actually prevent invalid configuration and build error (2022-03-07 17:46:54 +0100)

----------------------------------------------------------------
As part of a previous changeset introducing support for the K3
architecture, the OMAP_GPMC (a non visible symbol) got selected by the
selection of MTD_NAND_OMAP2 instead of doing so from the architecture
directly (like for the other users of these two drivers). Indeed, from a
hardware perspective, the OMAP NAND controller needs the GPMC to
work.

This led to a robot error which got addressed in fix merge into
-rc4. Unfortunately, the approach at this time still used "select" and
lead to further robot reports.

This time we switch to "depends on" in order to prevent random
misconfigurations. The different dependencies will however need a future
cleanup.

----------------------------------------------------------------
Roger Quadros (1):
      mtd: rawnand: omap2: Actually prevent invalid configuration and build error

 drivers/mtd/nand/raw/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
