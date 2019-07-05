Return-Path: <SRS0=jTzi=VC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A59AC46499
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2019 21:01:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 510472133F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2019 21:01:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NgJGWYg5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 510472133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIVjuXq9JHEMEJSbBuMw5XOE4IhEsxBkl8YAyrDJqak=; b=NgJGWYg5xn2Iu6
	/dTEjV2GPTFeW325UTCMpqlWa06uKUvSrm9mBsYKHSdY4hBJQVbWUFdhtcdXCjlEVQySKvobs8fS2
	64K7s5jJCMOEsmCrSg4Bwm+0sgOtEp7eTGABZK8Zks6au+5A3ZMxwo5qa6vAGT78NKeUySoXYAVX9
	3CZpwC5xlPbwkXihCmE5tBeoJlzrzZx2Ctux3Uj5COFjTZwcQFHCwVNo6AxDlMeWh80mtwBMgctga
	xkmXOpmlf2GexV0nfMpR0kDaxP0su8BmfqZFKCP0XAzZEx2Gd7jd7WIWEWIdIM6cuKdQ+1vsGGzp1
	bhpx/drh4TqIALG72Vvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjVKG-0006d0-1n; Fri, 05 Jul 2019 21:01:00 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjVK1-0006TQ-9T
 for linux-mtd@lists.infradead.org; Fri, 05 Jul 2019 21:00:47 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id AB3C720004;
 Fri,  5 Jul 2019 21:00:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "emil.lenngren@gmail.com" <emil.lenngren@gmail.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spinand: Fix max_bad_eraseblocks_per_lun info in
 memorg
Date: Fri,  5 Jul 2019 23:00:26 +0200
Message-Id: <20190705210026.13420-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190606170754.6531-1-frieder.schrempf@kontron.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: a126483e82957172b8a93ebb1d30fb2b1df3cbbc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190705_140045_483287_F3AD9474 
X-CRM114-Status: UNSURE (   6.91  )
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
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2019-06-06 at 17:07:55 UTC, Schrempf Frieder wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The 1Gb Macronix chip can have a maximum of 20 bad blocks, while
> the 2Gb version has twice as many blocks and therefore the maximum
> number of bad blocks is 40.
> 
> The 4Gb GigaDevice GD5F4GQ4xA has twice as many blocks as its 2Gb
> counterpart and therefore a maximum of 80 bad blocks.
> 
> Fixes: 377e517b5fa5 ("mtd: nand: Add max_bad_eraseblocks_per_lun info to memorg")
> Reported-by: Emil Lenngren <emil.lenngren@gmail.com>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
