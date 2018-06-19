Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVO54-0007jI-P6
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2018 21:23:27 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>, "Marek
 Vasut" <marek.vasut@gmail.com>
Subject: Re: [RFC PATCH v2 5/6] mtd: rawnand: micron: add
 ONFI_FEATURE_ON_DIE_ECC to supported features
Date: Tue, 19 Jun 2018 21:22:00 +0000
Message-ID: <b7bfe97c079e4e83bc108625224c2b16@svr-chch-ex1.atlnz.lc>
References: <20180619053125.16792-1-chris.packham@alliedtelesis.co.nz>
 <20180619053125.16792-6-chris.packham@alliedtelesis.co.nz>
 <20180619074056.420d5560@bbrezillon> <20180619085244.77790406@xps13>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19/06/18 18:53, Miquel Raynal wrote:=0A=
> Hi Boris, Chris,=0A=
> =0A=
> On Tue, 19 Jun 2018 07:40:56 +0200, Boris Brezillon=0A=
> <boris.brezillon@bootlin.com> wrote:=0A=
> =0A=
>> On Tue, 19 Jun 2018 17:31:24 +1200=0A=
>> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:=0A=
>>=0A=
>>> Add ONFI_FEATURE_ON_DIE_ECC to the set/get features list for Micron=0A=
>>> NAND flash.=0A=
>>>   =0A=
>>=0A=
>> Fixes: 789157e41a06 ("mtd: rawnand: allow vendors to declare (un)support=
ed features")=0A=
> =0A=
> Sorry for breaking it in my previous series.=0A=
> =0A=
>> Cc: <stable@vger.kernel.org>=0A=
>>=0A=
>> No need to send a new version, I'll add that when queuing the patch.=0A=
>>=0A=
>> Miquel, if you're okay, I'm gonna take this patch in the mtd/fixes branc=
h=0A=
>> and let you deal with other patches in this series.=0A=
> =0A=
> Yes please, take this one.=0A=
> =0A=
> * Chris, I'll take patches 1, 2, 3 with Boris comments.=0A=
=0A=
OK.=0A=
=0A=
I also got a kbuild report on=0A=
=0A=
include/linux/mtd/rawnand.h:788: warning: Function parameter or member =0A=
'fixup_onfi_param_page' not described in 'nand_manufacturer_ops'=0A=
=0A=
Do you want me to send a v3 for that? (given our timezones I'll just =0A=
send it anyway and you can choose to take it or just stick with v2).=0A=
=0A=
> * Patch 4 I think I'll just drop it as nobody can test it (and it's a=0A=
>    oneliner). I prefer people requesting a feature than complaining=0A=
>    about a bug :)=0A=
=0A=
Agreed. It's in the mailing list archive now if someone needs it we can =0A=
resurrect it from there=0A=
=0A=
> * Boris will take patch 5 in the mtd/fixes branch.=0A=
=0A=
Thanks all. Sorry our emails crossed so I couldn't just send #5 as a fix =
=0A=
on it's own.=0A=
=0A=
> * I'll let you write a v3 for patch 6 only.=0A=
=0A=
I'll have a read through the old thread and see if I can make sense of it.=
=0A=
