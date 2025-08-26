Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B90CA0FE9
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Aug 2025 11:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TJhcQG1VcGJ4kjzN+3KiDLOIytw8rDCHGSEhFnDWDY=; b=Tv8tPYlnV7K16J
	hRyg+bTxLj1auBK1lkIV0WwWFmmX3XSqAkILF2n3eugNpRCUryV4kmWVJUNvsL+M6USYlWMHqIlfv
	AV/6fwyv04XLnCwLuyKw1Nq86dqElVaFYMPs+Fw38XZExmd+MRlMH5q9N8rCbaaw64L2D8Klk7CDo
	9rORYpphism000iXg01RRr4XdKc3XarCX5rfmOmLqZ8nTMWO6vUUjgjim6eQXeh2YkVLUf9z41Ksa
	975ajosHO6Ew40itfee9WHi1u+T3oZ4l5LrHnqDLr8iImur2lA+3BBkdV/dEAb6yXQPgfh677SpoW
	iiN9WAx95zlL8XWG3cJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqs6T-0000000BpbX-1UnR;
	Tue, 26 Aug 2025 11:44:41 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrA3-0000000BewY-43Vz;
	Tue, 26 Aug 2025 10:44:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 126661484416;
	Tue, 26 Aug 2025 12:44:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1756205055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KwLQqQaMoEE+Hv1ZG6dhCcc/rDPs+TlmKuOnBY34Nv0=;
	b=gHASm2ESs1rHyh92A6xH9vOgeJ18Q2+bcxVpa9MXJ00778LYLJ3oO6LyJt5mVWzcS/K5oa
	GZsAoJCgfuuKMSrkOTD0EL9y/yyo1iTiiW49gR2zKA+cLsdxQwh3Sj9Xvm0fnU5kmYUiy0
	Vkkjs9KSveVfRuJ/u6/zjR9jRI38SJdat918MpT8nmvsR9JgfC5s4R57eWyKV9LP0RYSXY
	yNNssAaegaU+Q/K5GsWd8V5w9pMBOy3pqkeXt4/7E7tV9o9/36j+6twrWhXAoyJg3yvVwM
	CEcN7tCTQmyNt5V0PP4nMoBe5m8xO3BLgDLydiKcN/UQxTcMxmISi+HYIQOoRA==
Date: Tue, 26 Aug 2025 12:44:08 +0200
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
Message-ID: <20250826-wake-jet-e15c7a209bb4@thorsis.com>
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
 <20250825-vista-cuddle-c159a6bd97ec@thorsis.com>
 <513ad54017eb96a55176d232ce1464ff51bf452f.camel@siemens.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <513ad54017eb96a55176d232ce1464ff51bf452f.camel@siemens.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_034420_452343_8565D7FA 
X-CRM114-Status: GOOD (  21.23  )
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

Am Mon, Aug 25, 2025 at 01:41:05PM +0000 schrieb Sverdlin, Alexander:
> Hi Alexander,
> =

> On Mon, 2025-08-25 at 15:22 +0200, Alexander Dahl wrote:
> > > > Threw this on top of 6.12.39-rt11 and tested on two custom platforms
> > > > both with a Spansion S34ML02G1 SLC 2GBit flash chip, but with
> > > > different SoCs (sama5d2, sam9x60).=A0 We had difficulties with the
>                                           ^^^^^^^^^^^^^^^^^^^
> [*]
> =

> > > > timing of those NAND flash chips in the past and I wanted to make s=
ure
> > > > this patch does not break our setup.=A0 Seems fine in a quick test,
> > > > reading and writing and reading back is successful.
> > > =

> > > thank you for your feedback!
> > > =

> > > Do you see an opportunity to drop the downstream timing quirks with m=
y patch?
> > =

> > Which downstream do you refer to?
> =

> That's how I understood the phrase above, that some adjustments are still=
 required
> on your side additionally to standard timings. Sorry for the confusion, i=
f it turns
> out to be a misunderstanding on my side!

I don't think your patch is sufficient to solve our problems with
sam9x60 and S34ML02G1.  Different parts of the timings are affected.
You changed NRD_SETUP while I changed NRD_PULSE.  I just wanted to
make sure both patches do not interfere.

For reference, these are the changes in at91bootstrap and u-boot I
referred to:

https://github.com/linux4sam/at91bootstrap/issues/174
https://github.com/linux4sam/at91bootstrap/commit/e2dfd8141d00613a37acee66e=
f5724f70f34a538

https://source.denx.de/u-boot/u-boot/-/commit/344e2f2cd4a407f847b301804f37d=
036e8a0a10c

My problem might be fixed with commit f552a7c7e0a1 ("mtd: rawnand:
atmel: set pmecc data setup time"), but I did not have time to test
that assumption.

Sorry for the confusion.

Greets
Alex


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
