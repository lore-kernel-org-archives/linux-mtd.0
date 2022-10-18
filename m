Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC97C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4V0BB5Yx+UNajnV+gbPhvAHOOd702/IUYCyU07K2Z34=; b=RXOmAwe65KXD8F
	ym43gzRcWpczaK3veBtl5Qb+MNq7jOlbQugOo07YNDnP9hf0hjPjko1oJS1WsKx2TGwVnG82UQBO9
	7UITDF/yNXmOFDWV2MHKHafn1D5TZnhBvkJH6/4gk2yVbPhqYfkEVtuUS8LthST/jvN3OYM2JP4l1
	4qcGl11iL+bH2G+KfHNZsXIVsDUugby/Pq3+ITO6n8uWyO5fwJpqvRmwKJx321Hns4TKsU0USw8Ag
	b2yqpjjWg5rPmtWFNuXK0jnxo6/pG5+PMSThFwexH0DEZk8VChn5Cz9zDnwVngNH/mB46MRoHXSfe
	abPxc7eSNGtPsVFx8Q5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiWE-004g4W-NS; Tue, 18 Oct 2022 09:04:14 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiW9-004fuh-E1
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:04:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C8D7EFF80B;
	Tue, 18 Oct 2022 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666083845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ov1McskxA2EWvBoLZC6l6I9qjfPSqehFWh4VIGcBMFQ=;
	b=RNBBhaVijb0w14KfkC4xHsEcaqv6Rkvinf3zl0ohRJnjuZlMhMfyQkr1dRKWnRdT9UWocM
	HmI4u08QXqzXsTQN7KI0Wcp2fs7NhyZACxte3ZW/fGG+OrOv7QVh9b7dnWnpyknBUDEvKe
	bMeZfkJBK7KsgLGNbLWHcyhJ/W4UAN7jIC0N2dXrR0xtbQ/bhIvOKGtpAEqtG7BmiJNOrq
	kLy0NNUH9oWjPqBmMahhm4W5yK8sp+YD3OQaEUrRqlyAhJhj0vm0mmVizD4Vn2Pz9/ZOe8
	hnlHjh2Myxax5xvrKbrOECmlLfvKB0409qem8w1DkMgN5NrsVShZqGFhBVQbXg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: mikhail.kshevetskiy@iopsys.eu,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v3 2/2] mtd: spinand: winbond: add Winbond W25N02KV flash support
Date: Tue, 18 Oct 2022 11:04:03 +0200
Message-Id: <20221018090403.466239-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010105110.446674-2-mikhail.kshevetskiy@iopsys.eu>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6154c7a583483d7b69f53bea868efdc369edd563'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_020409_630856_830C1E41 
X-CRM114-Status: UNSURE (   6.47  )
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

On Mon, 2022-10-10 at 10:51:10 UTC, mikhail.kshevetskiy@iopsys.eu wrote:
> From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> 
> Add support of Winbond W25N02KV flash
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
