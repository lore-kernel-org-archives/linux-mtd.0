Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AC1C5AD5A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 10:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwjFS2ccJXTPgDb/tWpcF6RD2ZqRzhGlKp6He/PQKJw=; b=igtK3yitK09Z8Y
	8fxCx4zo9Ak3KPRpafajdpYjZNUdDfI3LYFzuTvelIsmeY4vKnGfc5Eu6i7rRI0PMPE1uGyBNxHTy
	BZOPrSquTVzJkengrOG5uyvLstpBtxQMITAi0i9K6oqJUlUKC0Pn2Jcq5xaBTKxQjKPMQV5xJ5uD3
	NCTyfJonVl/ICXfCJdATA8uXMDhLOIB/UdobdJFsKWYve+MQ8j7nicMGe6yvPxojrE+knNAJ8BhN2
	4oeCwskWQK0+YBTay1CAQX6OJLkjYw0WKj+LDA7puShhk6nxmKeNTmI7Lr1BCWA09yK0wnGiJXX+P
	KP2gvTy7zjtIwYFe75hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6HI-0000000FuDY-1YOl;
	Wed, 12 Aug 2026 10:33:44 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6HF-0000000FuCg-36NZ
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 10:33:42 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 626A9141;
	Wed, 12 Aug 2026 12:33:39 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 12 Aug 2026 12:33:39 +0200
Message-Id: <DKMWBK3M5W6V.1V1JTUV6Q8IDT@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Unprepare legacy controllers upon RWW
 wait interruption
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260811-perso-rww-fixes-v1-1-5866a70e5d1c@bootlin.com>
 <DKMVA2HIPB2Z.J0W6OM4H3ARL@kernel.org> <87ik5fmz64.fsf@bootlin.com>
In-Reply-To: <87ik5fmz64.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_033341_954898_C909C8B3 
X-CRM114-Status: UNSURE (   6.04  )
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

On Wed Aug 12, 2026 at 12:05 PM CEST, Miquel Raynal wrote:
> Hello,
>
>> On Tue Aug 11, 2026 at 5:56 PM CEST, Miquel Raynal wrote:
>>> All the parallel locking helpers (spi_nor_prep_and_lock(),
>>> spi_nor_prep_and_lock_pe() and spi_nor_prep_and_lock_rd()) call
>>> spi_nor_prep() then wait with a killable sleep. If the sleep gets
>>> killed, we leave the controller in its prepared state.
>>>
>>
>> Why does this only affect legacy controllers?
>
> Aren't ->prepare()/->unprepare() callbacks only implemented by legacy
> spi-nor controllers?

ah ok :)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
