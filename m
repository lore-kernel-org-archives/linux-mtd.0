Received: from mail-ie0-x236.google.com ([2607:f8b0:4001:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW0U0-0007c3-50
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 10:36:52 +0000
Received: by iegc3 with SMTP id c3so32770880ieg.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2015 03:36:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUv2w0chGPK37oYaY5f64X4XK+Ab+aP7egxv2fnWa8k-g@mail.gmail.com>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
 <CAMuHMdUv2w0chGPK37oYaY5f64X4XK+Ab+aP7egxv2fnWa8k-g@mail.gmail.com>
Date: Thu, 12 Mar 2015 11:36:29 +0100
Message-ID: <CACna6rz-4nKE_iV2-8aG3ZEcrpN88A0iX4cHC+FudJ-==H9p7w@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On 12 March 2015 at 11:19, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Mar 11, 2015 at 10:57 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>> diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Document=
ation/devicetree/bindings/mtd/m25p80.txt
>> index 4611aa83531b..1b2997d4cee4 100644
>> --- a/Documentation/devicetree/bindings/mtd/m25p80.txt
>> +++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
>> @@ -3,9 +3,12 @@
>>  Required properties:
>>  - #address-cells, #size-cells : Must be present if the device has sub-n=
odes
>>    representing partitions.
>> -- compatible : Should be the manufacturer and the name of the chip. Bea=
r in mind
>> +- compatible : Should be "nor-jedec" for any SPI NOR flash that can be
>> +               identified by the JEDEC READ ID opcode (0x95).
>> +               Additionally, may include a device-specific string consi=
sting of
>> +               the manufacturer and name of the chip. Bear in mind
>
> For the casual reader, this suggests putting "nor-jedec" first, which is =
not
> what we want. So I would write it like e.g.
>
> "Should be the manufacturer and the name of the chip. Additionally,
>  should contain "nor-jedec" for any SPI NOR flash that can be
>  identified by the JEDEC READ ID opcode (0x95)."

I don't really like above. It suggests using manufacturer,name
always/in most cases. This is what we want to avoid. Let's use
"nor-jedec" wherever possible (when dealing with JEDEC compatible
flashes).

--=20
Rafa=C5=82
