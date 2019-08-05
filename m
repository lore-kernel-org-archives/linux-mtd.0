Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BC8C433FF
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 19:04:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A471F205F4
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 19:04:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fbHxflin";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMzzANz2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A471F205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=wip5xXLIY+VipLNblGRnyFMRBmB2ojE6KG9RZ6BUd5c=; b=fbH
	xflinQdRNh0EvdCymuY+WnZk/ZlA4weze14Y2ahG44WMxAZeBAry4qvfvTDDh6AeRuS3Zf171K8M9
	Wx0KbvZ/8MJzpEBmQShASzJBPNLmAwH/odaUQpDKp9WzZDzZ1nAKYxx+BfsUzFYGyJj3Gfv4Aoa5S
	fAbn0144iC68lsABZBVdXhwkSr0/g+yue4C2YPssO8L6AbZEWmgfnviVD4wP3ssJyCVwuuHQbWLIw
	LPQ7FMRwHgpXwKtUx9Czs+XxIAIUrhdk7ARqG0hYQU7qxdMjl+wUoyXn+bIk0GmcrRAcdjn28aNSN
	TG/3EwL5qerT/VSCXhS47AaIFHHM9ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huiGn-0003Ib-T6; Mon, 05 Aug 2019 19:03:45 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huiGk-0003I3-H8
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 19:03:44 +0000
Received: by mail-pf1-x441.google.com with SMTP id y15so40118261pfn.5
 for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2019 12:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WUCgen8FrEmYX6roX9/os03+ZRfandPEtH1cUK/stSM=;
 b=WMzzANz27VuHbWSgWVxXlNz3j5Q17XAKwTh8DGMmABbdDIPMh33gcUmBCnNHFkQVPf
 V4C+x8QtXIl0/NPQi9db59sB75FrUySmRnNveZlqaDbcJbFQiepxdVznGLTe1uO06QXA
 m9QklTGZFdQyBCEmBsr1hCVCqAaR67K4ghYwGPYG+Xnzj5RG7s5fHdt9h2KgjyaTPq93
 wi+A1TeX8waxRehl+G/6RcJszVc5PdjeU5tQCkgM8p0Hkc3DPyfKHhdIryftAQPB/kx7
 fDWIy0q7il3BmQkXscfr6EKLrdbOm7fBSTgTBnyMKO25JIMoyb9a3vJ7dgYqnkbHw9kE
 lafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WUCgen8FrEmYX6roX9/os03+ZRfandPEtH1cUK/stSM=;
 b=SaynxcOp98BGfYjWGkeeYBJyEdzqxTbGGSLX1D3rUhpG2bk8jK77L1eiWsDoMz88In
 uoteefiM1WTtItpg4H0HDG8zo4NcXi99dIs0xsUgN8sHOQgiEU+lcWTJs6Ly+ba+Lwqn
 378tI8WplD3RyZPAsW3KhQB1vrqN8Ra4kjKj4h8GxzUC6sJB4fIQkF4uMjOcVUdByrxU
 H1u3TqWNiHcQDjxyGsVALVteMfmxUAn18gJbOqeNINV7hhaxt/FdlHNUcvQfIP4KcRlr
 Mr8ISmq/oA24GARxGqKVoWOh4BFa1sgwcix80KAVvq2bau5iqoeyAvqADmFfDj34Tfm4
 wsBg==
X-Gm-Message-State: APjAAAWR54SATkydZ3EIjbwb4hSc6JGt6tZ+DTWEwLmqXAWmAL0COa0Q
 HpwrqfGniJOAkC0F7mIi0CFJgwPR
X-Google-Smtp-Source: APXvYqyFW4278xsGeCbN8cEeAwDzqM//uGILJ2cM880NjMb9F8y392nxkHPDiwXE9HV3GQg7lc0ygw==
X-Received: by 2002:a17:90a:1904:: with SMTP id
 4mr2926537pjg.116.1565031821270; 
 Mon, 05 Aug 2019 12:03:41 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id q198sm88045579pfq.155.2019.08.05.12.03.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 12:03:40 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v8 0/9] mtd: cfi_cmdset_0002: Fix flash write issue for
 OpenWrt Project
Date: Tue,  6 Aug 2019 04:03:17 +0900
Message-Id: <20190805190326.28772-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_120342_596056_B6C66F6F 
X-CRM114-Status: UNSURE (   9.67  )
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

 drivers/mtd/chips/cfi_cmdset_0002.c | 296 ++++++++++++++++++++++--------------
 1 file changed, 184 insertions(+), 112 deletions(-)

-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
