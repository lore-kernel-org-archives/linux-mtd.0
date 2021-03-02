Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95D9C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:06:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0480664ED7
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0480664ED7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E/R6ZCtJIaGcKR2Me5PJDDJPHnIzdBmNwC+vEbQlZh4=; b=hj+IACE415vFGQAL4xkQD1Lqw
	kkgzXayhljyIRV1PN5kMrtbFFd/ai4N5u8N6rdimz8tavRmQWGIpFfhmhejfebGycAbD0orGX0g8W
	Ww295lpc614wYuv+3tv+Y0U+kkO93hTYrckFcIWHfINGxqQ/iyoQUMtfklJV2Li53PB5uYTeRNbIt
	c+rbKpJY40Qe+3IOe6YSkLT2ZjQlWHDVxJRDrRetdV/mt6A2al7JSsW/+jqfU0yJ+skdM/sNY8Lpi
	+IDQroQq98Pwo89My51jgwVqv4W8yhzBrXsw9EemBf3hpBJ/4AfMZheX7GDxze1CXvV2KVcQoyYZ8
	X5OWeG5/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHU0I-005WgI-Ae; Wed, 03 Mar 2021 16:05:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSoT-005Dbo-Sl
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=B9AP+6VIkO2K2jZ4sMpvftpOLYDNmst211HRr5uiPqg=; b=bV0pDGcK9G2eyaAM189MMKykyu
 bcqnHhhuyku/hnKy47/gHzCp7LOEAfpyPxJ34ImC/LVughbr3/FDihKXdgxjc05ZLwO9Trjt44nHq
 sLvscT9uW30MCeoTh3QAff7LF3XJ3aLhbBA9hw3jBI8WyGioSXMplRD963d02BAWTMDJoif0tJvrA
 cIFVbK+BPnB0iDd5XUGhWZYhud7xclbMkObUoXfvpfzNxsIpnpfCVirEQn+9rFaUOv5koN5cvS5Iv
 cSm5SmuovJ7lXot55YDOlja+8vL8BJDtx0jel+JzzztPQUcERwHr7WlX+D2W1NeFeOZAtdvYWwmPE
 CmpIIgpw==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7xk-00HSFy-Tr
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:33:35 +0000
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id A71ED200012;
 Tue,  2 Mar 2021 16:33:07 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com,
 manivannan.sadhasivam@linaro.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org
Subject: Re: [PATCH] mtd: rawnand: qcom: Update register macro name for 0x2c
 offset
Date: Tue,  2 Mar 2021 17:33:07 +0100
Message-Id: <20210302163307.23653-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1612037236-7954-1-git-send-email-mdalam@codeaurora.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: f95add6ff80490872464817653378b8d2c06d692
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163335_215848_BC1A8CD7 
X-CRM114-Status: UNSURE (   6.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 2021-01-30 at 20:07:16 UTC, Md Sadre Alam wrote:
> This change will remove unused register name macro NAND_DEV1_ECC_CFG.
> Since this register was only available in QPIC version 1.4.20 ipq40xx
> and it was not used. In QPIC version 1.5 on wards this register got
> removed.In QPIC version 2.0 0x2c offset is updated with register
> NAND_AUTO_STATUS_EN So adding this register macro NAND_AUTO_STATUS_EN
> with offset 0x2c.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
