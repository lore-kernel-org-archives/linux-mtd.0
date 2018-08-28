Received: from mta-01.yadro.com ([89.207.88.251])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fugK4-00060D-2K
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 15:54:42 +0000
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Marek Vasut <marek.vasut@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, <leroi.lists@gmail.com>
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
 <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
Date: Tue, 28 Aug 2018 18:54:12 +0300
MIME-Version: 1.0
In-Reply-To: <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="l3KNYY5DlcH6d32dNT2hg9s9nFvOPIMTA"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--l3KNYY5DlcH6d32dNT2hg9s9nFvOPIMTA
Content-Type: multipart/mixed; boundary="ALkjwjbNc57cJBtg7hkTsBFngvlNDmJPp";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, leroi.lists@gmail.com
Message-ID: <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
 <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
In-Reply-To: <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>

--ALkjwjbNc57cJBtg7hkTsBFngvlNDmJPp
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

28.08.2018 14:43, Marek Vasut wrote:
> On 08/28/2018 01:29 PM, Alexander Amelkin wrote:
>> 27.08.2018 14:34, Marek Vasut wrote:
>>>>>> According to the datasheet for mx66l51235f, "The device default is=
 in
>>>>>> 24-bit address mode" (section 9-10). Having option SPI_NOR_4B_OPCO=
DES
>>>>>> makes the code act as if the device was already in 4B mode and did=
n't
>>>>>> need the EN4B command. That prevents this chip from functioning on=

>>>>>> systems where the boot loader left the chip in 3B mode (e.g. if th=
e
>>>>>> chip wasn't used during the boot process).
>>>>>>
>>>>>> Hence, this commit removes the SPI_NOR_4B_OPCODES option for
>>>>>> mx66l51235f (added previously by commit d342b6a973af).
>>>>> Could it be there are two variants of the chip, one which supports =
the
>>>>> 4B opcodes and one which does not ? Wouldn't be the first time I sa=
w
>>>>> this. If this chip supports the SFDP tables, you can check those.
>>>> I was unable to find another variant of the chip. There is only one =
specified in the datasheet:
>>>> http://www.macronix.com/Lists/Datasheet/Attachments/7401/MX66L51235F=
,%203V,%20512Mb,%20v1.1.pdf
>>>> and it says that the device supports both 3B and 4B modes, but defau=
lts to 3B (24-bit) mode.
>>> So keep the 4B part in. Linux will just not reconfigure the device to=
 4B
>>> mode using register write, but will instead issue the 4B opcode
>>> directly, without any stateful change.
>> Marek, thank you for asking all these questions. They made me conduct =
a deeper investigation than just finding the commit that broke it and rev=
erting it. It appears that OpenPOWER P8's SBE code (the thing that P8 CPU=
 runs first from its built-in memory) expects the PNOR flash chip to be i=
n EN4B mode. It reads the rest of OpenPOWER Firmware using a usual READ (=
0x03) command with 4 bytes of address. Always. That's why, I believe, Rom=
an's commit broke host booting for us.
> Uh oh, I seem to remember some flashes had this weird quirk where they
> were in EN4B mode by default, and if U-Boot/Linux reset the flash into
> "sane default" state (3B addressing etc), some systems failed to boot.
> Furthermore, this EN4B is non-volatile bit on this flash, right ? That
> means it is retained across power-cycles, which sucks even more.
No, EN4B is volatile. It doesn't survive power cycling. A quote from data=
sheet:
>>> The 4BYTE bit may be cleared by power-off or writing EX4B instruction=
 to reset the state to be "0".
>
>> Probably it would be best not to merge this patch into Linux kernel. I=
'll discuss it with colleagues from OpenPOWER community and we'll probabl=
y fix it on SBE side.
> Can you fix the firmware ? If so, that'd be amazing.
It turns out that it is impossible to fix that on firmware side mainly be=
cause the firmware does not send any opcodes over SPI at all. It relies o=
n the SPI flash controller to do the address mapping so the firmware acce=
sses the chip as a usual memory address range. The flash controller is lo=
cated in our case inside Aspeed AST2400 BMC SoC and does not support 4B o=
pcodes. It expects the chip to respond to generic READ and WRITE opcodes =
with (configurable) either 3 or 4 address byte cycles. So the only way to=
 make it work is put the chip in EN4B mode when BMC boots. As this is qui=
te a specific case, I guess you won't be willing to remove the SPI_NOR_4B=
_OPCODES option globally. We'll have to keep the patch local to openbmc p=
roject
> But still, there can be a software which does rogue transmission on the=

> SPI bus and flips the flash into 3B mode before reset, so the system
> will not boot anyway. Do you have a way to deal with that somehow ?
Sure. As I said, there is no way to turn on the host without BMC knowing/=
controlling it.
The BMC ensures the chip is in the right mode. That's actually the reason=
 why this patch appeared in the first place.
Also, there is no rogue software on BMC.
>> As for renaming the chip, I can provide a patch just for that. Or we c=
an leave it as is.
> A patch would be nice, yes.
Will do a bit later.

Best regards,
Alexander.


--ALkjwjbNc57cJBtg7hkTsBFngvlNDmJPp--

--l3KNYY5DlcH6d32dNT2hg9s9nFvOPIMTA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbhXAkAAoJEOiTWHtbdBeNXrgP/0Q1ZmcEWZIST3a9BGlhabxE
xftiFnfNsybsfve1QKemwFxQCgKA0CCiwAJspoy2mAJZc9aGpjNf106alaHKhijU
7lriqCVNB1uLtAP2s7+CBGcOfMdIHIti+l6WiVboDUbbImpqZGSdIP7C6PE6zpb7
vHoDaYeoJOjKNXH6C/iE0k7pChRH97CSLMCZ1hOX2E7FM/iV0v0Gxi6ZNB7UciEU
aOrjZMvH7vI2Qcdc+GCChECxqUN/ydELTfnrQ0rPKsWNl77/tWEedZ2+Gf/KKHOE
fBdYzOyNbEfdGqZw6++wPFidR77M0FXTaWB9LkIyDwYpE6F0+r5DDJlSSpLCO/yy
Z42oDnLj2+RhiBB68BUvg8gR9XpSQFEvYT8mm94wYbnwCFMpgFAmdMgqBYuh9fIc
ZiHvspMBN35ylNK+b3LVsjEabJAbokMk7VwMJ22xftWtVeyYJLfd804njDk1yZLQ
Ed0yUQ6LdgUhHaT9XGY7a/Rou6XsJj4jisBVKqyiY1Js1q/7EBX62Use+tXnWlfu
6Uyt7Blpt775985HXRG6hXPYvXHeQc0GV8s8UzBmwGw2h/Kz8MCxmqZqGmkrVOYB
mgUsRHLj1odCfBY7xWSyazTbBE4r5YDVZEaUccEI1QVRPmtTyQ56San5AvY35ocB
eWtgP/Z+ngINq6dvUkb3
=jiWi
-----END PGP SIGNATURE-----

--l3KNYY5DlcH6d32dNT2hg9s9nFvOPIMTA--
