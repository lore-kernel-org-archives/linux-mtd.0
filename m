Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F77C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 11:57:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1825C60ED3
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 11:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1825C60ED3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQ9KSnkB30stEwtEQhmO9ko+GnHg64G/LkcKD89m47o=; b=fwqrcu76zMhB7E9xEuGdzzhkXo
	XcdMvY+usJBCwlOBTUU85i2zWbKRJs85CR9p4vwk05W5rSLLId9QTlakCwIK29ewy06GvH7BqN27d
	tcGr1W5KKaym+xqQMCIzmNxl/UvnoZfOxTwCb/NVqblB9f5Qxr374RGtxpaWoA8JZtTAk6POMbcum
	M/mKbaodS7lj63fj0YuZhZnAPRqsEM1vSnxLIWTUhPuLaV8yf8udtVR9MGUhQ3vcNrhlo/UWCsp3Y
	2G6GRMDqR4WrooHO8jqNAkpVJN3SEcpJAF2cuLDz6dlr/d9os1P2SazO8zn9AIaDOzgYzcwTAW7D0
	poiHUQIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmx5C-001aro-Sf; Tue, 16 Nov 2021 11:57:02 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmx4w-001akJ-3O; Tue, 16 Nov 2021 11:56:48 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 825962223E;
 Tue, 16 Nov 2021 12:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1637063800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Wu0Y9gO5QDQ+y+Jno3s9WmDPtFyObjPP3kE3JG1PtI=;
 b=pA2Q74Jkno8Uw2kV4251dhzeBNyeZJ80bGSrRRhOFe4T7FoX7Csc4wp1WALfJWEYghSA/e
 hRz5GhEHtPQZghfD30p6iJgRVsHcBTlx0/7VRt/CAVSOIzmxOEpe4kdtkAXnTtTawRKMce
 WlTOjKrsCOwIRNXuwA71OfAA8ONXEEc=
MIME-Version: 1.0
Date: Tue, 16 Nov 2021 12:56:38 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v3 00/25] mtd: spi-nor: Clean params init
In-Reply-To: <20211116113646.3yjfk3ifatvsimli@ti.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211116113646.3yjfk3ifatvsimli@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0d573205c99133efed42bf82a6a0123c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_035646_358778_1C0D0F68 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-11-16 12:36, schrieb Pratyush Yadav:
> On 29/10/21 08:26PM, Tudor Ambarus wrote:
>> Clean spi_nor_scan() and the flash parameters initialization code.
>> Tested all the flashes from patch set. If someone can test the
>> locking ops on few flashes would be great. It seems that my flashes
>> have the non volatile bits weared out.
>> 
>> This patch set is split from:
>> https://lore.kernel.org/linux-mtd/20210727045222.905056-1-tudor.ambarus@microchip.com/
>> The ID collision series will be set in a dedicated patch set that will
>> depend on this one.
> 
> I generated some random data (4 MiB), erased the flash, wrote the data
> to the flash, read the data back, and compared it with the original
> image. Works fine on Micron MT35XU512ABA, Micron N25Q128A13, Cypress
> S28HS512T.

Ahh btw. I've tested the locking with a custom patch which can dump the
status register. Haven't posted that yet, because it still uses sysfs 
and
I was thinking of converting it to debugfs.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
