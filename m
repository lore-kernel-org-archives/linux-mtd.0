Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E34C6FA82
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 14:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHo+ZCB5USt9i/54eD+kQQs/ZBlSYS4awya7pT4j92M=; b=xaEJqNIe0cb8RWa1RDm/SotUBF
	cRJT+6Xbi+JiQWFnVRWtSM5s5vRDVEvTosuLZD+0/209WtHWJ90gYKDhgfUZB/R25fV7nAaER6THL
	HGOI9EbJp0ln3DVRSFAR0OAUJ39eeI0y/Y0gPfH215+HK8luxqgCDvjZKwbZMQbnM4bJheeI1u0Gw
	gQlcl2+yMnifojc24wkQkGmc23hhkQ+SWoPbC5x2xQm+EJoprmsYAX5dY/u1ErcYUlh+Ezx/wGhwv
	sDv3jB8g9K1I18dl/SnUTkLvZLcVkpQXCpLwotkf7wOI3AvohnV0ak7zm5gKzAmBR98vckYTUri5Q
	CypQL13w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMwP-00FugI-8j; Thu, 22 Sep 2022 14:12:37 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMwL-00FuZR-KH
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 14:12:35 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 9083E1250;
	Thu, 22 Sep 2022 16:12:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1663855937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QIsv+BbhZoeuovYf1nI8eVyX90SqlFsQIlOqpsl4IT4=;
	b=rRw0aqU2xKs3+ZiP7Y7b9Fb+tEONSHE/GKl9EII0hN7QwyHYFALh0Y0x0whyi8QobG1Un5
	L1FZiO3kgmJGMiBdnn7NQP2ZiL2rs1RNGmt55q7IgcUp6uEJKm3csSI/NuSb8qopSqZhR0
	UDjT8/W0ef/RiruM2g9KTjBUpqChSTpEovv/i3ymrFtMgUkFya9vZ3ItfhesMyfuvLW3fB
	LfCBmVmCeDyi5th/Uk+uFrkEr8iheX61HI2m99LvBElB1wym/Z20q+W2O+k9EoKG4VNIfh
	0i3R1cG5ASub0xh5MTj29aKhZeNp/sve+xnJ/I1jcSCL7bLzQmi/s68q/pY2kw==
MIME-Version: 1.0
Date: Thu, 22 Sep 2022 16:12:17 +0200
From: Michael Walle <michael@walle.cc>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>, Hongyu Ning <hongyu.ning@intel.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Revert "mtd: spi-nor: core: Return error code from
 set_4byte_addr_mode()"
In-Reply-To: <20220922134824.46758-1-mika.westerberg@linux.intel.com>
References: <20220922134824.46758-1-mika.westerberg@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <a383698ae4a8e400f4961da5cc42663c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_071233_870604_8CE2A65D 
X-CRM114-Status: UNSURE (   7.32  )
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

Am 2022-09-22 15:48, schrieb Mika Westerberg:
> This reverts commit 08412e72afba3a2daef3e7f3378c3753255a0017.
> 
> The Intel SPI-NOR controller does not support this opcode so the driver
> ends up returning -EOPNOTSUPP and that makes the SPI flash chip probe
> fail like this:
> 
>   [ 12.291082] spi-nor: probe of spi0.0 failed with error -524
> 
> Whereas previously it worked just fine (and hence the return value
> probably was ignored in the first place).

Can't we just ignore that return code then?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
