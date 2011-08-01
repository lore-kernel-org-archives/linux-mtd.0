MIME-Version: 1.0
In-Reply-To: <201107311551.48223.marek.vasut@gmail.com>
References: <1311230846-26437-1-git-send-email-b32955@freescale.com>
	<20018.43621.688990.319528@ipc1.ka-ro>
	<CAHMSPgPXnDVO630P9fnogQ0XvPSrwz0MYzXfXZLJoJNRf1gifA@mail.gmail.com>
	<201107311551.48223.marek.vasut@gmail.com>
Date: Mon, 1 Aug 2011 17:14:07 +0200
Message-ID: <CAHMSPgMK_zM17NXgsbrzs8Zw0VXtDoP12_1V7oeROSF=aBDuYg@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] add the GPMI controller driver for IMX23/IMX28
From: Koen Beel <koen.beel.barco@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Content-Type: multipart/mixed; boundary=000e0ce0d02e1bafb804a97315b6
Cc: arnd@arndb.de, dedekind1@gmail.com, Wolfram Sang <w.sang@pengutronix.de>,
	Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
	Shawn Guo <shawn.guo@freescale.com>, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--000e0ce0d02e1bafb804a97315b6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Don't think it's a hardware issue. After all it is working on the
mx23evk using the Freescale BSP based on 2.6.35.3.
Now I tested using this kernel command line:
mtdparts=3Dgpmi-nand:20m(boot),-(user) gpmi_debug_init
(So I removed the ubi rootfs stuff, see previous mails).

Its booting fine now without complaining about dma timeouts.

Have tried flash_eraseall /dev/mtd1. Now it's complaining and thinking
all blocks are bad. So a "flash_erase: Skipping bad block at 1db00000"
message for every erase block.
Writing 1 to /sys/devices/platform/imx23-gpmi-nand/ignorebad, makes to
go a little further giving 'only one' error but I doubt it's working
at all. See attached log file.

When the trying ubiformat /dev/mtd1 its stopping with a dma timeout.
Every subsequent action (e.g. using ubiformat or flash_eraseall) using
that dma channel is failing.
I have put a printk in mxs-dma.c around line 387:

    if (mxs_chan->status =3D=3D DMA_IN_PROGRESS && !append)
    {
        pr_err("dma already in progess!\n");
        return NULL;
    }

I see that printk also in the log file in attach. Seems like the
mxs-dma is failing at some point and for the rest of the time always
keeps it's status at DMA_IN_PROGRESS

Any input or feedback is welcome.

Regards,
Koen


On Sun, Jul 31, 2011 at 3:51 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On Friday, July 29, 2011 05:00:48 PM Koen Beel wrote:
>> On Fri, Jul 29, 2011 at 2:41 PM, Lothar Wa=C3=9Fmann <LW@karo-electronic=
s.de>
> wrote:
>> > Hi,
>> >
>> > Koen Beel writes:
>> >> Hi,
>> >>
>> >> On Fri, Jul 29, 2011 at 9:20 AM, Lothar Wa=C3=9Fmann <LW@karo-electro=
nics.de>
> wrote:
>> >> > Hi,
>> >> >
>> >> > Koen Beel writes:
>> >> >> Hi,
>> >> >>
>> >> >> I have test on mx23evk board. Still see the same issues.
>> >> >>
>> >> >> On Wed, Jul 27, 2011 at 3:53 AM, Huang Shijie <b32955@freescale.co=
m>
> wrote:
>> >> >> > Hi,
>> >> >> >
>> >> >> > Thanks for your test.
>> >> >> >
>> >> >> >> Hi,
>> >> >> >>
>> >> >> >> It's not really working for me.
>> >> >> >> I've applied all gpmi-nand driver patches and the dma driver
>> >> >> >> patches.
>> >> >> >>
>> >> >> >> I have added following kernel parameters:
>> >> >> >> mtdparts=3Dgpmi-nand:20m(boot),-(user) ubi.mtd=3D1 root=3Dubi0:=
rootfs0
>> >> >> >> rootfstype=3Dubifs gpmi_debug_init
>> >> >> >>
>> >> >> >> During boot I get already get DMA timeout:
>> >> >> >> [ =C2=A0 =C2=A02.560000] [ start_dma_without_bch_irq : 392 ] DM=
A timeout,
>> >> >> >> last DMA
>> >> >> >>
>> >> >> >> :1
>> >> >> >>
>> >> >> >> [ =C2=A0 =C2=A03.560000] [ start_dma_with_bch_irq : 427 ] bch t=
imeout!!!
>> >> >> >> ...
>> >> >> >> (see log file in attach line 89)
>> >> >>
>> >> >> I still see this DMA timeout when booting.
>> >> >> What kernel parameters do you use? I still use same as above.
>> >> >
>> >> > Do you have an SD card in the system? I'm getting the same error wh=
en
>> >> > accessing an SD card. Without SD card I can use the flash without a=
ny
>> >> > errors.
>> >>
>> >> No SD card in the system. At least not on my mx23evk board.
>> >> My real target hardware has a SDIO wifi chip.
>> >>
>> >> Are you also testing on the mx23evk board? Really strange it is not
>> >> reproducible here then.
>> >> Anyone using mx23evk please give:
>> >> - revision number of board (I have tested on rev C1)
>> >> - kernel parameter used (see previous mail for mine)
>> >
>> > It's getting ever more strange. I only have problems with concurrent
>> > access to the flash and SD-card when I do file system based accessed
>> > to the SD card.
>> > A 'dd if=3D/dev/mmcblk0 of=3D/dev/null' while excessively using the fl=
ash
>> > works well, while mounting the SD card and doing an 'ls' produces
>> > immediate BCH DMA timeouts.
>> >
>> > Perhaps someone can make anything out of that.
>>
>> I have checked and the function dma_irq_callback is never called
>> during my tests. This means the DMA transfer does not even works once.
>>
>> Also no clue here ...
>
> Aren't you getting some undervolt on the powerrail for example ? btw the =
driver
> looks a bit crappy to me, but let's believe it works ;-)
>
>>
>> > Lothar Wa=C3=9Fmann
>> > --
>> > ___________________________________________________________
>> >
>> > Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
>> > Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
>> > Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
>> > Handelsregistereintrag: Amtsgericht Aachen, HRB 4996
>> >
>> > www.karo-electronics.de | info@karo-electronics.de
>> > ___________________________________________________________
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--000e0ce0d02e1bafb804a97315b6
Content-Type: application/octet-stream; name=log1
Content-Disposition: attachment; filename=log1
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gqtkgdo90

