Return-Path: <SRS0=LGak=CY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6661AC433E2
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 07:48:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01D7421974
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 07:48:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nKbo4Skb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GVQTZFD+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01D7421974
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g1QNFAxVITYFLn7POR4PS9B5Llb5w+SJMHWABjd/9Jk=; b=nKbo4SkbmC+DiG9Hu6+SxjYxA
	STyz8eSsDON6ehn4PUTMg3C4DwIhGwAu3ei0UVnZd2i5OZrSaZEVksAEu/LVZzbGqecgipDOZpBbh
	Va1OE/ryH2Tz8UrG9bzE6tO9LfUqyY9y2gc+iw/VC5fVWfxQIqCXfe6cRqoDch3OpDr3oEl0UZS/p
	ZUPd0oRPG0WuYTnKrzsPTjFSUfx+YUJVrIn+ZRxvaF8NSze8C92S8PeY5WEiDGrng/oXHM2hdFzaK
	2tA954vnOpvumM8prwrV+cZf7sV4HjqySf6TUqlEUwGO3J28LfBOdQsVkqfM5qsn3zay9TAJYyF1o
	ksR/IW47Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI5gl-0003Nl-Fe; Tue, 15 Sep 2020 07:47:43 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI5gj-0003N5-0v
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2020 07:47:42 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08F7lVYV073494;
 Tue, 15 Sep 2020 02:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600156051;
 bh=F1VtgPYhfoDI8XLXkh3ytrJ6AvV5dM/S6p5vJyP8ges=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=GVQTZFD+BngUoXYojAYu820J17/dT+ELcF3Bj0dk45hEKIePkQCuUdVeWFEWmaKuC
 P2zUpcLGJf9ZLfNbJ7vVy2ByHVVwnVbSdkLWUMb4JTYePnx2YppQiHQN9NZHrGde+/
 4M1KTriHvr7l5RwcjWIbHkaDavB1SZpgTNMFJVdk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08F7lV0H096544
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Sep 2020 02:47:31 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Sep 2020 02:47:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Sep 2020 02:47:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08F7lTcF019578;
 Tue, 15 Sep 2020 02:47:30 -0500
Date: Tue, 15 Sep 2020 13:17:29 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v12 00/14] mtd: spi-nor: add xSPI Octal DTR support
Message-ID: <20200915074727.o4drgfgdabhozjb5@ti.com>
References: <20200903171313.18741-1-p.yadav@ti.com>
 <973eac67-fa01-309f-c4d1-7983f404d507@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <973eac67-fa01-309f-c4d1-7983f404d507@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_034741_222413_92FD8B3E 
X-CRM114-Status: GOOD (  18.35  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, "open
 list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 15/09/20 12:16PM, Vignesh Raghavendra wrote:
> 
> 
> On 9/3/20 10:42 PM, Pratyush Yadav wrote:
> > Hi,
> > 
> > This series adds support for Octal DTR flashes in the SPI NOR framework,
> > and then adds hooks for the Cypress Semper and Micron Xcella flashes to
> > allow running them in Octal DTR mode. This series assumes that the flash
> > is handed to the kernel in Legacy SPI mode.
> > 
> > Tested on TI J721E EVM with 1-bit ECC on the Cypress flash.
> > 
> [...]
> 
> Please fix checkpatch issues on patch 1, 3, 4 and 5

I ran checkpatch on my patches based on top of next-20200914 just now. I 
only see issues with patches 3 and 4. Patches 1 and 5 report no issues. 
What problems do you see on patches 1 and 5?

As for patches 3 and 4, the error I see is "ENOTSUPP is not a SUSV4 
error code, prefer EOPNOTSUPP". I left it in intentionally. There a 
couple other functions in SPI NOR that use ENOTSUPP instead of 
EOPNOTSUPP so I followed the local convention.

If you insist, I can add a preparatory patch that first changes those 
uses of ENOTSUPP to EOPNOTSUPP and then update patches 3 and 4 to do the 
same. Let me know.
 
> Otherwise patches look good to me...

Thanks.

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
