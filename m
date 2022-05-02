Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594A9C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 11:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JqMTEBJLe4m90MrynrjOjgj8E1o7lplY5cv0Xcr4pw=; b=OeKWc5FjyPF0EaDynwd9bL8jMC
	nJ46hjUITx087LXME0gDhSqT5rVXo5scHuUV8S1s4hVKQHnpn1R3A5gCzMyztJ0nhraVdj4106NVf
	5lVaxJnAgQPJeIz4mTZAktL4BTC/lsMXjkftvIx5gwhJJu6ENmWXqT4M6MhTthZMingbBF3uFGt7C
	i5cFUbWM4qUZdPVsFqvyD5ExP+JKzlIAA8VjmJ8+Oh6gT1okiO27deEeeQBR9SVB2sNJ8U03JjrnA
	rIjNDby+vz0ySXj2UAyz39ToCHvTiv4x7mgAry150NHo4I/AqmB5lPepwrk0DPuVcLB8fDujPKCtB
	3ddLyAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlUYk-00118a-R5; Mon, 02 May 2022 11:49:46 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlUYe-00116l-FX
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 11:49:41 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 86BC3221D4;
 Mon,  2 May 2022 13:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1651492177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ur3rUNf/yoe4JhaC+IZGMN+I/fhpryB36fehxJDdRUI=;
 b=KeoN5UY1TpDVl7T8/Z1miaHUQsxGs+/mOAcde+TCdCxH3N2nkMOZoTG/ICrBv/f1cWU0Ld
 R8BRS1u9Ef9ZMBJXAVYMnP+E6Gbu3DareURlaQDAGvt5Y+eejpURdhQ4tY6UxKT6cUN2Ut
 rTC8htdVYSkZej1MGFHJFY1I7HjG4Ss=
MIME-Version: 1.0
Date: Mon, 02 May 2022 13:49:36 +0200
From: Michael Walle <michael@walle.cc>
To: biju.das.jz@bp.renesas.com
Cc: Chris.Paterson2@renesas.com, biju.das@bp.renesas.com,
 geert+renesas@glider.be, linux-mtd@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, miquel.raynal@bootlin.com,
 p.yadav@ti.com, prabhakar.mahadev-lad.rj@bp.renesas.com, richard@nod.at,
 tudor.ambarus@microchip.com, vigneshr@ti.com
Subject: Re: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
In-Reply-To: <20220502112934.2433516-1-michael@walle.cc>
References: <20220501185512.51158-1-biju.das.jz@bp.renesas.com>
 <20220502112934.2433516-1-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <b6bbfbcaf6b278112d1f713849460089@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_044940_726513_39FF2208 
X-CRM114-Status: GOOD (  11.07  )
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

Am 2022-05-02 13:29, schrieb Michael Walle:
>>  drivers/mtd/spi-nor/Makefile  |  1 +
>>  drivers/mtd/spi-nor/core.c    |  1 +
>>  drivers/mtd/spi-nor/core.h    |  1 +
>>  drivers/mtd/spi-nor/renesas.c | 57 
>> +++++++++++++++++++++++++++++++++++
> 
> Please put the flash in atmel.c. There are all the Atmel/Adesto/now 
> Renesas
> flashes.
> 
>> +static const struct flash_info renesas_nor_parts[] = {
>> +	{ "at25ql128a", INFO(0x1f4218, 0, 64 * 1024, 256)
>> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
>> +};
> 
> I suppose this flash supports SFDP. Therefore,
> 	{ "at25ql128a", PARSE_SFDP },

The id is missing. Sorry. Seems like we need a new macro.

#define SNOR_ID3(_jedec_id) \
     .id = { \
         ((_jedec_id) >> 16) & 0xff, \
          ((_jedec_id) >> 8) & 0xff, \
           (_jedec_id) & 0xff, \
     } \
     .id_len = 3,

Then it would be
	{ "at25ql128a", SNOR_ID3(0x1f4218) PARSE_SFDP },

Now we'll get bitten by that missing comma (or the additional
comma in the defines).. I'd love to see that one removed, so
we can have the usual declarations:
	{ "at25ql128a", SNOR_ID3(0x1f4218), PARSE_SFDP },

Also it might make sense to have the PARSE_SFDP in the
SNOR_ID3() macro, because without SFDP, that macro cannot
be used. Tudor, Pratyush, what do you think about:

#define SNOR_ID3(_jedec_id) \
     .id = { \
         ((_jedec_id) >> 16) & 0xff, \
          ((_jedec_id) >> 8) & 0xff, \
           (_jedec_id) & 0xff, \
     } \
     .id_len = 3, \
     .parse_sfdp = true


-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
