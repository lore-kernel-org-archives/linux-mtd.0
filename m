Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C432FC43334
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaZQu2NbguTglCASZDdwYg9/WlnojEnACPDJmFrz3QM=; b=f+OBwqocvSe/w2q98F7a501d4h
	Ywdd5h/ltndgDLejlUEEQAuGh13TPPEzRo8qpwYHDT4dzu7t93F1WraLGUmqumR4LCmYSpD2pm0Jw
	fDQxOSeQclvbHQIEQF3AN5VbNnRRETmpp9CDi0FIk4Zax0vVtdrTH/W1WVJdH/hMOD4LbtXyJBvnn
	rRKapTDXP7xLpzNqXsoQt7uJaV8t5gt523yN3Bwnf/JTcewtmKtqhL44oAEOOCgmB/QoQYYAEVCuO
	A4jB4aMYnh35JfKSRUPvB4VeUag+FP8m60jDEccHkC3pZ4uR9G4LODJGvUNfZ4oxIQ4ELZNeVqEHj
	j6bfDIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oET5R-003g37-Iy; Thu, 21 Jul 2022 10:07:17 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESyq-003bOk-3q; Thu, 21 Jul 2022 10:00:29 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 900CE22248;
	Thu, 21 Jul 2022 12:00:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658397626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v2W2nucsH56c4FQn1IU47owA/fk5A66k5whSo+WIdAY=;
	b=slgCREFYcphjLyvOjX8eVrfmuGLiN6G7rE0oz0OJbd7Zw2JikGjiahDnH5964u1QhMU3TQ
	EzeMVKc9GUmdv57TREX8SLj14bVxKJ+WC87V8jROkZqr6j9YYX8bPy/ZWaJJwMX02ovf4u
	ntd31h3jagxxEpTWqtrw83khUKb3hQA=
MIME-Version: 1.0
Date: Thu, 21 Jul 2022 12:00:25 +0200
From: Michael Walle <michael@walle.cc>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tudor.Ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, Claudiu.Beznea@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 geert+renesas@glider.be, Chris Paterson <Chris.Paterson2@renesas.com>,
 biju.das@bp.renesas.com, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
In-Reply-To: <OS0PR01MB59221FE257A0E06F225AB6B686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
 <7aa7de93-23f0-c94a-bfc3-e79321cdc1f9@microchip.com>
 <OS0PR01MB5922F0D52EACD4686768117686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <785e50c4-3c8c-a1a6-de60-4587aef820a8@microchip.com>
 <OS0PR01MB59221FE257A0E06F225AB6B686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <dbf2931656904b9b5e18702f27a11b1a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_030028_390181_97396489 
X-CRM114-Status: GOOD (  11.72  )
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

Am 2022-07-21 11:46, schrieb Biju Das:

>> > root@smarc-rzg2ul:~#

nice a smarc board :)


>> >
>> > root@smarc-rzg2ul:~# cat
>> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
>> > .0/spi-nor/manufacturer
>> > cat:
>> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
>> > .0/spi-nor/manufacturer: No such file or directory
>> >
>> > This result is not matching atmel-> cat:
>> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
>> > .0/spi-nor/manufacturer: No such file or directory
>> 
>> here we could introduce a generic name as well.
> 
> OK.
> 
> Michael: Do you have any plan to add generic name for manufacturer
> as completeness?

Why would we need that one? There is no manufacturer. So I don't
see why we should add a fake one. The partname is debatable, too.
IMHO if we really want to get rid of the "dummy" tables in the kernel,
the userspace (mtdutils for example) could parse the jedec id and
sfdp and find the manufacturer and partnumer. But TBH, I don't know
if that is really an important information.

Implementation wise, right now, it's quite a hack how the
manufacturer is set. It gets already set early in
spi_nor_match_name(), while the actual flash info will get set
later in the call chain.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