IyBmbGFzaF9lcmFzZWFsbCAgL2Rldi9tdGQxCmZsYXNoX2VyYXNlYWxsIGhhcyBiZWVuIHJlcGxh
Y2VkIGJ5IGBmbGFzaF9lcmFzZSA8bXRkZGV2PiAwIDBgOyBwbGVhc2UgdXNlIGl0CkVyYXNpbmcg
NTEyIEtpYnl0ZSBAIDVjODAwMDAgLS0gIDIgJSBjb21wbGV0ZSBsaWJtdGQ6IGVycm9yITogTUVN
RVJBU0U2NCBpb2N0bCBmYWlsZWQgZm9yIGVyYXNlYmxvY2sgMTg1IChtdGQxKQogICAgICAgIGVy
cm9yIDUgKElucHV0L291dHB1dCBlcnJvcikKZmxhc2hfZXJhc2U6IGVycm9yITogL2Rldi9tdGQx
OiBNVEQgRXJhc2UgZmFpbHVyZQogICAgICAgICAgICAgZXJyb3IgNSAoSW5wdXQvb3V0cHV0IGVy
cm9yKQpFcmFzaW5nIDUxMiBLaWJ5dGUgQCBmZWI4MDAwMCAtLSAxMDAgJSBjb21wbGV0ZSAKIyB1
Ymlmb3JtYXQgL2Rldi9tdGQxCnViaWZvcm1hdDogbXRkMSAobmFuZCksIHNpemUgNDI3Mzk5NTc3
NiBieXRlcyAoNC4wIEdpQiksIDgxNTIgZXJhc2VibG9ja3Mgb2YgNTI0Mjg4IGJ5dGVzICg1MTIu
MCBLaUIpLCBtaW4uIEkvTyBzaXplIDQwOTYgYnl0ZXMKbGlic2Nhbjogc2Nhbm5pbmcgZXJhc2Vi
bG9jayAwIC0tICAwICUgY29tcGxldGUgIFsgIDIyMi43MzAwMDBdIFsgc3RhcnRfZG1hX3dpdGhv
dXRfYmNoX2lycSA6IDM5MiBdIERNQSB0aW1lb3V0LCBsYXN0IERNQSA6MQpbICAyMjMuNzMwMDAw
XSBbIHN0YXJ0X2RtYV93aXRoX2JjaF9pcnEgOiA0MjcgXSBiY2ggdGltZW91dCEhIQpbICAyMjMu
NzMwMDAwXSBbIG1pbF9lY2NfcmVhZF9wYWdlIDogMTA1NCBdIEVycm9yIGluIEVDQy1iYXNlZCBy
ZWFkOiAtMTEwCmxpYm10ZDogZXJyb3IhOiBjYW5ub3QgcmVhZCA2NCBieXRlcyBmcm9tIG10ZDEg
KGVyYXNlYmxvY2sgMCwgb2Zmc2V0IDApCiAgICAgICAgZXJyb3IgMTEwIChDb25uZWN0aW9uIHRp
bWVkIG91dCkKdWJpZm9ybWF0OiBlcnJvciE6IGZhaWxlZCB0byBzY2FuIG10ZDEgKC9kZXYvbXRk
MSkKIyAKIyAKIyB1Ymlmb3JtYXQgL2Rldi9tdGQxCnViaWZvcm1hdDogbXRkMSAobmFuZCksIFsg
IDIyOS40OTAwMDBdIGRtYSBhbHJlYWR5IGluIHByb2dlc3MhCnNpemUgNDI3Mzk5NTc3NiBieXRl
cyAoNC4wIEdpQiksWyAgMjI5LjUwMDAwMF0gWyBncG1pX3NlbmRfY29tbWFuZCA6IDc0OSBdIHN0
ZXAgMSBlcnJvcgogODE1MiBlcmFzZWJsb2NrcyBvZiA1MjQyODggYnl0ZXMgKDUxMi4wIEtpQiks
IG1pbi4gSS9PIHNpemUgNDA5NiBieXRlcwpsaWJzY2FuOiBzY2FubmluZyBlcmFzZWJsb2NrIDAg
LS0gIDAgJSBjb21wbGV0ZSAgWyAgMjI5LjUyMDAwMF0gWyBtaWxfY21kX2N0cmwgOiA4OTQgXSBD
aGlwOiAwLCBFcnJvciAtMQpbICAyMjkuNTIwMDAwXSBkbWEgYWxyZWFkeSBpbiBwcm9nZXNzIQpb
ICAyMjkuNTIwMDAwXSBbIGdwbWlfc2VuZF9jb21tYW5kIDogNzQ5IF0gc3RlcCAxIGVycm9yClsg
IDIyOS41MzAwMDBdIFsgbWlsX2NtZF9jdHJsIDogODk0IF0gQ2hpcDogMCwgRXJyb3IgLTEKWyAg
MjI5LjU0MDAwMF0gZG1hIGFscmVhZHkgaW4gcHJvZ2VzcyEKWyAgMjI5LjU0MDAwMF0gWyBncG1p
X3JlYWRfcGFnZSA6IDkyNCBdIHN0ZXAgMSBlcnJvcgpbICAyMjkuNTQwMDAwXSBbIG1pbF9lY2Nf
cmVhZF9wYWdlIDogMTA1NCBdIEVycm9yIGluIEVDQy1iYXNlZCByZWFkOiAtMQpsaWJtdGQ6IGVy
cm9yITogY2Fubm90IHJlYWQgNjQgYnl0ZXMgZnJvbSBtdGQxIChlcmFzZWJsb2NrIDAsIG9mZnNl
dCAwKQogICAgICAgIGVycm9yIDEgKE9wZXJhdGlvbiBub3QgcGVybWl0dGVkKQp1Ymlmb3JtYXQ6
IGVycm9yITogZmFpbGVkIHRvIHNjYW4gbXRkMSAoL2Rldi9tdGQxKQojIAojIAojIHViaWZvcm1h
dCAvZGV2L210ZDEKdWJpZm9ybWF0OiBtdGQxIChuYW5kKSwgWyAgMjM3LjM2MDAwMF0gZG1hIGFs
cmVhZHkgaW4gcHJvZ2VzcyEKc2l6ZSA0MjczOTk1Nzc2IGJ5dGVzICg0LjAgR2lCKSxbICAyMzcu
MzcwMDAwXSBbIGdwbWlfc2VuZF9jb21tYW5kIDogNzQ5IF0gc3RlcCAxIGVycm9yCiA4MTUyIGVy
YXNlYmxvY2tzIG9mIDUyNDI4OCBieXRlcyAoNTEyLjAgS2lCKSwgbWluLiBJL08gc2l6ZSA0MDk2
IGJ5dGVzCmxpYnNjYW46IHNjYW5uaW5nIGVyYXNlYmxvY2sgMCAtLSAgMCAlIGNvbXBsZXRlICBb
ICAyMzcuMzkwMDAwXSBbIG1pbF9jbWRfY3RybCA6IDg5NCBdIENoaXA6IDAsIEVycm9yIC0xClsg
IDIzNy4zOTAwMDBdIGRtYSBhbHJlYWR5IGluIHByb2dlc3MhClsgIDIzNy40MDAwMDBdIFsgZ3Bt
aV9zZW5kX2NvbW1hbmQgOiA3NDkgXSBzdGVwIDEgZXJyb3IKWyAgMjM3LjQwMDAwMF0gWyBtaWxf
Y21kX2N0cmwgOiA4OTQgXSBDaGlwOiAwLCBFcnJvciAtMQpbICAyMzcuNDEwMDAwXSBkbWEgYWxy
ZWFkeSBpbiBwcm9nZXNzIQpbICAyMzcuNDEwMDAwXSBbIGdwbWlfcmVhZF9wYWdlIDogOTI0IF0g
c3RlcCAxIGVycm9yClsgIDIzNy40MjAwMDBdIFsgbWlsX2VjY19yZWFkX3BhZ2UgOiAxMDU0IF0g
RXJyb3IgaW4gRUNDLWJhc2VkIHJlYWQ6IC0xCmxpYm10ZDogZXJyb3IhOiBjYW5ub3QgcmVhZCA2
NCBieXRlcyBmcm9tIG10ZDEgKGVyYXNlYmxvY2sgMCwgb2Zmc2V0IDApCiAgICAgICAgZXJyb3Ig
MSAoT3BlcmF0aW9uIG5vdCBwZXJtaXR0ZWQpCnViaWZvcm1hdDogZXJyb3IhOiBmYWlsZWQgdG8g
c2NhbiBtdGQxICgvZGV2L210ZDEpCgo=
--000e0ce0d02e1bafb804a97315b6--
