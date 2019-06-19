Return-Path: <SRS0=hJJw=US=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390A6C31E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:50:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 069D8206E0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:50:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AfpHawiw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYWyaMv2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 069D8206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=EJq/pnfVMNQ4GyFbfr111PCr8AfFNyfrucEr2Zm1mhc=; b=Afp
	HawiwFXC11LTidSZqDO54yH9jIDr8/KNsHcSuw8o1Do3FRML2ql4A++IukyigQclErew3Fs/AlpfS
	GxR92yfDIWRosE/sRWbHyax/zcLjGhqaG/4Fe/c5IneZjppP/qtqBjkUbbG8a7VMYm/pVSeEKIxmO
	lQc5ZLBh0FDadcFrD/AmUU/hQ5yYmT66vc6i/TWg+w/z4u8Mx95XKd3almBONIp8KY9J/01IWxMNo
	yMdx7aJ4IB6xwxI6KcMpeRghtMqo/qBYLceFWUQK7a/YDe8AXEleDLlIGK63yVvUbCPa0DR2Vcyng
	JI3qh93bdUbI9IvBfHp69k1Ig0LtrZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hddn9-0000T0-Ff; Wed, 19 Jun 2019 16:50:35 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hddmt-0000Ea-8W
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2019 16:50:23 +0000
Received: by mail-pg1-x544.google.com with SMTP id 196so521865pgc.6
 for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2019 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=12N3eUD5hhrCPexddLzchewcrrmGfLZeSnomIA07mjo=;
 b=NYWyaMv2ZrA+qeOjulKp38sZofS7dj7lhkD252jDZIwkgBRuW9ZnZR68JDFyOreAf3
 DokR6sOUpG6nwDP9d0mAWUd7zUbkTQHCRSumb+c40GenOjo+uP2J+vAbt+ZpWPCZjdOH
 nF0TMs1sxLfx7arYRwKSscmAcGQ8IOE9Oau8zQcCHZYYkNS/vvV2N8vatRUCCKZVXYIe
 N/fVmA1VySddGEy7Arzm929SIXVs9u0rDnU6UaY4048Vc0xTvEZLyr39VLVYulBrdcBz
 ixTB4wMprncBEJfh8nhDMl5oHAWCyt6CmCc6jhvPMZ6sV7UQjtVfgrEbQO3ZpxKfx8y7
 aMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=12N3eUD5hhrCPexddLzchewcrrmGfLZeSnomIA07mjo=;
 b=hDtZfpi4+Hh1loO7km6TWtoVmsl0skbFesn4VQuTn+F6i96+IpLGntsn07freDBcaC
 7YW/eA23LrDOCHIqbRBaHFfcLfeSomn014gZXwe9pND5O/BZGTpeKUch7P8XUClb1Cde
 FNKIMVHX02RpAP9qMmsOVQqU58P/1H9AzEj+T71XaBfcjvVvCQqVS8IOCZUU8A66ZSSB
 S/DDfqNB8KVy8lB4GlkCHaSWQmdFUdUe0UkMQoBHibX4vpBG5mignVVWR3/bzHI8d2y0
 zUUp1ZjJo9tbrGYTsYoPZvA0+iooRZNqJfoTAgxuBnJXl15pcOUsvS4xmEzcq6n33tWw
 pQMw==
X-Gm-Message-State: APjAAAV9UGMcAH9ncF0ZLbCeFrQSthMetzv8xw37pzA+ZzOTw/WMnOl/
 1v1BqMcIh/YvBS5NgacaTIc=
X-Google-Smtp-Source: APXvYqw74sFpL7WHOFq61LZvXsp5TlNzXCFKM33J6XZSQ5QOco279jjwq8QRlHH8vPKckJ4xHoEycw==
X-Received: by 2002:a63:fc15:: with SMTP id j21mr8542636pgi.217.1560963017301; 
 Wed, 19 Jun 2019 09:50:17 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id j1sm21344894pfe.101.2019.06.19.09.50.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 09:50:16 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v7 0/9] mtd: cfi_cmdset_0002: Fix flash write issue for
 OpenWrt Project
Date: Thu, 20 Jun 2019 01:49:52 +0900
Message-Id: <20190619165001.28410-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_095020_331177_C7BA1183 
X-CRM114-Status: UNSURE (   9.43  )
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
Cc: Tokunori Ikegami <ikegami.t@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Fabio Bettoni <fbettoni@gmail.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The change is based on the fix for flash erase to use chip_good() done in
the past. And it is fixed as same way in the OpenWrt Project as below.
 <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3932>
Also includes some refactoring changes.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org

Tokunori Ikegami (9):
  mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()
  mtd: cfi_cmdset_0002: Remove goto statement from do_write_buffer()
  mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce function size
  mtd: cfi_cmdset_0002: Split do_write_oneword() op_done goto statement
  mtd: cfi_cmdset_0002: Remove op_done goto statement from
    do_write_oneword()
  mtd: cfi_cmdset_0002: Split write-to-buffer-reset sequence
  mtd: cfi_cmdset_0002: Split to wait write buffer to check if completed
  mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce exit paths
  mtd: cfi_cmdset_0002: Disable write buffer functions if
    FORCE_WORD_WRITE is 1

 drivers/mtd/chips/cfi_cmdset_0002.c | 290 ++++++++++++++++++++++--------------
 1 file changed, 182 insertions(+), 108 deletions(-)

-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
