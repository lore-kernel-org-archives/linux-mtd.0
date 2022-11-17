Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C754EC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fp5pbtnBjSqXSTqHjwQTdQs43POU1l1e3RDc+Uc73U=; b=fS9Cls4X2yaQVL
	SbwyFAltxNoKbHViX3UvF3WZcf7zFWkyj8qhly6uqscR6BkfZns8Tqpn/WMDlik+VaJtKzPbc3y1l
	FGSPjAZIMXZi6jHEB9qFlppPBDcQ2XlUR4eMBCl0JqOCNdNBlgCTUfRtquc7dnpWIzP1+o2A+Fbdj
	sua8ExT0frHK+dUV5++AvipQTWo2AkJIaDE7zMNnXUmRqXWBRofhENgxOBaTm9V9Jq8norACULvUH
	YJg6qZpjV4npcPgFoWKykH1vxBPzrQpu4JyXsopa9CX6iEqzKunu/9/Ik8pdxYdPQDSHF/zKKGwP3
	xckj6agdY+4t1+p634zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmGx-00HaQq-N6; Thu, 17 Nov 2022 21:18:12 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmFZ-00HZJN-OH
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:16:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8CC7E240007;
	Thu, 17 Nov 2022 21:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8sSSAG02v9c1rix4dWFafQx0XJFdGQdS3+n8JraUS34=;
	b=gflZVOYyopBq8lAgrMnCclNfRx+jwt8Cb2LIX1DL/pT53PPG+ygs8wvF9kBQ4bG7d8YIv0
	FkThP65GeDLc5gQ9dHcW1KkctjdV4UvQf18VY1LB+/DsS6HZjm/pELXVO5hLqPL7V6Xirl
	sgPwm9jwIwxYLdiEYX7Qw0272Wi8sHQk8LhdAOBVlDUwMg1NSEHHpzdrtHtX300SZy4m3s
	8AIGRF7BVE+5VAu2uvEZiz5teo2rP73QMyjUHXSjZd26ETrdAbB3L8CaHmm47dU0qCUaMl
	RRi2pdVuGVzDHyOX9Qa0HI1BXXnO9pYCJFFeza0IMk0pPrRYN1TnM6lvHNY43Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: chris.packham@alliedtelesis.co.nz,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: marvell: Enable NFC/DEVBUS arbiter
Date: Thu, 17 Nov 2022 22:16:42 +0100
Message-Id: <20221117211642.1273750-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109231325.7714-1-hamish.martin@alliedtelesis.co.nz>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c13bf589e5cff0d05ce63c4832de3fab2a19c62d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131645_948914_8CEC727D 
X-CRM114-Status: UNSURE (   9.00  )
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

On Wed, 2022-11-09 at 23:13:25 UTC, Hamish Martin wrote:
> The CN9130 SoC (an ARMADA 8K type) has both a NAND Flash Controller and
> a generic local bus controller (Device Bus Controller) that share common
> pins.
> With a board design that incorporates both a NAND flash and uses
> the Device Bus (in our case for an SRAM) accessing the Device Bus device
> fails unless the NfArbiterEn bit is set. Setting the bit enables
> arbitration between the Device Bus and the NAND flash.
> Since there is no obvious downside in enabling this for designs that
> don't require arbitration, we always enable it.
> 
> Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
