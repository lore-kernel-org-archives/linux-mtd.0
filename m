Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9701DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:46:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58C84610E9
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58C84610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7pgnmOMcDj9kx3OnJGz5aiWLQKeEAtBqcTIeh8OHCQ=; b=j0mXrPPwqAD1+A
	LmI/I0zlW7cYjzdEQXRf08/Bi3xt2AzpgoiD+Y/y1xG6GYWaco0HFDjKWRieoV2vAilw2TtSmGaTh
	jnpt9wsVVGTnLgpNuVmkU/qLHP0gQvwtRvdeHgBZUgbEh7Ql5mw7mWA6i/dIwjmiAti8+KMB2Z/fo
	hByRk4QadumcXRJvGhMcK9h3pDGbOVknuWO2hpRSQ46bqZ2BBbwVozG8JPRV2ehZguBgdCRFuzavs
	BCBSEZZiF/67CJV5vZkXg7j1m0EDtIaO1Xd+L18lri9LW1YD8lZyOea+NwKY08dLJ4fP09qVEOWzN
	8Fxz5IMpGYT1NVPTR0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo8tl-00BKxn-Qe; Fri, 19 Nov 2021 18:46:09 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8mX-00BJJI-FJ
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:38:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 47FD9FF80A;
 Fri, 19 Nov 2021 18:38:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 3/4] mtd: rawnand: fsmc: Take instruction delay into
 account
Date: Fri, 19 Nov 2021 19:38:38 +0100
Message-Id: <20211119183838.1402761-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211119150316.43080-4-herve.codina@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2149aefa9c1521848a8d459dcfc40ad5e5ba385d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_103841_724054_E5A64A5A 
X-CRM114-Status: UNSURE (   7.30  )
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

On Fri, 2021-11-19 at 15:03:15 UTC, Herve Codina wrote:
> The FSMC NAND controller should apply a delay after the
> instruction has been issued on the bus.
> The FSMC NAND controller driver did not handle this delay.
> 
> Add this waiting delay in the FSMC NAND controller driver.
> 
> Fixes: 4da712e70294 ("mtd: nand: fsmc: use ->exec_op()")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
