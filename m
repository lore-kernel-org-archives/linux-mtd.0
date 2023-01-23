Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A80C54E94
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 15:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Content-ID:MIME-Version:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfeZDbWP/b8ldOrIyAtTnidXvgBGH4JUyhtfWgPU++4=; b=SndBhbTs1qgg3F
	YkXRMd76IPSiYMqz+d0yPuSNuQshrVgZH8xoBZTrqPa3P+0UaMzAZAEDaj7XVNCwzI59RQxnpjLZF
	+LDF+LRmCcmqyZPrS7gVAVQt4IORDj9+USioehdEzQdULeFuRm5aXDc1DwlW9HL8N5BgCOP/oGyIw
	BiF0cc+ODe7YFuLPb8ZOLqLKP2EcBWntgGZCZoQJuCjYeVSDiifh61M4lW9L4mRf/Mh4+ZS70RKuZ
	VMpKidm+b/YdOpsToEhf1yiZmAf6jBdKuaJZ/ag1m30Tq0NH3gMlXbvDgNDSHPrYByRa5T6eUOw7B
	+rFGTivBcd+7YVTS9+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyLc-0003G5-4U; Mon, 23 Jan 2023 15:03:00 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyLY-0003F6-NO
	for linux-mtd@lists.infradead.org; Mon, 23 Jan 2023 15:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674486176; x=1706022176;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version:content-id:
   content-transfer-encoding;
  bh=GEa2wspqr6J3lyPu8fImvpGGVirL3i14PWRHbuLKCRk=;
  b=GyL4LUOXmuRynq0Xb4SFOMvcnfzJHK+DsHL5Mpph0xms4TmM45aqU6tX
   4uZDv8FDjCRXoGBv448axqw5G5w2Xbk4SyrLskMZhPQVD00euEQYzkPSE
   15B1AWfjay1UBTuIRrBv0ITrBlngThxibQNIcHTRWS4XVh6FrosaCgfEd
   mhnFB85RaFex6o1aBisUte/NBi4dx8w3aNK+Mi1tknw0OA8JQIcJDUOAy
   JlrPHykdkY3lya3PyYZdnbH19Mb2uCppjZ8eddJma1PpZKxv3SoCfkG5c
   8+6Vcnco7+ui6SYK36DxR0/4jK1nNDUYvyBPnGYaVKqdUAFfnQ9hQY4Kh
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,239,1669071600"; 
   d="scan'208";a="28595830"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Jan 2023 16:02:46 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 23 Jan 2023 16:02:47 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Mon, 23 Jan 2023 16:02:47 +0100
X-IronPort-AV: E=Sophos;i="5.97,239,1669071600"; 
   d="scan'208";a="28595829"
Received: from vmail01.tq-net.de ([10.150.72.11])
  by mx1.tq-group.com with ESMTP; 23 Jan 2023 16:02:46 +0100
Received: from vmail01.tq-net.de (10.150.72.11) by vmail01.tq-net.de
 (10.150.72.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 23 Jan
 2023 16:02:45 +0100
Received: from vmail01.tq-net.de ([10.150.72.11]) by vmail01.tq-net.de
 ([10.150.72.11]) with mapi id 15.01.2507.016; Mon, 23 Jan 2023 16:02:45 +0100
From: "Stein, Alexander" <Alexander.Stein@tq-group.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>
CC: "michael@walle.cc" <michael@walle.cc>, "p.yadav@ti.com" <p.yadav@ti.com>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix shift-out-of-bounds
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Fix shift-out-of-bounds
Thread-Index: AQHYOQodYTda3weuU0+yf380GWE6Ea6t9KqA
Date: Mon, 23 Jan 2023 15:02:45 +0000
Message-ID: <5642351.DvuYhMxLoT@steina-w>
References: <20211106075616.95401-1-tudor.ambarus@microchip.com>
 <5550605.DvuYhMxLoT@steina-w>
 <b8d01f36-663a-928a-6dbe-64952b5bd8d0@microchip.com>
In-Reply-To: <b8d01f36-663a-928a-6dbe-64952b5bd8d0@microchip.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.150.72.21]
MIME-Version: 1.0
Content-Language: en-US
Content-ID: <442701B35985684F88905FBEBE92D650@tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_070257_189527_545BB969 
X-CRM114-Status: GOOD (  19.71  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

Am Mittwoch, 16. M=E4rz 2022, 08:47:40 CET schrieb Tudor.Ambarus@microchip.=
com:
> On 3/16/22 09:39, Alexander Stein wrote:
> =

> > [You don't often get email from alexander.stein@tq-group.com. Learn why
> > this is important at http://aka.ms/LearnAboutSenderIdentification.]
 =

> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the
> > content is safe
 =

> > Hello,
> =

> =

> hi,
> =

> =

> > =

> > Am Samstag, 6. November 2021, 08:56:15 CET schrieb Tudor Ambarus:
> > =

> >> When paring SFDP we may choose to mask out an erase type, passing
> >> an erase size of zero to spi_nor_set_erase_type().
> >> Fix shift-out-of-bounds and just clear the erase params when
> >> passing zero for erase size.
> >> While here avoid a superfluous dereference and use 'size' directly.
> >>
> >>
> >>
> >> UBSAN: shift-out-of-bounds in drivers/mtd/spi-nor/core.c:2237:24
> >> shift exponent 4294967295 is too large for 32-bit type 'int'
> >>
> >>
> >>
> >> Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI
> >> NOR
 flash memories") Reported-by: Alexander Stein
> >> <Alexander.Stein@tq-group.com>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> ---
> >> =

> >>  drivers/mtd/spi-nor/core.c | 9 +++++++--
> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >>
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> index 3d97c189c332..a1b5d5432f41 100644
> >> --- a/drivers/mtd/spi-nor/core.c
> >> +++ b/drivers/mtd/spi-nor/core.c
> >> @@ -2230,8 +2230,13 @@ void spi_nor_set_erase_type(struct
> >> spi_nor_erase_type
 *erase, u32 size, erase->size =3D size;
> >> =

> >>       erase->opcode =3D opcode;
> >>       /* JEDEC JESD216B Standard imposes erase sizes to be power of 2.
> >>       */
> >> =

> >> -     erase->size_shift =3D ffs(erase->size) - 1;
> >> -     erase->size_mask =3D (1 << erase->size_shift) - 1;
> >> +     if (size) {
> >> +             erase->size_shift =3D ffs(size) - 1;
> >> +             erase->size_mask =3D (1 << erase->size_shift) - 1;
> >> +     } else {
> >> +             erase->size_shift =3D 0;
> >> +             erase->size_mask =3D 0;
> >> +     }
> >> =

> >>  }
> >>
> >>
> >>
> >>  /**
> > =

> > =

> > What is the status of this patch? It is not applied up until now, no? H=
as
> > it
 been superseeded?
> > =

> =

> =

> I think it's marked with "changes requested". I'm going to send a v2.

Is there a v2 somewhere?

Best regards,
Alexander

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
