Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD064C4727C
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 16:19:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37E0420708
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 16:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aI96+nmN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yadro.com header.i=@yadro.com header.b="TnVKoem5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37E0420708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yadro.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fciChr5l/A8j1LJI2ktAoGgc0JIdOhv5eP/gZgzYWX4=; b=aI96+nmNpbaZzVlrsJ+Zdzxsd
	4Wo52EfYFOXmbLNqm+rVK3OapbAdawwSNjbOU4JaCQzjEfSNDN8wSz0okJW78NP3wTYIPaCQn8XO3
	JU+Px3MlAtEvlRUXSOgTLiSrnyDwypFP7MIdKXaogM1lQSvVRfPkOg2FteiV6SJbLr2MU+0Xw3Keq
	NIWYude7MqbxakK/wmGJQ8ysZ73jb+n/YcmGTha3+zjVVeY01Zy52QLbsvLp/5tuTuTR/VlE6tBVO
	OPWcpUpVW5lUfDqQFYWtpMDPh0OwtIuEiMv5WiqZmMdemVXSLkUdYHYL7ykCKuOI/+gMnHPg/UtyO
	1wgLM2tQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNeom-0001zb-70; Wed, 30 Sep 2020 16:19:00 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNeoi-0001yN-3M
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 16:18:57 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A26AD41304;
 Wed, 30 Sep 2020 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1601482732; x=1603297133; bh=BaLuW/JZFO3VU5hu0YrWImsNB
 z/UdPmOUw6h808shmY=; b=TnVKoem5KMWup9u/DFo59aZHTADOJgEfWYHjbVLkB
 uPgYKjMYPq99Uix48euP14d4ZYek0j0NccsIE/8ESKz2AicikRCrr48v4OcxmhS1
 N6ipQbPmnZJvy4glp1rrFJA6G/O4kVo2+ivkxAeq6x0V5BIjyPwDb2BAMETQrLw+
 Ro=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xz0a6kCL6vTL; Wed, 30 Sep 2020 19:18:52 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 79A3C4125E;
 Wed, 30 Sep 2020 19:18:51 +0300 (MSK)
Received: from localhost.localdomain (10.199.2.78) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 30
 Sep 2020 19:18:50 +0300
Message-ID: <ff66efae07b4b97ac5f891e6b37c348105dc17db.camel@yadro.com>
Subject: Re: [RESEND PATCH 1/2] mtd: spi-nor: do not touch TB bit without
 SPI_NOR_HAS_TB
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Date: Wed, 30 Sep 2020 19:22:45 +0300
In-Reply-To: <758b2772-3c44-1184-066e-df890d05a21a@ti.com>
References: <20200921112450.4824-1-i.mikhaylov@yadro.com>
 <20200921112450.4824-2-i.mikhaylov@yadro.com>
 <9bfb10df-64d8-4a5e-b0ad-a8b5f4efc56f@ti.com>
 <4a5945534f7b41cb799c044ec8c9d31c61d5beda.camel@yadro.com>
 <758b2772-3c44-1184-066e-df890d05a21a@ti.com>
Organization: YADRO
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
X-Originating-IP: [10.199.2.78]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_121856_502510_9B8BF117 
X-CRM114-Status: GOOD (  28.36  )
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

On Wed, 2020-09-30 at 19:30 +0530, Vignesh Raghavendra wrote:
> 
> On 9/30/20 6:37 PM, Ivan Mikhaylov wrote:
> > On Wed, 2020-09-30 at 15:06 +0530, Vignesh Raghavendra wrote:
> > > On 9/21/20 4:54 PM, Ivan Mikhaylov wrote:
> > > > Some chips like macronix don't have TB(Top/Bottom protection)
> > > > bit in the status register. Do not write tb_mask inside status
> > > > register, unless SPI_NOR_HAS_TB is present for the chip.
> > > > 
> > > 
> > > Not entirely accurate.. Macronix chips have TB bit in config register
> > > and is OTP and hence should not be touched ideally...
> > > 
> > > You still need to "read" that bit to determine actual scheme (Top vs
> > > Bottom). This is needs to be done before 2/2 enables SPI_NOR_HAS_LOCK
> > > flag for macronix flashes.
> > 
> > Vignesh, that's the point about this commit to generalize this part about TB
> > bit
> > plus there is already exist SPI_NOR_HAS_TB flag which representing state of
> > TB
> > existence. I didn't add any support for macronix's TB bit, that's true but
> > that's enough to make macronix chips able to use lock mechanism with default
> > 'use_top' or any other chips which doesn't have TB bit.
> 
> Right, but 2/2 "enables" locking mechanism for Macronix flashes. Therefore
> its 
> necessary to take TB bit into account so that implementation is correct. 
> What if OTP bit is set as "use_bottom"? Although this is non default, 
> we need to take care of this case for correctness.

Maybe wording of my commit message is incorrect, let's try to think about this
commit without macronix words in it. What do you think? Just additional patch
for control TB writes.

mtd: spi-nor: do not touch TB bit without SPI_NOR_HAS_TB
    
Do not write tb_mask inside status register, unless SPI_NOR_HAS_TB is   		
present for the chip.

If we talking from OTP point for Macronix then in this case better way to make
lock/unlock inside macronix.c which brings a lot of copypaste. I'll try to
rework it.

> > > I guess macronix does not support SR_SRWD right? This needs special
> > > treatment as well.
> > 
> > It does support SR_SRWD as well. No need any special treatment here.
> > 
> 
> I did not find it in one Macronix datasheet at least:
> https://www.macronix.com/Lists/Datasheet/Attachments/7902/MX25L25673G,%203V,%20256Mb,%20v1.6.pdf
> 
> Are you sure all Macronix flashes support SRWD?
> 

No, I'm not sure, I did it more than month ago and I've checked BP0-X bits +
SRWD bits in the documentation at this time for whole set of chips in
macronix.c. This one (mx25l25673g) not even listed in macronix.c. Also SRWD was
present there until 1.3 rev for this chip from documentation.

I've noticed one thing also:

	{ "mx25l51245g", INFO(0xc2201a, 0, 64 * 1024, 1024,
			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
			      SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
			      SPI_NOR_4BIT_BP) },
	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024,
			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
			      SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
			      SPI_NOR_4BIT_BP) },

mx25l51245g and mx66l51235l have same id and different flags(SECT_4K).
As example if you have mx66l51235l, driver will take mx25l51245g because it
comes first in the chip list. I don't think that's right but I didn't find
information how to distinguish them.

Thanks.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
