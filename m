Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fM4C3-0005ew-L8
 for linux-mtd@lists.infradead.org; Fri, 25 May 2018 04:19:10 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, "boris.brezillon@bootlin.com"
 <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
Subject: Re: [PATCH v6 0/5] mtd: cfi_cmdset_0002: Change write and erase
 functions
Date: Fri, 25 May 2018 04:18:35 +0000
Message-ID: <52ecd5f29ca3466788231425654877a8@svr-chch-ex1.atlnz.lc>
References: <20180515171120.5629-1-smtpuser@allied-telesis.co.jp>
 <f74834424cb3f1f86e8803884b53be5f62d15c94.camel@infinera.com>
 <TY1PR01MB0954DBEFF399886473C1242FDC690@TY1PR01MB0954.jpnprd01.prod.outlook.com>
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

Hi Ikgegami-san,=0A=
=0A=
On 25/05/18 15:03, IKEGAMI Tokunori wrote:=0A=
> Hi Boris-san,=0A=
> =0A=
> Could you please apply the patches if no problem?=0A=
> Or still should we wait if any other comment?=0A=
=0A=
Probably best to let the world turn for a bit longer. I imagine most of =0A=
the Linux subsystem maintainers are busy with the last stage of the =0A=
merge window for 4.17.=0A=
=0A=
> Let me confirm these things since we are waiting to apply them for=0A=
> our product problem as resolution.=0A=
=0A=
I think things are far enough along now that we can apply these to our =0A=
kernel fork. If there are any new changes we can always revert and apply =
=0A=
updated versions.=0A=
=0A=
> By the way I think that the commit message of patches can be changed=0A=
> to Jocke-san as "Reviewed-by" from "Cc" as below.=0A=
>    - Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>=0A=
>    + Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>=0A=
> =0A=
> Since actually the changes have been reviewed by him as the mail=0A=
> below.=0A=
> Also our company mail system has been changed so now I can send the=0A=
> patches with my email address as sender instead of the smtpuser address.=
=0A=
> If needed I will resend patches or send them as new version patches=0A=
> again to change the commit message and send address.=0A=
> =0A=
> Regards,=0A=
> Ikegami=0A=
> =0A=
>> -----Original Message-----=0A=
>> From: Joakim Tjernlund [mailto:Joakim.Tjernlund@infinera.com]=0A=
>> Sent: Thursday, May 17, 2018 10:12 PM=0A=
>> To: boris.brezillon@bootlin.com=0A=
>> Cc: IKEGAMI Tokunori; PACKHAM Chris; linux-mtd@lists.infradead.org;=0A=
>> cyrille.pitchen@wedev4u.fr; dwmw2@infradead.org;=0A=
>> computersforpeace@gmail.com; boris.brezillon@free-electrons.com;=0A=
>> richard@nod.at; marek.vasut@gmail.com=0A=
>> Subject: Re: [PATCH v6 0/5] mtd: cfi_cmdset_0002: Change write and erase=
=0A=
>> functions=0A=
>>=0A=
>> I think the patches look good but I think they should go=0A=
>> to stable as well.=0A=
>>=0A=
>>   Jocke=0A=
>>=0A=
>> On Wed, 2018-05-16 at 02:11 +0900, smtpuser wrote:=0A=
>>>=0A=
>>> From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>=0A=
>>>=0A=
>>> The changes are to make sure to check the operation status.=0A=
>>> Actually the flash write and erase error behavior is caused on our=0A=
>> products.=0A=
>>> The flash is Macronix flash device MX29GL512FHT2I-11G used by our=0A=
>> products.=0A=
>>> The patch series was separated for changes of flash write and erase.=0A=
>>> Since those were not depended each other at the time.=0A=
>>> But by additional changes the changes are related more as same way=0A=
>> currently.=0A=
>>> So combine patch series for the flash write and erase changes as v6.=0A=
>>>=0A=
>>> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>=0A=
>>> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>=0A=
>>> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>>> Cc: Brian Norris <computersforpeace@gmail.com>=0A=
>>> Cc: David Woodhouse <dwmw2@infradead.org>=0A=
>>> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>=0A=
>>> Cc: Marek Vasut <marek.vasut@gmail.com>=0A=
>>> Cc: Richard Weinberger <richard@nod.at>=0A=
>>> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>=0A=
>>> Cc: linux-mtd@lists.infradead.org=0A=
>>>=0A=
>>> Tokunori Ikegami (5):=0A=
>>>    mtd: cfi_cmdset_0002: Change write buffer to check correct value=0A=
>>>    mtd: cfi_cmdset_0002: Change definition naming to retry write=0A=
>>>      operation=0A=
>>>    mtd: cfi_cmdset_0002: Change erase functions to retry for error=0A=
>>>    mtd: cfi_cmdset_0002: Change erase functions to check chip good only=
=0A=
>>>    mtd: cfi_cmdset_0002: Change erase one block to enable XIP once=0A=
>>>=0A=
>>>   drivers/mtd/chips/cfi_cmdset_0002.c | 36=0A=
>> +++++++++++++++++++++++-------------=0A=
>>>   1 file changed, 23 insertions(+), 13 deletions(-)=0A=
>>>=0A=
>>> --=0A=
>>> 2.16.1=0A=
>>>=0A=
> =0A=
=0A=
