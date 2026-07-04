Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7031BC44502
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DLWPQmbnOELHB9/fnDC8c/auBxHWRaOmMbSZJSwLcBo=; b=BpeWDx3D1WzU+7
	RNohDN0tyk/WZBKkA2P07h7XoycZD/2HdvzvSIkqMpjYM9bzAEQ41jUChuwy8vxv5H+cM5f+8I+Gx
	dHdceO6+LuVJrvdYFzXoTFKiBGLEDf4LkiIHG13I3BGQ3jhR/K2vwV3o6cChpk21Y5badHe3tFOqJ
	9tpjvJvLoHsXeF47QNTZmdFqQyCKo32PowpM0iJuKrjShLP1jKE1e1ZnnJEC1rg5VfkbwvI86lfpG
	yRzhLua3el1sYevS70DA42cKOHTzmm0rJ/axdS182lNXEyZmnkHnOWRRp0yr5Jr+eVsoAO8Eb0w60
	a8lJdEeggWb18xDvKZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNh-00000008BXc-2PTw;
	Sat, 04 Jul 2026 05:57:37 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNe-00000008BWe-3Dys
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:35 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-37f816d01e3so1292903a91.2
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144653; x=1783749453; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5+rvElI5DJc+LADkj/yI5i5ZTCILlIx+N3s68Xcqphs=;
        b=Uz/P5d0rBT0RxGGLVzPAHzSrBzh4pWM7trTgr8va3a2oAe7AEmXilH8XrvON8QEWii
         872pQ31gutW5T4R3USsP23vjwiOnda+Wj1LQ9cU/7BmkQhEp+4akPd3Vl7N1SHEb8+7F
         6Z9T3qeqPlZlNMXbLJSrKxPAfmuMEfRJr3P7dhUly4eeyf6WxX1TMCTce9CVu1kW1D2Z
         EOVXsYL+JzTBvpLb7pA/AFRm0lUGyral0vV2/Vb++blJonBSe0E7CjxdCGas/lOyH2Tj
         /ZEXIhbdol4YwfEy1ifSVmKHWVXLbXVkeD/GRDlHII9rUpnqakjF1VR3nrGOUhNIKw0U
         Hcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144653; x=1783749453;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+rvElI5DJc+LADkj/yI5i5ZTCILlIx+N3s68Xcqphs=;
        b=FWQ8pHwma6vHc0pzpJn8pFHm+qlxv8LLniK2n+NcG6NuJkmieauyFNkj/gWgdOiBBM
         h0SIXQS3MacS4/IPCGabW+kfiA5WudVLiqRCqfvU0tbrR3d4g4p1UfSxTmOEXvtM7Gcc
         degsdtpdIzDzjwxrvym51VrQddgDantMJyLp8XDU8H0uTSJM+BkObJKJxsPw8bMZINRm
         5WObYleJiCOPEsG0nMg9r7Lu2HWo70vu7X5CBPchCvT+N8bmt7yoUh1E38ZjmGeAZ3gV
         4pPCPMMPiZvIQAlFQj7AkOCOxXUbPu5Ns0s2zpc66c06pGkTHpcF3RGGur7jjXBzlvGb
         BdIA==
X-Forwarded-Encrypted: i=1; AHgh+RorkbXoV9+bfWwz5+wCXUaP2CZJSGDfMGiAUfRTsWgmJQhLdGaDmjXeEZHn3FJMLXraVAzyDF/0Hc4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8TR3zuOauTkyezVpgMXDtO/sA0v9M+GaZ8XD8IT8r5ShfuqtP
	ot+I4QB6kbK0g0IlhPh+ArSBIV3QWKGf38Hk/crjfetpUQGPm0eLrBmTYOOG9w==
X-Gm-Gg: AfdE7cnpT/FYrx0SYz82a3zGRZ3Fk/jeV83Wd0YVpnI8aeZ7szIsM2r/L77P5niYESf
	q8Mj/420kUzPDmsqrToCB2PU3zURM9amRFR8D+iGrkg8TkMF/8sRzJ8SspdA346MIbFsTaSVsYG
	TZHIU3kupGgcLQaKH9ksKdt3zValM5qRc1+cXqUzJ/9DD2ZEAGhRAmFVbVHvVrwFwZnDi0xlV8V
	WDBDphYVqJEog0WsSSrQ0K0s/lpDFpXoLimIqn61hDlDplgl88dbId2CaLzYC2RM50ee8US69XT
	CmCtSJfM/m7s+K6Vht7DNrIqHfiagNl7NsOUunDN2AltDrGFzQI0BllHozO31xtFK1f3zK2zMYm
	qtmw8ymQ+Kyfxf2UlM4PPDVrPOKYwqxsD21mcfO+R3vy13Cs1pFRsRIdKtEy8jf5f7flGUT0ZW1
	J3/VKynV4wOC8F1tn/mbxlxUtLMyzST+RiPqeyVL0DC6HeLUKufMNkwTK4SLe1iPp4fguZvF+r/
	Uw=
