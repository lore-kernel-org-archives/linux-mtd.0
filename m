Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C588C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 19:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3ezsZbFBWf+HD4yYDXbcrRaADZKfb6ZX+3MLDlmNvY=; b=Wtj+vohSWmVDG1
	DsyUIM6F+7Irxg4JLNhz7gPJP+hbA7jXLqUNchdamgogfSGxhICi/S1Tqmv8HfzBCbzHgUjdzBuIJ
	7x9fx6UMaXbasMoQtGTcOQi/03+6UlBv7Zwy61YzTLS7bneHTYQjOxiE8E6SI5k5RJj9TGVkQeATa
	5mdq3PYzgrEICEOJQf7J+G5Oq9rDwOQlfYPeFRHYOleHrbz8D/h8Lb1xEV/HCQpBGC87LledcvApz
	FFc9KhGTCD8J2NAOzMHViYLiKlNcGLanBSXRUenl7O6o9s6abXYv90kO8CdbI3qwIH03xbbRrBBT1
	kzhKFS/RZR26it/TGxCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbpCK-002R9E-KC; Tue, 05 Apr 2022 19:50:40 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbpCH-002R8O-Cc; Tue, 05 Apr 2022 19:50:39 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 235JoAfF112216;
 Tue, 5 Apr 2022 14:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1649188210;
 bh=0Kmb+YJoZyauUAADn+OfEyRTvOQfvAR8zT7JcMcSOgs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=XuCvTaiNBwGdu7mDYFH3eBo3FnHuvYMBcjoCGa4T0gv6Qg0OrHiY+iDjJo3IK52eY
 01SetxUJjdha4dxhgtZoKIN9O9ZptifyLmCkazLHd/CqV2iY/Bi9X8imflIZqEcnbE
 MuQBGf+Jm5txdLNxxwp/Ne7XE/AFgjkTx2Qt73N4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 235JoAUL033623
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Apr 2022 14:50:10 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Apr 2022 14:50:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Apr 2022 14:50:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 235Jo7Ho053449;
 Tue, 5 Apr 2022 14:50:08 -0500
Date: Wed, 6 Apr 2022 01:20:07 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v4 3/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
Message-ID: <20220405195007.d277eunfmrue3yww@ti.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-4-tudor.ambarus@microchip.com>
 <67810d13180a2718ad7ccc28815d2894@walle.cc>
 <d6e3dae6-fc46-1697-e496-33ab11469807@microchip.com>
 <6bb1aafe7e156db8dfcf77f04a9d100e@walle.cc>
 <CAEyMn7aN+wJnYkTJU_nWA9bPzF1sezA9_=E5YG5rnPBLMAmabA@mail.gmail.com>
 <b533feb1c69ddae69dd88a44a902eb47@walle.cc>
 <58af5b61-83a6-38bf-05d1-f1ded5299f30@microchip.com>
 <546a7f0f728b01e2283bab53989e5a69@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <546a7f0f728b01e2283bab53989e5a69@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_125037_550074_7264E002 
X-CRM114-Status: GOOD (  38.72  )
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
Cc: sr@denx.de, vigneshr@ti.com, Tudor.Ambarus@microchip.com,
 jaimeliao@mxic.com.tw, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 macromorgan@hotmail.com, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 zhengxunli@mxic.com.tw, mail@david-bauer.net, code@reto-schneider.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 04/03/22 03:36PM, Michael Walle wrote:
