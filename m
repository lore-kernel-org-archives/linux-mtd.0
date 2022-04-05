Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16448C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 13:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8KbR0sQ5RMC0S63I7iXDev4dSkB8WEnX8ksdUnPpXlo=; b=Sx18oarBwBFTOb
	g4xIuGCpkuf3h+l3jGmjwQu5GV8ITTGZw1ScxUmQUY9FUSgMDGSQPRx9KBxzRN9cq0cmtjNOeUDaV
	31iAftz0mgkcrupKYhHAY45InhNPTPQV5QHR1+5thqBe7aJaiA6he3NfMYBbdk9IWeBTs71bErCh+
	o66n7nppR7r9dRIDG/1HJsL0OZgMosPiJvV3Fh3ymjB1EwoNcsET42e1tv/IXtN5pYiEBzQnZq/GP
	qzMODcQUPL8vnQzkijJU042IkrFGnYPo2m/HYp0Iu1sjrVOhnu7EiRwIYpGTnofL6WkM/O+BrbFx1
	Bx6NkItgjAJQ/XtGW/JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbiqo-0012f9-9I; Tue, 05 Apr 2022 13:04:02 +0000
Received: from smtp1.axis.com ([195.60.68.17])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbiqk-0012dq-Rd
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2022 13:04:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1649163839;
 x=1680699839;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LB9Z91H4lxNWiHmnPf+yOrh5/8wfRKj1DRyzVPm5Z0s=;
 b=WUZj+nhNaQk+plWanfhUOe+OsLv68D/+hZsmIxc3F7IhlWxRaDIg81Jf
 mrV7Rnur5M93c1gfVtOZTNZaynpnE35xTtz1zCyWQXhS3rH1Xm7JpVBoQ
 HVHmPp81CxvwmrKQS33lkypf1dXHcVlwg5EQvCsE3+g6eHejF/KHcx0Q+
 BkiiMWRNIZWp4bbF/Ruwn/wKI6YmehfD/JZiaS+WPYPYQwEm4IT0UFRW/
 PJv5G4CbGoGi99GyNdIsPXxbemScV3FTTH/u3U6FZCoBJCqKTJKuMdTgN
 eay7AyS3hki5eMrm76CcDIIR71yaYJQsSQm4za/tYVRsfbcZxnINxwDtg A==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <joern@lazybastard.org>
CC: <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <krzk+dt@kernel.org>, <frowand.list@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/4] mtd: phram improvements
Date: Tue, 5 Apr 2022 15:03:46 +0200
Message-ID: <20220405130350.1640985-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_060359_380625_37782929 
X-CRM114-Status: GOOD (  12.04  )
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

v2:
- Add note on what "phram" means in binding.
- Use /schemas/mtd/mtd.yaml instead of relative pathUse /schemas/mtd/mtd.yaml
  instead of relative path in binding.

The phram driver in the MTD subsystem can be used to allow the kernel to use an
MTD or (via mtdblock) a block device in RAM (with the contents loaded by a
bootloader for example).  This series has some improvements to make it more
usable by adding device tree support and to significantly improve its
performance by using cached mappings when possible.

I use this feature to pass the rootfs to the kernel when booting from RAM.  The
boot is much faster and requires less memory than initrd (which is on top of
that being deprecated), and it allows the same disk images to be used when
booting from RAM, unlike initramfs.

Cc: linux-mtd@lists.infradead.org

Cc: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org
Cc: krzk+dt@kernel.org
Cc: frowand.list@gmail.com

Cc: linux-kernel@vger.kernel.org

Vincent Whitchurch (4):
  mtd: core: Check devicetree alias for index
  dt-bindings: reserved-memory: Add phram
  mtd: phram: Allow probing via reserved-memory
  mtd: phram: Allow cached mappings

 .../bindings/reserved-memory/phram.yaml       | 47 +++++++++++
 drivers/mtd/devices/phram.c                   | 78 +++++++++++++++++--
 drivers/mtd/mtdcore.c                         | 11 ++-
 drivers/of/platform.c                         |  1 +
 4 files changed, 129 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/phram.yaml

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
