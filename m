Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BD8C30658
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2024 14:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbDv97jET73qO8A7M/47BmQE7cExeR86B38MLyDrL+Y=; b=GuoSmx8iXyJgx+
	4hkZidUpDS6V9UGEPx7vnaGBd7PgomUnWsskFgob1lIzhKX/+43FPkv3JLxdGcQzq3p/5OGYloLOL
	QHKF6OutXJkOiagjdQVmcyRlnzZgbkFoGryVdzoy4HHKIQDYIA74XgMZpgbOLyL2/uZdJG+rRV120
	DfEbm91Q0iK0btLeU4oX0NIlYsjSHmEP0l5wY/FoQzT6b5CZwovDdjjdPTu7qg54CGbFkYNBVsAmo
	imwyzbrqloI1BFMb6rBeP3eG7jjEFnluAx5ulqie9MhQWi8Y3BAKjVNA5SA0QTFiY1uT9Dfwqshcg
	Hnr+OK4x3uuo1VktLf/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOeID-00000006znj-2neZ;
	Tue, 02 Jul 2024 14:15:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOeI4-00000006zmg-3JP3;
	Tue, 02 Jul 2024 14:15:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3735661D50;
	Tue,  2 Jul 2024 14:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE16EC116B1;
	Tue,  2 Jul 2024 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719929727;
	bh=Yj29D4k1LcVn7Ks20rGXW4rvIpFaMTU+k2U6e4btBIQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fp8a4ALqKzJzQAFeAuZkwqCTvJuj0YtIUipMdlDd1rdkIFeKnzJXvTU3ZN0hz7K3I
	 gdGUBWehue5RqVC5hGNOUvvuyOunqynlN5KMwgWGLsZkZ1bjI6ci4xj01PXjke6cF8
	 p/8NbVcc0wZLJ+yL0JRUzNF2LdURmYzmHW6CDju7ahJGwtuuwL4Mzn+Aj/Z1wcz5bH
	 oWLRk0GLRph+pRoW5289upyRK2T1BiUlNsysIDE7Lh88Pb71ZAoYouEyj8x2rrNUUH
	 b1aKcrmm/8bQuL0VWowbIbLBntgCeNZ+kZbpWxKHVFdpLswkkGR7QKvlhrlM+MW3hn
	 NrIInqs3S0POA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Marco Felsch <m.felsch@pengutronix.de>,
  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Arnd Bergmann
 <arnd@arndb.de>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Bartosz Golaszewski <brgl@bgdev.pl>,  Russell King
 <linux@armlinux.org.uk>,  Joel Stanley <joel@jms.id.au>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Shawn Guo <shawnguo@kernel.org>,  Sascha
 Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Vladimir
 Zapolskiy <vz@mleia.com>,  Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Tony Lindgren <tony@atomide.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>,  Magnus Damm
 <magnus.damm@gmail.com>,  Dinh Nguyen <dinguyen@kernel.org>,  Thierry
 Reding <thierry.reding@gmail.com>,  Jonathan Hunter
 <jonathanh@nvidia.com>,  Jonathan =?utf-8?Q?Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>,
  Michael Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin
 <npiggin@gmail.com>,  Christophe Leroy <christophe.leroy@csgroup.eu>,
  "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,  Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Huacai Chen <chenhuacai@kernel.org>,  WANG
 Xuerui <kernel@xen0n.name>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-i2c@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
  imx@lists.linux.dev,  linux-omap@vger.kernel.org,
  linux-renesas-soc@vger.kernel.org,  linux-tegra@vger.kernel.org,
  openbmc@lists.ozlabs.org,  linuxppc-dev@lists.ozlabs.org,
  linux-mips@vger.kernel.org,  loongarch@lists.linux.dev
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
In-Reply-To: <20240702-congenial-vigilant-boar-aeae44@houat> (Maxime Ripard's
	message of "Tue, 2 Jul 2024 15:56:52 +0200")
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
	<20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
	<07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
	<mafs0ikxnykpr.fsf@kernel.org>
	<20240702-congenial-vigilant-boar-aeae44@houat>
Date: Tue, 02 Jul 2024 16:15:20 +0200
Message-ID: <mafs0ed8byj5z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_071528_932995_3EAB3F69 
X-CRM114-Status: GOOD (  18.10  )
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

On Tue, Jul 02 2024, Maxime Ripard wrote:

> On Tue, Jul 02, 2024 at 03:41:52PM GMT, Pratyush Yadav wrote:
>> On Mon, Jul 01 2024, Tudor Ambarus wrote:
>> 
>> > On 7/1/24 2:53 PM, Marco Felsch wrote:
>> >> EEPROMs can become quite large nowadays (>=64K). Exposing such devices
>> >> as single device isn't always sufficient. There may be partitions which
>> >> require different access permissions. Also write access always need to
>> >> to verify the offset.
>> >> 
>> >> Port the current misc/eeprom/at24.c driver to the MTD framework since
>> >> EEPROMs are memory-technology devices and the framework already supports
>> >
>> > I was under the impression that MTD devices are tightly coupled by erase
>> > blocks. But then we see MTD_NO_ERASE, so what are MTD devices after all?
>> 
>> I was curious as well so I did some digging.
>> 
[...]
>> 
>> I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting adding
>> EEPROMs to MTD [1]. The main purpose would have been unifying the EEPROM
>> drivers under a single interface. I am not sure what came of it though,
>> since I can't find any patches that followed up with the proposal.
>
> That discussion led to drivers/nvmem after I started to work on
> some early prototype, and Srinivas took over that work.

So would you say it is better for EEPROM drivers to use nvmem instead of
moving under MTD?

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
