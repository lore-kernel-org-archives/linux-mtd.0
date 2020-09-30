Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E020C4727E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 13:05:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B620820709
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 13:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o7Z1Age3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yadro.com header.i=@yadro.com header.b="DzYrn8U4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B620820709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yadro.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9FEk0eiO1Mp3/a+qDMsRgtdsm05IOMwOpgVfhbhl7UQ=; b=o7Z1Age3lS2fafiiUzae+IqGz
	9FcU+TYTzFIbU0DeTrZvhZUwo+Ih7HjBlpcPHyk8iFFywPQobatU+6nqYnb6u1oM2g9z7oYW6DZ9s
	2Uq3PabviM2Y5z4jk4ip+bZSXv5BLck9c7GHrBr2aOjUHfifMuciGh589vbYhr9Kf0WbfsyG3njdj
	jGFZurxU1RmerHCuOEgvUPzYH1jh97a7p7kJO+Y3FI0bvvIP/+ek48bk48YcPyauaDCWorPDmbT87
	KjMxLE1w560o9WDkpjF+l65Vkh/+H5k5ZWf4Yman6lXjQgveWLlPAL7sSOhRp44I6mbS9yID3TS+g
	vk1dmh3bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNbmE-0005hJ-OF; Wed, 30 Sep 2020 13:04:10 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNbmA-0005fC-Cm
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 13:04:08 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id E7FD14130F;
 Wed, 30 Sep 2020 13:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1601471040; x=1603285441; bh=njVa9cplwqkKacO5snuH36/Bo
 YnsXd9WkIp7KVh22W4=; b=DzYrn8U4Ujk/W1+h6DsWmSjEeguylOsSX2hS2dMPA
 4ePHPgmlTkpCQF+NH1q3Iw+7GyPrYCJ6eCIYl8MAwTRX/RdYCn0BPQ88qWRQfk/T
 bD3pdGK35uKUIu0XgL88EZpNNjKCoB6unKJ5qvJnAxbqgKDY2XFzTJwtfcoeHV3B
 +U=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvIGsKiEPSWw; Wed, 30 Sep 2020 16:04:00 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C084041207;
 Wed, 30 Sep 2020 16:04:00 +0300 (MSK)
Received: from localhost.localdomain (10.199.2.122) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 30 Sep 2020 16:04:00 +0300
Message-ID: <4a5945534f7b41cb799c044ec8c9d31c61d5beda.camel@yadro.com>
Subject: Re: [RESEND PATCH 1/2] mtd: spi-nor: do not touch TB bit without
 SPI_NOR_HAS_TB
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Date: Wed, 30 Sep 2020 16:07:53 +0300
In-Reply-To: <9bfb10df-64d8-4a5e-b0ad-a8b5f4efc56f@ti.com>
References: <20200921112450.4824-1-i.mikhaylov@yadro.com>
 <20200921112450.4824-2-i.mikhaylov@yadro.com>
 <9bfb10df-64d8-4a5e-b0ad-a8b5f4efc56f@ti.com>
Organization: YADRO
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
X-Originating-IP: [10.199.2.122]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_090406_632736_9143A97B 
X-CRM114-Status: GOOD (  14.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-09-30 at 15:06 +0530, Vignesh Raghavendra wrote:
> 
> On 9/21/20 4:54 PM, Ivan Mikhaylov wrote:
> > Some chips like macronix don't have TB(Top/Bottom protection)
> > bit in the status register. Do not write tb_mask inside status
> > register, unless SPI_NOR_HAS_TB is present for the chip.
> > 
> 
> Not entirely accurate.. Macronix chips have TB bit in config register
> and is OTP and hence should not be touched ideally...
> 
> You still need to "read" that bit to determine actual scheme (Top vs
> Bottom). This is needs to be done before 2/2 enables SPI_NOR_HAS_LOCK
> flag for macronix flashes.

Vignesh, that's the point about this commit to generalize this part about TB bit
plus there is already exist SPI_NOR_HAS_TB flag which representing state of TB
existence. I didn't add any support for macronix's TB bit, that's true but
that's enough to make macronix chips able to use lock mechanism with default
'use_top' or any other chips which doesn't have TB bit.

> I guess macronix does not support SR_SRWD right? This needs special
> treatment as well.

It does support SR_SRWD as well. No need any special treatment here.

Thanks.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
