Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD18606A337
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=34Tci5r+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zMjrhBgn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0jqYdL/Vw8lchsSrCPP0V2CcpJKzp1vq4GL5ncLQ5fc=; b=34Tci5r+Gjd6hc3vV4mtGzaRzH
	T9cv+mHRiD1MbN5QfsE9VKPupIMJSUE9WFQWzr8Wty58jkrxx6Ou33jgorkPYUIKKzfNaujSRv9SQ
	w3JaeujtE7osCtMdjlDRG4TkyFbXd1N6/1jtLGFUAHst4hzJ2OTaTMrhfGtvfYteJ3ybcsME9VdTk
	4gAnzE/gP/pYaX87InXcC9SaVjEY3FdePB/m2/4lds4lWGdi/OvDN9311/R5hyz0W/ME6fi8xPurt
	djS3KzRBGbCJ9FbQzrq9TVwWqG2MC+GDLsL5+u+nvcFxYz34jU9KhhgOWJCdGO781/eL1RCsj1F7N
	m6ORVztA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVJz-0000000CT4v-1qLR;
	Thu, 26 Nov 2026 08:59:15 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVJv-0000000CT3e-21PX
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 08:59:12 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e46e449e8so4380385f8f.3
        for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2026 00:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683549; x=1796288349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQc/CTIKgLFqNg7/EqVB3eWhheGznFwlbWTqinE5lFo=;
        b=zMjrhBgnu2PgHC2f7rp4U+RunqpzgU2VolJ87FNzliRcntfjhEawqwN0f5EhPV5Nvv
         SleB0SAi8I39My+GWRZjuytRA1DUMvaTEARa2mX69/LFV46Bg50BGo71ElqfwdjgiYb4
         oQ7gUqwSJGH2jgSn+gv6aRYQv9TvYWU65fT8UtNcLIdTvC8hUAW1fYUewazZp90zAs9J
         rniXJnCgaeQVPBm3XakhXMfHMK/5w4oUHCXnJQHIyPolhPBdIKNQ5E/R/7me4Al8kXlC
         EdThQr0i36D3Q63thPwHcy2B0ucY2NUrYl67XrqrKQ1/hheLyGWbIl/27Wm22/Alt/d2
         eDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683549; x=1796288349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQc/CTIKgLFqNg7/EqVB3eWhheGznFwlbWTqinE5lFo=;
        b=dareOjN/Q636z0nbUY10XGyqtifN/tfxvv2Fps4BCzu1NhGPN9sMN9SlpNhBE/6f4O
         mUSzNXSDq/zUQkwo+fcRPNSZEKL7epfNjLz6TXSupdKWyDDRSNdNeQzKtOXmKHB5zRaj
         QoVgo/oGmzYuJ1s76MbeNywKApXLr08kjhOc3t009LGrfAryjeRJ3Wl3Wzlwqc7WheMa
         aRBjlZqm5vb+mekfY8xYUvgxrTSzlaj5TdVrTVPtRnEo7Rz3ekYDILOUpowM8lp08U9v
         2CYNtsKEmSmWrApmmu+6OqXzr0HDo5A7C5nRDzRE2iuqKYwG7J6FFhJbNtqNq1nfHzPN
         xvIw==
X-Gm-Message-State: APuU4Z84oFj4Wk/pbWRm5YR4Zy1n3O9My6nAVxb6TdxWbgc729kEnWpR
	5sOK7fWGwrSRw/9o2EOqy35O5mv0D2O9Es8IK65gC/uwTaIeHkO5Dkyi
X-Gm-Gg: AZFdTZd5imF7pPqNsqDaip3FzLQLIoQ1hG6ehkFPwxgomr4TAnO8Ny5iRfRfAUgSJKS
	RetxyTNp3BdZan2BT8I9DcME9luWtDtY1T0Ji9L+5+88xCAII1q/pXmqfyDYR42rv/Ty5zYLPIa
	dXmYGMnV1lFXrJBKVYUgIBB/U27qKRMMJON5eQVFaCzpJFlD15nmCJF7pN99dILWxqryNImuk6c
	0jxeSja3CCfl8FxD+hlnzXncrSVQzaRVffz4SNqSjDHhHOcyGDtGqPWyDQuQjFMZODcXEhCaXuj
	dIOgR0mK7jyuxW8AS3XUItbANTZE591fLQSX9rXBxcjWp4I9xDiyROSBGXP/yk+w9gU3+hoE9NX
	etVFe7/2HJAEJWn4kn9JWq9+YSLtg/da35uiHCzdc90/KULeesqsOOg0BOm6I3tDgrFAWekAiNR
	tBa7lgoZfsvXJa74wVxYKsHX1XEfcmrJuYbPz+crJxZkleEwwh9a7jCKe+GbQdCpboMyh0FpV/M
	dYu0renZR54vW4wtxuqPS7uPVkDbmjfwfmN110dudzc4fAucPXM2qiYKbVVSpSCV1mCUMBiIy1V
	U3esREcNhQakMvCvP0fybFZCfZoVE2/MKTFwFq+mTO0SEqvncO728g==
