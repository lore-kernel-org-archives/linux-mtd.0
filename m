Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D476DC43334
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 09:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbSibhghkKruCxLNj5Atgm6y3UUtxT6/V35u596Ex9E=; b=xIUtpCD1DcU7rlB+lPusIzol/1
	lQdy25ZGWMAe3KRvZh95LSGw7IW93sr2pwZA6HfpGybAZQniiO21oNre/onq63iCDTN58K4XjawxN
	V6zJmgrb7taTNuAKeecaloZV2nXzjFeZRbYuxzhpM0QL/LQGa1aGwrVtauj++DxwFIXJC6vT0S21H
	NhfOZ2JljNZovZIsEihyAbOIZrzjNuuKh3FlR3CY3ruwckdzLcn1D6sxeVpmskbJFxdyT3ggoTjXe
	xQ7F9VxCwNmGMaLrCYuBBLauGbRbUwn14IOFt2rSPFHch48RU6zmuibTaLR7x0QzONyhlf+ClQGsP
	3ZG6ozVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESih-003Sdg-Ql; Thu, 21 Jul 2022 09:43:48 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESi8-003SN7-96; Thu, 21 Jul 2022 09:43:13 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id EC82122175;
	Thu, 21 Jul 2022 11:43:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658396586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mNJ/p8jstTxRfpudoG/DkUzSGNs3GG/SV5IaUBqPKco=;
	b=oChbOp8IDGLYp+le+G8yPLjmys+doZglgTbQSSXwBYM3+slfcXilJbDVwSB6gSQ4jg2qbF
	vM1l9Bp3Z5oTq4AaKmZUxvNbbHbPpZQ+MTyGkLqP781GQ8xayg+ijNBgchJsfPYZen9Amq
	sMH9sFmjL8evbIGuem1J+tVt+GAykKM=
MIME-Version: 1.0
Date: Thu, 21 Jul 2022 11:43:04 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: biju.das.jz@bp.renesas.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, Claudiu.Beznea@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 geert+renesas@glider.be, Chris.Paterson2@renesas.com,
 biju.das@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
In-Reply-To: <785e50c4-3c8c-a1a6-de60-4587aef820a8@microchip.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
 <7aa7de93-23f0-c94a-bfc3-e79321cdc1f9@microchip.com>
 <OS0PR01MB5922F0D52EACD4686768117686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <785e50c4-3c8c-a1a6-de60-4587aef820a8@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <2335e23aff8406e959d1d14cecb2d6a1@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_024312_519174_411ECA48 
X-CRM114-Status: UNSURE (   6.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-07-21 11:39, schrieb Tudor.Ambarus@microchip.com:
>> cat 
>> /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
>> 1f42181f4218
>> 
>> This result is not matching 1f4218->1f42181f4218
> 
> here it looks like the ID is sent twice.

That is expected. We don't know how long the id is so
SPI_NOR_MAX_ID_LEN bytes are read for now.
Some flashes will send additional information, some don't and
just repeat the pattern.

It's up to the userspace to interpret that.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
