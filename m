Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AE4C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 12:38:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0A4761075
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 12:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0A4761075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQ+9+bivNhmnOn++tojbFDvvjLINo6DPqkWmZ9g7GS8=; b=TR7FjZt1Ic+UKlNmAuJWtm6S2A
	UXx7H5I27/trXCIJMyewCV+DOSyCDKXLG1bvoFdHWTbpb767FYok0dv61aAeZRmpFmN75mh4T66P/
	rbd2E7IO5C0Zd0p+uPtxeYKkupjZmOOwV2Ehgy6YvHakqiQLZFeOUA/r9tme4mMU22DDEb1R2adwq
	c+oXE8q4OJYtpXldtr06wlUYcDDc+GUvAa4ULkJzGp91fYaH5IQ9meADbcAV2zUqvQMu8YouuQV+a
	SsQPqKG3rUbHxbkjfdPNQSY4Vf6jVJm7soNEqQYLsfZRN5Bp9niRT7HA81jG/unTIsonIlyi/USW/
	XIiZG80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQNX-0023pD-Ix; Tue, 09 Nov 2021 12:37:31 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQNG-0023mS-OW; Tue, 09 Nov 2021 12:37:16 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B45C922246;
 Tue,  9 Nov 2021 13:37:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636461432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u57bZfUqg0fthdr9Ilh5RE4BZjuKqcpT8rvE173dRAw=;
 b=laPy2J73fBG2aomhGm7bvMFHayU/7e6EcgEC2LghPUFL+0Z7J8Kxvq6w4GHU95TOthnJt3
 s5Vi9NVqrNRJwCUOH+GEvPwMYfj+nR57j15bb8PD86z3Dgwi3J+4/PZZc7gWO0QO92mtwY
 RG4QFEKQkL7mJ6WH/6Dau+lsso1M4+s=
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 13:37:11 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3 20/25] mtd: spi-nor: sst: sst26vf064b: Init flash based
 on SFDP
In-Reply-To: <804938ee-9726-8591-0efb-e9ac40a3d5e3@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-21-tudor.ambarus@microchip.com>
 <11ac4016-94ad-39ce-e845-0324543065fa@microchip.com>
 <feebb504a3d6f27061a1e2faadec8fe9@walle.cc>
 <804938ee-9726-8591-0efb-e9ac40a3d5e3@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <bd0c9e472d9151097b7d37d6bdd80f67@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_043715_009389_BB625546 
X-CRM114-Status: UNSURE (   8.51  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-11-09 13:33, schrieb Tudor.Ambarus@microchip.com:

>> xxd please, and md5sum or sha256sum or really any
>> checksum is missing.
>> 
> 
> right, I forgot the checksum.
> Just curious, why do you prefer xxd over hexdump? Does it matter
> which tool we use?

xxd can do the reverse and its easier to get the binary version
of it again. also, if you use hexdump without -C (or -c) I'm not
sure about the endianess.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
