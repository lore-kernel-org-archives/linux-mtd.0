Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A719BC5AD5A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Cc:Subject:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6X0OI47+t6VAUUT6ON6VdRkzDNjyEcR0zXQfsqmr4E=; b=hlPBK3i93uvhKv
	fxiYFrER5FYhcxopuO4fxw8UU2qWhk4lX1kA0eAARBJM55kJ2kpSk4yXpG5iOk9SZ8hVPVO2gnBvf
	D9ziGvr92YS5znhV14EHK+Qx6avQxUPo/M3u8cGhAjPtWmUhtP+s2YCZuAwysWfPSRrb0Rx9bBLNU
	LwM1EpMVaMdYDwZ6REF/QZkd674K/lFXkLlaIyzTEml/nMdn/7rJOOqlhEuC25E3IKkKVcqmdwsTc
	dFh8GCILik2Ll3xzkh0RJ1GzqiRDIbjSkD2IppL1gM32ScFxOTTn0tZZ9+Xra8X9ss8OGXrPmshBu
	A5cG1JCkRKw/4PcyYvew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5W6-0000000FnrR-2bFR;
	Wed, 12 Aug 2026 09:44:58 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5W2-0000000Fnpy-3d56
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 09:44:56 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 971BF116;
	Wed, 12 Aug 2026 11:44:41 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 12 Aug 2026 11:44:41 +0200
Message-Id: <DKMVA2HIPB2Z.J0W6OM4H3ARL@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>
Subject: Re: [PATCH] mtd: spi-nor: Unprepare legacy controllers upon RWW
 wait interruption
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260811-perso-rww-fixes-v1-1-5866a70e5d1c@bootlin.com>
In-Reply-To: <20260811-perso-rww-fixes-v1-1-5866a70e5d1c@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_024455_085992_6524D022 
X-CRM114-Status: UNSURE (   6.20  )
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

On Tue Aug 11, 2026 at 5:56 PM CEST, Miquel Raynal wrote:
> All the parallel locking helpers (spi_nor_prep_and_lock(),
> spi_nor_prep_and_lock_pe() and spi_nor_prep_and_lock_rd()) call
> spi_nor_prep() then wait with a killable sleep. If the sleep gets
> killed, we leave the controller in its prepared state.
>

Why does this only affect legacy controllers?

> Call ->unprepare() in these cases.
>
> Fixes: 74df43b3f626 ("mtd: spi-nor: Enhance locking to support reads while writes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
