Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93F7C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4DkCyNRGpGAMCFqcVtQ8YVp3hekGUjN2Tga3dDL26Yw=; b=2TQMbMMIsUnXb5
	cywC/nZnK3PqMHO7gS8NtUbA1P3LR9aES5p1dGi6r+HeN3oy1C2h8cUpNpUfbNM+DhdTW/HqWmRJs
	5iQjurt80tMOgBwiz9kyNWyNiR+jsziPAD9mfpLYO/RmZvtzs0bWQD1tX3e++zn+vdUFvdhGFGFSa
	XJx/6LHv16QbW+PKdvAi7jgyV/9jQs3EcXPSbczQth27oI3xJMg+jACejfYXzoXOp13vvuWZRvwjH
	llFYU0ruDvptpcs3UHZcsGy1bLWDeib0mjR1lNFuX8/KMSQIQDskp3DPNUOhcLdoL9KUWgA5j2iWv
	wfNCX2zrOyPk1qvgi8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neGxI-00Ei06-8o; Tue, 12 Apr 2022 13:53:16 +0000
Received: from smtp1.axis.com ([195.60.68.17])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neGxE-00Ehx8-Sj
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 13:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1649771593;
 x=1681307593;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AUdNxymSjy37DI3EYemBqzmoIe81Gg2MVcQxXKOtE1k=;
 b=K9EmuStfrNiXT/Nq5GgR5w9HRFkbP3EYmDI7Z+lp5mJNIzeYSIeHp4ij
 oVTOIu960Y5kCJVtHny7ujrVPbKv/o2Cz0urniDJ4fC7BIdaPQ346w63M
 Dh5R2ndbhJGP1BU/a4bdbaT/6rk+zT9GlqTNhk21vND946DpN/HiiqPbG
 1zKM8tHj58Xc+KOGiCpuFJnAkM9Ve1pWISr93f8FTOEYCgxQYHJmacT6L
 A3p8wiSjCcjGglUjs2Pkg/sBSz3t1orTZ9wBbfygyLoXA7tYGWgqyqmUY
 R2MdctHZE5jiJRUwrIcNOjy8jaH5ojnmVDbhzAIzMnVKKdConhgULvdsU g==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <joern@lazybastard.org>
CC: <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <krzk+dt@kernel.org>, <frowand.list@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/4] mtd: phram improvements
Date: Tue, 12 Apr 2022 15:52:58 +0200
Message-ID: <20220412135302.1682890-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_065313_286091_39B3A321 
X-CRM114-Status: GOOD (  14.59  )
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

v3:
- Fix build error on some configs.
- Reword binding.
- Added note about alternatives in cover letter (see below)

v2:
- Add note on what "phram" means in binding.
- Use /schemas/mtd/mtd.yaml instead of relative pathUse /schemas/mtd/mtd.yaml
  instead of relative path in binding.

The phram driver in the MTD subsystem can be used to allow the kernel to use an
MTD or (via mtdblock) a block device in RAM (with the contents loaded by a
bootloader for example).  This series has some improvements to make it more
usable by adding device tree support and to significantly improve its
performance by using cached mappings when possible.

I use this feature to pass the squashfs rootfs to the kernel when booting from
RAM.  The boot is much faster and requires less memory than initrd (which is on
top of that being deprecated), and it allows the same disk images to be used
when booting from RAM, unlike initramfs.

If there is no interest in extending the phram driver to support this, an
option is to use a new custom block driver.  I have patches for that too.  That
will not support MTDs of course, but it works for block devices and it is
faster and smaller than mtdblock + MTD + phram.

Cc: linux-mtd@lists.infradead.org

Cc: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org
Cc: krzk+dt@kernel.org
Cc: frowand.list@gmail.com

Cc: linux-kernel@vger.kernel.org

Vincent Whitchurch (4):
  mtd: core: Check devicetree alias for index
  dt-bindings: reserved-memory: Support MTD/block device
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
