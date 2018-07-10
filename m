Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fd0Nb-0005My-5w
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2018 21:41:05 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Bean Huo
 (beanhuo)" <beanhuo@micron.com>
CC: Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 0/2] mtd: rawnand: micron: Fix on-die ECC
Date: Tue, 10 Jul 2018 21:40:30 +0000
Message-ID: <bae093198b024b06b3642531b704741c@svr-chch-ex1.atlnz.lc>
References: <20180709210937.30150-1-boris.brezillon@bootlin.com>
 <20180710101049.57a7cd21@bbrezillon>
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

Hi Boris,=0A=
=0A=
On 10/07/18 20:11, Boris Brezillon wrote:=0A=
> On Mon,  9 Jul 2018 23:09:35 +0200=0A=
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:=0A=
> =0A=
>> Chris, Bean,=0A=
>>=0A=
>> Here are 2 patches for you to review/test. The first one is fixing=0A=
>> the layout definition, and unless I missed something it should be=0A=
>> correct.=0A=
>>=0A=
>> The second one is just my understanding of how byte 5 of READ_ID works=
=0A=
>> based on our experience with the 4bit/512 on-die ECC chip we have=0A=
>> worked on and the other datasheet I had a look at.=0A=
>> I'm not 100% sure this will work for all chips, but might work for the=
=0A=
>> 2 chips we support right now.=0A=
> =0A=
> I tested it on a MT29F2G08ABAEAH4 (4bit/512bytes on-die ECC) and it=0A=
> works as expected. When I do the SET_FEATURES(ECC_EN) the ECC enabled=0A=
> bit in READID byte 5 is set, and when I do SET_FEATURES(ECC_DIS), the=0A=
> bit is cleared.=0A=
> =0A=
> Now we need to make sure it works correctly on MT29F1G08ABAFAWP.=0A=
=0A=
I'll test that as soon as I can get access to the hardware (probably =0A=
Monday next week).=0A=
=0A=
> =0A=
>> So please test and/or review it and let me know if this approach works.=
=0A=
>>=0A=
>> Regards,=0A=
>>=0A=
>> Boris=0A=
>>=0A=
>> Boris Brezillon (2):=0A=
>>    mtd: rawnand: micron: Define the proper layout for 8bit/512bytes=0A=
>>      on-die ECC=0A=
>>    mtd: rawnand: micron: Fix on-die ECC detection logic=0A=
>>=0A=
>>   drivers/mtd/nand/raw/nand_micron.c | 110 +++++++++++++++++++++++++----=
--------=0A=
>>   1 file changed, 75 insertions(+), 35 deletions(-)=0A=
>>=0A=
> =0A=
> =0A=
=0A=
