Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CEEC02194
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 11:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Utr01BVeOXVw+/KUAdvaAg9sGHWmTAu48ZkuVcf/eZk=; b=YGGYZgcVG10AKm
	xTitnXo6+eK9wzQtRFxRrc02cLqKhldTKD/XRLFEbs53CWgH/MtiFMuwW0Q6AI3fL7LLd4ElkDFzh
	U8cRTe9uvEqTbv40XW+zsYi3x7b4mcWuwCQY07YQ0IGRa7DMCX4J7/n5BFKqoxgssxrnnalbCR3lH
	PhS5cLn3E5efsQtHHfy0F/f4Wi+6dkoIsZPFlFqJNBNN/pB9GQsQdeb00GK7il2EFVE2jplWBNaUW
	yNQtmlR30Ejfuu4KCtGdvR7Ri72hkHnvkSlJUO1xK1TyOvQBie1c0IF3UQfIEzUZuTTe/6gUMYokR
	GPpWCRj1PnxyEZmnz6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMbZ-00000009Mq8-1Sxy;
	Fri, 07 Feb 2025 11:33:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMbW-00000009MpO-44LA
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 11:33:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7130A4320F;
	Fri,  7 Feb 2025 11:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DEBC4CED1;
	Fri,  7 Feb 2025 11:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738927981;
	bh=yPbCpc9GhZJ7ZubvWj9Nq6sB/bAQG+9/7K4H+EVldjA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=O/lrvzqpFKwCz8mmFn2c27sF7vhcuUvSX3hxRNTWkKjVsnODJC/6TT0ZHt6uIz+ok
	 LrZ7lPNVuw+C2jEx0PSaqdMjD7M6W4Fu5PG0zSUkwiGTQ3gKKe3uPNCW7VvDx0brXU
	 McwSM3uYTzNFEnGU2xDHpgmW2M812upbCG9fbeZJA5wCUvthAuOsNZ9z7IKZyWVEbM
	 /qliyqTEW/ebcJBvVzdZa2EsBDd5ow6cuyiblkYE9mbd9cbfxQ+PKMDbShOQA5fBAg
	 LExTVeY2U7OjuhNrILAjyJuEUqdTpTM0qtYnVtKiybJ1nGZheOIyCGTZEOUFU6vBQl
	 BF1/53ruOiaAw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Cheng Ming Lin <linchengming884@gmail.com>,  tudor.ambarus@linaro.org,
  pratyush@kernel.org,  miquel.raynal@bootlin.com,  richard@nod.at,
  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,
  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add support for Macronix
 NOR Flash
In-Reply-To: <811f5b9d7b2842a3e1293ac6a0bb3b70@kernel.org> (Michael Walle's
	message of "Fri, 07 Feb 2025 09:39:34 +0100")
References: <20250207081846.362919-1-linchengming884@gmail.com>
	<20250207081846.362919-3-linchengming884@gmail.com>
	<811f5b9d7b2842a3e1293ac6a0bb3b70@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Fri, 07 Feb 2025 11:32:58 +0000
Message-ID: <mafs0frkqyoph.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_033303_068764_DEFB6DCD 
X-CRM114-Status: GOOD (  11.48  )
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

On Fri, Feb 07 2025, Michael Walle wrote:

> Hi Cheng,
>
>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>> Due to incorrect values in the 4-BAIT table for these two flash IDs,
>> it is necessary to add these two flash IDs with fixups.
>
> What's the part number of these flashes?
>
>> --- a/drivers/mtd/spi-nor/macronix.c
>> +++ b/drivers/mtd/spi-nor/macronix.c
>> @@ -127,6 +127,9 @@ static const struct flash_info macronix_nor_parts[] = {
>>  		.size = SZ_128M,
>>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>>  		.fixups = &macronix_qpp4b_fixups,
>> +	}, {
>
> Although we don't have .name anymore, a comment like
>
> /* <partname> */
>
> is recommended.

+1

I have been recommending this in other patches as well. Going through
commit messages can be tricky. This lets us still identify flash entries
easily. Let's recommend this for all patches going forward.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
