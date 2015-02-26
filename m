Received: from 8.mo69.mail-out.ovh.net ([46.105.56.233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQwxR-0006p9-HS
 for linux-mtd@lists.infradead.org; Thu, 26 Feb 2015 11:50:23 +0000
Received: from mail409.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo69.mail-out.ovh.net (Postfix) with SMTP id F26CCFFB97A
 for <linux-mtd@lists.infradead.org>; Thu, 26 Feb 2015 12:49:58 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Subject: Re: [PATCH 1/3] mtd: atmel_nand: move the hsmc_clk from nfc node to
 nand node
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
In-Reply-To: <20150226101857.59104e97@bbrezillon>
Date: Thu, 26 Feb 2015 19:49:09 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <C9CC8708-B99A-47F4-AC57-1A92B302E1C9@jcrosoft.com>
References: <1423548885-27589-1-git-send-email-josh.wu@atmel.com>
 <20150226101857.59104e97@bbrezillon>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Nicolas FERRE <nicolas.ferre@atmel.com>, Josh Wu <josh.wu@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On Feb 26, 2015, at 5:18 PM, Boris Brezillon =
<boris.brezillon@free-electrons.com> wrote:
>=20
> Hi Josh,
>=20
> On Tue, 10 Feb 2015 14:14:43 +0800
> Josh Wu <josh.wu@atmel.com> wrote:
>=20
>> Also add a new sama5d3_nand compatiable string for sama5d3 nand.
>>=20
>> For sama5d3, sama5d4 chip, the pmecc became part of HSMC, they need =
the
>> HSMC clock enabled to work.
>> The NFC is a sub feature for current nand driver, it can be disabled.
>> But if HSMC clock is controlled by NFC, so disable NFC will also =
disable
>> the HSMC clock. then, it will make the PMECC fail to work.
>>=20
>> So the solution is move the HSMC clock out of NFC to nand node. When
>> nand driver probed, it will check whether the chip has HSMC, if yes =
then
>> it will require a HSMC clock.
>=20
> Do you plan to use the NAND chip without the NFC (I mean, is there a
> reason for not using the NFC to access the NAND ?) ?
> If you don't, why don't you just wait for the NFC before probing the
> NAND chip it is attached to, so that the hmsc clk is properly claimed.
you can as you can have 2 Nand on the d3 but only 1 NFC

Best Regards,
J.
>=20
> I'm not convinced that moving a clk reference out of the controller
> node can address the fact that the nand/nand-controller DT
> representation is inappropriate (your embedding controller specific
> information in your NAND chip definition).
> I think we should reconsider this problem with a controller/chip
> approach:
> - which parts are representing the NAND controller: the PMECC engine,
>  the NFC if available, ...
> - which parts are representing the NAND chip: the EBI mem range, the
>  R/B pin, the ALE/CLE information, ...
>=20
> And of course, we should take the EBI/SMC rework into account ;-).
>=20
> Best Regards,
>=20
> Boris
>=20
>=20
> --=20
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