X-Received: by 2002:a05:600c:154c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4bb8881c378mr415302325e9.8.1795683548507;
        Thu, 26 Nov 2026 00:59:08 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:07 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH v5 0/4] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Thu, 26 Nov 2026 08:59:02 +0000
Message-ID: <20261126085906.814373-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_005911_542935_AB2A2D2B 
X-CRM114-Status: GOOD (  14.05  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jffs2 scans a flash in place through mtd_point() when the chip driver
offers it, and copies every used eraseblock otherwise. cfi_cmdset_0002
has no point(), so an Octeon CN6635 board with a 100 MB jffs2
partition on an 8-bit M29EW spends 15-30 s mounting it at every boot.

1/4 lets point() through only for maps read through the simple
accessors; cfi_cmdset_0001, lpddr, map_ram and map_rom point today at
maps whose own accessors swap bytes, switch pins or lock the bus.
2/4 adds point() to cfi_cmdset_0002 behind that gate.
3/4 gives each Octeon flash device its own map.
4/4 lets that map use the simple accessors when no eMMC shares the
boot bus. 3/4 and 4/4 build alone, but 4/4 only pays off with 1/4 and
2/4, so taking all four through mtd with an ack from Thomas seems
simplest.

Tested on that board with 7.3.4: the mount drops to 0.55-0.6 s, and an
8 MB file written to the jffs2 partition keeps its md5 across a
reboot. v5 was booted on another Octeon board with 7.3.4; its code
changes since v4 touch only a failed point() and little-endian
kernels. v3 held its md5s across ten 8 MB write/delete rounds on
7.2.9. The series applies to v7.4-rc1.

One question: a cramfs on AMD flash falls back to the block device
today. After 2/4 it keeps its image pointed while mounted, as it does
on Intel flash, so jffs2 writes to the same chip wait until cramfs is
unmounted. Is that acceptable, or should point() in cfi_cmdset_0002
be opt-in?

Changes in v5:
- 2/4: no pointer is returned when nothing could be pointed (sashiko);
  the changelog now also states the slower first CRC check of jffs2
  data and that lock and OTP operations wait for an unpoint.
- 3/4: Fixes tag (sashiko).
- 4/4: little-endian kernels keep the semaphore accessors; their boot
  bus needs the address swizzle of the I/O accessors (sashiko).

Changes in v4:
- 1/4 also gates lpddr, map_ram and map_rom (compile-tested only).
- New 3/4: the per-device map sashiko asked for on v2 and v3.
- Rebased onto v7.4-rc1; Assisted-by dropped (an LLM helped write
  this series).

Earlier changes, in v4 numbering:
- v3: in 2/4, an XIP erase no longer lets a point through either.
- v2: in 2/4, a point no longer suspends an erase in progress; 4/4
  checks the bank width before ioremap().

v4: https://lore.kernel.org/all/20261117214141.3826637-1-orgads@gmail.com/
v3: https://lore.kernel.org/all/20261011062908.2365879-1-orgads@gmail.com/
v2: https://lore.kernel.org/all/20261010180840.2152492-1-orgads@gmail.com/
v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (4):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: allocate the map per device
  MIPS: Octeon: flash: use the simple map accessors without a shared
    eMMC

 Documentation/filesystems/cramfs.rst  |  11 +-
 arch/mips/cavium-octeon/flash_setup.c |  78 +++++++++---
 drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c   | 174 +++++++++++++++++++++++++-
 drivers/mtd/chips/map_ram.c           |   4 +-
 drivers/mtd/chips/map_rom.c           |   6 +-
 drivers/mtd/lpddr/lpddr_cmds.c        |   2 +-
 drivers/mtd/maps/map_funcs.c          |  12 ++
 include/linux/mtd/map.h               |   2 +
 9 files changed, 256 insertions(+), 35 deletions(-)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
