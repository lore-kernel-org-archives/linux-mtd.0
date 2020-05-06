Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC582C28CBC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 09:40:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 941692075E
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 09:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="taKt+3gK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 941692075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnXF+gBThFWBSDC7gZypj7Jq8DBi2M8lGRcW9QY39Bw=; b=taKt+3gKAxcKZA
	NS0SwdyilM8C2KUCa9m2vOwwCro3H5UERuVy3RSRm1PeyU26iCH/qPi9ykovdQjKPSu3DeR5htGie
	NPzHTuzcaH8Gx3LrF6tSI70tw1vjlTLBZivAW8UeG0CJcRWLwQIE+MUlwPH9g2q6Ae3hMUd3EaSx3
	ohf51nkSL78y0lmuRQ2X4yCOXvya2y+JUTWXhxlpeWMsCKTLStoVTLV/84nyZTs0cxm2avBrspMxe
	bMkOOhSQqxuQvHC97QHz6FPElcgw9gVw38slQyTPEKWhd5R9paonrA2eFTvRSpk+3zjzcIzmncaHn
	LKoNtEnu4ebNNrHqfjzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWGXj-00040K-1R; Wed, 06 May 2020 09:40:43 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWGXg-0003yZ-Dd
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 09:40:41 +0000
X-Originating-IP: 42.109.197.213
Received: from localhost (unknown [42.109.197.213])
 (Authenticated sender: me@yadavpratyush.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5B7AC240004;
 Wed,  6 May 2020 09:40:32 +0000 (UTC)
Date: Wed, 6 May 2020 15:10:28 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v2 0/5] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
Message-ID: <20200506094028.2asq56goslfd2ngo@yadavpratyush.com>
References: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
 <20200421092328.129308f6@collabora.com>
 <20200427175536.2mmei2fy6f7bg6jm@yadavpratyush.com>
 <OF18214CA5.6A9B2B30-ON48258558.001D894C-48258558.002249E0@mxic.com.tw>
 <20200428085401.574wmo6qddmumd7q@yadavpratyush.com>
 <OF04289CE2.B346916F-ON48258559.002280BD-48258559.00295800@mxic.com.tw>
 <20200429181856.kkavelcczylg4yxf@yadavpratyush.com>
 <OF28AE0642.4F34D6BB-ON4825855F.002D6E58-4825855F.003458C9@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF28AE0642.4F34D6BB-ON4825855F.002D6E58-4825855F.003458C9@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_024040_597363_C803F184 
X-CRM114-Status: GOOD (  11.49  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 05/05/20 05:31PM, masonccyang@mxic.com.tw wrote:
> Hi Pratyush,
> > > I can't apply your patches to enable xSPI Octal mode for 
> > > mx25uw51245g because your patches set up Octal protocol first and 
> > > then using Octal protocol to write Configuration Register 2(CFG 
> > > Reg2). I think driver
> > > should write CFG Reg2 in SPI 1-1-1 mode (power on state) and make sure
> > > write CFG Reg 2 is success and then setup Octa protocol in the last.
> > 
> > Register writes should work in 1S mode, because nor->reg_proto is only 
> > set _after_ 8D mode is enabled (see spi_nor_octal_dtr_enable()). In 
> > fact, both patch 15 and 16 in my series use register writes in 1S mode.
> 
> but I didn't see driver roll back "nor->read/write_proto = 1" 
> if xxx->octal_dtr_enable() return failed!

I copied what spi_nor_quad_enable() did, and made failure fatal. So if 
xxx->octal_dtr_enable() fails, the probe would fail and the flash would 
be unusable. You can try your hand at a fallback system where you try 
all possible protocols available, but I think that should be a different 
patchset.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
