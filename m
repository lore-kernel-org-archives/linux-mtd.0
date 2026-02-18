Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B843E9A049
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Feb 2026 14:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nuMQGFb5kak+DYmgNiElaio7NUhHbZ+cLKTGe9s81/8=; b=soJaCQrIUtLIPJ
	FpYudvGOkL65m02rCKDDiX9Pzg0y3536lFQt0FRGKbo0JD9NliDIYUPmdulYA1rRAvmCDPCLCCUCk
	9RxvP/8Uy9cWeWqmSoT979W2pmaHDHhAFFX/YRzcda1T/Rp4bS/chyHbuZVMvIPeZDFay//N151n4
	YUsHDI7uypBOP73mEHASGvgc/Zm5EabjmQD8GLsB7LW3yiQv4828uLY943VZmK8lv0iLlUHJNL+u/
	m5cIyTwiVkTrdOwx2sz8SLVSzTRqLEI7wntLmfwwbLKSh0D8truaSegA5EzQhBLfLOv1glpubahh8
	bJht3Vepz1x1zVO65b9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsieQ-00000009xS9-3jDL;
	Wed, 18 Feb 2026 14:35:38 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsieO-00000009xRJ-1Kb1
	for linux-mtd@lists.infradead.org;
	Wed, 18 Feb 2026 14:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1771425336; x=1802961336;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eBp0rF4uFYg4vwSoxOgPUtCxGm+sSxHke7Tk2gwYH10=;
  b=Px2A+g49U7id7KXdUcLBLBOYby7WkV7oWhx4rEZIkIV1ze43eZ7QXtOv
   9lXqdIiT2s5IdV9UqDiRC3vwb+N8VC1a6wKZMeVDe5xDc23neqm+ZHVmB
   JLt1BdG9QLfW7KT4tL51v/T87WR/dY/XqB9MB8t3DRdpAu4G3YDPuvvMY
   HaK8+W/+k9LmTAntmRDb4iGedslpD5dBrZgL8q2Gis3jSNuTCIWrTs1kC
   NYKADJcQa4ttVJ89I8sqhVlsZUR9/XhsBi/8P5bfFyLVA5BV7oGRbloA6
   M/relL+A5570e7sgIhs1ocFC1R9Y+vm9XCSzo5G366czLRepqi9r+IDh3
   w==;
X-CSE-ConnectionGUID: dfbVZIx+Q7iWrsRRUkl/Ug==
X-CSE-MsgGUID: 6+kmqMLPSPmzFEanIUatMQ==
X-IronPort-AV: E=Sophos;i="6.21,298,1763424000"; 
   d="scan'208";a="13173832"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 14:35:29 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:11427]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.27.120:2525] with esmtp (Farcaster)
 id 17957111-9f85-4ff2-8e30-0a4c1dd76f32; Wed, 18 Feb 2026 14:35:29 +0000 (UTC)
X-Farcaster-Flow-ID: 17957111-9f85-4ff2-8e30-0a4c1dd76f32
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 18 Feb 2026 14:35:29 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Wed, 18 Feb 2026
 14:35:27 +0000
From: Eliav Farber <farbere@amazon.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <farbere@amazon.com>
Subject: [PATCH v2 0/3] mtd: spi-nor: winbond: Fix protection handling
Date: Wed, 18 Feb 2026 14:35:20 +0000
Message-ID: <20260218143523.17467-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D042UWA002.ant.amazon.com (10.13.139.17) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_063536_438078_23AED066 
X-CRM114-Status: UNSURE (   8.55  )
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

All changes were validated using flash_lock on the affected devices.

Changes in v2:
- Remove last patch in series that added dual/quad read for w25q64jvm
- Added Minimum testing requirements for w25q256jwm and w25q64jvm

Eliav Farber (3):
  mtd: spi-nor: winbond: Fix locking support for w25q256jwm
  mtd: spi-nor: winbond: Fix locking support for w25q256jw
  mtd: spi-nor: winbond: Fix locking support for w25q64jvm

 drivers/mtd/spi-nor/winbond.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
