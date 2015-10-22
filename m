Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZpHhW-0000W8-I7
 for linux-mtd@lists.infradead.org; Thu, 22 Oct 2015 15:22:48 +0000
Received: by wijp11 with SMTP id p11so37475814wij.0
 for <linux-mtd@lists.infradead.org>; Thu, 22 Oct 2015 08:22:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20151022171259.57581575@free-electrons.com>
References: <1445416144-9194-1-git-send-email-antoine.tenart@free-electrons.com>
 <20151022171259.57581575@free-electrons.com>
Date: Thu, 22 Oct 2015 12:22:24 -0300
Message-ID: <CAAEAJfCmo5u6=5GN6+k8GsFhC0dg477gVYY+t77uODP-PgWLGw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] mtd: pxa3xx_nand: rework the timing setup
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, zmxu@marvell.com,
 jszhang@marvell.com, Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 =?UTF-8?Q?Gregory_Cl=C3=A9ment?= <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22 October 2015 at 12:12, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Antoine,
>
> On Wed, 21 Oct 2015 10:28:59 +0200, Antoine Tenart wrote:
>
>> Antoine Tenart (5):
>>   mtd: pxa3xx: prepare allowing compile test
>>   mtd: nand: allow compile test of MTD_NAND_PXA3xx
>>   mtd: pxa3xx_nand: add helpers to setup the timings
>>   mtd: pxa3xx_nand: rework flash detection and timing setup
>>   mtd: pxa3xx_nand: clean up the pxa3xx timings
>
> I tested your series on Armada 375 DB, which uses the same pxa3xx
> driver, but with the Armada 370 variant.
>
> With the current Device Tree which has nand,keep-config to keep the
> timing configuration from the bootloader, I don't see any problem, so
> there is no regression introduced by your series, at least on this
> platform.
>
> However, when I remove nand,keep-config to use the ONFI timings from
> the NAND, then things work fine (I can mount a UBIFS root filesystem),
> but there is a weird:
>

Could you compare NAND throughput using keep-config (keeping
the bootloader timings) and without keep-config (with ONFI timings) ?

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
