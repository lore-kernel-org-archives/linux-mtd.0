Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628ACC88E7B
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 12:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=l0vfpNVo12PowjOH8G9g9TWEbXfN2F1Y95TeQP0lfiI=; b=iVF
	K784w5RGoV26Vf9qf3BG6URjw3Xaar+Pi+okhFClH1ttxiDJXAWUn4KzWu6uB7/FUzC4facrNlsbb
	gZ5Mn4bJFs2dYC1JlN8faE6VSn5XR1wUhyYitFOq41C3iZ1fR1ba2DcW8QXGvhlToYB3Bx0GcU+9b
	65WOj1RnXtEH6Bu9JVdWy51IfbpuZGZvhQSbfpjvzgXv7GQMIdVdNPVblvxMjNjeqK15WiE8ZXXwE
	plHFwMZU9uPHhFGE4U5wspxAtEelarixiKDHHDsjT5yWlKSZpfRUUcuIe7JR32lXqU35rH0hKMr83
	te4zCJKgRBmXRd1sPuc0yppofF6EgLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Shg-00000006cx7-0r3x;
	Tue, 15 Sep 2026 12:56:04 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6She-00000006cwI-08nv
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 12:56:03 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6351832so1805980f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 15 Sep 2026 05:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789476959; cv=none;
        d=google.com; s=arc-20260327;
        b=YbdrQge77oWfDiQ6z6JUkcaGV2bsQkbXAo71FLUS5unAKMOZxbq6zTox7CFz0ZII8G
         K22gdSh0MrBDpcIO784h7MDE6Y4DhqphRBn83n6NWTwWLARecgBROllOoiVOKhpBi/k4
         AN+CX8PKN6Qu2U/LpqIr/MOwV8KkUL2V6F+0QKbhSYcFnkiYLSNta+UVWhjSVZZBbXqj
         g5t7lJT5qiWFhOtyrdCJwFgniom8DQX2nxlDyzfUC2EXVV1Q05DhAuIBd/w4FCjCAqGE
         DIZ2yjPgLZwAQU2pXx6El1H2/4f6/kHJwZmHyTePG1ejeAvZghMTuDth16ccWbKV5Tm9
         eUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=LG5h/iTLMj+UYuvATFs99oU1mCyX4FFNoe4oQ6uOrgk=;
        fh=htGQ2/vytPFfRsgof4HWjdx+mjwwjvsvvhLjya6nGHM=;
        b=J6se9v+J1oUH0BC2YJikEpm1sq1XvMpfxuYRrsflIxFJQbmunWlWcvNPiN1drPmpZA
         rt5mWY2ockaHCmg/dTYUgMo7NO3bR2bvNq9kAHYsla46sJ3tncpQjBJV8Poe3gDNM633
         wVkyG3e4pU5rzs9SPMtBrP2t9YRxyqqqIgzFKcJjPoCaS0JezpKwQglP4O0qxzTpuOS+
         YHjeYurXl/xTMeH7CvpkPVI80SZJzKkmGSSb2bAwVsH0J246AnB8SaOAbjaL8nCO8pgd
         Vj05FprIE9suKPQNAxK3qj3imTSR/XBa+uM+WaWvKJ2ILan4IEJMdQ7ih1wjEji7IfSv
         QYWA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476959; x=1790081759; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LG5h/iTLMj+UYuvATFs99oU1mCyX4FFNoe4oQ6uOrgk=;
        b=stlbF6BeOgsalJkIrePiemI4k8LzYPOKTZYQV2aaF+OPWSDK8O6+CEfA4BLSRlVVx+
         FSHIvlojPR8IZRuCWvqqboPu/s9iGzuSDzFDNdQ3ua7nlUr6WcKMpEqaoqNuaPOgM7/2
         sa+s3TOQHHXwti/BXzeCFwSTiAG2Xl8KgGZUFBWX/rpPkF27YfMIldHb3XpMEU2rBuut
         4iGFQLCAbbULRe8+XuUN/YzeYH/hcceHNxK0znplxkt5AVKya+KWMVYCX76bl6dQy/e5
         OKKd2Ydx1ncXL0mnNukCIXf1zGLdkoHqIYBAQQ8s93BcgHKFO1V7bmojrY6X7UTHGeR/
         mB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476959; x=1790081759;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LG5h/iTLMj+UYuvATFs99oU1mCyX4FFNoe4oQ6uOrgk=;
        b=JoW8as+c3/VkxwwwYgNjPHuZWqybIgwl5uaBEGOxC9iTQcs1CPM6ds9SBi+hjMBR0e
         1zvBDEVMG2oUxS44ypUNrnlcJPXSmEZi6bwVHLCPNSHHUPS4cYv9QIYe+8QxZ6MuU52d
         DcuPXLkQXWl/93bQGm92hxCAP4nwpSDDVP1zQLL5Y8YnAgWcYQGaSpkbVfU0QN05lVn5
         zYXLnQdlsnhg3kN1H5VzHgcflnOt60+AcsxMakOi2d1HoJ6djiqFSB7GnqS/TwyfbPVb
         ZfvfpL8LYyuxMfS89QOnYxs79QVmjFbKDOzcmdz0VljcJZ2sWse6e/T+2PsgRyglBUXY
         Lymg==
