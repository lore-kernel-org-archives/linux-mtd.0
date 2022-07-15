Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A111C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7w5QFiep6I8G1LnzPig+z1HlR53n4f4uhy/S4qVKqY0=; b=4trKEGHRByBoWg
	ibuQr4BjN9x91sMsB0LqZdA8Jj7Wqcn24tyW0HyBptMcIzeOY9cKspjn5luhGZaf8aVBxbdaZvQ6x
	xNn8QHjvEETBhqcOERRcyC5EKa93uEMwh60pZHC66vLOuKNVRmzoGsetIPuFp6NKf1M3OUU4T9l9f
	jsHcZr61XRU1cb4HkKq8wGUSGeLJmtTkJAbBP2M03vzdgLPELDS8miw6AJdl0EsqxTOm1wuz4QDUa
	J2UUurYQm3zYe3XAyxz77A2XxWLvWMpzd5jAJ6oSuBLpz8SSQOHCO8wykIex1F1PKRKWRm5tJwrP+
	/M78/DzyPvJu0OdpqUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCHV3-0065Rn-62; Fri, 15 Jul 2022 09:20:41 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCHUz-0065Pv-MX; Fri, 15 Jul 2022 09:20:39 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26F9KI0r094953;
	Fri, 15 Jul 2022 04:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657876818;
	bh=79+15PhDBbaYfjRz4Da0CiyiPsDJzQ/ow0y1Q7+aARk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kku9VDBbVMWl9g0xa3sStuUIr4MfzM0QTmdvBlm/S2Z7YPaldmgSrAsxASMklZLRQ
	 NVZfyuAwCazMKJkkJvxJ5Ubh9vpImw4d7WrajJW1p47vrCR2QgnoPH6a+JXkZH3KXS
	 lHEO39TeX6H63j7cAr36m8Jy3dUjk78ULwbzSliI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26F9KIQ0004595
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 15 Jul 2022 04:20:18 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 15
 Jul 2022 04:20:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 15 Jul 2022 04:20:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26F9KHi9108271;
	Fri, 15 Jul 2022 04:20:18 -0500
Date: Fri, 15 Jul 2022 14:50:17 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
CC: Michael Walle <michael@walle.cc>, <linux-sunxi@lists.linux.dev>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej
 Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh
 Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: When a flash memory is missing do not
 report an error
Message-ID: <20220715092017.2ftoyzm22i4amrbt@ti.com>
References: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
 <d8de86aa0331be697fbef33d5ab2c57a@walle.cc>
 <20220714205529.GE17705@kitsune.suse.cz>
 <33abf7b84860049c4a22605578303ff2@walle.cc>
 <20220714220744.GF17705@kitsune.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220714220744.GF17705@kitsune.suse.cz>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_022037_904287_2F1DE0B8 
X-CRM114-Status: GOOD (  53.76  )
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

On 15/07/22 12:07AM, Michal Such=E1nek wrote:
> On Thu, Jul 14, 2022 at 11:51:56PM +0200, Michael Walle wrote:
> > Am 2022-07-14 22:55, schrieb Michal Such=E1nek:
> > > On Thu, Jul 14, 2022 at 09:41:48PM +0200, Michael Walle wrote:
> > > > Hi,
> > > > =

> > > > Am 2022-07-14 21:19, schrieb Michal Suchanek:
> > > > > It is normal that devices are designed with multiple types of sto=
rage,
> > > > > and only some types of storage are present.
> > > > >
> > > > > The kernel can handle this situation gracefully for many types of
> > > > > storage devices such as mmc or ata but it reports and error when =
spi
> > > > > flash is not present.
> > > > >
> > > > > Only print a notice that the storage device is missing when no re=
sponse
> > > > > to the identify command is received.
> > > > >
> > > > > Consider reply buffers with all bits set to the same value no res=
ponse.
> > > > =

> > > > I'm not sure you can compare SPI with ATA and MMC. I'm just speaking
> > > > of
> > > > DT now, but there, for ATA and MMC you just describe the controller
> > > > and
> > > > it will auto-detect the connected storage. Whereas with SPI you
> > > > describe
> > > =

> > > Why does mmc assume storage and SDIO must be descibed? Why the special
> > > casing?
> > =

> > I can't follow you here. My SDIO wireless card just works in an SD
> > slot and doesn't have to be described.
> > =

> > > > both the controller and the flash. So I'd argue that your hardware
> > > > description is wrong if it describes a flash which is not present.
> > > =

> > > At any rate the situation is the same - the storage may be present
> > > sometimes. I don't think assuming some kind of device by defualt is a
> > > sound practice.
> > =

> > Where is the assumption when the DT tells you there is a flash
> > on a specific chip select but actually there it isn't. Shouldn't
> > the DT then be fixed?
> =

> The DT says there isn't a flash on a specific chip select when there is.
> Shouldn't that be fixed?

If the board has a flash chip, then DT should describe it. The it does =

not have one, then DT should not describe it.

So if DT says there isn't a flash on a specific CS when there is, then =

DT should be fixed to describe the flash, and then we can probe it. You =

both seem to be saying the same thing here, and I agree.

> =

> > Maybe I don't understand your problem. What are you trying to
> > solve? I mean this just demotes an error to an info message.
> =

> Many boards provide multiple storage options - you get a PCB designed to
> carry different kinds of storage, some may be socketed, some can be
> soldered on in some production batches and not others.

Usually for non-enumerable components you can plug in or out, you should =

use DT overlays to add the correct nodes as needed. For example, CSI =

cameras just plug into a slot on the board. So you can easily remove one =

and add another. That is why we do not put the camera node in the board =

dts, but instead apply it as an overlay from the bootloader.

> =

> The kernel can handle this for many kinds of storage but not SPI flash.
> =

> I don't see any reason why SPI flash should be a second class storage.
> =

> > > However, when the board is designed for a specific kind of device whi=
ch
> > > is not always present, and the kernel can detect the device, it is
> > > perfectly fine to describe it.
> > > =

> > > The alternative is to not use the device at all, even when present,
> > > which is kind of useless.
> > =

> > Or let the bootloader update your device tree and disable the device
> > if it's not there?
> =

> But then it must be in the device tree?
> =

> And then people will complain that if the bootloader does not have this
> feature then the kernel prints an error message?

Then add the feature to the bootloader? Adding a node in DT for a flash =

that is not present is wrong.

> =

> > Or load an overlay if it is there?
> =

> Or maybe the kernel could just detect if the storage is present?

It can't. This is a non-enumerable bus, unlike USB or PCI. And there is =

no way you can actually detect the presence or absence of a flash =

reliably. For example, TI chips come with a flash that is capable of =

8D-8D-8D mode. If the flash is handed to the kernel in 8D-8D-8D mode, =

the read ID command will return all 0xff bytes since the kernel expacts =

communication in 1S-1S-1S mode. With your patch you will say that no =

flash memory is detected. In reality the flash is present but the kernel =

just failed to properly detect it.

> =

> It's not like we don't have an identify command.

We do, but it does not let us detect the _absence_ of a flash.

> =

> Thanks
> =

> Michal

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
