From: Vikas MANOCHA <vikas.manocha@st.com>
To: Marek Vasut <marex@denx.de>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Graham
 Moore <grmoore@opensource.altera.com>, Alan Tull
 <atull@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Date: Tue, 18 Aug 2015 07:48:01 +0200
Subject: Re: [PATCH V7 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI
 Flash Controller driver.
Message-ID: <0B80CAC4-70B3-4557-8D6E-4CA84AF9CEA2@st.com>
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <55D29A0B.20408@st.com> <201508180647.30119.marex@denx.de>
In-Reply-To: <201508180647.30119.marex@denx.de>
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

Ho Marek,



> On Aug 17, 2015, at 9:48 PM, Marek Vasut <marex@denx.de> wrote:
>=20
>> On Tuesday, August 18, 2015 at 04:35:55 AM, vikas wrote:
>> Hi Marek,
>>=20
>>> On 08/13/2015 08:28 PM, Marek Vasut wrote:
>>> From: Graham Moore <grmoore@opensource.altera.com>
>>>=20
>>> Add binding document for the Cadence QSPI controller.
>>>=20
>>> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Alan Tull <atull@opensource.altera.com>
>>> Cc: Brian Norris <computersforpeace@gmail.com>
>>> Cc: David Woodhouse <dwmw2@infradead.org>
>>> Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
>>> Cc: Graham Moore <grmoore@opensource.altera.com>
>>> Cc: Vikas MANOCHA <vikas.manocha@st.com>
>>> Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
>>> Cc: devicetree@vger.kernel.org
>>> ---
>>>=20
>>> .../devicetree/bindings/mtd/cadence_quadspi.txt    | 50
>>> ++++++++++++++++++++++ 1 file changed, 50 insertions(+)
>>> create mode 100644
>>> Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
>>>=20
>>> V2: Add cdns prefix to driver-specific bindings.
>>> V3: Use existing property "is-decoded-cs" instead of creating a
>>>=20
>>>    duplicate, "ext-decoder". Timing parameters are in nanoseconds,
>>>    not master reference clocks. Remove bus-num completely.
>>>=20
>>> V4: Add new properties fifo-width and trigger-address
>>> V7: - Prefix all of the Cadence-specific properties with cdns prefix,
>>>=20
>>>      those are in particular "cdns,is-decoded-cs", "cdns,fifo-depth",
>>>      "cdns,fifo-width", "cdns,trigger-address".
>>>=20
>>>    - Drop bogus properties which were not used and were incorrect.
>>>=20
>>> diff --git a/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
>>> b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt new file
>>> mode 100644
>>> index 0000000..ebaf1fd
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
>>> @@ -0,0 +1,50 @@
>>> +* Cadence Quad SPI controller
>>> +
>>> +Required properties:
>>> +- compatible : Should be "cdns,qspi-nor".
>>> +- reg : Contains two entries, each of which is a tuple consisting of a
>>> +    physical address and length.  The first entry is the address and
>>> +    length of the controller register set.  The second entry is the
>>> +    address and length of the QSPI Controller data area.
>>=20
>> "Controller data area", i think it means mapped NOR Flash address ?
>=20
> Probably ; Graham ?
>=20
>> If yes, it would be more clear with "Physical base address & size of NOR
>> Flash".
>=20
> This is the Direct mode thing, correct ? We don't support this, so I thin=
k
> we should drop this bit altogether and keep only one single address in th=
is
> field.

No it's not.

>=20
>>> +- interrupts : Unit interrupt specifier for the controller interrupt.
>>> +- clocks : phandle to the Quad SPI clock.
>>> +- cdns,fifo-depth : Size of the data FIFO in words.
>>=20
>> It actually is sram-depth, better would be "sram-depth" to avoid confusi=
on.
>=20
> Is there any documentation for this piece to which you can point me ?

It's on the controller data sheet , should also be part of socfpga doc, let=
 me know the document you have access to, I will point to the relevant part=
.

>=20
>>> +- cdns,fifo-width: Bus width of the data FIFO in bytes.
>>> +- cdns,trigger-address : 32-bit indirect AHB trigger address.
>>=20
>> we might make trigger-address also part of property "reg".
>=20
> No, we cannot, it's not part of the controller's base address, is it ?

Ok.

>=20
>>> +
>>> +Optional properties:
>>> +- cdns,is-decoded-cs : Flag to indicate whether decoder is used or not=
.
>>=20
>> Not clear about the usage of decoder, if it does not make sense we might
>> remove it from driver.
>=20
> Graham ? SoCFPGA uses this decoded-cs thing, so we absolutely can not rem=
ove
> it from the driver.
>=20
>>> +Optional subnodes:
>> I think flash subnode is mandatory.
>=20
> You can have a controller with no SPI NORs on it.

Without spi nor this controller/driver can't be used for anything.

Rgds,
Vikas =
