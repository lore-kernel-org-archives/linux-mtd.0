Return-Path: <SRS0=mpCX=X4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2708C10F14
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2019 06:35:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5E8921D81
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2019 06:35:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L+dfaKSI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5E8921D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HgyJ+400XQiQKeuUTR0lWgtS1Ez75f6VmJcU18XWvYY=; b=L+dfaKSIdriws4
	xct8DWocLcQVBCgwnmsXeA/pWtsMrq9/u0IF+RgTYHeK8eC7ChdvNOLHGmiT9SZamnmSopnlWHgyd
	XjJDkpkb/yrhDvjlyWxN/Xv4Uc4YyU9oOzO+vdcp+4B/3GB85pGAijdxB1WuWTqPSEur7c6pko0mV
	dJcFZ1HZTJNeQrVCg9s43MWVO+m9+dg1QK8thAt0SEGwGYRCQSjD/H3hxDBtE6F0Ryk8KcmfNAACB
	zsoVULv0yQTgSvCYmK07vKfC8MNdBub+6fhgtB6Sh9X8IolTuqxRgsn9PUSxhkw/4EF8vRQmqgYvO
	2SQLvrZUH9RS6HjaZgPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFuiG-0008OB-3B; Thu, 03 Oct 2019 06:35:44 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFuiC-0008Mj-5S
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2019 06:35:41 +0000
Received: from methusalix.home.lespocky.de ([92.117.58.69]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MvJs9-1hxyJh1dsP-00rI4F; Thu, 03 Oct 2019 08:35:24 +0200
Received: from lemmy.home.lespocky.de ([192.168.243.176])
 by methusalix.home.lespocky.de with esmtpsa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <alex@home.lespocky.de>)
 id 1iFuht-0002ny-0N; Thu, 03 Oct 2019 08:35:22 +0200
Received: (nullmailer pid 18477 invoked by uid 2001);
 Thu, 03 Oct 2019 06:35:20 -0000
From: Alexander Dahl <post@lespocky.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] ubihealthd: Fix options
Date: Thu,  3 Oct 2019 08:34:59 +0200
Message-Id: <20191003063501.18421-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Scan-Signature: 17b193f88b83a18bc1d70958b03d0eed
X-Provags-ID: V03:K1:9r3sl/Ut5bDxJnFiR+CLWv1WXh/arBYJO9bmKiONzpHCDZXQTpU
 ld78tW5NVwsR4p+qIGp3CnHvTmdLc4KOK6H81zq6Ub+KHwWU81eady+Q67aMwb3yN0NE6BO
 RdH524guL7D3gNQjiPiILH93O6C/R/B2zNLwVM9WwSlJiFGllLrGrBAf5M9yANPABtwi7LO
 dTUKuBqa97UYyO8lOPpsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xbKNIdFaIZU=:bFTz+rKy9CH5DFjhourS1T
 5DXYAViP/mLr4+46Mux/U6jRRvs3uOwEBVj1QbKUu3fzxihVdw7nMEyR5k1vyChUhUrXQA3zH
 eo9ROPZqKHQwYfHLuzD1XFEl4zcsTDT8sVKua9ddimyQMmCJlnjXPDxE+ImOnV9QHhWLLs8Ee
 a28QbnomBDQYAD8AresXeNAQOp+4rvS7mOckgvvaqla20oBYdF40mmHT4QAthBvxr+rEJt0dI
 aW3QijOb1UNVrbYDP1ZMSI81hktXaS30DTR4vro/9mr1bUOENv98LiWaIOG+E5qh8jbirdGPW
 c4+c+Z9my6+Q/6uqGduvq64/5S/Ml8xyV9XvWBz+cRtG33LG2p1Ecs2vFyWbxX7pbdH16GQ/y
 vYwsQzikEY3wP8W85233KcxFLTLmKiwJaPTLIYzuojWAm6dxq9rReO7m7Bm4iDVED5w5ezrpe
 GpTPFXGjZTpSWl3Zq/xRNoK9Sf4Ue35RO7SFl5kONRa8uPqOeZNcaMn+py4wN9BEQ6VmARXDP
 lUMTkyn+emtzVTB8RXP7LbDFuFnNlezja3LkuXhpFwC0ooU3Qvp5Fe+JUM1fYFtbKyKYwyzRe
 fqbyjbewPhmSweDisijM1f2Rm4g6JvAD2RA9VjjomJnW9elApaz6spZyUzN/WYQZlcyXsc52X
 CBrp7hleZopxhkY6xJ07fhLAfYFSBSM1GNPMq1CaJgTNZVFN5Nq+5eGdMGqpERwxuFyGLyZfJ
 PbOQimecy22f9dZbV1lADho8WpvOhFn2kTKJNzlHwxTIRgDgKqTAMMjK2nthx1xF/Am8Z/nm7
 rA49pXfG0yIF0YWjFOZwWP1AxaAep3ey+gko7Le/yOMfjo8ETlOiV3qDEig6WsjfkeDocddRe
 3dHrGyTWarnQpHDaZNcB6KZvWn/RjFN88W3hWw5jg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191002_233540_507181_AC399B94 
X-CRM114-Status: UNSURE (   6.32  )
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
Cc: Alexander Dahl <post@lespocky.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

I started experimenting with ubihealthd, first thing I did was:

    ./ubihealthd -h

And boom segfault. The first patch is about that. The second about
having the usual -h and --help options.

Greets
Alex

Alexander Dahl (2):
  ubihealthd: Add missing sentinel in options array
  ubihealthd: Add option -h/--help

 ubi-utils/ubihealthd.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
