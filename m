Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAE5C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 12:22:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F3436103D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 12:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F3436103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmu3mAF+lDLdLVkimqzPtXo+36OFz/48N6BZUCTcNbM=; b=OJRrhgc8i3CLDK9zQkA6woKOZ1
	53WZMAFLLI6XHOzQrRqfco1VhqSoEoFoMjL26fvvx10UUGFM01umJbkejIe7OBNquChZEp83XFLsN
	VJOJP+USEuqep54qdQ6fcc3te8vNXV32GUYV7WtZ5WCNEh4Gv2CthPCwUds9ucS0GWww9bOUEnDb4
	tw79GwYf4IZ4TWyrhjhuOkuZs8s/3RFUtuqsUbEHMupd5e437cfkitwLr5M8hH/U79wYlxY46Sla7
	Ie6H6oP3ujtjQ/Cq+Rkn/XWCfMduBsxPKpzyZs9PsUDaC3mfhDvS64ZIePRdXHWtiAiQ/K7u/FTGy
	VQ6DKDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQ8t-0020I1-Ul; Tue, 09 Nov 2021 12:22:24 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQ8O-00205F-6g; Tue, 09 Nov 2021 12:21:54 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 571A122246;
 Tue,  9 Nov 2021 13:21:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636460507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=805mT7S2wWRRIUEs2UBb69pBqwmjdHKYcqp5M5u2g58=;
 b=YItFW4Jm8xqM1JV+BJBQiwwCJCjoNTrCn88NG020qMZ9bNGvygTSJ5s4LM+9XM3RKJIv9P
 45QLemnSkj8XH81Qta8ZCyJYplnS8C0NJsuTEPw8D6jzJG9cv+EtyDUBuvrO3PIRqIqFQs
 LoSmtP//Tbkw/xhD/GbXpvJ/6i9SZvI=
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 13:21:45 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 13/25] mtd: spi-nor: sst: Get rid of SST_WRITE
 flash_info flag
In-Reply-To: <20211029172633.886453-14-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-14-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ef9e5b2e36b37293a8761cd01e334877@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_042152_480850_140AD174 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-10-29 19:26, schrieb Tudor Ambarus:
> The flash_info flags should be generic and not manufacturer specific.
> Get rid of the manufacturer specific flag and use the late_init() fixup
> hook instead.
> Please note that sst_write is now set at flash level and not globally,
> per manufacturer. Manufacturer hooks are generally a bad idea, because
> it affects settings for all the flashes and we might end up with fixups
> for "manufacturer settings".
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

I'm still not sure, if having a just one fixup function will scale with
different flashes. What do you think about having an additional (opaque
to the core) (bit)field for the manufacturer and flash fixups functions?
In this case, you can reuse the same function - and then a manufacturer
will make more sense (addressing Pratyush comment about a common
manufacturer fixup here).

I.e. the SST_WRITE flag would go into these flags, set per flash device
and the fixup can still remain in the manufacturer fixup.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
