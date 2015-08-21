From: Vikas MANOCHA <vikas.manocha@st.com>
To: Marek Vasut <marex@denx.de>
CC: Graham Moore <grmoore@opensource.altera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Alan Tull
 <atull@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Date: Fri, 21 Aug 2015 09:00:05 +0200
Subject: Re: [PATCH V7 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI
 Flash Controller driver.
Message-ID: <6F1A0998-0895-4E5D-9FF9-82BAD42A945B@st.com>
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <201508200603.19962.marex@denx.de> <55D5FB19.9010402@st.com>
 <201508210546.28932.marex@denx.de>
In-Reply-To: <201508210546.28932.marex@denx.de>
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

Hi,



> On Aug 20, 2015, at 10:20 PM, Marek Vasut <marex@denx.de> wrote:
>=20
>> On Thursday, August 20, 2015 at 06:06:49 PM, vikas wrote:
>> Hi,
>=20
> Hi!
>=20
> [...]
>=20
>>>>> It's the location of the SRAM fifo.  Also direct mode location I thin=
k,
>>>>> if that were ever used.
>>>>=20
>>>> Hmm...It is the base address of NOR flash. SRAM is not memory mapped.
>>>=20
>>> Huh ? I am inclined to trust Graham more -- I have seen memory mapped
>>> SRAM, but I have yet to see memory mapped SPI NOR.
>>=20
>> Well, SPI NOR flash in SOCs normally is memory mapped.
>=20
> I'm afraid you have some very disturbed views of how SPI NORs are operate=
d
> most of the time.

Just wondering what should I say, hoping you will sit back and try to corre=
ct your views.

> No, SPI NOR is most often hanging off of some sort of SPI
> controller just like any other SPI device. It is definitelly not common f=
or
> a SPI NOR to be memory mapped.

Definitely ? And what made you think like this ? Do you even know the spi p=
eripheral you are sending patch for has memory mapped nor flash ?

>=20
>> To give some mainline examples, all Spear family SOCs (spear300, 320, 13=
10,
>> 1340).
>=20
> That's an exception, not a rule :)

And there are many such exceptions starting from this cadence qspi :-)

>=20
>>> Also, the driver code clearly
>>> uses that area in a way one would use a memory mapped SRAM with FIFO on
>>> the other side. I think the above description is pretty much OK.
>>=20
>> that is the purpose of making NOR flash memory mapped.
>=20
> I'm not sure if you agree with me or not anymore. I am pretty sure the=20
> discussion went quite far for such a trivial matter though.

I definitely disagree with you.
I stop here now.

Cheers,
Vikas

>=20
>>>>> The size is determined by a configuration parameter during system
>>>>> design.  On Altera Cyclone5 the size is really big compared to SRAM
>>>>> fifo.  I don't know why, maybe some hw engineer thought it would be
>>>>> better to have a large size in case direct mode was used.
>>>>=20
>>>> my comment is about second parameter of property "reg" which is NOR
>>>> flash address, so above explanation does not make sense for it.
>>>> Also in direct mode, sram does not come into play.
>>>=20
>>> This is absolutelly not a SPI NOR address.
>>=20
>> Then i can only suggest to check out the controller literature.
>>=20
>> Think like this : what is the purpose of SRAM in all this flash access
>> business, It can work without SRAM also, the only purpose of sram (& in
>> fact indirect mode) is to access data from flash memory without AHB acce=
ss
>> to trigger it. Once the data is available in SRAM(in case of read), AHB
>> Master can access it with low letency. Same is true for writes. SRAM is
>> integral internal part of state machine in case of indirect mode, there =
is
>> no need for it to memory mapped. If the controller does not support
>> indirect mode, there is no need of sram in the system.
>>=20
>> Hope it is little bit more clear.
>=20
> It is, I understand what you're trying to convey now.
>=20
> Yes, this register area can be used in certain modes of the controller in
> such a way that it presents a window of the SPI NOR, which can be directl=
y
> accessed.
>=20
> This register area can also be used as a FIFO, which is the way we used t=
his
> area in the driver . We read/write the first four bytes when communicatin=
g
> with the flash.
>=20
> So I don't really see a problem with calling the second register a "Contr=
oller
> data area", that's what the IP documentation also calls it.
