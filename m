Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41592C87FCF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Aug 2025 13:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MidVSWT4UX5Sw31849Ro6WiDoVkq12r3ZjKQCTL5KvI=; b=RTuEyLZdXy1qQ5
	38lfHzEp7bvDj3sOT3vYnUUf0dma2ugeRy37iBETZkyAwgqC7o+561/fTZRIgXzw0kc8YH5mgGTCV
	UVGK2uZaLcMMoMHU88KN8VkV1MHWLZ4rXcvqfwjisrkN7wUbPq7him2HK12/7QzaQGSWIHDZB6ee5
	LqezsTYJMQqbWFlSUx6zBLuzEHBrmoRTSTorzQ3E1KeOaxeiBv2nvwQ90NSd0jjLx/y1YyqZYz3pR
	P5Q29Gu2W79VGpWTzf+U4QID6X4Dr5V1yzWZSdHM+wd746LOdtD/d9DZ3LbAjp7MZMWQv46rgsrgP
	g4ay2cA2u5Pw2X+W5z6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBOp-0000000DkYP-1YM8;
	Wed, 13 Aug 2025 13:20:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umArt-0000000DfZU-0S3d
	for linux-mtd@lists.infradead.org;
	Wed, 13 Aug 2025 12:46:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FF3C41775;
	Wed, 13 Aug 2025 12:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D86EC4CEEB;
	Wed, 13 Aug 2025 12:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755089171;
	bh=ZT0JpTvVCigZnjnkn/I/KbtOHKxQ7IUW9aNh+zCsE6g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HMS66+jHDTZz8nqrxMWaySstee2iZwP7X7bOke9Xus38Cro7xOaOQJHDlyE/VQ9Os
	 cxZhsr9MxtUb3+AROO5A/vDhMzunaX6vKRwgVpDgUF5UV+7KC2xZ6mchaFASBNugeu
	 w6is+Iv5adU3NCKthpqxbm6vxatFISvxsitmIAeCVkCGEF7bDNkEeU3VE3d09AjUHe
	 glUHYG7iy5+PlFS4EF3OWGQimoILktKko9oQRbMd4eDT5xxG3RxguNHyHGCDI7LzBa
	 D5mPHkdei0ENG0jpdD+yNMhzbgMuOhIH7DpsO1OxA918kn3yV98k3Z0QgB885sBemo
	 Vy3BU95hPubeQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Luke Wang <ziniu.wang_1@nxp.com>
Cc: "pratyush@kernel.org" <pratyush@kernel.org>,  "tudor.ambarus@linaro.org"
 <tudor.ambarus@linaro.org>,  "mwalle@kernel.org" <mwalle@kernel.org>,
  "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
  "richard@nod.at" <richard@nod.at>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,  Bough
 Chen <haibo.chen@nxp.com>,  Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: core: avoid odd length/address
 writes in 8D-8D-8D mode
In-Reply-To: <PAXPR04MB85749F748DD87CE41452AEBBED2AA@PAXPR04MB8574.eurprd04.prod.outlook.com>
References: <20250708091646.292-1-ziniu.wang_1@nxp.com>
	<20250708091646.292-2-ziniu.wang_1@nxp.com>
	<PAXPR04MB85749F748DD87CE41452AEBBED2AA@PAXPR04MB8574.eurprd04.prod.outlook.com>
Date: Wed, 13 Aug 2025 14:46:08 +0200
Message-ID: <mafs0jz37wfsf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_054613_163269_9155676E 
X-CRM114-Status: UNSURE (   9.55  )
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

Hi Luke,

On Wed, Aug 13 2025, Luke Wang wrote:

> Gentle ping on this, are there any comments or issues?

I plan to review it this in the next couple weeks (hopefully this one).

>> 
>> On Octal DTR capable flashes like Micron Xcella the writes cannot start
>> or end at an odd address in Octal DTR mode. Extra 0xff bytes need to be
>> appended or prepended to make sure the start address and end address are
>> even. 0xff is used because on NOR flashes a program operation can only
>> flip bits from 1 to 0, not the other way round. 0 to 1 flip needs to
>> happen via erases.
>> 
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> Reviewed-by: Michael Walle <michael@walle.cc>
>> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
