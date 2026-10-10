Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD51DCA9EC1
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2026 18:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZ/g0NLov5xivodN5WRRYxYdL37fLVtWPuYry1b7iMA=; b=sQAtYZaB9KkERp
	GDAXs4QKCegJsQQ63fmepD1wyV2IJ2P1ezEJNO8KN3fHtXppyB9dxBVT1Fm+x9Suu3Ryz5FfxfQ7j
	v/50y3hbj8bzXFKj2nNVuIUtrHkrdtxnIxtMxTVd+1Q/3l3SYIXB4xwUvsZJth76FzJQzay9gfh6s
	R1HHOZe/Ttz5gtBndP3GNR3dbXNvdwXIjRWdxAoMMxJCZxRAU0yi80NjCnYwdmQHvPwNkL1wuv7aT
	WPf7AwzsWfQ7A+0zZtwMzgwlvrVJje5w+weaC1IDxrgzycZBsTD9FebIvmL4hJpDl71nlN6t6jBRs
	MCq2h/9oHf/nZ7H5g7zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbV3-00000008MQE-1XU1;
	Sat, 10 Oct 2026 18:08:49 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbUz-00000008MPO-2qPj
	for linux-mtd@lists.infradead.org;
	Sat, 10 Oct 2026 18:08:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso387246f8f.3
        for <linux-mtd@lists.infradead.org>; Sat, 10 Oct 2026 11:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655723; x=1792260523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqJzHpBsOkwbCuifN5JxVshD70grUK+B6gcyk5nzdLY=;
        b=anSqp4fLOE0xWj/IioBTP5694Vv+KLHRwKvzzXuVz72B1gMdC3RfyZceiejf1NwNTp
         FMpbEvffDe65r9FrBZUHXoSu2P9Puok2pch6TsYvHqHksa/70mpcPfUgRzjFWEL195zP
         kbnjdE4EF1OCBznlbOhPi9HVeZnrUHRA3QceD0WJMo+MgyD91ZnYKOGh+dCVV8DSuUOr
         S1BiLjAK0oPBz8zJj7Wp5p2U7HH8a9nfQJYY6wfXtsmegR9nOqszacxrjkAO3ontrzPE
         4DxGgrQQ4tmltWZWNCqTybPgyHKvP1cir2zmB8gZ/tAaYH6ARA5Hi2ImEooRppZLkJGp
         JHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655723; x=1792260523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqJzHpBsOkwbCuifN5JxVshD70grUK+B6gcyk5nzdLY=;
        b=StBL2Xz7xTrmdP9+5Saa4aDRfOPGyTsm9HznYWa711OTKTROxR6weAwIvUHmH4HWuG
         GzhomZb0u/bDlT1S0bBIdI+E8LdA1AFr9+tcOM+ACXvmC1TF8xvtHbGZ20IeJzvaITY3
         n8Ls2o7xyenR3+Lnw0KqxV6msHgMc76j0NNP6EWEBUbt0fxKRbHkxRsZ649ooTBmV+WP
         VD8rAFjjNiJdCz3CElLVEz2OdwRu3q02TSNXryv+JIlVymwAnrZbCPevIKFnoLQuYrbd
         YBcRZLoDGJ16jVlDrjLeojGzO53PRhs42XuFOdPONkMsgmbiBN9waBDmiWcOke1T//ID
         27aw==
X-Gm-Message-State: AFq9FYIEnasFiASXwpK9FFmzQuq1TSWMgGoAg30DSdNcRlFqMIgGXjO7
	hKMJNV9Pm+fn4xh3cmq5BxyRL30DLNUcCeHVOFVlrHYTpxx6nT0rvcvL
X-Gm-Gg: AYBFou0FQ6My9JvrpEJ7v6fes7HgiUFR02vNQx/WHZCIJVCuhtAshz8GnNXXnPoxbCK
	XWK3mfs9EExkt7F75W53XbKc6mKYkhwPFX9smgJbkIsiVlnNvFmPQfdmwLm4sfuxB7G8jV/Xt+f
	D/okfBrjuQADUkI6rnGXObiCKk1ArP56KBwB6W/RPxuHbUR684JnGNRARlKzo9gxKDhuPPaU6Hx
	kU0aONKi6LH+2huUul7Cjg1CQaPg6IMu5haP/sElAgiT5V4bv+514GhVBpHnJ3CjuCL7hqq0SqR
	yhS2MPcL6H6YZ3R+prvpf29/fzmUhMAia1z7pld7PkD1tR/qGKeraP7aM7pCQ+RJlYvaVm8CWEe
	uVxaIIZbIszomqx1fDfYu0NkVS/8q1at6nwNZoBVI5f8z400jalBS2zvWqxEUyD9vzaDyQhLt1Q
	ZfpG4Zv9ACCNIyo10JZeQqo+MraMDo9xO2SGdzpgVBuQLLHsy4yHlaeesMr3Oh1NO5ftur5Vhh7
	IeR1Y87WKO5kqV88SelSBUqfXqMmoLA+t4z5rC4vByWFu9fsXHPABWWb4XjYEPn9vmLQAbF1Wvb
	nxbUbkiZUphc4oDe
