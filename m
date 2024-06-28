Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FA9C2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 17:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:From:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h16LrDV5NXFbSOLjLF9pm1oIXS7MFfb54W+kTkz8zPU=; b=aIshEoUhJzp6Gu
	VvuAf/1BzspnBLBrCNIBE7fuz+6DAirm7vvDljyhkU4JPH1QbF5FRlrEjMtoEdvUlIw7NsIwLYRWV
	AsOK7XkXc6sG6jSmkrPMzZtu+Xv47e2UrvgGNSYtp6UnpAxIN6qBtDM3+9ZUCoF5T/Sbsy5hICoOr
	J195RKEP3NlphqPbAZUWcJ8lmuDwreElzHjZPugXbQcYo/ekqwSlxbocopfCoTj+GKIgN+8ofqEgM
	iomO5CGYXLCJxPy2p0x9qgjLZUE8nsDS+uQzquc6gsj55stBUO+D4Ma+ZDz/RY9t9AD7AM6Tu1Ynj
	2iLmZdcEYiwQEH9f6BpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNFff-0000000EXN1-0Uu4;
	Fri, 28 Jun 2024 17:46:03 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNFfc-0000000EXKb-39nr
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 17:46:02 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:4ee9:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 7147F5444;
	Fri, 28 Jun 2024 19:45:50 +0200 (CEST)
Mime-Version: 1.0
Date: Fri, 28 Jun 2024 19:45:50 +0200
Message-Id: <D2BU69BDUOL0.63A7T034CORP@kernel.org>
Cc: "Conor Dooley" <conor@kernel.org>, "Erez Geva" <erezgeva@nwtime.org>,
 <linux-mtd@lists.infradead.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 <linux-kernel@vger.kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <devicetree@vger.kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Erez" <erezgeva2@gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: mtd: macronix,mx25l12833f: add SPI-NOR
 chip
X-Mailer: aerc 0.16.0
References: <20240628140328.279792-1-erezgeva@nwtime.org>
 <20240628140328.279792-4-erezgeva@nwtime.org>
 <20240628-refuse-actress-b76985aa020c@spud>
 <D2BS0YMA48BG.1PEPFC3KMFV8N@kernel.org>
 <CANeKEMMrXK=mw=n=9DuTnprkTs3ct446oaC2QTJyst8Nd+D6rw@mail.gmail.com>
 <D2BT0DT9UQ66.2L497FSY7GMAL@kernel.org>
 <CANeKEMO9hBhBs91nZkZRht9J29iRC2Tgf6ucWq=nbO7XAqzzng@mail.gmail.com>
In-Reply-To: <CANeKEMO9hBhBs91nZkZRht9J29iRC2Tgf6ucWq=nbO7XAqzzng@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_104600_955774_9F86D7BC 
X-CRM114-Status: GOOD (  13.37  )
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

> What is the kernel policy regarding obsolete flash chips?
> Macronix annonce on end of life of mx25l12805d in 2010.

Which doesn't mean there are no boards using it. But EOL in 2010
might be a strong argument to remove it. But I don't see the need
for it, yet.

> > Also please have a look at
> > https://docs.kernel.org/driver-api/mtd/spi-nor.html
>
> The new mx25l12833f supports SFDP, the obsolete mx25l12805d does not.
> I did manage to read the SFDP, though I do not have a copy of it (I do
> not have the hardware any more).

So how would you test newer versions of this series?

> To my best knowledge SFDP table do not contain information on OTP,

That's true, but we need it to detect flashes during runtime in the
future. Imagine sometime later, there's a third flash with this
exact ID, then we need to have the SFDP to figure out if there are
any differences between yours and the new one.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
