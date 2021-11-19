Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF863C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:40:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B04BE610E9
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B04BE610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNx4+PDymNLZ5At1zK7jMu8aUeAGPIVeWbkcUAQ4jQw=; b=1oKr1BzBsMrhhb
	AQbGuPzdtsVepNM6iIjTjqguMjyfmdeNaGeQymyuKBTsEQIuHhPMAmBb9XDxHJ+igb+YmszOkt7w4
	knrkElh7Wp1hPf/4yqQC7jtErQSepYJPxB0/ptls6BmRm3uuJsKX+aw8ICEorSMEXsrb9aTEVBjSo
	i6LjbA96FtX/zW5CqqytJ/KWnrAlMGMXrMe0KD2btsZh1Xd1VKj7t02kKetuM54QobXWUYRreiICV
	ohcwi8Z0/PKbNLyhdd1Am3zP/hjCeBds/eZY7zJV86D4Yk6kbgYpmFxoLutCDPeMj9VuIG6SivIIu
	Wmm3c87Q9/zayj7Num9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo8nv-00BJg9-9j; Fri, 19 Nov 2021 18:40:07 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8jh-00BILv-1g
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:35:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2326A40006;
 Fri, 19 Nov 2021 18:35:40 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] mtd: core: protect access to MTD devices while in
 suspend
Date: Fri, 19 Nov 2021 19:35:40 +0100
Message-Id: <20211119183540.1330186-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211102110204.3334609-4-sean@geanix.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9d6abd489e709666fc3f6fcfc124c89ab53c52a8'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_103545_260692_882C48C3 
X-CRM114-Status: UNSURE (   8.23  )
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

On Tue, 2021-11-02 at 11:02:03 UTC, Sean Nyekjaer wrote:
> Prevent MTD access while in a suspended state. Also
> prevent suspending a device which is still currently in use.
> 
> Commit 013e6292aaf5 ("mtd: rawnand: Simplify the locking") allows the
> rawnand layer to return errors rather than waiting in a blocking wait.
> 
> Tested on a iMX6ULL.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
