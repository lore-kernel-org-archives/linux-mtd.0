Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B683C5AD7B
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 06:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:From:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AoI7sAgmV2wrTs/09zMVt8JpMSOvO/4jrG4rKsOpviY=; b=JXxKTKXm2Tymgj
	fZjREKapPWPaRAleeGk1Xd3qStVBNmP4jVUEzf4suAY9crPlqdFefxR29RPeHjnkhPHe6tGt5666j
	PcObhj319tjqu+5j6OYboWc2gxErlseKtnyvDGERjHfdjxnlToH6eAIlPypM9zRtmA5JeDayvehc5
	Rdn4CsGyQOjq+XtBA8u0bLNdm1diIXoi/4I7g6vXiMEaiZ/lw0p8CTqqdesW7O6qGS6bLb0wGegHT
	hfhHfrmM3J6EWdk9h+J+lDfZh7J6xU7vHI2cyKCxLUQD2kiXbxSKRDlcnDpt+C3wMRrBszdq3KNXl
	NfdCcMqFdwlC4LAxkU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtg1i-0000000DQP5-1nfx;
	Tue, 11 Aug 2026 06:31:54 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtg1g-0000000DQNG-0gxr
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 06:31:53 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D4B1C2E0;
	Tue, 11 Aug 2026 08:31:48 +0200 (CEST)
Mime-Version: 1.0
Date: Tue, 11 Aug 2026 08:31:48 +0200
Message-Id: <DKLWJUH5UFTD.2WLKWBOCB56HS@kernel.org>
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <alvinzhou@mxic.com.tw>
From: "Michael Walle" <mwalle@kernel.org>
To: "Cheng Ming Lin" <linchengming884@gmail.com>
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: macronix: Add support for
 MX25L12833F and MX25L12845G
X-Mailer: aerc 0.20.0
References: <20260605084837.1875896-1-linchengming884@gmail.com>
 <20260811012238.961754-1-linchengming884@gmail.com>
In-Reply-To: <20260811012238.961754-1-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_233152_650962_5AEC1429 
X-CRM114-Status: UNSURE (   8.63  )
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

Hi,

On Tue Aug 11, 2026 at 3:22 AM CEST, Cheng Ming Lin wrote:
> Gentle ping on this series, which has been on the list since June 5
> without review feedback.
>
> v3 addresses the comments from v1 and v2: the fixup now uses
> ->post_sfdp() with a comment explaining the ID collision, and the build
> error in v2 is fixed. Patch 2/2 is an independent regression fix
> (Fixes: 947c86e481a0, Cc: stable) for the legacy MX25L12805D, which
> currently fails to probe. The series still applies cleanly on master.
>
> Could you take a look when you get a chance?

Sorry that fell through the cracks.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
