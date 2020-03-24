Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F21C10DCE
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 22:06:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AE292077D
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 22:06:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LX2oIZLp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AE292077D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21YcHcKx46Q5Jide9AX1DZOEpEl7YfEi8ZophxSIANI=; b=LX2oIZLp1eZzuK
	kGC/wcou61vV6hGhjhYkTiG1d+g40B4psr+8ItAQoPsGkxjzz9lLQlaXJAo6cS9gzEqgNNmTJNlwO
	18ajmSZc4okk1fJMoxX63K+1/Nik5v6SKI5GhnGc3Y2asrBPt29Blumk4iZNqL05UZhfk6prEGGrS
	ZvlvQiW/efivAGhpgKzdtivZEPGuKZEdEKh19LEuRXcZmpUNqTnDxuZzhxQp9+kwq5gISn4UmPPCj
	+MR83ozhkJKQo6MLFyC9HaiYuac4CV7z1YsNsYwXfK+vS+jVY9zBoU44tRWccBF8yQx5UWM2x4vPm
	5nM9zQM3LsXh2VjlOQlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGrgP-0006Pc-3Z; Tue, 24 Mar 2020 22:06:01 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGrgE-0006DD-PQ
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 22:05:52 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D43DF200002;
 Tue, 24 Mar 2020 22:05:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wen Yang <wenyang@linux.alibaba.com>, Joern Engel <joern@lazybastard.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [RESEND PATCH] mtd: phram: fix a double free issue in error path
Date: Tue, 24 Mar 2020 23:05:46 +0100
Message-Id: <20200324220546.15403-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318153156.25612-1-wenyang@linux.alibaba.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 49c64df880570034308e4a9a49c4bc95cf8cdb33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_150551_050233_D6A2B409 
X-CRM114-Status: UNSURE (   8.34  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-03-18 at 15:31:56 UTC, Wen Yang wrote:
> The variable 'name' is released multiple times in the error path,
> which may cause double free issues.
> This problem is avoided by adding a goto label to release the mem
> uniformly. And this change also makes the code a bit more cleaner.
> 
> Fixes: 4f678a58d335 ("mtd: fix memory leaks in phram_setup")
> Signed-off-by: Wen Yang <wenyang@linux.alibaba.com>
> Cc: Joern Engel <joern@lazybastard.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
