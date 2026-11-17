Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A580606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 21:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BszQrL/3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G/W7wgJG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=V7T6bCTrZoTNPLrMLs7Z9LPzzu4a+YNClXbEfZepWU8=; b=BszQrL/3ijoXSRAExGorC+/E9N
	5LkRYma55dX/tl5pbKbJUUFRozvCwtJ87oX+uH4W+2w8WzwbR74GXyBO4Mocjd8WW71urqLJ7Jfdm
	Gli/9cY+VsHKR/8R5EFlDgS1MaTmG8z5XgqOo+ozjE1kWrLRv/QiLbV5LLgvduMqfRq+UDuZFgmW5
	K+UCfHnysc8XdEgJLpznhjOObpdaPtF9V+65ULRTp7wrIlH+MbChLU8EXcjbZQAKHxzB/uw2aKTj/
	zbKjvgwqjyAWQ0/Tu0ub3/csetbMIpH0bTCNAKF3iu8hUa4WTw1ZQKAxep4QNFtLXgz2e1xdsKKOD
	GnWjhBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQw1-000000079Fm-248c;
	Tue, 17 Nov 2026 21:41:49 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQvy-000000079Ek-2osd
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 21:41:48 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so195063f8f.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 13:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951704; x=1795556504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cM8zYdFhYY7QMWD01wtMfnMSvgeVrmpAogUxeL6zgEY=;
        b=G/W7wgJGRD3fBC95okwJALzlE8PZIJtL3qIuyYwNPU0hCz4fVyqbWKZ1ZKYZ68S5R5
         j4s2QtU6AMEPkk8yUTrPuPryc2WofHycQyMuleyh9tZLSeaMnX305SmnGq9VxyHd6Ri4
         9D/t1dvyh8kq8NS1IiYjaw52nWBIvjOcoh0wiqKng0rOpkH4/sd8eLa8bS6CFVu+lxff
         TD8qZ94KRD+Phj26GxjK/LaRja+SkekxU3v5dheatkxysHV9GZWNVbrN4r7BijgGtyG+
         exeHMgHNoTrWhcRM3fHWW4dOYMtvq/Ji4Nkip2xkbHXJIRF4uNygV7Y/rWkpR9mFKP48
         naUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951704; x=1795556504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cM8zYdFhYY7QMWD01wtMfnMSvgeVrmpAogUxeL6zgEY=;
        b=Ey9TYT3ODfDdlfG1zOKnRRockx90PQIluN4N13xOiermxy1+F++OiTNIj8NYBLnOqR
         /wJlL7QcL5TlxiceIZtiT4+FWeeIkIF6amNFYsQoz9M9aZE8g/B7f/1wobypB/01nQXz
         e7QohrzPHAEIAGfpiRvbq+csKitH0eL/Rw7S/btbUhYj7I0MFCzqDQjYNIMO3LZLZQS0
         U8B2u+jrygV7pnrvImPhUKE5YcH4xnsPzAzcbtJTwWgZPVlHAQGutK5FrAvY88UnWTKe
         P00VCwGXyqtLwrEBrXjlk5cEhTWV856Q8JVrKsHfC7O+Cl93KEh2RSAfEsqtdRnXTxXi
         uhUw==
X-Gm-Message-State: APuU4Z8X2x89Fr0n+OcAjKsBAD4QfaEfm47RMCYmrlG+a6VeHlESLxVw
	CHA6RoUFWTXoXUGKH9aA0Qkf9SETSkI/3hp/uPGRgPKIiCc8WMYwD9N4
