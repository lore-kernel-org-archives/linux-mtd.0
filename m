Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC34ACA0FE7
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Aug 2025 15:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJae8Vkul6sclkRoUlEwRqJ3jJgH6HWYyqtayoqzG0I=; b=napZTedySSNzZ7
	m/AJ8WuLAhCTvoi+h5qZGaveqS3tRcppa/ezRIE1DG/6fBbMvYnqZnbvTE8tFu+u/Mdfa5LNHIkH7
	4dOg3LHiutJUhLttpPNjNsG6pYpB+n8KmvmCWdD/xYvuuLMTAcCciXuPlGmU0mbDlP5IXr1m7aL7I
	v/zL2gH7XPPdexXVW5AiOzabHb7ByJHL6HpEz7L+Uqwahk7/7WQ9ayTZz8X9jXL9JFvjU52AAWnX+
	kPjq+sZPCViBrRc0xYQwE+ffHeVc9N30o0QuiPxeENWuVGuxVksJkmpMPVYc/lZGBZEsOjaOHiNqq
	iRzYwmzXAG3o6t8ixYEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYg3-00000008Mof-0oj9;
	Mon, 25 Aug 2025 15:00:07 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqX9g-000000084Ki-2geE;
	Mon, 25 Aug 2025 13:22:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D10431485849;
	Mon, 25 Aug 2025 15:22:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1756128154; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Dt3bZHXB6Pw2aBzNRDnFUH71ehaQs545/ECq/BqLHbE=;
	b=TiJ2yGu/EIyLweS6Rmf8/EcDyy6SW4NeWhK4WYeHGsm+cYyJPXK13GVlLgbT83mswrnIO+
	aYPIdv+fEOuEv3/UACURpcsfkiQW6CW4A2hrRrpaMxOLp440xjHFq9RKfH7DmSyZFOXgX+
	JuWeqI4AwpJAUHU0vs4zAr57uEpv3mALFU8NIgntRAZa5GHi9N67wdL60ZZqm72xDDhxow
	vv9TQ7FG+y2CeCwtzxqmmPBCzqBci0m9oWH3OUCkwuKJx+4pKeWUdI0mT+2x0YkyHCYaw5
	9OKfn5L0FRsRZ4GfhvIzPdviJhb+77SjE751fi/jMwrLxf0puKFVNKvhIKdj9A==
Date: Mon, 25 Aug 2025 15:22:29 +0200
From: Alexander Dahl <ada@thorsis.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "Balamanikandan.Gunasundar@microchip.com" <Balamanikandan.Gunasundar@microchip.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
	"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	"richard@nod.at" <richard@nod.at>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"bbrezillon@kernel.org" <bbrezillon@kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: nand: raw: atmel: Respect tAR, tCLR in read
 setup timing
Message-ID: <20250825-vista-cuddle-c159a6bd97ec@thorsis.com>
Mail-Followup-To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>,
	"Balamanikandan.Gunasundar@microchip.com" <Balamanikandan.Gunasundar@microchip.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
	"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	"richard@nod.at" <richard@nod.at>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"bbrezillon@kernel.org" <bbrezillon@kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20250821120106.346869-1-alexander.sverdlin@siemens.com>
 <20250825-uneven-barman-7f932d0ca964@thorsis.com>
 <3d0259caac9925e3d5dd3dd27a6785b2a2e82c0b.camel@siemens.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d0259caac9925e3d5dd3dd27a6785b2a2e82c0b.camel@siemens.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_062236_842427_389C3A51 
X-CRM114-Status: GOOD (  21.39  )
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

Hello Alexander,

Am Mon, Aug 25, 2025 at 12:21:24PM +0000 schrieb Sverdlin, Alexander:
> Hi Alexander,
> =

> On Mon, 2025-08-25 at 13:02 +0200, Alexander Dahl wrote:
> > > Having setup time 0 violates tAR, tCLR of some chips, for instance
> > > TOSHIBA TC58NVG2S3ETAI0 cannot be detected successfully (first ID byte
> > > being read duplicated, i.e. 98 98 dc 90 15 76 14 03 instead of
> > > 98 dc 90 15 76 ...).
> > > =

> > > Atmel Application Notes postulated 1 cycle NRD_SETUP without explanat=
ion
> > > [1], but it looks more appropriate to just calculate setup time prope=
rly.
> > > =

> > > [1] Link: https://ww1.microchip.com/downloads/aemDocuments/documents/=
MPU32/ApplicationNotes/ApplicationNotes/doc6255.pdf
> > > Cc: stable@vger.kernel.org
> > > Fixes: f9ce2eddf176 ("mtd: nand: atmel: Add ->setup_data_interface() =
hooks")
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > =

> > Tested-by: Alexander Dahl <ada@thorsis.com>
> > =

> > Threw this on top of 6.12.39-rt11 and tested on two custom platforms
> > both with a Spansion S34ML02G1 SLC 2GBit flash chip, but with
> > different SoCs (sama5d2, sam9x60).=A0 We had difficulties with the
> > timing of those NAND flash chips in the past and I wanted to make sure
> > this patch does not break our setup.=A0 Seems fine in a quick test,
> > reading and writing and reading back is successful.
> =

> thank you for your feedback!
> =

> Do you see an opportunity to drop the downstream timing quirks with my pa=
tch?

Which downstream do you refer to?

> I actually have another patch related to timings, but it's based on code-=
review
> only and the theoretical issue never manifested itself in practice on our=
 side...

I also have another one, for which fixes got merged in at91bootstrap
and U-Boot already, but I never found the time to upstream it on
Linux.  It's related to pulse timing.

> (it's about missing ndelay at the end of atmel_smc_nand_exec_instr())

That does not ring a bell here, sorry.

Greets
Alex


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
