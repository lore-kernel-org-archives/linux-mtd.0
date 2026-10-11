Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72F1CA9EBD
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Oct 2026 06:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSN2Cpx8hYDrOYUBGL+D0fS1T5r+HExkYFXXmDDqIFU=; b=HTnIcSe98RPOrf
	cGr0wSlt70Fk0zgVZinbftziPwW7Bb8+BvvDXlmIDIaQfnraomyV6vEx408IoVKDMHWfQ6582tnns
	znleVzIj9E2cALcsJ94V1Gwdne4Pa/SsW8ZOFSXKQ28i35IdespFWHC+Q5EHggLOjcr0JUrZUxaSd
	bcHuIiO1vkA1mCfRPFBetq/hFIwM7ON8yPQ60vUQBBN+nBytC4Gf1vhqhvFqXQ+ur+TiBEPp1Zm1/
	9wNhR2nIdMPLwgYcaqdN9Ctup39MiM1ClKMRxCiwFsTA8Unj/Zvr4A0ekbpx1O0YOdqPjeDnzj0yS
	PFnCeKPZrZYJdqdCMwsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFn3a-00000008lQb-2sY9;
	Sun, 11 Oct 2026 06:29:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFn3X-00000008lPB-3ehR
	for linux-mtd@lists.infradead.org;
	Sun, 11 Oct 2026 06:29:13 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so5626785e9.2
        for <linux-mtd@lists.infradead.org>; Sat, 10 Oct 2026 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791700150; x=1792304950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBtQan1uSc108PxGt8KEILazDPgl7luxnl4pqbr4mVs=;
        b=YDAopcn05n7Sl07Lr31nO0IWhtCmVTaCuT81kDcAn7kZ0EvJ1RIAx/rPzGhVQxGT1X
         TS+hqxzyzX9LdeNCEtV+1BiWlkklWMAmMRnORglBVVIfEPSEuPtGJYNQiEZgc8q9hdyR
         PVtvqdNOkXoRuGiZL3DveY+4ijtqESvS1XGDUcltv9WBWOkXCCCtGlGFMXk4nzFOvS6U
         2Wf0lfSdhfBv9GQwRYwM2mVkOYfUi4Rmiauj1xzQdA8SyXMv1lmCfXZe+QuBA03WhqkN
         hCcF33e00u4U7PbLU5O4q9Ur1wuBfKYF44t8zhTjKZgawRTBraR6M62QQ2lwV52pjVEg
         SVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700150; x=1792304950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kBtQan1uSc108PxGt8KEILazDPgl7luxnl4pqbr4mVs=;
        b=vrJCwEu/1khhnhaUDDDLbmeOVGq+yVXVN/BqLKWGh3Htzn1L1fuWHgHUdKY9IuCbwn
         z3aFOQyg9MLW6pkozw43pidt32ZEwPVVnuaYpEBOzwyudpQsByEWryUSVutXT8kxEaJs
         XKZKG0LFpOuJrqLNGQD0nYfmrsJqTmRsi0eBlhHaUh/xPgxfN3NZ0cQKm9LOuTXfhSlh
         xcW/cctwxRSFTrMyO66hRzM9zAtwaFsJooPBOBhgzPtTNKWsXoEd83YjKYEaKPRq/S9U
         PWNzMDd2y5KnhYm5avbLjzKHIC1kxpXsrJvUamgb4KU8yZKgNOR4Py5id6guTxS05LYi
         yMRw==
X-Gm-Message-State: AFq9FYJAahUcq7kRq4HRXnWCVMm6IaBxFRZ0h/xwCC/8vFt8RZ6YPS1f
	LuEN8gxu/gy2203sFej4KshZGw4l7CKDuEZ1tVCKqT8iDa0EIVXUfKuD
X-Gm-Gg: AYBFou2YL9S3ukXFVcuI7ccDALzQhfMbErGJohaNZHzc7lOUFs68Fg6IZh4kMfks7Rx
	Gy2ONsPHhZp3bqAekcMqky3SjSueWaWx47tsJi03+aBoR8KCdYOysahvtth5TmuIp8qTVC6Gca2
	7noDgfYPp2Vp8T3auqtURMyjD2G0vIOgv9ofNjstb/3VhJeUWYCgh07DGL7O1lTOJTsAYLGYvEZ
	9FO9zYVoUuXR5NM+7M6flB3rBlSUYu6p+Xa+B64kKk4MvOUKmnPFEQ8BKURs1D8AktsjHWsabD2
	h89xSM1O3qeIxu+WNPsSKHLgs8VaoLjVz2F+WNaCthZIpRI5Ci3Q3tdSjezLb3xNJIjfe9dY28Z
	y+Pq1jA2nVzEtT+hwoiWi/W2731h6yN0hO6B+pDtSeiuYHw/RjcVbaKcCGCmibsUOFyD89sxAWE
	XdORIgiFGPipxLoNwfYJ1voAzraUSHQDYLQTp2MC8A6hH01RQIVotkCE40yx3qhQEqKaPbB0znf
	C1ibvxKBY2VH3tcB0SxuUQj99BlxqfVDR6yqKRPkJGyp9Q4kZX0LD1fuwWMbzgtXbQKwW8h3h1G
	WQcIu0Tw953niuzB
X-Received: by 2002:a05:600c:609b:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4a18e4c9944mr106707295e9.30.1791700149633;
        Sat, 10 Oct 2026 23:29:09 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm222579135e9.1.2026.10.10.23.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:29:09 -0700 (PDT)
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
Subject: [PATCH v3 0/3] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Sun, 11 Oct 2026 06:29:05 +0000
Message-ID: <20261011062908.2365879-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010172142.2138956-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_232911_938096_93C14568 
X-CRM114-Status: GOOD (  21.21  )
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

Changes in v3, from sashiko's review of v2:
- 2/3: an XIP erase (FL_XIP_WHILE_ERASING) no longer lets a point
  through either; v2 only covered FL_ERASING.
- 2/3: the changelog now states the cost of that rule: jffs2 points at
  a data node the first time it checks its CRC, so a read that meets a
  garbage-collection erase waits for that sector erase instead of
  suspending it. It also names what really blocks behind a cramfs
  point: jffs2's umount calls mtd_sync(); sync(2) does not reach the
  chip driver.
- Assisted-by in the form Documentation/process/coding-assistants.rst
  now asks for.
- Not changed: sashiko notes that 3/3 keeps the static flash_map,
  which a second probe overwrites, and leaks the mapping when
  do_map_probe() fails. Both are as in mainline today; v2 removed the
  iounmap() v1 added because, with the shared instance, it could unmap
  a registered device's window. Making the map per device would fix
  both, and I can send that separately if wanted.

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

v2: https://lore.kernel.org/all/20261010180840.2152492-1-orgads@gmail.com/
v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (3):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: use the simple map accessors without a shared
    eMMC

 Documentation/filesystems/cramfs.rst  |  11 +-
 arch/mips/cavium-octeon/flash_setup.c |  36 +++++-
 drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c   | 167 +++++++++++++++++++++++++-
 drivers/mtd/maps/map_funcs.c          |  12 ++
 include/linux/mtd/map.h               |   2 +
 6 files changed, 214 insertions(+), 16 deletions(-)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
