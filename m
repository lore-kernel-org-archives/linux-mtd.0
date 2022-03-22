Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D6EC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 08:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJDC8jNhH9IvbDPp2jgwRBy7qITzGCz5xj08mMNZUGo=; b=1hXPmSXkoqsUu+A64XilStSC+S
	LYwOAuGobWk7lDQtEUWJ+WZGz0tAzE0ZBhLpWMmopM8hs7mSQMWn7mTEsXPAIOvQmREMDhxER7ThB
	VIad2iXkBeA84V9WBpu2B15f7LDRqWoaYcp0t1Pq7dNk+0aVY7y5Rm90gqYwYsYom15tC/iIybESC
	tcDrlfRi52+HcIk17YpZ2JNsqXv1jEfV+N7ReBjsdUZszWPI4cG5XAvndVLRMz7JQybVSh/OhLdqS
	IW94vcEdcuV8Mysaadm4dvbmEbyhX8Mie8CcL2XWL+54QTmTqc3E3DpOuSxoKtPP61KYo4UgJh/1h
	FpuRC1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWZkC-00AMWb-JO; Tue, 22 Mar 2022 08:19:56 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWZk9-00AMVH-Bt
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 08:19:55 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B891922246;
 Tue, 22 Mar 2022 09:19:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1647937190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zL5MkQsCXafBeEg4aKfiJNR+gU4ZjIQei5uI3xDhyqM=;
 b=IcLe4Q6SWVwEb14ZFt+QiDGekYS+efuPr2YDmu0dM1dZ26WDIPzNzE9jAHEXvVKU/V6qZx
 ufRb3R3h4W9k/w+Q6jiCINPqdzMinTlIoBk7rPpsDg4fF0AK+HKvXKBgRR/2F2G+B1WaL+
 5zBm+Ky2Cu4ry60CQme34joM8k+T830=
MIME-Version: 1.0
Date: Tue, 22 Mar 2022 09:19:49 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH v2 4/8] mtd: spi-nor: core: Introduce method for RDID op
In-Reply-To: <20220322073209.26m2udmftiaxxtcq@ti.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
 <20220228111712.111737-5-tudor.ambarus@microchip.com>
 <0bdbe6ad8f39996df6345bb249e4a2e8@walle.cc>
 <20220322073209.26m2udmftiaxxtcq@ti.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <eca7100c7e6dacd9cb9e18b5bee3e2ab@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_011953_593027_D43FF6D3 
X-CRM114-Status: GOOD (  17.77  )
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

Am 2022-03-22 08:32, schrieb Pratyush Yadav:
> On 21/03/22 11:56PM, Michael Walle wrote:
>> Am 2022-02-28 12:17, schrieb Tudor Ambarus:
>> > RDID is used in the core to auto detect the flash, but also by some
>> > manufacturer drivers that contain flashes that support Octal DTR mode,
>> > so that they can read the flash ID after the switch to Octal DTR was
>> > made
>> > to test if the switch was successful. Introduce a core method for RDID
>> > op
>> > to avoid code duplication.
>> 
>> Some or all? Is that specific to the flash or can we just check that
>> readid works in spi_nor_octal_dtr_enable()? That way we could also
>> just get rid of the proto parameter for the read_id because it can
>> be called after we set the reg_proto.
> 
> It is specific to the flash. Not all flashes support RDID in 8D mode.
> And the RDID command is also different in 8D mode for various flashes.
> For example, Micron MT35XU512ABA flash expects 8 dummy cycles and 0
> address cycles. Cypress S28HS512T expects 4 address cycles and 3 dummy
> cycles.
> 
> The octal_dtr_enable hook would know what parameters to use but it is
> harder for the core to know since this information is not discoverable
> via SFDP.

Ah, I see, thanks for clarification.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