X-Received: by 2002:a17:90b:17c4:b0:380:40b:f30a with SMTP id 98e67ed59e1d1-38280d99e12mr2630038a91.13.1783144652797;
        Fri, 03 Jul 2026 22:57:32 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:32 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 00/26] sh: maple: cleanup and modernize input drivers
Date: Fri, 03 Jul 2026 22:57:23 -0700
Message-Id: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMSgSGoC/yXMQQrCMBBG4auUWTuQhhKGXqW4SOKvTmljSKwIp
 Xc36vJbvLdTRVFUGrudCl5a9ZEa+lNH8e7TDayXZrLGOuOscBh49XkBxwU+bZlFBifWozcSqGW
 54Krv33I6/123MCM+vx86jg9nwHB4dAAAAA==
X-Change-ID: 20260628-b4-maple-cleanup-884682ae108b
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Florian Fuchs <fuchsfl@gmail.com>, 
 Adrian McMenamin <adrianmcmenamin@gmail.com>, linux-kernel@vger.kernel.org, 
 Dmitry Torokhov <dtor@mail.ru>, linux-input@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org
X-Mailer: b4 0.16-dev-6911d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_225734_846958_37285B6D 
X-CRM114-Status: GOOD (  10.48  )
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

This series aims to modernize the Maple bus core and its input drivers
(keyboard, mouse, joystick/controller), addressing build failures, race
conditions, and coding style issues:

- fixes a build failure in vmu-flash.c due to missing include
- fixes keyboard press detection logic (eliminating a 1-poll delay and
  redundant press events)
- corrects D-pad axis limits and optimizes event reporting using
  branchless calculations
- implements open() and close() in maple_keyb so all Maple input drivers
  only poll when actively open
- introduces callback_mutex in the Maple bus core to avoid potential UAF
  when stopping/unbinding the drivers
- removes the unused driver field from struct maple_device (write-only
  since 2008) and eliminates the redundant maple_unsupported_device dummy
  driver
- implements standard bus-level probe() and remove() methods for the
  Maple bus
- converts all three Maple input drivers to use managed resources, and
  fixes style issues reported by checkpatch.

This compiles but has not been tested on real hardware.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (26):
      sh: maple: include linux/device.h in linux/maple.h
      Input: maple_keyb - fix key press detection
      Input: maplecontrol - only enable present axes
      Input: maplemouse - stop polling and clear callback on close
      Input: maplecontrol - stop polling and clear callback on close
      Input: maplecontrol - simplify maple_device retrieval in open/close
      Input: maple_keyb - implement open and close methods
      Input: maplemouse - remove redundant drvdata resetting
      Input: maple_keyb - remove redundant drvdata resetting
      Input: maplecontrol - remove redundant drvdata resetting
      Input: maplemouse - remove unused mdev->driver assignment
      Input: maplecontrol - remove unused mdev->driver assignment
      Input: maple_keyb - remove unused mdev->driver assignment
      mtd: maps: vmu-flash: remove unused mdev->driver assignment
      sh: maple: remove not needed maple_unsupported_device driver
      sh: maple: remove unused driver field from struct maple_device
      sh: maple: implement bus-level probe/remove
      sh: maple: introduce callback_mutex in maple_device
      Input: maple_keyb - remove redundant mutex and remove method
      Input: maple_keyb - convert to devm
      Input: maplemouse - convert to devm
      Input: maplecontrol - convert to devm
      Input: maple_keyb - fix style issues
      Input: maplemouse - fix style issues
      Input: maplecontrol - fix style issues
      Input: maple_keyb - remove redundant 'new' buffer from struct dc_kbd

 drivers/input/joystick/maplecontrol.c |  98 +++++++++------------------
 drivers/input/keyboard/maple_keyb.c   | 124 +++++++++++++---------------------
 drivers/input/mouse/maplemouse.c      |  55 ++++-----------
 drivers/mtd/maps/vmu-flash.c          |  15 ++--
 drivers/sh/maple/maple.c              |  61 ++++++++++-------
 include/linux/maple.h                 |   8 ++-
 6 files changed, 140 insertions(+), 221 deletions(-)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260628-b4-maple-cleanup-884682ae108b

Thanks.

-- 
Dmitry


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
