Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AF4C47247
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 06:40:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDCD520870
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 06:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gUj5VlyA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AGitAEjA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDCD520870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a/Q83nqwoi2anorYQYXrxGo3Ynml2ZNZvBowWmQ2wPQ=; b=gUj5VlyAe+Y5Ah
	a3o5ziPx63cfh2VOQD8WafCUkHnxpvI4CuZhGviVlPWMRtLxLYi37ohkDVWxri2+eeQrwlMt8yart
	CdjHrFlozydyAFZGsQanKc9ebTsl2sKp0Ebjc2HLiB1+5lnLWAJ7kf/dpoiMzRzpsiDO66Rdsuc0o
	TG9ZURSS2zBTJy7Xbe9miR6cjhXamm/vBwwphaqzHnZsPqQdkO9AiYKfHFfdXbuXvD/cdmHmvx6dL
	STe6t+KRLRP0lFEXV0gXyd19fGQmkE5c3r/Zm07W6UCBHDqDcIoUSNx18HNqSoyqo6Gi+Rcqmzagd
	pXjpZtGVyvIUyf1gtG9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWwgD-0008DV-PG; Fri, 08 May 2020 06:40:17 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWwgA-0008Cd-GZ
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 06:40:16 +0000
Received: by mail-pg1-x544.google.com with SMTP id d22so432575pgk.3
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2020 23:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qiQcUnaOsTuYIdMr9pQhA9E0vZ/bgcYyUJ6NKwIoiA8=;
 b=AGitAEjAmIYuKXy+lG43wJaRD8vsDY21A7oS+DPw/WXhdya0M2b77Hp2SjGy4IDeA7
 0mXKCAbk5gyUBklW+6pHdkHCR05KcSgPpdfyhoVoNan7SFIeqEK/VVjckLgwFwrYPTDZ
 OpOCzvcEaiQZBjlPAHAPh8sFU5hMWxw/60ScM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qiQcUnaOsTuYIdMr9pQhA9E0vZ/bgcYyUJ6NKwIoiA8=;
 b=Cb0QP4wKOAlSlMcQ8TcgLik8T8/0LySbFFLIlY94T3vSEV6tS7M+nSPPjCk1uSHdU9
 9/3N3g/EBDXiwKtJE6yj1hUYhcWKTPxdG9CVYGZUUinqA5EpOZwH5QLlT2TwnoQWFCyi
 BJ5iqUV+G/1Fj9roNrVCeLYeQSqP1+wQ9Sy8lpQQiGwSyA65mb6AE6uMVgv1vZnw9t7Z
 zY3fvODa/F4gbMmSOgoutS5RoPyO9wNRd4whG58qyofZSAYZV8XpLZN78ELkgAVxYb+b
 7wWGwhXBXJcb0z4SQr03sBZ4Qe5cxV/Ik/6XuhaX11yyZPwConcmFbov8CY20yDq154w
 thsA==
X-Gm-Message-State: AGi0PuZzMctZ77RUi9BXoMPcM9BPUZgvUeGW0CMbrG/rIRRR4wsROGuB
 B8I5Rg3fw6PViWMSvfF2cVwWTw==
X-Google-Smtp-Source: APiQypLhC9jPG3VyD0chnEVvbTzcUfM6EnXrvWXuM3nZ1Jmch+lbDR8507FGYLZRkZnFAwwsLzJRtg==
X-Received: by 2002:a63:b649:: with SMTP id v9mr832219pgt.402.1588920013880;
 Thu, 07 May 2020 23:40:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 140sm757265pfw.96.2020.05.07.23.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:40:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v4 00/12] pstore: mtd: support crash log to block and mtd
 device
Date: Thu,  7 May 2020 23:39:52 -0700
Message-Id: <20200508064004.57898-1-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_234014_579344_607EF21A 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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
 Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org,
 Anton Vorontsov <anton@enomsg.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-mtd@lists.infradead.org, Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

This is a v4 of WeiXiong Liao's series. I spent time porting this on top
of the latest pstore (mainly to support max_reason), and I started making
various other changes, mostly just bikeshed stuff.

Changes since v3:
	fixing up various typos, alternate phrases, and language. For
	example:
	        recorder -> frontend
	        Pstore -> pstore

	filenames:
	        rename pstore_*.c -> *.c and adjust Makefile
		(I decided fs/pstore/pstore_zone.c repeated "pstore" one too many time. ;)
		pstore-block.rst -> pstore_blk.rst

	conversion of dump_oops -> max_reason

	refactor/rename get_reason_str() and move to kernel/printk/printk.c

	psz* -> pstore_zone* renamings:
	        psblk_usr_info() ->... pstore_blk_usr_info()
	        psz_zone -> pstore_zone
	        pszinfo -> pstore_zone_info

	register_pstore_zone():
	        registration reporting via pr_cont(), with max_reason
	        remove needless get/put_module()

	public API renamings: VERB_NOUN()
	        psz_*register() -> *register_pstore_zone()

v3: https://lore.kernel.org/lkml/1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com/
v2: https://lore.kernel.org/lkml/1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com/
v1: https://lore.kernel.org/lkml/1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com/

So far, I've identified the following stuff left to do:
        - settle on various function/struct renamings
        - review locking
        - implement ramoops-like probe feature for pstore/blk
	- spend time seeing how ramoops might use pstore/zone

But I wanted to get this update published just to show what I've done
so far in my bikeshed review. :)

Thanks!

-Kees


Kees Cook (1):
  printk: Introduce kmsg_dump_reason_str()

WeiXiong Liao (11):
  pstore/zone: Introduce common layer to manage storage zones
  pstore/blk: Introduce backend for block devices
  pstore/blk: Provide way to choose pstore frontend support
  pstore/blk: Add support for pmsg frontend
  pstore/blk: Add console frontend support
  pstore/blk: Add ftrace frontend support
  Documentation: Add details for pstore/blk
  pstore/zone: Provide way to skip "broken" zone for MTD devices
  pstore/blk: Provide way to query pstore configuration
  pstore/blk: Support non-block storage devices
  mtd: Support kmsg dumper based on pstore/blk

 Documentation/admin-guide/pstore-blk.rst |  243 ++++
 MAINTAINERS                              |    1 +
 drivers/mtd/Kconfig                      |   10 +
 drivers/mtd/Makefile                     |    1 +
 drivers/mtd/mtdpstore.c                  |  564 ++++++++
 fs/pstore/Kconfig                        |  109 ++
 fs/pstore/Makefile                       |    6 +
 fs/pstore/blk.c                          |  481 +++++++
 fs/pstore/platform.c                     |   22 +-
 fs/pstore/zone.c                         | 1498 ++++++++++++++++++++++
 include/linux/kmsg_dump.h                |    7 +
 include/linux/pstore_blk.h               |   77 ++
 include/linux/pstore_zone.h              |   60 +
 kernel/printk/printk.c                   |   21 +
 14 files changed, 3079 insertions(+), 21 deletions(-)
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