X-Gm-Gg: AZFdTZeB4fDa7oNTyAR6ew/YCc7Z0sv9MiRzgdnTyUHjuZXxrlT7gsPPeIqzqwfZOa6
	7b96W/2PMJs2+ZbmTbViU31EfzsoxuFsl9eEemyjnbNvEdQBQ9Fb7sMLKTvJoKojd/kaMg7q8i8
	JmOW9LCFt2fDMQ6Q8iW5Pei0vmujzY28B550c6fM0eCXZ7TawQxjq/di/DQB5eltNmbiPsCagxq
	QXZ9cgVRMPVjf6dMuUXQ3VliGSA2ISIqzflL7ro+1KyCeidiJ3TYf58bAGWlLiWBsxsyYt56V+p
	4gggmOnoP8QDxlMeX+0319BlmVo1EEFk8DXvGSFriE23wpfFCgZdZHU5rPxiVAG/i+YCf8dSqDw
	0mwB/kppnqenqX4xkAaFrf+OjMfeOHJvhHRD9bLhMsupGbii/uiRAq0cv9JPiKACTWcLLxc1acJ
	TyeP/W2VdDaZFjTwaFUBgOZYYipJXlKv5xbv7v95jgBxFyNQEDPxXuHTj/K/oeg1/23KZ8W3BUF
	7bdbqp7AOwfgTVnVNjhDj24WXpqziyLO7S9T++eaLc7bO5dvbYmBf8Z0A4m6pTq863RewBE4oi+
	Lrrpe4V2gPSaXaOw4dkUN/S46w8h8nMcxWT5AM5pCtqFs5lr1sI64u6VbH/ao8xijZrWKWhOWOg
	HATLKUqj7TjWZSX/kvBmm80YI39CI8ptADwp19HY14xDyXFgp
X-Received: by 2002:a05:6000:2798:b0:48d:f99d:a0d3 with SMTP id ffacd0b85a97d-4a63b137aa8mr951124f8f.46.1794951703521;
        Tue, 17 Nov 2026 13:41:43 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm978391f8f.21.2026.11.17.13.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:41:42 -0800 (PST)
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
	linux-doc@vger.kernel.org
Subject: [PATCH v4 0/4] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Tue, 17 Nov 2026 21:41:37 +0000
Message-ID: <20261117214141.3826637-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_134146_763155_394B0539 
X-CRM114-Status: GOOD (  13.81  )
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

Tested on that board with 7.3.4: the mount drops to 0.55-0.6 s, and
an 8 MB file written to the jffs2 partition keeps its md5 across a
reboot. v3 held its md5s across ten 8 MB write/delete rounds on 7.2.9.
The series applies to v7.4-rc1.

One question: a cramfs on AMD flash falls back to the block device
today. After 2/4 it keeps its image pointed while mounted, as it does
on Intel flash, so jffs2 writes to the same chip wait until cramfs is
unmounted. Is that acceptable, or should point() in cfi_cmdset_0002
be opt-in?

Changes in v4:
- 1/4 also gates lpddr, map_ram and map_rom (compile-tested only).
- New 3/4: the per-device map sashiko asked for on v2 and v3.
- Rebased onto v7.4-rc1; Assisted-by dropped (an LLM helped write
  this series).

Earlier changes, in v4 numbering:
- v3: in 2/4, an XIP erase no longer lets a point through either.
- v2: in 2/4, a point no longer suspends an erase in progress; 4/4
  checks the bank width before ioremap().

v3: https://lore.kernel.org/all/20261011062908.2365879-1-orgads@gmail.com/
v2: https://lore.kernel.org/all/20261010180840.2152492-1-orgads@gmail.com/
v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (4):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: allocate the map per device
  MIPS: Octeon: flash: use the simple map accessors without a shared eMMC

  Documentation/filesystems/cramfs.rst  |  11 ++-
  arch/mips/cavium-octeon/flash_setup.c |  73 +++++++++++----
  drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
  drivers/mtd/chips/cfi_cmdset_0002.c   | 167 +++++++++++++++++++++++++++++++++-
  drivers/mtd/chips/map_ram.c           |   4 +-
  drivers/mtd/chips/map_rom.c           |   6 +-
  drivers/mtd/lpddr/lpddr_cmds.c        |   2 +-
  drivers/mtd/maps/map_funcs.c          |  12 +++
  include/linux/mtd/map.h               |   2 +
  9 files changed, 245 insertions(+), 34 deletions(-)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
