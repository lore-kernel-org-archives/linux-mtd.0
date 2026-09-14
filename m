Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC970C88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TMgk3fD1wqfnd+2pJ6Foiwz7PYRRgmvbT9NIqwAmbZU=; b=TvOaJKeMPrELU8
	ZTRtSQ6rPai25Pk+GwHG/yuMuKiyuM+VzmU+n3Q7DVAoO19V5oukN6ORAkZ1TUjZT2rJ8EWEktyCw
	vZyAqQFkXlgb2Kg6dGxY8D2dli+DDi3r8t5rFwCXhre2xI09tfveZvsO6Jx9fzvMNanM2E/K3U6lT
	x0OspE1ImjgEl/FYSawWDD1voF07bkqqdkmjdCYJ6TVTi1UxMcBqPNkRwsa1Q1h504MXrAUk8uEXS
	L9Qj+BVnbZnZusQwA6v02H44pgSoNMYVXVl8rHRyodbfL+QGjaUpOJ+b7E9hT2ghbSUStF80gPe3Q
	iXffw07cGH+KaQ2xQGiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61nm-00000002gOZ-1Xft;
	Mon, 14 Sep 2026 08:12:34 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61nj-00000002gNI-2qVV
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 08:12:33 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49c5a927a1fso603275e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373550; x=1789978350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=urdTA4HjJrGTCEZczwl4Arel3MJiGP/u9tgNaNw6UBk=;
        b=T8FSOJ+5eBdoRcmHNk6BDKGX1TuXIcFXsqpqMYOd1AxP3JSPjxJCLbGFf2pA6IOto9
         iZCoNzuL7/LYuje+KS82v8HMVV7Z6xSRYokQUPj4P7yFJDcLxEkbmOe37KJyBHpq2eUf
         3SNFnW4pYDjtDtsegsUFPnpHIV6Q9WNxTNhj8PVqXdlvriovjJQ7p6VDQMBCtM6WmTjL
         ZBrJ6GkkFh/Ak9/Y7F/NAOb51lwkfOr4lhpcDiYlyYeg1F15bDHo6sp0LjrXAhW0H5nJ
         nl2VKz8rLU5xKtlP74P0SFNV4nUU+b1lvy3W9nGnKkxSXpd9mO4Pj5BH3mapgvq87guG
         gQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373550; x=1789978350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urdTA4HjJrGTCEZczwl4Arel3MJiGP/u9tgNaNw6UBk=;
        b=LxnDAQw/TrMmdlv3Xs87X+aBjXyD3p6vHeUrdpvIK5lvImDc03ahTNiiPf7ToteAUq
         6PIp8ezg7ci+ictnnVvlXxFkc9+GHhveLsrSKE0E2a9o0dlf/+oclsa76qCKmH+BuBRh
         aihkSy5TvzvQGnkJ342DmtKUMaGONKA7i9pi++8t0dBPFQ0cHqd3feH/TM78x3HQCZuk
         qyPU6c3fX2ZM6q37DL4Q+YcAp4dmyB3Y/xkwcEVLvcZBJhsS8EDG/vEN8J4c3a9mJUrl
         iNZUho/vXGucExnUfdl1ul9AFGxVN+n8XZz/MejP2IYXCWE/waO7b2giuaGMsh3vyXIr
         gYog==
X-Forwarded-Encrypted: i=1; AKwUvBwje38dwf2s2dmXp32dGnuc6UrRenlHC/l9uzUvviAakURwL3vRw8attnOLPkK1ISgWbYT4Eqvvr28=@lists.infradead.org
X-Gm-Message-State: AFuF++mo1Yhojuk3PqNLcHpqcDn0KvdqcZixx6w0TSZqU7TmJkKp1EvO
	6GDuqLhjFKEU74Ij487a6C7GI1NlRUz0YvmOiC0wVqOPBb4TXdVlJ5/n
X-Gm-Gg: AYBFou1d/W0hKkHHG1blAnjRGFX9HCYPE7gJ8aXuQfaMaHOr7lfwet7d5zWkgDE3Ad2
	mYnrVXAld/ad1IZUvmIh1rSpdykNc2KowdzfifK77sDBZRwj60guCW7sVVx+Fe8rj40RX/0wcUu
	91HqXLChksUiiufCD+GurCOHrDI9vAzpPQGU+oNIMbP/NIgNh65FStGpgL2QFJ9I9+Pg04WnEFf
	/or2eCENs8O8qxQagZCMYuvIKGp26NwpO+FDGlS6DwMFFSGgB8Uk40caV4cbr4Md/5vKr2a7IxI
	AWTjHuQHRr8IRDo36QG8XdXdiC+cJMA9/0GdsAndykl1/9xTMigneVXumYaaO96KwbYxlzPwkWl
	F82apaK2L5x5LJAacc8cIuetQDrzDy5+pZyCReU3uIKV1da72G9/TgROXC+OTka2qWnY+fyFzhZ
	ZxBseA+LxJasIYkmc7s+OFA5HOKA6f1uNbPFUZPpBRlXwxfnIECBhLhyqwI0Gf7enWppBLsxG1H
	WhEjSGki5Ptr0upM18=
