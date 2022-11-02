Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECCEC433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Nov 2022 07:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zeF0L5K6qNwSRnvlhyN8QXdHO9oO6muyMqs/4N+Z36s=; b=AgXoZLYrE76yty
	MBEBT8MMIgOv37xBs5T0wEQ6r9tf2NC2Ew4NnvzbZEJyqtA34CLtZTuXlzUhRzp4Wbi0SX3s02lnP
	idMvhIl2U/oTw7M0IBIydoe4oGQ9r4bLQ9JIPNzPtKP9/NuJOhskgyN4P0ig+yn+rF4W857OtQF3L
	IJwOAZV6Ec4w1u2765tjFtdyJTffr98OGxmt6+r5TXvQXT0SSrq5SELRIyedY4d/d4IlsLntTIpH3
	+xhGzB3jyeU0V23ipbr1VpqMNtlrdYc19Nw3rO/sbj9owHPwnEDwFzzNGMLdVKX09if2TjxTPrbur
	Itf7KslYOqhxp8i5Z/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq7vS-008aOl-SH; Wed, 02 Nov 2022 07:12:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq7vN-008aNP-Ry
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2022 07:12:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A82361807;
	Wed,  2 Nov 2022 07:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8EFBC433C1;
	Wed,  2 Nov 2022 07:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667373152;
	bh=ehQ7VwaNM30H0c86wZXvETCmaz99RqH3y0Oi3nAZ3D4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bnrvlbysWyB+7sfoRLVJQZbm/5vU50SjTnFoXpIq5CiiyaquZRhVwsmizFxUkH8Ws
	 6h6Sx6c7TVlRAfOC64IPm0a3/kY7/x/XY6EjzHTdql+4qmkarCIJUNfUU9FpMUs8FU
	 efepWxoD0iKscunEyxty3XLmateRbLUUaIwjXkkgrhpDYJ/zAH1JXYWyc1nta4pwrZ
	 4qxhyuEcaGwrrfGJ+WgHh0Zfs8MV9LFTXLVtZEu4s/xOef7ZIYn0ik8g0DODkPtQ+N
	 4KN4KnVlB5jmliczVCv0hE7zz0f4jr4+VCylbnSF06zhD1CpCTbCkuMzhv/NR0pFIr
	 jy8s99mPG/YvA==
Message-ID: <ec160658-e251-bfdc-05ac-631bd4c716dc@kernel.org>
Date: Wed, 2 Nov 2022 09:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Barebox / Kernel Omap ECC inconsistency?
Content-Language: en-US
To: Colin Foster <colin.foster@in-advantage.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Pratyush Yadav <p.yadav@ti.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <Y2FvB5D0K4MBii8N@COLIN-DESKTOP1.localdomain>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <Y2FvB5D0K4MBii8N@COLIN-DESKTOP1.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_001233_978201_D11BDDDE 
X-CRM114-Status: GOOD (  23.25  )
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

Hi Colin,

On 01/11/2022 21:09, Colin Foster wrote:
> Hello,
> 
> I'm trying to revive a product that runs on a Phytec OMAP 4460 SOM. I
> submitted a .dts RFC a month or so ago, and plan to perform the
> suggestions and resubmit, but I'm up against one main hurdle that seems
> to be related to flash OOB/ECC. (get_maintainers on
> drivers/mtd/nand/raw/omap2.c is how I got this email list)
> 
> Barebox has "native" support for the Phytec SOM:
> https://git.pengutronix.de/cgit/barebox/tree/arch/arm/boards/phytec-phycore-omap4460
> 
> It seems like Barebox is writing and expecting ECC bits to start at an
> offset of 12 bytes, while the kernel (and Barebox comments suggest) the
> ECC bytes should start at 2. I'm seeing this with
> `nanddump -n -o -l 0x41000 -f mtdxnanddump /dev/mtdx`
> 
> Barebox created partition with UBI (mtd3)
> ...
> 00000800  ff ff ff ff ff ff ff ff  ff ff ff ff 56 49 fd 17
> 00000810  b2 25 60 1a 42 1d eb 56  5d ff ff ff ff ff ff ff
> ...
> 
> Kernel created partition with UBI (mtd4)
> ...
> 00000800  ff ff 07 73 04 ac 57 6b  9b 1f 92 49 ab e0 b9 ff
> 00000810  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
> ...
> 
> 
> My question: 
> 
> Am I right to assume this is an issue in Barebox? Perhaps this is just a

I'm guessing so. Both u-boot and Linux for OMAP put the ECC bytes right
after the Bad block marker which is 2 bytes.

https://elixir.bootlin.com/linux/latest/source/drivers/mtd/nand/raw/omap2.c#L1729
https://elixir.bootlin.com/linux/latest/source/drivers/mtd/nand/raw/omap2.c#L134

> bug that has been fairly dormant for 15 years. If that is the case, I
> assume there's probably no hope in getting this mainlined, and "native"
> barebox support is just a ruse.
> 
> If that isn't the case, is there a hidden "shift OOB by 10" config
> option that I'm missing? Or am I interpreting this data incorrectly?
> 
> 
> Any suggestions would be greatly appreciated.

You should fix the OMAP NAND driver/config in Barebox to match that
with Linux OMAP NAND driver if you want them to run on the same system.

cheers,
-roger

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
