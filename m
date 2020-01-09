Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACAB8C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:15:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CCB9206ED
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:15:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bymx5cC5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CCB9206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiLwBRaSzNjQYYm+M/N2rXpoV425xq1+vxpX/SJmUtE=; b=bymx5cC5KPD71n
	GlmL1k2HaurZr6JYRQSBp8JH1DxTtChG1ANzNxpxhAk/X0tFHjijnNtVe0Lc/KkZEBfauRo7CAROJ
	FswubbpEJdBWf/pkI6HaC3RZmLQt5dfeWqGBYYCsSVGC4UP63msZ6JBMqLvzJ/RjWvUhKwPrinSrD
	Dvi8KveQ5q8AiTIB9yDcCOePKfCaMZEz000h4SXtEPPTcLoicy2i0zrIaKAW2vM2WA/wASMnm2NhS
	SkquatUE1/AnpU0Bz3M6bl8x7LBOJwqHLm7abkLMfbJjP7GbRJ5nLJQHSG42Ks2obt+l+3JmJDBNS
	1XCj5SpUOQ2DX9iPKm2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipdHN-0000U8-2h; Thu, 09 Jan 2020 19:15:37 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipdGp-0007F9-NX
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 19:15:05 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 777C320008;
 Thu,  9 Jan 2020 19:14:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>,
 kyungmin.park@samsung.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: checkpatch.pl cleanup - fix errors and checks
Date: Thu,  9 Jan 2020 20:14:56 +0100
Message-Id: <20200109191456.10838-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200102171008.GA15268@user-ThinkPad-X230>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 44f45994f438b4f4e0ba977b173980268983c60f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_111503_970480_F2953FE2 
X-CRM114-Status: UNSURE (   4.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-01-02 at 17:10:08 UTC, Amir Mahdi Ghorbanian wrote:
> Correct mispelling, spacing, and coding style flaws caught by
> checkpatch.pl script.
> 
> Signed-off-by: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
