Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7504C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:38:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6806E61B54
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6806E61B54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFYMuxDlIdVBxrBjhpUzJCFgMdeAprxowzhKHBxUx2U=; b=4vOL/fSQx5EaKV
	GPPD4gYSqKRCTxEYPc6Q8KILt2IGzlT+7Xe+vNTDfwSDGHLMA7F+GS6lrp369WbbHWmD7ifspjjFi
	MIS1UBsa498/tqSDP7bxOuST4U3BpsLWbwS/2Q5IuSdKSakF/NQvaev2BxdVdabbv3mgAizMtL2E/
	9o/tArgZTK/QubDIeo+42fuvJuWb+BJbvWrTzzXQk2GR9AKbTkX49juc1zijfGXKwZbmA0K7Qx23z
	DEiEKl4yTLlESWfCo/k9V6V/ebj7pcwCFUE281DA7NeP79SzNl78jLA5oHQU5dPVjaQDKP8jM1xMb
	W8HlwPu8O3uv8dmhn/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo8ll-00BJ4O-RK; Fri, 19 Nov 2021 18:37:54 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8jV-00BIGn-MD
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:35:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D3EA71C0003;
 Fri, 19 Nov 2021 18:35:29 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andreas Oetken <ennoerlangen@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andreas Oetken <andreas.oetken@siemens-energy.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3] drivers: mtd: Fixed breaking list in
 __mtd_del_partition.
Date: Fri, 19 Nov 2021 19:35:29 +0100
Message-Id: <20211119183529.1330052-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211102172604.2921065-1-andreas.oetken@siemens-energy.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cd6727626290d4abd37d92dfee24be36eb57ba82'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_103533_895074_7AAE7522 
X-CRM114-Status: UNSURE (   7.51  )
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

On Tue, 2021-11-02 at 17:26:04 UTC, Andreas Oetken wrote:
> Not the child partition should be removed from the partition list
> but the partition itself. Otherwise the partition list gets broken
> and any subsequent remove operations leads to a kernel panic.
> 
> Fixes: 46b5889cc2c5 ("mtd: implement proper partition handling")
> Signed-off-by: Andreas Oetken <andreas.oetken@siemens-energy.com>
> Cc: stable@vger.kernel.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