X-Received: by 2002:a05:600c:548e:b0:4a0:1aa0:7cfa with SMTP id 5b1f17b1804b1-4a18e4aa724mr101228615e9.12.1791655723242;
        Sat, 10 Oct 2026 11:08:43 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db97ce3aasm10187163f8f.21.2026.10.10.11.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:08:41 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@openwrt.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 0/3] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Sat, 10 Oct 2026 18:08:37 +0000
Message-ID: <20261010180840.2152492-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010172142.2138956-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_110846_366027_F4E98CF4 
X-CRM114-Status: GOOD (  19.59  )
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

jffs2 scans a flash in place through mtd_point() when the chip driver
offers it, and copies every used eraseblock through mtd_read()
otherwise. cfi_cmdset_0002 never had point(), so every jffs2 mount on
an AMD-style NOR copies the whole used area. On an Octeon CN6635 board
with a 100 MB jffs2 partition on an 8-bit M29EW that takes 15-30 s at
every boot.

1/3 tightens the existing gate first. map_is_linear() only checks for
a physical address, so cfi_cmdset_0001 already points at maps whose
own accessors swap bytes (IXP4xx), switch pins (Gemini) or lock the
bus (lantiq). The new map_is_simple() also requires the simple
accessors.

2/3 adds point()/unpoint() to cfi_cmdset_0002 behind the same gate,
modeled on cfi_cmdset_0001, and lists it in the cramfs documentation.

3/3 lets the Octeon flash map use the simple accessors when no eMMC
host shares its boot bus. Without it, 2/3 changes nothing on Octeon.
It builds without 1/3 and 2/3 but only pays off once they are in, so
taking all three through mtd with an ack from Thomas seems simplest.

Tested on that board with 7.2.9: the mount drops to 0.6-0.8 s. The
md5s of the images on the jffs2 partition held across reboots and
across ten 8 MB write/delete rounds. The series applies to v7.3-rc4
and to mtd/next.

Separately, for the MTD maintainers to judge: the write-buffer count
truncation that cfc5ebc9540e ("mtd: cfi_cmdset_0002: cap the
write-buffer chunk at 256 bytes on an x8 device") fixed in
cfi_cmdset_0002 has two siblings. do_write_buffer() in cfi_cmdset_0001
writes CMD(words) and the one in cfi_cmdset_0020 writes
CMD(len / map_bankwidth(map) - 1). On an x8 device CMD() keeps only
the low 8 bits of the count in each device lane, so a write buffer
larger than 256 bytes per device would be programmed with a truncated
count. I have no x8 Intel or ST part to test on, so I have not touched
either; I do not know whether such a part exists.

Changes in v2, all from sashiko's review of v1:
- 2/3: a point no longer suspends an erase in progress. cramfs holds its
  point for the whole mount, so the erase - and the task waiting on it,
  and the reboot reset - would stay suspended until umount.
- 3/3: the bank width is checked before ioremap(), and the iounmap()
  calls v1 added are gone; flash_map is a single static instance, so
  on a second probe they could unmap what the first one registered.
- Not changed: sashiko also asked about writers sleeping
  uninterruptibly behind a long-held point. That is how
  cfi_cmdset_0001 has always behaved, and 2/3 describes the cramfs
  consequence: a cramfs mounted from /dev/mtdblockN on AMD flash
  today falls back to the block device, and after this series it
  takes the direct path, so writes to other partitions of the same
  chip wait until it is unmounted. If you would rather not change
  that, I can make point() in cfi_cmdset_0002 opt-in.

v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (3):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: use the simple map accessors without a shared
    eMMC

 Documentation/filesystems/cramfs.rst  |  11 +-
 arch/mips/cavium-octeon/flash_setup.c |  36 +++++-
 drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c   | 162 +++++++++++++++++++++++++-
 drivers/mtd/maps/map_funcs.c          |  12 ++
 include/linux/mtd/map.h               |   2 +
 6 files changed, 211 insertions(+), 14 deletions(-)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