> Am 2022-03-04 01:36, schrieb Tudor.Ambarus@microchip.com:
> > On 3/3/22 18:45, Michael Walle wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > > know the content is safe
> > > 
> > > Am 2022-03-03 17:31, schrieb Heiko Thiery:
> > > ..
> > > 
> > > > > > > > # xxd -p mx25l3233f-sfdp
> > > > > > > > 53464450000101ff00000109300000ffc2000104600000ffffffffffffff
> > > > > > > > ffffffffffffffffffffffffffffffffffffe520f1ffffffff0144eb086b
> > > > > > > > 083b04bbeeffffffffff00ffffff00ff0c200f5210d800ffffffffffffff
> > > > > > > > ffffffffffff003650269cf97764fecfffffffffffff
> > > > > > > 
> > > > > > > Is quad enable working or has this the same problem as
> > > > > > > the macronix flash in patch 4? Judging by the length of the SFDP
> > > > > > > this also lacks the required information to select an
> > > > > > > appropriate enable method. I haven't had closer look though.
> > > > > > 
> > > > > > it worked, yes. As I specified in the commit message, I tested it
> > > > > and
> > > > > > it used
> > > > > > SPINOR_OP_READ_1_4_4 0xeb opcode for reads.
> > > > > 
> > > > > I'm confused, why is Heiko reporting that the CR/SR writing isn't
> > > > > working because a wrong quad_enable method is chosen, but here it
> > > > > will work. What am I missing?
> > > > 
> > > > I suppose that the flash that supports the RSSFDP is JEDES216B
> > > > compatible including DWORD[15]. The flash that I have is only
> > > > JEDES216
> > > > compatible and has not the DWORD[15] defined.
> > > 
> > > That was why I wrote "Judging by the length of the SFDP". I've
> > > converted both the mx25l12835f and mx25l3233f to binary and both
> > > are 112 bytes long. Both seem to have the short BFPT table, ie.
> > > no DWORD(15). Both seem to have a second table at offset 60h.
> > > 
> > 
> > I've just redone the test, I see:
> > root@sama5d2-xplained:~# mtd_debug read /dev/mtd1 0 65536 read
> > atmel_qspi f0020000.spi: op->cmd.opcode = 00eb, so
> > SPINOR_OP_READ_1_4_4 as I said.
> > 
> > Michael, you have the eyes of an eagle, only the first 9 BFPT dwords
> > are defined:
> > spi-nor spi1.0: bfpt_header->length = 9
> > spi-nor spi1.0: BFPT[DWORD(1)] = fff120e5
> > spi-nor spi1.0: BFPT[DWORD(2)] = 01ffffff
> > spi-nor spi1.0: BFPT[DWORD(3)] = 6b08eb44
> > spi-nor spi1.0: BFPT[DWORD(4)] = bb043b08
> > spi-nor spi1.0: BFPT[DWORD(5)] = ffffffee
> > spi-nor spi1.0: BFPT[DWORD(6)] = ff00ffff
> > spi-nor spi1.0: BFPT[DWORD(7)] = ff00ffff
> > spi-nor spi1.0: BFPT[DWORD(8)] = 520f200c
> > spi-nor spi1.0: BFPT[DWORD(9)] = ff00d810
> > 
> > What happens is that the QE bit is non volatile and it's already set.
> > 
> > spi-nor spi1.0: spi_nor_quad_enable
> > spi-nor spi1.0: spi_nor_sr2_bit1_quad_enable
> > atmel_qspi f0020000.spi: op->cmd.opcode = 0035
> > spi-nor spi1.0: spi_nor_sr2_bit1_quad_enable cr = ff
> > atmel_qspi f0020000.spi: op->cmd.opcode = 0005
> > spi-nor spi1.0: sr = 40
> > 
> > spi_nor_sr2_bit1_quad_enable is called, RDCR is ignored so 0xff,
> > but I did a read of the SR and surprise, it's value is 0x40, so QE set.
> > This is a new kind of bug :). So yes, this patch has the same problem
> > as Heiko's, I will update it. Thanks for the heads up!
> 
> I've given this a little bit more thought. I'm pretty sure
> the QE bit is non-volatile on most flashes which share IO2
> IO3 with hold#/reset#/wp#. Why is the QE bit needed in the
> first place? Because it will determine the function of the
> pins. For example, all our products will have WP# pin enabled
> and pulled low to make sure (parts of) the flash is
> write-protected. Needless to say, we cannot use quad mode.

For those cases you should set spi-{rx,tx}-bus-width to 1 or 2 in device 
tree so SPI NOR does not attempt quad mode. If it does despite that, 
this is a bug which we should fix.

> 
> There might be edge cases where we accidentally disable the
> write protection pin. I'm not saying it is likely, though.
> E.g. on our boards we have a jumper to disable the write
> protection, now if linux decides for whatever reason to fiddle
> with the QE bit and set it to 1 that jumper might very well
> be useless after you booted linux once. Now that does ring a
> bell with "linux will just disable the write protection for
> no good reason on any flash", if you still remember ;)
> 
> Anyways, just to let you know. I don't have any better
> idea.
> 
> -michael

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
