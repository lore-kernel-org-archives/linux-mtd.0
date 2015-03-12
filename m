Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW0YC-0002Ox-6b
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 10:41:12 +0000
Received: by obcuz6 with SMTP id uz6so14185697obc.7
 for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2015 03:40:50 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <CACna6rz-4nKE_iV2-8aG3ZEcrpN88A0iX4cHC+FudJ-==H9p7w@mail.gmail.com>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
 <CAMuHMdUv2w0chGPK37oYaY5f64X4XK+Ab+aP7egxv2fnWa8k-g@mail.gmail.com>
 <CACna6rz-4nKE_iV2-8aG3ZEcrpN88A0iX4cHC+FudJ-==H9p7w@mail.gmail.com>
Date: Thu, 12 Mar 2015 11:40:50 +0100
Message-ID: <CAMuHMdWszFbs2N8W0-O35-fWydetMx8tHvn7NLEyZi_ZL9R1tA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 12, 2015 at 11:36 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com=
> wrote:
> On 12 March 2015 at 11:19, Geert Uytterhoeven <geert@linux-m68k.org> wrot=
e:
>> On Wed, Mar 11, 2015 at 10:57 PM, Brian Norris
>> <computersforpeace@gmail.com> wrote:
>>> diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Documen=
tation/devicetree/bindings/mtd/m25p80.txt
>>> index 4611aa83531b..1b2997d4cee4 100644
>>> --- a/Documentation/devicetree/bindings/mtd/m25p80.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
>>> @@ -3,9 +3,12 @@
>>>  Required properties:
>>>  - #address-cells, #size-cells : Must be present if the device has sub-=
nodes
>>>    representing partitions.
>>> -- compatible : Should be the manufacturer and the name of the chip. Be=
ar in mind
>>> +- compatible : Should be "nor-jedec" for any SPI NOR flash that can be
>>> +               identified by the JEDEC READ ID opcode (0x95).
>>> +               Additionally, may include a device-specific string cons=
isting of
>>> +               the manufacturer and name of the chip. Bear in mind
>>
>> For the casual reader, this suggests putting "nor-jedec" first, which is=
 not
>> what we want. So I would write it like e.g.
>>
>> "Should be the manufacturer and the name of the chip. Additionally,
>>  should contain "nor-jedec" for any SPI NOR flash that can be
>>  identified by the JEDEC READ ID opcode (0x95)."
>
> I don't really like above. It suggests using manufacturer,name
> always/in most cases. This is what we want to avoid. Let's use
> "nor-jedec" wherever possible (when dealing with JEDEC compatible
> flashes).

Why? It's a basic DT principle to always specify the real device.
One day you might find a deviation from the nor-jedec spec, which you canno=
t
handle if the device node doesn't claim compatibility with the real device.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
