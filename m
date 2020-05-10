Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52F4C38A2A
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:26:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABD3206F5
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:26:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kZEdIITS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jxnIlVzj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ABD3206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aQ/Eb/TJXXFaWbstzfZN1o8U6Pb1ZlNTR2jn6DfXIFY=; b=kZEdIITSdOz1mG
	PhVAUX7RKJ1urphU2ONhTrd4odlxFb1lQgIRounComI1fZI/a5FPDrcVCUYpXG+xKyPS4mB1tEE2x
	xNzHxI6YJCk3YO9QhFqIztCKx/jOeysLbrfFLReirg1QhTs6MTAmDutyLrmBwB1EAd06JsXzLp+Hy
	4xLptMTcaPRHzaKzCMVIJoKq90N6SZhJ5c33/pObFkJWsqlgXEjGklc7Kh5tjYkdyMwVJHC5c/grU
	TRNO1ixVrjIbeAyhf5zIg9cvrcGsW/rEBFZOs52CVaATYPE3iSLrDny+skxZs2YAlLpJYDS/jDFBh
	Ne7ZgPRXlwkP9JkNkvNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXsWS-0005tU-9b; Sun, 10 May 2020 20:26:04 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXsVB-0002RQ-W8
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 20:24:47 +0000
Received: by mail-pl1-x643.google.com with SMTP id k19so3018981pll.9
 for <linux-mtd@lists.infradead.org>; Sun, 10 May 2020 13:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jMnvmwdf0lD4TWDxpQeCiDqgUg/BNY/6yd0J6c0RUaw=;
 b=jxnIlVzjg4LuX0x4ZxxB1JEkhMutYk9n+d2bj8maSEKQYCpP8QW0AvSZM2+MydWo17
 hFg6spS4Y8qyZldiFLK7H6lD7DqCwh+ptn93hbbWPLowJU5q3HpQS2XQ7NI8YXkdrfmC
 XKExDDq/gQbLg5YH+GX/v6KMd7og+GDHK5M8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jMnvmwdf0lD4TWDxpQeCiDqgUg/BNY/6yd0J6c0RUaw=;
 b=Ja6zfYpsNM0ZoLhPCU61G+dp7zYYlShrSNEKoYaqWOkGkiCy+fjlOZUyQK0FiGgtXL
 jUcsfNEUck3uf9+BxwjDXyo7+Qg2FA3LCShx/tTDd2GyPa8oCsoiz3RjAUuYm2Xo3srF
 RjA+F6k4h9m5r2KdXyAazrDw3S9BQ64dOj2o9rufNONFxonv/nqp14oexEs2CSKMSzCn
 BdfTqGxIljL4dpSdSLXQHAQhL0RtQJjoFxFl2tKVV+rqDlzLIgWYoJqHPD5g2HooQpQG
 YvQGaaMZEYnVbNrhWz0vLFdYVFQV8kWwf4s+WTQcxhrnWpT9mjnXADeFDUlqmB5NNjp+
 BBPg==
X-Gm-Message-State: AGi0PubWzfm1mu9tWDU1hmK6A00dYHkbdI8QYOIznlD2vM7U4TwuXdOu
 YxF5hywieToQ3wzyG7fg1zcjDw==
X-Google-Smtp-Source: APiQypLvN7WjM+iFu647e6o7NyvuJP0SZANsYUCqdd2Q7tf4QMuUe/X50yR6CDzAlEROB6zdXlLglg==
X-Received: by 2002:a17:902:9b8e:: with SMTP id
 y14mr12182467plp.109.1589142285531; 
 Sun, 10 May 2020 13:24:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id gm3sm7871240pjb.49.2020.05.10.13.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 13:24:41 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v7 00/18] pstore: mtd: support crash log to block and mtd
 device
Date: Sun, 10 May 2020 13:24:18 -0700
Message-Id: <20200510202436.63222-1-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_132446_027744_CBF16A26 
X-CRM114-Status: GOOD (  10.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Rob Herring <robh@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

Well, I guess I spoke too soon. :) Here is v7. Hopefully this is
it. WeiXiong, can you test this and make sure you're happy with the
results?

Take care!

-Kees

v7:
- more renamings in the exported APIs and structs
- fix mtd build
- replace psblk_blkdev_info with passing in a struct to fill
- consolidate bdev opening/checking
- rename psblk_device -> pstore_device_info
- kerndoc for pstore_blk_get_config
- fix hunks in wrong patch
- add missing "static"s for local functions (0day)

v6: https://lore.kernel.org/lkml/20200509234103.46544-1-keescook@chromium.org/
v5: https://lore.kernel.org/lkml/1589022854-19821-1-git-send-email-liaoweixiong@allwinnertech.com/
v4: https://lore.kernel.org/lkml/20200508064004.57898-1-keescook@chromium.org/
v3: https://lore.kernel.org/lkml/1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com/
v2: https://lore.kernel.org/lkml/1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com/
v1: https://lore.kernel.org/lkml/1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com/


Kees Cook (8):
  pstore/ram: Move dump_oops to end of module_param list
  pstore/platform: Switch pstore_info::name to const
  pstore/platform: Move module params after declarations
  pstore/platform: Use backend name for console registration
  pstore/ram: Refactor ftrace buffer merging
  pstore/ftrace: Provide ftrace log merging routine
  printk: Introduce kmsg_dump_reason_str()
  pstore/blk: Introduce "best_effort" mode

WeiXiong Liao (10):
  pstore/zone: Introduce common layer to manage storage zones
  pstore/blk: Introduce backend for block devices
  pstore/zone,blk: Add support for pmsg frontend
  pstore/zone,blk: Add console frontend support
  pstore/zone,blk: Add ftrace frontend support
  Documentation: Add details for pstore/blk
  pstore/zone: Provide way to skip "broken" zone for MTD devices
  pstore/blk: Provide way to query pstore configuration
  pstore/blk: Support non-block storage devices
  mtd: Support kmsg dumper based on pstore/blk

 Documentation/admin-guide/pstore-blk.rst |  243 ++++
 MAINTAINERS                              |    1 +
 drivers/mtd/Kconfig                      |   10 +
 drivers/mtd/Makefile                     |    1 +
 drivers/mtd/mtdpstore.c                  |  564 +++++++++
 fs/pstore/Kconfig                        |  109 ++
 fs/pstore/Makefile                       |    6 +
 fs/pstore/blk.c                          |  520 ++++++++
 fs/pstore/ftrace.c                       |   54 +
 fs/pstore/internal.h                     |    9 +
 fs/pstore/platform.c                     |   40 +-
 fs/pstore/ram.c                          |   70 +-
 fs/pstore/zone.c                         | 1463 ++++++++++++++++++++++
 include/linux/kmsg_dump.h                |    7 +
 include/linux/pstore.h                   |    2 +-
 include/linux/pstore_blk.h               |  118 ++
 include/linux/pstore_zone.h              |   60 +
 kernel/printk/printk.c                   |   21 +
 18 files changed, 3210 insertions(+), 88 deletions(-)
 create mode 100644 Documentation/admin-guide/pstore-blk.rst
 create mode 100644 drivers/mtd/mtdpstore.c
 create mode 100644 fs/pstore/blk.c
 create mode 100644 fs/pstore/zone.c
 create mode 100644 include/linux/pstore_blk.h
 create mode 100644 include/linux/pstore_zone.h

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
