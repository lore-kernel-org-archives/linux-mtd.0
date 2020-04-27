Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C38C4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:56:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35CB6208FE
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:56:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GlHnhYWL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="AeU7CXrx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35CB6208FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wbp8NFlLirRhAubi3HLBGjZQ3xnzu85jN3/fYOV5nwc=; b=GlHnhYWLkabSIZ
	1eQTTJBx4v/5Fz5OGujce/CrdKk4zJCwlZMxohhTWImxlh44bwlBD1xIS8r46GT15K9ARAq5/GcHy
	sdhlnwiPZLkns0S662wNoFxt/Y5TqMxK9hd7nxeuv7n4IjrcvAmqHf1AvLHlpDpJI996APIRnP+t8
	1hzVbMI1+nR3iNwEb2WUOSuR9bHx7toT/rgTqNehCXLkwb4Pw1L3KmEJWdICCUqHe5DhjXCEfwkAT
	1oVEmR/6Cw0tkAk1ev9X+ifuh/cWOEl6/vEPwQCLyvh1llLrLiooiwSNjqv9ZaVasc13+OcRDWheP
	E+amerPM+b0loloGeMmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8vL-00088j-El; Mon, 27 Apr 2020 18:56:11 +0000
Received: from gateway22.websitewelcome.com ([192.185.47.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8vI-00087q-G8
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:56:09 +0000
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id E9A3EA32
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2020 13:56:05 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id T8vFju9AB1s2xT8vFjVR1C; Mon, 27 Apr 2020 13:56:05 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MkwcCR3lst8/B7n+4ulIUXVmvitCgG29H/hIsQNGTwQ=; b=AeU7CXrxhdg9fpvzHvSe2zoXvw
 eyL94sVa/mqO6UoWJcna3+3WJgMcMSp+rWmLFi3KJjN+D17t5e0HI5BSf7RVCz9+SQgmt8SR4Klfh
 cgQ7pSm6LV64O5i5YZ9QJwkpLTyGZQAqGkyQvX5a9Ueivthd3XzVSZqTO3/U8nriuffjsO70i4WEa
 ia9E8VNkhvzxoUHPzvTW/NLs5sp2Ju/g16I5qmFgVM0jHkhUH0xQQJFit/fb5ow7hxJcFz9mljXjk
 66OgOi0/9pQmfERp0iMEy+xzEKB8YOhGn6xDgSQI0GvlMhZNR85khKUeXU35Nip0nRmH/xArBbmxc
 lEPNmwkw==;
Received: from [201.162.241.110] (port=27793 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1jT8vF-000Yrj-Dk; Mon, 27 Apr 2020 13:56:05 -0500
Date: Mon, 27 Apr 2020 14:00:23 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] mtd: lpddr: Fix bad logic bug in print_drs_error
Message-ID: <cover.1588013366.git.gustavo@embeddedor.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.162.241.110
X-Source-L: No
X-Exim-ID: 1jT8vF-000Yrj-Dk
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.162.241.110]:27793
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 11
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_115608_585318_FD38AA2C 
X-CRM114-Status: UNSURE (   4.69  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

This series aims to fix a bad logic bug in print_drs_error, which is
tagged for -stable.  The series also include some formatting fixups.

Thanks

Gustavo A. R. Silva (3):
  mtd: lpddr: Fix bad logic in print_drs_error
  mtd: lpddr: Replace printk with pr_notice
  mtd: lpddr: Move function print_drs_error to lpddr_cmds.c

 drivers/mtd/lpddr/lpddr_cmds.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/mtd/pfow.h       | 32 --------------------------------
 2 files changed, 33 insertions(+), 32 deletions(-)

-- 
2.26.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
