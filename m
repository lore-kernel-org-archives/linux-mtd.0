Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41A3C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 10:54:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4348F60F21
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 10:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4348F60F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Mime-Version:Date:Cc:To:From
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QP+8t5hd3VEMjZG/Jm2xRsJs0p4N+A1TTBqOosXJQoQ=; b=Ok978mLIHA2QiG
	gkRtKh3yU016xGLihFE7o3pnhRyLuqCEdEKRF6pMjmBuj4ALveSnskRfPZ9EEybvnG1WY+seG4xx5
	m0mYVqkDQ5kkLqqGHf4Lg7zOYjEPEaA7mh+w+iRgLfSE8cCi+8QN6xJtNzvTdXRdIadfAiGwUijO+
	aGbeIG/6BvrXVip3v/3VHrutFy2ivWQSf7rbfh1GbVTERb+/f4z+MP3NAKL9z5Av4zG/g8fahcUsC
	hVIVmOZIAIxFCoKSRzPH6EL7nu5Litx/5GvG9x9pYYfMccXYiINgLy8keYD27eUTwuY5y4bbrydz3
	bOuy16oIafOmf9EhEoeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mabtX-00G7Xh-VQ; Wed, 13 Oct 2021 10:54:01 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maZuq-00FdS3-52
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 08:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634114832; x=1665650832;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=pAs91x88z+ajqtkXU1xcpob8J9OK5iJT+zTO2gT1iSo=;
 b=ogk5ZCxHUetQeT4Tbs0o0IS87Y1cq4nr5iVBfqzRdVsjwjeKSGK6jstB
 feVgXRiGIUoTI3wO8+MOAF/FFkfiBN0+sEBkizNEZkhItDuoqz8W0FBoc
 UMfJ39ExnjbX+623w5pv/ulNPunEsuk183ck63gPF+MJ5wSFfVp3kCKbA
 gFxw1c037kXwx5eGaDybHcIj+p6OnDi15Obg14Q0hwpTKENkXu8jjrpiY
 kQ3034yjmkdtlspVRp5oSNoVC3T1rwV/ZrpmT2h/5wP9HOrG4BSR1nL7o
 Q/UNng+o+dxYuHVXYhs2Lf0p71KoeitkYFkRzCZT9UundrzhaKWlIoEaL A==;
X-IronPort-AV: E=Sophos;i="5.85,370,1624312800"; d="scan'208";a="20016647"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 13 Oct 2021 10:47:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 13 Oct 2021 10:47:04 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 13 Oct 2021 10:47:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634114824; x=1665650824;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=pAs91x88z+ajqtkXU1xcpob8J9OK5iJT+zTO2gT1iSo=;
 b=pS+TCdEXTeT871X7A3AyV7GPgqdefmlmSrHkc64z0Mvm7/QX/5B83d8A
 LWpGD3Lf4VqfeRYqFMNHHd99uMYpP4L1syiu1VnvyTlOaxBrHcX7XkbUX
 srUAtyVyMR3VNUaAkThGn90YjgPFptlP4+ito4aqpxA/uhIfNwefSzfnA
 kyxwh87CpYRuU47/iRR7k8DU59gKjD6nEy3okd8j35Sun/v2+VneGxCXE
 WSuog9hygkQYnVij37xIMipsK0NJ7JWviZcrL5IKTX/Uz0045LcKWujn+
 btfR863ngaZ/tpn7b8yQLIXW13ffhzuTojdJbCOy7g6dO+wK58nxYrDNz A==;
X-IronPort-AV: E=Sophos;i="5.85,370,1624312800"; d="scan'208";a="20016646"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 13 Oct 2021 10:47:04 +0200
Received: from vtuxmail01.tq-net.de (localhost [127.0.0.1])
 by vtuxmail01.tq-net.de (Postfix) with ESMTP id 550EF280065;
 Wed, 13 Oct 2021 10:47:04 +0200 (CEST)
Received: by vtuxmail01 (kopano-spooler) with MAPI; Wed, 13 Oct 2021 10:47:04
 +0200
Subject: AW: (EXT) Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nor: Add
 output-driver-strength property
From: "Alexander Stein" <Alexander.Stein@ew.tq-group.com>
To: "Michael Walle" <michael@walle.cc>
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Rob Herring" <robh@kernel.org>, "Pratyush Yadav" <p.yadav@ti.com>,
 "Tudor Ambarus" <tudor.ambarus@microchip.com>,
 =?us-ascii?Q?linux-mtd=40lists=2Einfrad?= =?us-ascii?Q?ead=2Eorg?=
 <linux-mtd@lists.infradead.org>, 
 =?us-ascii?Q?devicetree=40vger=2Ekernel=2Eorg?= <devicetree@vger.kernel.org>, 
 =?us-ascii?Q?linux-kernel=40vger=2Ekernel=2Eorg?=
 <linux-kernel@vger.kernel.org>
Date: Wed, 13 Oct 2021 08:47:04 +0000
Mime-Version: 1.0
X-Priority: 3 (Normal)
X-Mailer: Kopano 8.7.82
Message-Id: <kcEE.9geNR42QRKGTSoedF1sEfQ.ALRP5Q7A1wE@vtuxmail01.tq-net.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_014712_590378_4295BEB9 
X-CRM114-Status: GOOD (  24.56  )
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

Hello Michael,


Am 2021-10-12 09:48, schrieb Michael Walle:
> Am 2021-10-12 08:17, schrieb Alexander Stein:
> > This property is for optimizing output voltage impedance and is
> > specific to each board. It overwrites the default set by the flash
> > device. Various flash devices support different impedances.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v2:
> > * Updated the property description and the commit message accordingly
> > 
> >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > index ed590d7c6e37..4c3c506a8853 100644
> > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > @@ -72,6 +72,14 @@ properties:
> >        be used on such systems, to denote the absence of a reliable 
> > reset
> >        mechanism.
> > 
> > +  output-driver-strength:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Output driver strength in ohms which optimizes the impedance at 
> > Vcc/2
> > +      output voltage. This property overwrites the default set by the 
> > flash
> > +      device. This is board specific and should be determined by the
> > +      manufacturer. Various flash devices support different 
> > impedances.
> 
> Mh, this seems to be very tailored to this flash chip. Eg. the "Vcc/2", 
> is
> this something specific to this flash or is this some kind of common 
> usage?

"Vcc/2" is taken from the datasheet description.

> For example, Winbond flashes specifies the output driver strength in 
> percent.
> Settings are 25%, 50%, 75%, 100% there.
> 
> I'd have to ask a hardware guy, if one could convert between these two
> representations of the driver strength.

Well, 100% must map to some actual value. Which then can be used to create
a discrete value table, which are then supported by the flash driver.
E.g. for Micron not every flash supports the same set of settings for
driver strength.
Macronix uses similar settings (values and bitmask), but in a different
register. But if some vendors have pretty much incompatible settings, it
might be feasible to provide vendor specific settings, e.g.
"micron,drive-strength = <45>" (for 45 Ohm) or "winbond,drive-strength = <100>"
(for 100%).

Best regards,
Alexander


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
