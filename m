Return-Path: <SRS0=EZ/G=T2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840BAC282E3
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:39:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56FB520815
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:39:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b99dHQgs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fs3sIqY3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56FB520815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=SUAKQZ/CQQzJq8z3wdh8ZfOFw0AyVLx96BtQa14W6u0=; b=b99
	dHQgsrfDgGg9QsEc5TQrpHLCew/Py+45hA+skzD9V2e4RXHJxlEMhtHqRt1OjeCIz75pDAB9L7DQE
	SL2lSokdLIpGmq0Y01+ercYo9UbO5M3DzLCQ3ri5voi0jHiKG/HQliBmtRma7d2RmTIwzf0Ht9Irk
	W8yNDE81gZ8F3nfxMjPfFVRSiioVAOFQsKrF/9R1vHIPV+LhNTsSJ+hjs8DvOC7MqN/+QVon/r4W5
	TP1nZ/9SV9418EHPFNj7hUfzXGMhd4S9YqhIRBx5VNWVQQozUx1ZNovazWnszhTNGJflLjiaxqHqP
	Kzdgow3KkqjUh9k6GaS3hxOrJretv2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUvF8-0007cX-Ba; Sun, 26 May 2019 15:39:26 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUvF3-0007bt-Bw
 for linux-mtd@lists.infradead.org; Sun, 26 May 2019 15:39:23 +0000
Received: by mail-pl1-x641.google.com with SMTP id w7so6045257plz.1
 for <linux-mtd@lists.infradead.org>; Sun, 26 May 2019 08:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=IB/ftJN+h+GjzuaEvTsWsATwZ5V3lyEhvtvujIWFsY8=;
 b=fs3sIqY3B5OEx/BWPyCFpfAIuWTjXj8X2W8rMrcseCfCGPg/714Ssi0zYiLU+0qoz5
 yQYfme7u/2xKR8zDEp+kyHRtYK7ETAyw0CsVi+YpuR0132l/kGNJmAkrdrNDg/hU4uXL
 cDWVz1RFWgC9u7u84EYPxoveKloXdQ4oXWEO/YeNOhqKC+Q6tR8C3FmdsbtrKMciZ0in
 K9DThI6J1cr1lFyll6nOI6KSsGGpIZWFxJIUy2jVBVv7f3TsMrLbjRxEhVz+REGouAEQ
 +98fWH+tZBw5jg1dojauMpEoEwNEojJWCz2mg71NHUfI7iCfjGmy3bUhFP2w5e2Ymplx
 qPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IB/ftJN+h+GjzuaEvTsWsATwZ5V3lyEhvtvujIWFsY8=;
 b=k9bcPsVZ+leEVPRdna0RO2go6chw+D1T5FCAeOfV62HOGbyNXX4NO1ex3m8C+BwFOd
 XfQ58hUNm8IiyzQ7HajGlrBpM7dvXQR+V+t7MTe2hkLlqpcohlVlwrMIiIy8ajoGkXRa
 xJIkCDZmCTb2G9OuThR1iuxPi/WRvDYHIBUttKE3ZVqRvcunx+yGV/LeeHDNnthlPZVs
 6VUAxGYhvMLdlgk0mgHgdxZaBjTBkhndUGXwIMqMXmg+3awg4axOY9B4caHc9ZIWBPIO
 xxUkEt3MwUWUG8NJW1uYE0zaP9JMETyWGybQxVK9BqFTv3htSSWWz5XmOmiCDB96zyer
 wACg==
X-Gm-Message-State: APjAAAWdkCWpFUem5bLFQOcmKoZ5mEKyIK9Aznt0b1N/uQgCSL9yZ+h9
 typLbDnuE0IIhQWlj4xGL5k=
X-Google-Smtp-Source: APXvYqwgC7YcXypBqFHCe/HdIu7o55Vul0TLkax+r/vC3Zi5BgTtNf3wWeb0hRXknktSQWTlVC/9Cg==
X-Received: by 2002:a17:902:22:: with SMTP id
 31mr121094882pla.15.1558885160085; 
 Sun, 26 May 2019 08:39:20 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id o2sm863129pgm.51.2019.05.26.08.39.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 08:39:19 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v6 00/11] mtd: cfi_cmdset_0002: Fix flash write issue for
 OpenWrt Project
Date: Mon, 27 May 2019 00:38:53 +0900
Message-Id: <20190526153904.28871-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190526_083921_436164_02C13AAC 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

The change is based on the fix for flash erase to use chip_good() done in the past.
And it is fixed as same way in the OpenWrt Project as below.
  <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3932c7b7b7df7d5fbd48f207e77619eaa7>
Also includes some refactoring changes.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org

Tokunori Ikegami (11):
  mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()
  mtd: cfi_cmdset_0002: Remove goto statement from do_write_buffer()
  mtd: cfi_cmdset_0002: Call xip_enable() once only in
    do_write_buffer().
  mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce function size
  mtd: cfi_cmdset_0002: Split do_write_oneword() op_done goto statement
  mtd: cfi_cmdset_0002: Remove op_done goto statement from
    do_write_oneword()
  mtd: cfi_cmdset_0002: Remove retry goto statement from
    do_write_oneword()
  mtd: cfi_cmdset_0002: Split write-to-buffer-reset sequence
  mtd: cfi_cmdset_0002: Split to wait write buffer to check if completed
  mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce exit paths
  mtd: cfi_cmdset_0002: Disable write buffer functions if
    FORCE_WORD_WRITE is 1

 drivers/mtd/chips/cfi_cmdset_0002.c | 288 ++++++++++++++++++++++--------------
 1 file changed, 180 insertions(+), 108 deletions(-)
 mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c

-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
