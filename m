Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756AFD58D4C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 14:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=toGQnYq1kI9OQlof+Vh3ePBGU1FqHBqfUN6BVZsYOoc=; b=FFBzTftukcto/H
	3uTnaJ4qITbB/TROsi1suzn4HPVMLXCBNCBZREulF2NQqmdnK99MwYFcpym+Vd39U1TYhnGPQJFPf
	Yh6d6RANRya1XtPMnCxkO7/YkgUsLnCPwMV5eIoGQF+C0NK6Mg1//drnUo76RIyWwmzN9TKEqlLNj
	/6OHGNvt88rXHa40ow/OYfYrBTRbZq+MN6oX1ajQWFViteyqD281CECMdspKINMH2/ysPxNeZe2YA
	j/bakU4pjzr+5z/92eNxnc+pOOMDjJ9kAn49O3Mg5mag3lS71Q4Upmh8fHDcGpv0Q3+9DhgkluiGn
	tXfyoG7+4VIa7iWeACvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZjR-00000008E7T-2hVs;
	Mon, 25 Nov 2024 14:06:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZiT-00000008Dzs-3HV9;
	Mon, 25 Nov 2024 14:05:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1ECA5C5588;
	Mon, 25 Nov 2024 14:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FFAC4CECE;
	Mon, 25 Nov 2024 14:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732543528;
	bh=7N6O5nyyAZXOnHOqqGJ5UhxAbpqm8gEQrH9VexcwMgc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=V3DG7sp0uA5XWqdPO4E37yrNAk0dGyGTDmVuoZVJPWxymXAG1waHXaCZx1vbAbljR
	 ONtbg4d6DVG6Y7NfMvw3OhVxTyj5MSWIHEI3qVFFDVDsCC34I/T0AydslnuzVkGArS
	 JYvf7GP8y9AeWr07hWk/5WRKjY2Ug1Wit9CJHhKZcJq2F30kDwLxkNVHHDhqL/1YjZ
	 3jbgCPPyCtxwKRPamW9KB8g7gHcQ0HDWwala8eGrlPtCFpEHtKMqC8XaXiSs7Xi/pO
	 M6LdzEP4zuNLTCJtshzoqoNUK+ix86oD4busyWRkBvEWKg7MYwqBrUA1yRKzsvn1zx
	 hQ9GGSES94nfQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mtd: spi-nor: atmel: add at25sf321 entry
In-Reply-To: <20241116-spi-nor-v4-1-3de8ac6fd0be@gmail.com> (Marcus
	Folkesson's message of "Sat, 16 Nov 2024 11:55:55 +0100")
References: <20241116-spi-nor-v4-1-3de8ac6fd0be@gmail.com>
Date: Mon, 25 Nov 2024 14:05:25 +0000
Message-ID: <mafs0ed2z5ryy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_060529_958902_4E8599CB 
X-CRM114-Status: UNSURE (   7.92  )
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

On Sat, Nov 16 2024, Marcus Folkesson wrote:

> Add entry for the at25sf321 32Mbit SPI flash.
>
> This flash is populated on a custom board and was tested at
> 10MHz frequency using the "ti,da830-spi" SPI controller.
>
> Link: https://www.renesas.com/en/document/dst/at25sf321-datasheet?r=1608801
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
