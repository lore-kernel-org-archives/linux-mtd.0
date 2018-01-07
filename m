Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYJXQ-0005pl-Gf
 for linux-mtd@lists.infradead.org; Sun, 07 Jan 2018 22:35:35 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Miquel RAYNAL
 <miquel.raynal@free-electrons.com>
CC: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, "Cyrille
 Pitchen" <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Kalyan Kinthada
 <Kalyan.Kinthada@alliedtelesis.co.nz>
Subject: Re: [PATCHv4 1/1] mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370
 variants
Date: Sun, 7 Jan 2018 22:35:04 +0000
Message-ID: <c0b5230388814eb39b32575612152fbe@svr-chch-ex1.atlnz.lc>
References: <20171221231904.21140-1-chris.packham@alliedtelesis.co.nz>
 <20171221231904.21140-2-chris.packham@alliedtelesis.co.nz>
 <20171222165308.10f2fe15@xps13>
 <CAAEAJfDzZJKVX+3f69o0UF6DgcQEW-UEmp-VG9bPkFd2dybYkQ@mail.gmail.com>
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

Hi Miquel, Ezequiel,=0A=
=0A=
On 23/12/17 05:56, Ezequiel Garcia wrote:=0A=
> On 22 December 2017 at 12:53, Miquel RAYNAL=0A=
> <miquel.raynal@free-electrons.com> wrote:=0A=
>> Hello Chris,=0A=
>>=0A=
>> On Fri, 22 Dec 2017 12:19:04 +1300=0A=
>> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:=0A=
>>=0A=
>>> From: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>=0A=
>>>=0A=
>>> The Armada-370 based SoCs support arbitration between the NAND Flash=0A=
>>> interface and NOR (i.e. devbus) on the same chip select. However there=
=0A=
>>> are two guidelines that must be followed to avoid data corruption in=0A=
>>> this scenario.=0A=
>>=0A=
>> Sorry to bother you again with that but, do you actually face any=0A=
>> issue/data corruption with this scenario?=0A=
>>=0A=
> =0A=
> Indeed. We need a description of a real world problem this patch is fixin=
g.=0A=
> =0A=
=0A=
I totally agree. The Marvell FAE used words like "data corruption" hence =
=0A=
my re-newed interest in this. I had hoped these patches would pique the =0A=
interest of someone from Marvell's engineering team with some more info =0A=
on how the data corruption exhibits.=0A=
=0A=
I've been running some of the mtd-utils tests on my hardware and haven't =
=0A=
detected any failures yet.=0A=
=0A=
I think the key would be to be doing interleaved accesses between nand =0A=
and the parallel device. I've just kicked off something I think should =0A=
do this on my hardware but I'm unsure as to how long I should wait for =0A=
an issue to present itself.=0A=
=0A=
I'll leave it running for as long as I can today. If I find a failure =0A=
I'll report back otherwise we can leave this patch for the mailing list =0A=
archives waiting for an issue to be seen.=0A=
=0A=
