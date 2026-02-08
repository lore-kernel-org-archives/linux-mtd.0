Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EC3EF06E3
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Feb 2026 06:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t6dKe7z5ixetOK2pyZUERcJ25s4sXWvAOn8DUd3Fomw=; b=a4t6TeW/JDKxpn
	z89740qROCWqOgB6zuPZBwM7C3pHkCYK+eZS5CLYWAoJqZiSQRdSXqUqA55s+mT6JGgkc51z/BR8L
	I/M2YIRGjhuj2N6flF6bnzfPjlleQW5+9G7cOiWaWUDOpt1Lj8sYSYmHx5hKA9859kFn1HePazkvI
	3tjdrrsRnwUHynR9zl0gNfH4euhTsixk/UxfatB+KnNobJeae91nDoruLeiPAFXPPP2KN/KneCAnl
	OMsmIwgFqoeJg4URxmvOVTcpGiwcqLilODbF9TD9NBxBzjP38BDRWCCOdscubnWhmd9wJemF2fH/S
	g280yxLMnonFITHJSc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voy8w-0000000D4Xi-0K4w;
	Sun, 08 Feb 2026 06:19:38 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voy8q-0000000D4WX-2rmo
	for linux-mtd@lists.infradead.org;
	Sun, 08 Feb 2026 06:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770531572; x=1802067572;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WF+qi4ivY0NEP6GZqQRBPyCq0+EsbEsVfk5b6Ncuuzo=;
  b=hnzwWpEG1WgK5LtelJYIxmod3sXBCXbeTJq4mHtp5XqwUtHP3nqsmDbv
   OmjJIcCGiksSX6Elery5WbsFkteXjObIRrX2bVQ9sW7aknU3FksyQoHxL
   2RF6vF3CkLblrLRUqCP1MKTP7Gano44hr6DXysf8b3/fxmyRNbIMBgXCz
   MyBBNhFPhibxSNc+oHQoBbUT4gcUVkbtHzDzSdrFXNej53PBSdXaJAi73
   cAHL8//Fgp/82Jw8sA+5Pi24z3yhGtoaY1vpS6HsJC747SZpZVJbXjyNf
   oOWxmURxdWrm27/LTryceXqEElP2t099Od58UWI2JOaI3wABjXcSId1+o
   A==;
X-CSE-ConnectionGUID: IBZdUWx4RdSUt8CSv/oQ3w==
X-CSE-MsgGUID: Y8tKnTsyQ0uwqLC05bhLJg==
X-IronPort-AV: E=Sophos;i="6.21,279,1763424000"; 
   d="scan'208";a="12616449"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 06:19:26 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:20860]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.7.219:2525] with esmtp (Farcaster)
 id 6acaa630-3c74-4b85-b879-7e20e6a0d65c; Sun, 8 Feb 2026 06:19:26 +0000 (UTC)
X-Farcaster-Flow-ID: 6acaa630-3c74-4b85-b879-7e20e6a0d65c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Sun, 8 Feb 2026 06:19:25 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Sun, 8 Feb 2026
 06:19:24 +0000
From: Eliav Farber <farbere@amazon.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <farbere@amazon.com>
Subject: [PATCH 0/4] mtd: spi-nor: winbond: Fix protection handling and enable dual/quad reads
Date: Sun, 8 Feb 2026 06:19:15 +0000
Message-ID: <20260208061919.30498-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D038UWC003.ant.amazon.com (10.13.139.209) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_221932_841279_826529C2 
X-CRM114-Status: UNSURE (   7.08  )
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

This series fixes block protection handling for the following Winbond
SPI-NOR devices:
 - w25q256jwm
 - w25q256jw
 - w25q64jvm

The devices do not correctly describe their Status Register layout and
protection capabilities (locking flags, TB bit, BP bit configuration).
As a result, the spi-nor core rejects protection requests and locking
operations fail with -EINVAL, e.g.:

  flash_lock -l /dev/mtd29
  flash_lock: error!: could not lock device: /dev/mtd29
  error 22 (Invalid argument)

Update the device flags to match the actual hardware behavior so that
locking and unlocking regions work correctly.

Additionally, enable Dual and Quad read support for w25q64jvm when SFDP
is not used.

All changes were validated using flash_lock on the affected devices.

Eliav Farber (4):
  mtd: spi-nor: winbond: Fix locking support for w25q256jwm
  mtd: spi-nor: winbond: Fix locking support for w25q256jw
  mtd: spi-nor: winbond: Fix locking support for w25q64jvm
  mtd: spi-nor: winbond: Enable Dual and Quad support for w25q64jvm

 drivers/mtd/spi-nor/winbond.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
