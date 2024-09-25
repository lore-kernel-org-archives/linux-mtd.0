Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3511CCF9E7
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 19:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsLEcK79AYoKhSGiadNBEq7pRD0P0NF1aGAH7XKPa/c=; b=S2hyW4w3hMkkX6gbHElaFLzZn2
	I96m6AcNceMDRjzEGfnN4IAUh8/eLSPo0Tjrzv9Ne+i5/0Rsy6ZgoXDZ/Q0yy8Jrh+tEFdj6/vVxN
	9ZHdkyp5fj/cN+z3mQ7UzKHunoeQjhMDAb/69CZa4T6Clv5MfBJ5heJsUSrupJURWkZXCCA/w0vFW
	HtzOUqBC2TG46Wm3vlKKaJt4Dxy08nD06Wx1xjvBEvgDQBC4Em7ENqX5NnfF3L8aowlChUj5Hy6mY
	n51CPCwYCVDGO/ol+FDZlcHGyDOhcHeI9tDEu3mgZH22lSRHSujW9WhGMnIrXmLlFvzGSd+Kh4gDo
	iAJqn1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stXXg-00000006NnA-3UBN;
	Wed, 25 Sep 2024 19:19:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stXXe-00000006Nmi-2UC4
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 19:19:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E35D55C4C6B;
	Wed, 25 Sep 2024 19:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9935EC4CEC3;
	Wed, 25 Sep 2024 19:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727291953;
	bh=Q2p4A1+6mYTAEgW3SO8iZzn+TFU0r9uggFgEkVZdwT4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nGE8qE8q6I5mCbyLWhgXX3YTt4I3FOV1qgqEWSbJFNZ1ZByzapnFC4KjkUupMTQkA
	 kuW3rCDzGOgd5Juogosvq6n26ZW9gEfxfjQJq4grOJT/DgEfFOz/KgTOM+0uWZg5hu
	 cI88ls1nrmy6kENXaNMcISLVHoa3+wFhgJmMUYuigJvgI8in82ENksPphB/xv8GlB6
	 23xjnQ6zFbR0dFm24gjgais75CPeDOCnbTlv1PGnw2ysK6y0DwWi9S0TnFTBTOGGAu
	 GJ4YJ3eJ0Ae+MKcxh7DM0v+gYkL7YpQ2LVudgX+BRo25stFwH7G9DH3pGBLED1dr28
	 2742ZlRjC6tWQ==
MIME-Version: 1.0
Date: Wed, 25 Sep 2024 21:19:09 +0200
From: Michael Walle <mwalle@kernel.org>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 vigneshr@ti.com, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH] mtd: spi-nor: infineon: add Cypress (Ramtron) CY15B102QN
 F-RAM support
In-Reply-To: <36adf15058a6c0ccf5d3842460d3505b282f340e.camel@siemens.com>
References: <20240923165324.845639-1-alexander.sverdlin@siemens.com>
 <D4EDC01ZOSDV.AOFOP6LNWWJ6@kernel.org>
 <36adf15058a6c0ccf5d3842460d3505b282f340e.camel@siemens.com>
Message-ID: <28ab8b72afee1af59b628f7389f0d7f5@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_121914_730350_86111EBE 
X-CRM114-Status: UNSURE (   9.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

>> > Similar sad story as with "cy15x104q" where JEDEC ID comes last-byte-first.
>> 
>> Please have a look at
>> https://lore.kernel.org/linux-mtd/20240729102016.8527-2-alessandro.zini@siemens.com/
>> 
>> TLDR, please have a look at at25.c.
> 
> It unfortunately doesn't work with SPI host drivers which only 
> implement spi-mem API.
> Or did I miss something? Otherwise "cy15x104q" could also be handled by 
> at25.c.

The solution here is to add spi-mem support to the at25 driver :) Maybe 
you
can work together wit Hui Wang [1].

-michael

[1] 
https://lore.kernel.org/linux-mtd/20240408124328.777375-1-hui.wang@canonical.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
