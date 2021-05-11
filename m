Return-Path: <SRS0=SBmy=KG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279AAC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 11:08:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B61EB6134F
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 11:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B61EB6134F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=obf6tI2LbAkDtd+bZsWssD4TBdu4ssd3P6KKlXGh2aE=; b=ksadB89rudsNXt+DpR8GBv7Hif
	xc9qBdyYSgPexLGvtjMIMQSUWCELCiBmWrFRyrRwNSb+VUZtkLnqB3hOPuNDZpvhqWg+/8vT7kJah
	YbzTmD8KFotAfWKpWxSJ3rzWXyUiqXfvbDLT/eCyKB9b1E7NZzzAz6gyOI/h2eHhfmMbGYhh35H1x
	X7e0G7niAbUQiZ2FVFPFrsP4mQhU+1NmV7HN05QxhuKy0GJQ4PwAv1La3tIBe6RuCpHdVvh7AfslO
	BwVWg9N4OzHab5Tp3/dcXlaxwSfqCtIA7qmMsBNqBSNwrHMXCKQzuMjcZOsUU1r5OSKY8OD/e8o1O
	4ONg3SPQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgQEY-00H4X5-U5; Tue, 11 May 2021 11:07:27 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgHOd-00G3ZF-Nu
 for linux-mtd@desiato.infradead.org; Tue, 11 May 2021 01:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=4M5UWLEXmG3qQWOQ72/im+xF7iuSIQfjxJq0inwri/U=; b=cgxydK+SNdXXXS2AE1fn4d9D+3
 wxTJ8mnYi/5TkZgW77PsLx25W+UTjPhctIFy7mhNjLeLuZjIbbU6Ui02lV0jikiVlWclzbdvGqgrp
 dQ/tjcpF9kQORSm915iqCNAgobcjAwbQ2sexqmJwBbW+kfC7Q/jS/0rKmqCOIgRI+0di5z47ouCbt
 vaJ7qJe/HD/fKlughw3d1f1q6Nf048C+LU6wqY3j+yxdZz05+oEq3nWpRC6moY4v9W7CkHFSYyuPl
 qKtYf9sG0OLgYvRruWVpi2oXZq7u+ELRTorWMqkM3qSqFcmEmaQU+hFEIVo+8dztP5Uryuf3WAQ6n
 DtjNLieg==;
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgHOV-009F7f-Kv
 for linux-mtd@lists.infradead.org; Tue, 11 May 2021 01:41:09 +0000
Received: from localhost.localdomain ([172.17.195.95])
 by TWHMLLG3.macronix.com with ESMTP id 14B1esOY036551;
 Tue, 11 May 2021 09:40:54 +0800 (GMT-8)
 (envelope-from ycllin@mxic.com.tw)
From: YouChing Lin <ycllin@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 juliensu@mxic.com.tw, YouChing Lin <ycllin@mxic.com.tw>
Subject: [PATCH 0/2] Fix double counting of S/W ECC engines' ECC stat
Date: Tue, 11 May 2021 09:40:33 +0800
Message-Id: <1620697235-7829-1-git-send-email-ycllin@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG3.macronix.com 14B1esOY036551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_184107_953181_C801E343 
X-CRM114-Status: UNSURE (   5.45  )
X-CRM114-Notice: Please train this message.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_184107_953181_C801E343 
X-CRM114-Status: UNSURE (   0.94  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

This series fix the double counting of S/W ECC engines' ECC stat 

If you use SPI-NAND with SW-ECC engine, the ECC related statistics
(ecc_stats.failed & ecc_stats.corrected) will be doubled, because
those numbers will be double-counted in ecc-sw-[bch/hamming].c and
drivers/mtd/nand/spi/core.c.
    
This can be found by using nandtest/nandbiterrs validation.

Thanks for your time.

YouChing Lin (2):
  mtd: nand: ecc-bch: Fix the double counting of ECC stat
  mtd: nand: ecc-hamming: Fix the double counting of ECC stat

 drivers/mtd/nand/ecc-sw-bch.c     | 9 +++++----
 drivers/mtd/nand/ecc-sw-hamming.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
