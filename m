Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0340C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:45:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5762064ED4
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5762064ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vhIHKbPaaqRm/PfIxdr9ZGmWoYjV7jC/72KATSPeJPM=; b=bM7aZ5GQydORQTB4jI/rWL4G0
	M+msUcljkaZ7UZO1iM1KcTHOWOEOoKJ3hVqBJtYuknMgJTArGfqjCyMBYltFgwCobF2b34o3NdPzS
	E3TxUMKZikNeBUgmgE3cvjvYirk1SjefmYjhAPaQ1L1IbTVxnL2owM+w+nNeihUFjrH++rTUKibXf
	lIHJ8qSMNiowdabwneOTo/raSC8cr+znIu0vKA87X/D8mtSHDLMCIanRRI6PEJ4vW2AcFwG/ZPk2V
	CG/hQhDmnTjJE2e6Uoa7borsVBKB2BJEGWfaQ/+PqA1qlldetNrKuE6LpyerjKC3LvP9pzK1LYriz
	jUGFNd0Kg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWT4-0064Qv-PJ; Wed, 03 Mar 2021 18:43:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT1L-005HJd-FJ
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=FoDlSrgojQxCXs9onQBbM4u3wnYcRJ+StkeJemE22kk=; b=LLJ/EkyiSJnib3GKUw1M/D6viD
 WpAV8NFKkqUviGRWYYgDSBXVZh2ObE5IIabQDGaDvdB2YyMWwXM7FjieUs7PZ6ypVtgEXwhLxEJLS
 8Ghyt+WRqIEOzaAUsaNaAdIjEm2MD9XF4MiuQ1GLw2s6Oknvk0b3+9OygYo+FiqGDzMcemMn8oXvv
 oU7brWUJr5Ikzxl6Nxe1Wandjajf19FQLcLYU30vM8H+HPFkSJp+F3cUrM7u6IPOGTe/4ZqCH72sW
 K4im6mlOuGJuVgIjOLH1PbvGR5wfPeS9Ejy0462rWbw/M1KsGgJMAU7+be/FMZva+pdYHpvDIM2QP
 IOTglzZw==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7wR-00HSAd-PQ
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:32:16 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 20E4CE000D;
 Tue,  2 Mar 2021 16:31:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org,
 andriy.shevchenko@linux.intel.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 8/9] mtd/drivers/nand: Use HZ macros
Date: Tue,  2 Mar 2021 17:31:43 +0100
Message-Id: <20210302163143.22998-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224144222.23762-8-daniel.lezcano@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: ff0c6515cf31e133bc3e7c7cd9ddda0fa2efe9ce
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163216_227260_A63CBBFD 
X-CRM114-Status: UNSURE (   5.35  )
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

On Wed, 2021-02-24 at 14:42:18 UTC, Daniel Lezcano wrote:
> HZ unit conversion macros are available in units.h, use them and
> remove the duplicate definition.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
