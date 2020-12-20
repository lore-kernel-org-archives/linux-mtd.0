Return-Path: <SRS0=mmHb=FY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CF5C4361B
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Dec 2020 15:37:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CDFF22DFA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Dec 2020 15:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CDFF22DFA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=biot.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zGi96edikn3kPNzQTvO57hmV73/95j8CR6mzV8YFVHY=; b=XvTE5Pn1zS5FohpW23F8utjDQ
	6KtcBVSwPzQK+0apoIxlHtHJhGP8aGJyubuwaot0JktKxCVTKWJqbOagA7OtqqOD+e02Xu/wIhn6D
	+xwCrOAJc6/HQ7mJSc3NBHPZ42sEuwNN/rg7DhDPnBUdfZFql6rSx1S+V0HSHhdsxqfPorbOPe9qi
	uQv4wV6djhg2S6YpD00EmubvrkOEUQR2kXi6Ly/ak1zspq4RakiCJOWNXfEEP4LNsa2w4w+9FieyQ
	G187H0A1hwEX1+ObkSCEetW1eFds6JBDl0kYbDU0HGm4FvNUT8ghW+a5RGODVJvWCB4fwaeqCzItL
	c8XWA9vKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kr0kk-0004D4-34; Sun, 20 Dec 2020 15:36:10 +0000
Received: from yawp.biot.com ([2a01:4f8:10a:8e::fce2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kr0kg-0004CZ-TT
 for linux-mtd@lists.infradead.org; Sun, 20 Dec 2020 15:36:08 +0000
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
 (envelope-from <bert@biot.com>) id 1kr0kb-008r8N-Bq
 for linux-mtd@lists.infradead.org; Sun, 20 Dec 2020 16:36:01 +0100
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8]
 by yawp.biot.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <bert@biot.com>)
 id 1kr0kb-008r8J-6X; Sun, 20 Dec 2020 16:36:01 +0100
Subject: Re: [PATCH] Add spi-nor driver for Realtek RTL838x/RTL839x switch SoCs
To: Chuanhong Guo <gch981213@gmail.com>
References: <20201215214656.649896-1-bert@biot.com>
 <410ca5c2-96a0-ffd0-e1c0-316fe37ff4d5@microchip.com>
 <faaa83e9-e702-abfc-e298-fda1fa224b69@biot.com>
 <CAJsYDVLEggVBAm2zXe1V7jeAAwXACHrEj6UgiL9Wc-cNq=Zuww@mail.gmail.com>
From: Bert Vermeulen <bert@biot.com>
Message-ID: <df136529-67aa-fdbd-5283-c5924d3e9b17@biot.com>
Date: Sun, 20 Dec 2020 16:36:00 +0100
MIME-Version: 1.0
In-Reply-To: <CAJsYDVLEggVBAm2zXe1V7jeAAwXACHrEj6UgiL9Wc-cNq=Zuww@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_103607_058122_698AA3D1 
X-CRM114-Status: GOOD (  17.90  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, john.garry@huawei.com,
 open list <linux-kernel@vger.kernel.org>,
 vadivel.muruganx.ramuthevar@linux.intel.com, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/20/20 9:51 AM, Chuanhong Guo wrote:
> Hi!
> 
> On Sun, Dec 20, 2020 at 7:01 AM Bert Vermeulen <bert@biot.com> wrote:
>>
>> On 12/16/20 9:30 AM, Tudor.Ambarus@microchip.com wrote:
>> > On 12/15/20 11:46 PM, Bert Vermeulen wrote:
>> >> This driver supports the spiflash core in all RTL838x/RTL839x SoCs,
>> >> and likely some older models as well (RTL8196C).
>> >>
>> > Can we use SPIMEM and move this under drivers/spi/ instead?
>>
>> I wasn't aware spimem was the thing to use for new drivers. I will rewrite
>> the driver to that API.
> 
> Are there any limitations preventing this from being implemented as a
> generic SPI controller?
> spi-nor and spi-mem are designed for controllers which can only perform
> spi-mem/spi-nor specific transfers. I can't find such limitations from
> your current driver code.
 >
 > BTW I found a SPI controller driver for RTL8196C here: [0]
 > It seems pretty similar to the controller you are working on.
 >
 > [0]: 
https://github.com/hackpascal/lede-rtl8196c/blob/realtek/target/linux/realtek/files/drivers/spi/spi-realtek.c

The SoC's SPI core is very much intended for SPI flash use only, and indeed 
we haven't come across anything else connected to that SPI bus in dozens of 
devices.

I wrote my driver based on Realtek code and a datasheet for the (older) 
RTL8196C found floating around the net, and found no inconsistencies.

I hadn't seen that RTL8196C driver, but if it works that proves a plain SPI 
driver will do. I'll investigate.


-- 
Bert Vermeulen
bert@biot.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
