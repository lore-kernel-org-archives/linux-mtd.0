Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VpzMn-0003Ws-4d
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 11:51:13 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: RE: OMAP3 NAND ECC selection
Date: Mon, 9 Dec 2013 11:50:37 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA52D51@DBDE04.ent.ti.com>
References: <alpine.DEB.2.01.1312051000270.17561@pmeerw.net>
 <CAFqH_50vhgJ=ktqmYRo+ZO1bbRmiME+kXVt6sLJL91q9A2S7TA@mail.gmail.com>
 <52A04E75.3010609@corscience.de>
 <alpine.DEB.2.01.1312051711410.20976@pmeerw.net>
 <20131205171326.GA26766@atomide.com>
 <CABxcv=mtqkpyup0y-zv53YRvdgKH0bNXeCWf9mxPFoUTRQ=Gew@mail.gmail.com>
 <20131205182628.GF2345@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA5222E@DBDE04.ent.ti.com>
 <20131205200618.19b33ee2@skate>
 <CAN8TOE-cv5ppz0Q_asK=6WdRPaK9SAd1ccZF0Ax7QCdGOE7Fjw@mail.gmail.com>
 <20131205203237.047cfbb9@skate>
 <20980858CB6D3A4BAE95CA194937D5E73EA52ADF@DBDE04.ent.ti.com>
 <20131209120609.08e62b40@parrot.com>
In-Reply-To: <20131209120609.08e62b40@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Mike Dunn <mikedunn@newsguy.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Tony Lindgren <tony@atomide.com>, Enric
 Balletbo Serra <eballetbo@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Peter
 Meerwald <pmeerw@pmeerw.net>, Javier Martinez Canillas <javier@dowhile0.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?iso-8859-1?Q?Andreas_Bie=DFmann?= <andreas.biessmann@corscience.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Matthieu CASTET [mailto:matthieu.castet@parrot.com]
>> From: Pekon Gupta [mailto: pekon@ti.com]
>> >From: Thomas Petazzoni [mailto:thomas.petazzoni@free-electrons.com]
>> >>On Thu, 5 Dec 2013 11:24:18 -0800, Brian Norris wrote:
[...]
>> >> Using 1-bit ECC on NAND is not a long-term solution. Given that
>> >> fact, I think your ROM code is what may need to change, not the
>> >> entire MTD subsystem.
>> >
>> >As someone (Tom Rini maybe?) pointed out, today the shift is 1-bit
>> >ECC supported by ROM code vs. 4 or 8 bits required by NAND. But we
>> >can very well imagine that tomorrow ROM code will support BCH4 (and
>> >the NAND will ensure block 0 is OK for use with BCH4) but the rest
>> >of the NAND will require BCH16 or something like that.
>> >
>> >I'm not designing ROM code, and the fact that they today have this
>> >limitation, should be an indication that Linux should be capable of
>> >handling different ECC schemes to handle those hardware constraints.
>> >
>> Just to highlight few more points:
>> (1) ROM code on newer OMAP platforms like AM33xx do have the ability
>> to select ECC scheme by reading a specific location from EEPROM
>> connected to I2C0.
>>=20
>AFAIK on omap3, the rom code first try to read data with bch and if it
>doesn't work it fallback on haming 1 bit ecc.
>
I'm afraid, the OMAP35xx TRM does give much information about BCH
ecc-scheme being used by ROM code. Though it says that BCH4 ecc-scheme
would be selected for booting in cases when NAND_ID2 matches a
particular value. But nothing much is clear (Reference [1]).
Can you please point me to any other document or link which gives more
info about the same ?


>> (2) And going forward, ECC based NAND devices may be phased out,
>> and BE-NAND (Built-in) NAND devices are becoming popular. As both
>> cost and density wise they are same to SLC NANDs today.  Thus issue
>> of un-compatibility of ecc-scheme with ROM code, will not hold true.
>> We already have some BE-NAND support in our generic driver.
>> http://patchwork.ozlabs.org/patch/222186/
>>
>Yes but these flash are not always compatible with the ROM.
>
>If the rom is expecting some ECC and the internal controller expect
>other ecc you are stuck.
>
For AM33xx and newer DRA7xx platforms, allows user to explicitly select
between no ECC, BCH8 or BCH16. Thus ROM code of newer OMAP devices
supports BE-NAND. (refer [2]).

[1]	http://www.ti.com/product/omap3530
	http://www.ti.com/litv/pdf/spruf98x
	Chapter 25: Initialization
	 Section 25.4.7.4 NAND
	Table 25-34. ID2 Byte Description

[2] 	http://www.ti.com/product/am3359
	http://www.ti.com/litv/pdf/spruh73i=20
	Chapter 26: Initialization =20
	Section: 26.1.7.4  Memory Booting > NAND
  	Table 26-17. NAND Geometry Information on I2C EEPROM

with regards, pekon
