Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F272CA553E
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9em3yRITgcI2U2XZ7CMLx7Dazdr93/hICosLmwd6rU=; b=gfu/SQ8ZAk2K+d20m0xTF7ZiSL
	/yQM/USOCEQ45uZaWOhL/vEWv+pM/xV1PHTuSwhJIxWIrH789VLeNOMPASofeo7F9+2otFl+cm6Pv
	76A2h1Yf+jcmEBzfhXERSEg48hpt+wd8pHaZz3IEoTxnzKp2EJN7pWUajwRRf4X+5N2osSGfEGqoD
	dZPyTgTw751Rz3tK3S/pWwuVDu6la0h9ULY0RFn3TqaMft7DYQNmJzU65MpGQJGticKXAUtIr+vnz
	JUsoUzXX/y6H4YnC/zzvj3zA3aT3NZrBT/RrkcpQ0SJDk8D7S/RA88C3+2mH7ixynBW+YKkyZMLIo
	AdRyDGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmDm-008QrX-0k;
	Thu, 14 Sep 2023 13:17:26 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmDj-008QrA-1c
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 13:17:25 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C014BF84;
	Thu, 14 Sep 2023 15:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1694697440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ExZh8arWjoLAqWaYBfj+NhGvaG2asTtrVaWvVhRaGmQ=;
	b=NPDfwE0jfBgGTpaoOvfxV8yahVzA2Raq3ydqZhb9uhfIatume++5WYCm737NL6O+46GBRl
	NEmepH9oYoYbBji7/6wUiO6OIhj52jmqs+2yWcwmmlbLuwVOMooYrFaoLGxzzgZAidYpU6
	Itofr5kE1yUf8lNJEQYB6kV98tTUq0CSVEjZs9zlATynvnnW2l3A2lKtUn0nMZQISsG7if
	UOhl8kZlennpEfgylfyDWMQCr5ybDLgKCp6ekiyEk32YyIqrQKxHfeWNmOyM1DJEQMSe2z
	XMKaNZA/Gqa1nlzU14FLuX6LEXcV6Naz/uZWKH1teZGI9qk8NuNkY4lwYCiDsA==
MIME-Version: 1.0
Date: Thu, 14 Sep 2023 15:17:20 +0200
From: Michael Walle <michael@walle.cc>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>, linux-spi
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] memory: renesas-rpc-if: Fix IO state based on flash type
In-Reply-To: <OS0PR01MB5922AED5B1490E251669F45186F7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230830145835.296690-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV1qvypo1XmHBXV5Q1SHEhksMN3SxgweYxPu+=ZeDmg1A@mail.gmail.com>
 <TYCPR01MB5933571F06789BFF27A8FCC786E6A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <502336e9-2455-f3f6-57d1-807bc4b71f7f@linaro.org>
 <CAMuHMdWO8EdbxXetmc9-2jhZWeX1b_J74O0exo1Q85X9Gbc_SA@mail.gmail.com>
 <20230914105937.4af00bf2@xps-13>
 <CAMuHMdX8Vg2M2K3U_sbAtVk+6VDvL+GNYtbs5FTTRZzRvVGPCQ@mail.gmail.com>
 <20230914111200.6e6832ca@xps-13>
 <CAMuHMdVryt5bTk8HeFMS3NU-4EpQdU3Tf6LiGmGQQ5bVD-Emsg@mail.gmail.com>
 <OS0PR01MB5922B4BF11D1954DFBE2976F86F7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUA23VxkK-8CebyqiF=Oe81QZgpEmWmMrMGVd_+BXfsLA@mail.gmail.com>
 <737c6865703b8e294601d86a911691da@walle.cc>
 <OS0PR01MB5922A4F16DE8923373AA5DD886F7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <41a960b2a039ab88cb8a6ed6ed21e067@walle.cc>
 <OS0PR01MB5922AED5B1490E251669F45186F7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Message-ID: <9bf6cf6f104145080d38c8658000c24b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_061723_714383_A094EC6C 
X-CRM114-Status: GOOD (  24.46  )
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

>> >> >> > I'm not sure we can do that, as this code is part of the
>> >> >> > hardware initialization during probing.
>> >> >> > Biju: is this needed that early, or can it be done later, after
>> >> >> > the connected device has been identified?
>> >> >>
>> >> >> I need to check that.
>> >> >>
>> >> >> You mean patch drivers/spi/spi-rpc-if.c to identify the flash type
>> >> >> from sfdp info and pass as a parameter to rpcif_hw_init??
>> >> >
>> >> > Something like that.
>> >> >
>> >> > That configuration should be saved somewhere, as rpcif_hw_init() is
>> >> > also called from rpcif_resume(), and when recovering from an error
>> >> > in rpcif_manual_xfer().
>> >>
>> >> I'm not sure I follow everything here, but apparently you want to set
>> >> the mode of the I/O pins of the controller, right? Shouldn't that
>> >> depend on the spi-mem mode, i.e. the buswidth? Certainly not on the
>> >> type of flash which is connected to the spi controller.
>> >
>> >
>> > How do you handle the IO states sections mentioned in the HW manual[1]
>> > and [2]?
>> 
>> What do you mean by "IO states" you don't configure anything on the 
>> SPI
>> flash, do you?
>> 
>> I guess you should have to configure your SoC SPI pins in your
>> .exec_op()
>> callback according to the buswidth property.
> 
> Here, same 4-bit tx_mode IO pin (QSPIn_IO0 Fixed Value for 1-bit Size)
> to be configured based on flash type and bus width right?

Just bus width. There should be no dependency on the flash type.


> For eg: here Adesto flash requires HI-Z for IO3 pin and Micron flash
> requires setting "1" for IO3 pin for 4-bit mode to work.

That is odd. You'd need to ask Micron, but I assume it is because
IO3 is shared with hold# and reset#. And there is a note "For pin
configurations that share the DQ3 pin with RESET#, the RESET#
functionality is disabled in QIO-SPI mode". So I guess the reason
why they asking for a '1' is because they don't want to reset the
flash. I'm pretty sure, we don't really support this in linux, so
you'd probably want to disable that feature, i.e. see Table 7,
bit 4. You could also come around this by enabling a pull-up on
that line (assuming the SPI controller 'drives' HiZ during command
phase).


> 
> Have a look at the other spi
>> drivers. I'm not that familiar with the spi controller drivers.
>> 
>> > Without this setting flash detection/ read/write failing with tx in
>> > 4-bit mode.
>> >
>> >  [1] Figure 20: QUAD INPUT/OUTPUT FAST READ - EBh/ECh
>> >
>> >  [2] section 8.14
>> >
>> > https://www.renesas.com/eu/en/document/dst/at25ql128a-datasheet?r=1608
>> > 586
>> 
>> Section 8.14 shows a Read with Quad I/O and the flash will tri-state 
>> the
>> I/O lines during the command and dummy phase and drive them during 
>> data
>> phase (and expect an address from the SoC on all I/Os during address 
>> and
>> mode phase).
> 
> I agree, What about micron flash??
> 
> Cheers,
> Biju

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