X-Gm-Message-State: AFuF++kcnxXFJQWBR1fXYKm+hY62KqB8ph6lBPX+ydGyt5UWIEO66yP5
	S1bvdmfwadK7KaHJbRh7rPKq7go+PHargs4njb7aywJnP4Dz7jMyry3xBk68DfVEO5aMol1zPHf
	2tHnMlc+kEYhABZTqa5KQT5LiAHZnwlXJNPqVTc3gthfd
X-Gm-Gg: AYBFou1cTweuMRMoUc4jAKqVZcEtYb3YZgKj8/Wli106jizb3Af8UNpj1Zd1R56QtGu
	geCI+q6Q2s0+4GYEBpgQuTix4tsVvupb/4kLGsaZW/3RMFubzrNWrc7jKJPEL7zmYzecLO3xbk2
	1mXKWpDPUiVuXnt6uyPhnNrfx513qyngVfB4fCnY3JrYoKrODCZ9GXo0jAM9xJ6agNKS+kWO9Ge
	or51eQ7pEAbszWhu0TR2LCNXu3Dg2A68W6+u8HEX0MO1in0aly3kIte6pYyLXWV2LZ+UTVABIAd
	6xaJZ/pL2w8pWcTO+j0kq4+xoiiTkMeIynDn3lpRS7wILPh5w061oQ==
X-Received: by 2002:a5d:5889:0:b0:486:e9ab:2b86 with SMTP id
 ffacd0b85a97d-48702b139e7mr8348395f8f.39.1789476959401; Tue, 15 Sep 2026
 05:55:59 -0700 (PDT)
Received: from 830778650420 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 05:55:58 -0700
Received: from 830778650420 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 05:55:58 -0700
From: Ruslan Vagner <rusya92266@gmail.com>
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 05:55:58 -0700
X-Gm-Features: AcwNN1WgWj-T3A0q9LI-vz14w95KMwSOzeQo-fLgK5DiDqH4l7XpdgcMlWDaB54
Message-ID: <CAF9RqJ45HPa1HpJdZp3=G6QAxyNSFo4D1cpkPQhN5YmHbSdmSQ@mail.gmail.com>
Subject: [PATCH] mtd: fix comment typos in UBI and NAND headers
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, 
	Ruslan Vagner <rusya92266@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_055602_098963_9DB91116 
X-CRM114-Status: GOOD (  12.26  )
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

Fix the spelling in comments. No functional change.

Signed-off-by: Ruslan Vagner <rusya92266@gmail.com>
---
 drivers/mtd/ubi/wl.c         | 2 +-
 include/linux/mtd/rawnand.h  | 2 +-
 include/linux/mtd/sh_flctl.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 5a0db928a90e..44237de52250 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1486,7 +1486,7 @@ static bool scrub_possible(struct ubi_device
*ubi, struct ubi_wl_entry *e)
  * @pnum: the physical eraseblock to schedule
  * @force: don't read the block, assume bitflips happened and take action.
  *
- * This function reads the given eraseblock and checks if bitflips occured.
+ * This function reads the given eraseblock and checks if bitflips occurred.
  * In case of bitflips, the eraseblock is scheduled for scrubbing.
  * If scrubbing is forced with @force, the eraseblock is not read,
  * but scheduled for scrubbing right away.
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5c70e7bd3ed5..43fefff02025 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1592,7 +1592,7 @@ void nand_wait_ready(struct nand_chip *chip);

 /*
  * Free resources held by the NAND device, must be called on error after a
- * sucessful nand_scan().
+ * successful nand_scan().
  */
 void nand_cleanup(struct nand_chip *chip);

diff --git a/include/linux/mtd/sh_flctl.h b/include/linux/mtd/sh_flctl.h
index 78fc2d4218c8..f3ce3253e8ec 100644
--- a/include/linux/mtd/sh_flctl.h
+++ b/include/linux/mtd/sh_flctl.h
@@ -61,7 +61,7 @@
  * to control the clock divider used between the High-Speed Peripheral Clock
  * and the FLCTL internal clock. If so, use CLK_8_BIT_xxx for connecting 8 bit
  * and CLK_16_BIT_xxx for connecting 16 bit bus bandwith NAND chips. For the 16
- * bit version the divider is seperate for the pulse width of high and low
+ * bit version the divider is separate for the pulse width of high and low
  * signals.
  */
 #define PULSE3	(0x1 << 27)
-- 
2.54.0.windows.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