X-Received: by 2002:a05:600c:3b9f:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49e7a5f41a5mr18603755e9.0.1789373549421;
        Mon, 14 Sep 2026 01:12:29 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60acff8bsm301434385e9.9.2026.09.14.01.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:12:28 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	vigneshr@ti.com,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	takahiro.kuwano@infineon.com,
	Itai Handler <itai.handler@gmail.com>
Subject: [PATCH v2 0/3] mtd: spi-nor: fix the unlocked restore on shutdown and remove
Date: Mon, 14 Sep 2026 11:11:46 +0300
Message-Id: <20260914081149.1916589-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_011231_737625_5F32CAA6 
X-CRM114-Status: GOOD (  18.13  )
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

Two threads can talk to the flash at once during reboot/kexec and during
an unbind, because spi_nor_restore() is called without nor->lock while
MTD users are still attached. A busy flash silently ignores the restore
and is left in 4-byte addressing, which is exactly the failure the
restore was added to prevent; a restore landing inside a read corrupts
the rest of that read instead.

I reproduced this under QEMU, using a flash model extended to implement
erase busy time. With an erase outstanding, spi_nor_shutdown() issues
WREN, EX4B and WRDI; the chip refuses all three because it is busy, and
each one still reports success to the caller:

  the flash was mid-erase when spi_nor_shutdown() tried to put it back
  into 3-byte addressing, and refused 3 of its command(s):
  0x06 (four_byte=1), 0xe9 (four_byte=1), 0x04 (four_byte=1)

four_byte=1 is the mode the chip was left in, and so the mode the next
kernel inherits. With the patch, shutdown waits for the erase and the
restore reaches an idle chip. The reproduction is deterministic: the
workload keeps the flash busy continuously, so no timing window is
involved.

Two caveats on that. It runs on a 5.10 vendor tree rather than mainline,
though the path is unchanged - mainline's spi_nor_shutdown() has the
same unlocked spi_nor_restore() call. And what started the investigation
was intermittent hangs after kexec on a Zynq UltraScale+ board, which I
have not tied to this race.

Patch 1 is new in v2 and is a prerequisite rather than part of the fix.
spi_nor_rww_start_exclusive() returns with nor->lock held on both of its
exits, so taking the flash lock in ->shutdown and ->remove, which is
what patches 2 and 3 do, would deadlock an RWW flash on every reboot and
every unbind. Nothing reaches that code today, which is how it survived
since v6.15, so patch 1 also stands on its own.

Patch 2 fixes ->shutdown, which every reboot and kexec goes through, and
is marked for stable. Patch 3 fixes the identical problem in ->remove; I
have deliberately not marked it for stable, since nobody has reported
hitting it and it changes how long an unbind can block. Patch 1 carries
a stable tag too, so that a backport of patch 2 cannot land without it.

Note what patch 2 does not do: the restore still runs with MTD users
attached, so an operation starting after it completes still addresses a
3-byte chip with nor->addr_nbytes == 4. Serialising against operations
already in flight is what stops the restore being issued into a busy
chip; fully closing the window would mean stopping MTD from accepting
operations before ->shutdown, which seemed too big a change to fold in
here. I am happy to look at that separately if you would prefer it.

Patches 2 and 3 are independent of each other; patch 3 can be dropped
without affecting patch 2. Patch 1 has to stay.

Changes in v2:
- New patch 1/3 fixing the lock that spi_nor_rww_start_exclusive()
  leaves held on both exits. Without it the rest of the series
  deadlocks on an RWW flash, because it adds the first ->shutdown and
  ->remove callers of the exclusive lock. Found while answering the
  automated review of v1.
- Patches 2/3 and 3/3 are unchanged from v1 1/2 and 2/2.
- Link to v1:
  https://lore.kernel.org/r/20260910184452.895485-1-itai.handler@gmail.com

Itai Handler (3):
  mtd: spi-nor: fix the lock left held by spi_nor_rww_start_exclusive()
  mtd: spi-nor: take the flash lock in spi_nor_shutdown()
  mtd: spi-nor: take the flash lock in spi_nor_remove()

 drivers/mtd/spi-nor/core.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)


base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
