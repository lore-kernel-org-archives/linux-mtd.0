Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxzBs-0002f1-HY
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 17:02:54 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "pawel.moll@arm.com" <pawel.moll@arm.com>, Campbell
 <ijc+devicetree@hellion.org.uk>, "richard@nod.at" <richard@nod.at>, "Mark
 Rutland" <mark.rutland@arm.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "galak@codeaurora.org" <galak@codeaurora.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: RE: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
Date: Tue, 11 Apr 2017 17:01:51 +0000
Message-ID: <5a96e73ef951414a82c01b67088b24d3@SIWEX5A.sing.micron.com>
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
 <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
 <20170322144507.4d80d2cc@bbrezillon>
 <0dccc0abcf234e98be6d340027cf1a30@SIWEX5A.sing.micron.com>
 <20170322155216.319efc3e@bbrezillon>
 <414dd35931814ce38381a251917ad79f@SIWEX5A.sing.micron.com>
 <20170411145102.563fa388@bbrezillon>
 <90300f14cd2a4ae6967d8be0f7dff4e9@SIWEX5A.sing.micron.com>
 <20170411173051.7aafb717@bbrezillon>
In-Reply-To: <20170411173051.7aafb717@bbrezillon>
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

>On Tue, 11 Apr 2017 15:02:22 +0000
>"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:
>
>> Hi, Boris and Thomas
>> Let me do some explanation.
>>
>> >> if (NAND =3D=3D SLC ) { // on-die ECC only exists in SLC //check devi=
ce
>> >> ID byte 4
>> >>      if ((ID.byte4 & 0x02) =3D=3D 0x02) {// internal ECC level =3D=3D=
10b
>> >
>> >So here the MT29F1G08ABADAWP datasheet says 0x2 <=3D> 4bit/512bytes ECC=
.
>> >
>>
>> If the NAND supports on-die ECC, here should be 10b, not matter it is
>> 8bit or 4bit, You are correct, MT29F1G08ABADAWP is 0x2, its explanation =
is
>4bit/512bytes ECC.
>> But for the 70s, it is 8bit on-die ECC, but it is still 10b.
>> So that why here using these two bits to determine if exist on-die ECC.
>> What's more, for some old products, they don't support on-die ECC,
>> Sometimes, here is still 01b, so still need following codes to do
>> further determinations.
>
>Okay, then here is the differentiator. Did you check that on SLC NANDs the=
re's no
>collision on ID[4].bits[1:0]. I've seen NAND vendors changing their ID sch=
eme in
>incompatible ways (old fields were replaced by new ones with completely
>different meanings).


Yes, this is true, there is no one standard to define and formalize ID.byte=
4,
It is always changing. Also, sometimes it definitely conflicts with other N=
AND without
On-die ECC. For the Micron both serials SLC NAND with on-die ECC, bits[1:0]=
 is defined
Internal ECC level.=20

>I'd really like to make sure we're not mis-interpreting READ_ID informatio=
n, so
>maybe we should restrict the test on ONFI NANDs if all NANDs supporting on=
-die
>ECC are ONFI compliant. We should probably also check that chip->id.len >=
=3D 5.
>
>
>>
>> >> 	if (ID.byte4 & 0x80) {//on-Die ECC enabled
>> >
>> >Did you read my last reply?
>> >Thomas discovered that ID[4].bit7 is actually reflecting the ECC
>> >engine state (1 if the engine is enabled, 0 if it's disabled), not
>> >whether the NAND supports on-die ECC or not, so no this test is not rel=
iable.
>> >
>> For the on-die ECC, it is not always default enabled. It depends on requ=
irement
>from costumers.
>> If on-die ECC is not enabled, bit7 is 0. It can be switched through "Fea=
ture
>Operations".
>
>So this check is not needed, right?

Here is much complicated. One question is that what main purpose of on-die =
ECC.
there are two types of usage model:
1.  on-die ECC default enabled:
Normally before bootloader and kernel, there is no any ECC to correct and m=
aintain
Bootloader reliability.  For this kind of customer, I think, they mainly wa=
nt to have reliable booting.
Rather than for store user data. Per this kind of condition, we don't check=
, because on-die ECC
Always be enabled, cannot be disabled.

2. on-die ECC default disabled:
I think this is used for some important user data. Unless the bootrom of CP=
U can issue=20
SET_FEATURE to enable on-die ECC, and until Linux running, on-die ECC is st=
ill enabled.
Otherwise, we need to check if it enables or not.

>BTW, do you have NANDs where the on-die ECC is always enabled, and if this=
 is
>the case, what happens when you call
>SET_FEATURE(disable/enable-ECC) on these NANDs?

If this NAND is on-die ECC defaulted enabled, the on-die ECC cannot
Disabled later. Why? This is related to specific user model.
We have one PPT on Micron domain website, it is "on die ECC training",
It opens and can freely download. It clearly describes this.
If you cannot download, please let me know, I send to you.

As for the on-die ECC default disabled, you can freely switch on or off
by SET_FEATURE(disable/enable-ECC).

>
>>
>> >>                     if (ONFI.byte112 =3D=3D 4)
>> >> 		 60s SLC NAND with on-die ECC
>> >> 	    else if (ONFI.byte112 =3D=3D 8)
>> >>      	              70s SLC NAND with on-die ECC
>> >
>> >This is completely fucked up! Now the ONFI param page says the NAND
>> >requires 8bits/512bytes, while the ID bytes advertised an on-die ECC
>> >providing 4bits/512bytes correctability.
>>
>> I think, my previous answers can answer this confusion.
>
>Yep. BTW, sorry for being so harsh in my previous reply.
Don't sorry, open source community should like this. And if you have any co=
nfusion and
Something fucked up about Micron NAND, please freely speak out and let me k=
now.
If we can give any support, we are very happy.=20
