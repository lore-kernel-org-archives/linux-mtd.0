Return-Path: <SRS0=nfTR=6X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F457C54E49
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 23:42:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17D2A21775
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 23:42:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kpBOd/MK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a2OffO+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17D2A21775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0FxlY+vds14e0hF0DFbNeT1++ROvZAb2gEO6A9+ITF0=; b=kpBOd/MKmDMrsx
	EetnAsgZps2vZ5hDF/8OBd/GktML1QzFI69e2xT58nw4v0FK12MwcsIEYuhibR3yGz+HF5YikUL+Z
	LWwCiVHQ3AoPzrrI4G1II29NwWNRv+Doa1oDl80TqogjxhkFU0bpfegdDuW8BW1p3uqG0IiC8uiCl
	w7xnTHD9TMxqVEOf1kpWBNNAaSdmgYUL1sy6b7s850mbq6fWVbC1S+1cV9j/Q4WZ2KxpJdPiQr80l
	4Q53WiCTleRo7caicKm7ZyTl7+4mAJyh3cdi4aH+tX5Psle6vA8/+Vsqb+bVcNlmoBJxFTHqA8s5w
	QAxeHsWBAv1X0DE5Fknw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXZ6j-0002Bl-MA; Sat, 09 May 2020 23:42:13 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXZ5j-0001AW-Mc
 for linux-mtd@lists.infradead.org; Sat, 09 May 2020 23:41:13 +0000
Received: by mail-pf1-x42a.google.com with SMTP id f7so2885653pfa.9
 for <linux-mtd@lists.infradead.org>; Sat, 09 May 2020 16:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LN02kQGLgElFDT6YhRYkfrDyShhneRM4gygOe7piDXw=;
 b=a2OffO+4m00dWKoHHUMauc+9jzQitgt4pi5ica/PG9O+dw/0wGtT6L+v2xUTv9XT1e
 iNdEQJVHXZOZW0hpuyCL4cSKScaWt/EWbnysgj0OTX9SwhZiWxil5wqslLkSp25G6e3m
 JEcY8KRnfLgY67mjWFvFRdcLvho/YQqSPY/WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LN02kQGLgElFDT6YhRYkfrDyShhneRM4gygOe7piDXw=;
 b=k+7YTMpVqMSdkWz+6lFXmc7uLR3CgXT5GjXAJBASRuKzBMo+0ezUYrvBXGLBaBBayU
 0bfi3TLW1lqwoq8K/RbZFa9c/IcdfErlwGBxdZb8rVm18szwaL0Ndd/bHEFQToW4jbF7
 bvtfQbN1UJyRXwQphvZi8/wmThkvvNaeqbhsI+BDStNwWKQCM3DwJxmwcTK8KZPi454B
 MQKERvflZQEgxVWICAxz+ALlJ/1fzPSQhabZ7AGMACz5DMyE//TO/G3bDZEZAaa5uuwc
 oGldVkPfhsaqzIop2P8dq/QcItfZr3BgKz5Gnf+MnkiMiwpKQhkA+yN06Fg1s3pynijP
 /ngA==
X-Gm-Message-State: AGi0PuYqe4D5grnf9R8pgcqJjtSaILJxABaa9k4uMvhVvDrtDYTyiBVu
 D48mEl1ukRzJh28DGcrqlmUsGSaQFh4=
X-Google-Smtp-Source: APiQypIkzVjEFHa2Lrg3QC1KeNRQ6+ilOe2KWxjDWNTEq5yVdbPKmnUsIO6mBJKyCEQYBRh4Q1LiuA==
X-Received: by 2002:a63:9e53:: with SMTP id r19mr8385908pgo.5.1589067670765;
 Sat, 09 May 2020 16:41:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b16sm5448636pfp.89.2020.05.09.16.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 16:41:06 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v6 00/18] pstore: mtd: support crash log to block and mtd
 device
Date: Sat,  9 May 2020 16:40:45 -0700
Message-Id: <20200509234103.46544-1-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_164111_750783_408D64E4 
X-CRM114-Status: GOOD (  16.76  )
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

Hi,

Okay, I'm happy enough with this series to get it landed so we can start
doing incremental changes, etc. Here's the v6 I'll land in for-next/pstore
unless there's some objection.

Thank you again for all your patience! As you can see, I had a lot of
things I needed to fix up in the core pstore code, and I had a lot of
opinions about names. ;) I'm glad to have a block device backend for
this -- it makes testing the core much easier.

After spending so much time looking at pstore/zone, I've got some ideas
about how to merge it with pstore/ram's way of doing things. For example,
I'd like to get ECC support into pstore/zone, and once it's generalized
enough, I think other storage systems (EFI?) could use it to solve
some problems there (growing without bounds, not supporting the other
frontends, etc).

One last thought I had on naming would be to have mtdpstore be named
pstore_mtd.c, etc. That'd make it more like pstore/zone,blk,ram,
etc. (I'd really like to get pstore/ram renamed and keep the "ramoops"
name for backward compat.) What do you think about that?

Thanks!

-Kees


v6:
- more renamings, typo fixes, rewordings
- reset pstore_zone global counters/state on unregister
- add best_effort param to allow easy block device testing
- extract ftrace merging code from ram.c to avoid duplication
- use backend name for console name
- rearrange module parameters

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
 fs/pstore/blk.c                          |  571 +++++++++
 fs/pstore/ftrace.c                       |   54 +
 fs/pstore/internal.h                     |    9 +
 fs/pstore/platform.c                     |   40 +-
 fs/pstore/ram.c                          |   70 +-
 fs/pstore/zone.c                         | 1463 ++++++++++++++++++++++
 include/linux/kmsg_dump.h                |    7 +
 include/linux/pstore.h                   |    2 +-
 include/linux/pstore_blk.h               |   77 ++
 include/linux/pstore_zone.h              |   60 +
 kernel/printk/printk.c                   |   21 +
 18 files changed, 3220 insertions(+), 88 deletions(-)
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
