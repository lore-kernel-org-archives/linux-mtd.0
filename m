Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CEAC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:18:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0D1C6113D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0D1C6113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GYUXvTUP5+biVOD9sEqfoN8LS87k8N6maYg8N153D0A=; b=azhbq0oWpOzc5s
	RozcnAdZ+w3zIKNsgE5R1d0nkvVvLLZ7qZ6NZn5Eccj6QX/if9jBKLVklO3VEEJ4oOZpZG2wsr2Js
	m/hJSiEr+C3oBYq08K7CSwhX4vYhoaYalOt6UYXHnDX0MwGFruJouO1IoObR4egVm4hBAm/hHAVlT
	q5oGpAlvppQ5W7htFxZrGq6MoJk90eV5C9QClO2N4/yI2fe1E1INDbVry/ELnaLs6827wfFfmu70A
	Tx6mq1pJnPI+m17exIZL5wKtmH++aFlubgGG293AEoqCn2BworqR9a6tx4q2wTX/tETX1VszNP9as
	d37NgYJUNVWaSKwUL+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMKW-000xMj-EO; Tue, 09 Nov 2021 08:18:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMKR-000xMA-1D
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 08:18:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 71so15046843wma.4
 for <linux-mtd@lists.infradead.org>; Tue, 09 Nov 2021 00:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SCKJxPuUJuqu+blKRS4l/iLwZLQNlJgruyzB+c9vwqg=;
 b=OIKw2OvWeUCALFVysz/X6AsKSFn92rnFYMH0op+07s01k00tgvY2FOvftz5lyaqGhI
 Foi1BkXwMwichPgVIw1vn1efpb1RpLd2ZMpLF0dAMydInbIwSwGwXZxkP/9DcGOUDbDi
 FtkBCLKmihyv/kK6IoWFfwxzitzvl4xkUiFE/2sQLhSOFvWkpqiq9bndFyLCfxyElg+Z
 e9MVSZUvPO3hdE079x5C01TacLcHvqb0sgtTWsPMTv++qmT5yWQYdjggS8E1ge817LYY
 PZ/C3lRYTcpQ+0urdPMIn+O2PvDccY4wDLHf5AicYXkyBKgWXM71kPvgf1G98i9xWuhN
 SuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SCKJxPuUJuqu+blKRS4l/iLwZLQNlJgruyzB+c9vwqg=;
 b=yMbENV6GcUa/fp4zbh4gaDJagk6WGGwcyU6RIy2pANsLfcOKHLS5pv3v59OmlqCmuI
 QlXHlsnZ5vr+p9nANK8fMNdLOyun2VRF65HNYZm0wMk9DoGjF7q1kS8cd4FGTuJiz4PT
 5pwWj71T6D1EyMcxAQWwhxwMO9dNVZPWz/uZ0Yv/C7yMkL6mgC8K1+fPUqzIiH/Z3VP9
 n6jMyK8B7p7T0OMcki/Q4svksyNyq6HDvNh+O4P5zm1U+cCdIPHeGZAibGzUl3Zv75Tf
 jE9fLdMkF19pI+/QhBUnBNJ89901qbXVY4fKb3TUvDC9bNnoff+p8nLJzpDWcZ0mPxfo
 FCcQ==
X-Gm-Message-State: AOAM533bF+BMfZ6XKfnZOxUIXw3bPT4ZRZQsCpvD/5miI9YLCD4QQOQ0
 KFlRbjN7Pc3asYPjZwRBnL8TK2bPNCX/Y1we
X-Google-Smtp-Source: ABdhPJyo05ZVTm6IGMfWYLytSNF7hOcitdOZKBMwdUwBxtww9VDRBP/wYX/RhxSFaBhRWiH8UKNQrg==
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr5059191wmr.118.1636445880471; 
 Tue, 09 Nov 2021 00:18:00 -0800 (PST)
Received: from thor.lan ([213.205.241.131])
 by smtp.gmail.com with ESMTPSA id n184sm1714028wme.2.2021.11.09.00.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 00:17:59 -0800 (PST)
From: Frederic Germain <frederic.germain@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Frederic Germain <frederic.germain@gmail.com>
Subject: [PATCH 0/4] mtd-utils: adding support for lzma in jffs2reader via
 liblzma
Date: Tue,  9 Nov 2021 08:17:47 +0000
Message-Id: <20211109081751.480718-1-frederic.germain@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_001803_100425_12CAC892 
X-CRM114-Status: GOOD (  24.97  )
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

Hi,

This is my first time sending patch, I probably do some things wrong somewhere.

A while ago I, unfortunately, removed a file from my gl-inet 4g openwrt router.
That file is on a jffs2 partition, with LZMA compression.

LZMA support on OpenWRT is activated via a patch which seems never made it to the mainline : jffs2_make_lzma_available.patch.  There might be a problem with the jffs2 integration of LZMA, if it was not integrated into the kernel? The filesystem support should probably be first integrated in the main kernel before these patch in the user tools...

I think openwrt/LEDE is a big use case for jffs2, with maybe a lot of them with LZMA supports (I'm cannot say how much though...)
So it would be cool to have this integrated so people can recover the files they lost.

There are two opensource LZMA libraries that I found on Ubuntu 20.04...
- The source SDK from https://www.7-zip.org/sdk.html . On ubuntu, it's in the p7zip source package, which provides p7zip & p7zip-full package. p7zip-full provides a library, /usr/lib/p7zip/7z.so, but it's not integrated the Linux/GNU way...
- liblzma: from https://tukaani.org/xz/, which integrates an older version of the LZMA SDK provided by www.7-zip.org, but on a standard Linux/GNU library.

It seems LEDE already has patches for mtd-utils, but it seems they integrate source files from www.7-zip.org in a static way.
https://patchwork.ozlabs.org/project/lede/patch/20180330145639.15824-1-hauke@hauke-m.de/

I have to fiddle around to integrate with liblzma, as the low-level decoder is not exposed, but I got help from the XZ project author  https://sourceforge.net/p/lzmautils/discussion/708858/thread/d02ebb9386/

I pushed the patches on https://github.com/fredericgermain/mtd-utils too, main branch. It might just help some people to recover their file anyway.

---
There is also a problem that jffs2reader selects the earliest version of an inode instead of the latest? I've made a patch to take the latest one with data. But I still needed to patch the mtd dump to remove the DIRENT entry that remove the file from the FS. 

Maybe it would be nice that jffs2reader takes inode/version of the file to dump instead of a path? It's easy to get these parameters with jffs2dump.

Best regards,

Frederic Germain (4):
  .gitignore: add new ubiscan utility
  Fix warning about unaligned pointer in jffs2reader
  jffsX-utils: add lzma support on jffs2reader
  find_raw_inode returns latest version with data of inode

 .gitignore                |  1 +
 Makefile.am               |  4 +++
 configure.ac              | 24 +++++++++++++++
 include/linux/jffs2.h     |  2 ++
 include/mtd/jffs2-user.h  |  1 +
 jffsX-utils/Makemodule.am |  2 +-
 jffsX-utils/jffs2reader.c | 63 ++++++++++++++++++++++++++++++++++-----
 7 files changed, 88 insertions(+), 9 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
