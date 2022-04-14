Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CC4C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 09:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0jO6nWVkQVorfjQHJD9427K+KW1uipW22vDHVtxcp8=; b=Np/rWi0mC36GWwcUb33AC+45NP
	th72EJxWTT7/DHsRVHYMFTiGk/Z8Yfg6pJI00H85Tz+2E9p1bpI+WFSLpRf5Axb4OFn3rxUtkT4VJ
	0bXvw8arVAbvqQyhLG74gqknpn4RlqGQitkWu1AZ9430O3OUajJeCcO0N06wTfS3HMwXHUyyWgAJg
	vmbLYDIXL616ZN0MCYBS8GxozerKY/3mK2fUmuV9f6Phu/Jgqd+MGg+GkYg7BkPu0bv5TO2s0x0c7
	OOC95269KFLfXoGuIuDxI1z5MPj370adF3KbUBUnc+Ljn1RwLwArIRrevt2SqUL9rRAOyKp4e0X4Q
	vvJwj20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nevUJ-004mlp-Pu; Thu, 14 Apr 2022 09:10:03 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nevQI-004l0a-6m
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 09:05:55 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 98D4522248;
 Thu, 14 Apr 2022 11:05:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1649927152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZn4yeEtJfu31q4sHyEIHWwLWvwhYu1ql+ooBCPiES8=;
 b=fDiQDkfMEpy6IN9DTmjvCCvbGW8dfhDoEYdWI9Z5+BvT3APJL+LhpkmrKMCxVg+1UkV1s6
 9VjWdL8fK3K4XuKjpXvU57r1bvgtVv9S9VTmPSD4k2Qy1rR4HZfk/BCxm2tzscLxr5V1qt
 9IqlXUv+Lqe+bLV47TwXh2KA+x+AWlA=
MIME-Version: 1.0
Date: Thu, 14 Apr 2022 11:05:52 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: Parse BFPT to determine the 4-Byte
 Address Mode methods
In-Reply-To: <63b485a1e48d3116f8f49cc427049f81@walle.cc>
References: <20220411125346.118274-1-tudor.ambarus@microchip.com>
 <20220411125346.118274-2-tudor.ambarus@microchip.com>
 <63b485a1e48d3116f8f49cc427049f81@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <a9fe08f91fcb58d216bcf3b2a6f77792@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_020554_460683_F86288E9 
X-CRM114-Status: UNSURE (   4.47  )
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

>> +		params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
> 
> Shouldn't this be getting a neutral name? The quad_enable methods
> were renamed once, too.

Scrap that, I see it is done in patch 2.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
