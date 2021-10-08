Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFBFC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 10:57:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F45160FC1
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 10:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F45160FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tgf4B5wjEySFySN0XWpbGJrUuO3i0hT49e5Gm1ybfMI=; b=25X51EkpNY9Q0N
	CSLqPTZc5VIsf42/mw3ODePDA2HaZAXBinCoj1RsmkZkHEpY/g6cN6Siru9snxJl8LszsLKa2IaEK
	DfGRrE+tfDBL4KlQvJW8UlJ8WqBbeD0nEypDbNS6k+WcLSb5Ll3u1U36miGwlBQpJbwAX7Tspwlvz
	rnUHkxsLzEazRV/YKxhQD5Rpmg1ESv69SpHYsdzgbsNHNdUOy5a/V3q0Ix52f2IrC/51ziVZeEK/x
	MXSP+GnsVuT8dAaCF5/e2oPzk0tGsEjyD2VB9j47wY7fmM7Sl7QkJcwqJ7LuzG42WbYSCM5R0Dk1j
	ohxkQr93FTGJ7zKQN6GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYnYk-002UTQ-6S; Fri, 08 Oct 2021 10:57:02 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYnYh-002USm-EV
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 10:57:00 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 198Auood029695;
 Fri, 8 Oct 2021 05:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633690610;
 bh=ArFZiFrp6owtnFGDAHIUNN5gStk6ygO7vEiH2aBvNT0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=aoakMzHbxpiVf9pZBkuIeZY7D+244sItnzpDom8ddlIeOyOZ7k9VfY+9ILUw4rjt4
 DSFdWkgUsD57OJOMMl7F76kcr0bDG146I53ug0sSSfWJUWANbaHk43lkgoWfIDoLwM
 Ko7UfPJI6A9gV5XDX2UBmqehcnx6FZTXlmHSDeYw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 198AuoB7017392
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 8 Oct 2021 05:56:50 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 8
 Oct 2021 05:56:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 8 Oct 2021 05:56:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 198Aun4B003702;
 Fri, 8 Oct 2021 05:56:50 -0500
Date: Fri, 8 Oct 2021 16:26:48 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <20211008105646.ity7isvuum4yyvpj@ti.com>
References: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
 <20210930100719.2176-3-mika.westerberg@linux.intel.com>
 <20211004095239.dyowgkyq5lnfdag2@ti.com> <YVrSbyEsSLMOu1bU@lahna>
 <20211007123621.ld4aqasr3hlwq2c7@ti.com> <YV8kVKiMShWp4g7a@lahna>
 <20211007180029.6agt43vyiwpcgmjz@ti.com> <YWAJJLST7KYAD6Fw@lahna>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YWAJJLST7KYAD6Fw@lahna>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_035659_654381_9240D82B 
X-CRM114-Status: GOOD (  24.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 08/10/21 12:02PM, Mika Westerberg wrote:
> Hi,
> 
> On Thu, Oct 07, 2021 at 11:30:31PM +0530, Pratyush Yadav wrote:
> > > Probably but I would not call these "problems" - it is how the
> > > controller is designed. This one is meant only for SPI-NOR flash access,
> > > typically used by the BIOS. It is by no means general purpose SPI
> > > controller (as you can see from the datasheet). The BIOS does need the
> > > full SPI stack, it just issues these simple commands and let's the
> > > controller figure out what actually needs to be done.
> > 
> > The problem is not the controller itself. It is perfectly fine piece to 
> > have a controller like this IMO. The problem is how do we make it fit 
> > into the SPI MEM model, which seems to be designed for general purpose 
> > controllers only. This problem is shared with this and the Cadence xSPI 
> > controller.
> 
> Fully agree. IMHO trying to shoehorn driver like this into a generic SPI
> subsystem does not make much sense to me. These things can only talk to
> SPI-NOR chips, nothing else.
> 
> Do you have any suggestions how to solve this "problem" so we can move
> forward with the drivers?

No, I unfortunately don't. But I suppose the same problem existed with 
the old driver as well. It ignored nor->read_opcode, etc. and did its 
own thing, so at least I don't expect things to get much worse with the 
SPI MEM model.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
