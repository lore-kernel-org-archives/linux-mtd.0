MIME-Version: 1.0
In-Reply-To: <4E379B28.7090902@freescale.com>
References: <1311230846-26437-1-git-send-email-b32955@freescale.com>
	<20018.43621.688990.319528@ipc1.ka-ro>
	<CAHMSPgPXnDVO630P9fnogQ0XvPSrwz0MYzXfXZLJoJNRf1gifA@mail.gmail.com>
	<201107311551.48223.marek.vasut@gmail.com>
	<CAHMSPgMK_zM17NXgsbrzs8Zw0VXtDoP12_1V7oeROSF=aBDuYg@mail.gmail.com>
	<4E379B28.7090902@freescale.com>
Date: Tue, 2 Aug 2011 09:33:49 +0200
Message-ID: <CAHMSPgM4K5o_aGK31yyFcGK-hH4WBeqVkA5dZU=FvAiKGmHA9A@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] add the GPMI controller driver for IMX23/IMX28
From: Koen Beel <koen.beel.barco@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: multipart/mixed; boundary=0016e6db2980d4139904a980c4d3
Cc: arnd@arndb.de, dedekind1@gmail.com, Wolfram Sang <w.sang@pengutronix.de>,
	Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
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

--0016e6db2980d4139904a980c4d3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 2, 2011 at 8:37 AM, Huang Shijie <b32955@freescale.com> wrote:
> Hi,
>>
>> Hi,
>>
>> Don't think it's a hardware issue. After all it is working on the
>> mx23evk using the Freescale BSP based on 2.6.35.3.
>
> I doubt the Freescale BSP has fix the conflict, while the community kerne=
l
> does not
> fix it.
> Anyway, I will do more test on the mx23 board myself.

Strange indeed. I suspect that the BSP used another way to mark bad blocks.

>
>
>
>> Now I tested using this kernel command line:
>> mtdparts=3Dgpmi-nand:20m(boot),-(user) gpmi_debug_init
>> (So I removed the ubi rootfs stuff, see previous mails).
>>
>> Its booting fine now without complaining about dma timeouts.
>
> ok.

That's mainly because the ubi stuff is not done at startup.

>>
>> Have tried flash_eraseall /dev/mtd1. Now it's complaining and thinking
>> all blocks are bad. So a "flash_erase: Skipping bad block at 1db00000"
>> message for every erase block.
>> Writing 1 to /sys/devices/platform/imx23-gpmi-nand/ignorebad, makes to
>
> This is a very dangerous interface.

I know but it solved an issue here. Now flash_eraseall seems to be
working again without that ignorebad turned on (only finds one bad
erase blcok).
Again: I suspect that the BSP used another way to mark bad blocks.

>
>> go a little further giving 'only one' error but I doubt it's working
>> at all. See attached log file.
>>
>> When the trying ubiformat /dev/mtd1 its stopping with a dma timeout.
>
> echo 0x20 > /sys/devices/platform/imx23-gpmi-nand/gpmi_debug
>
> to show the GPMI register when the DMA timeout occurs.

Don't have this sysfs interface here. I also don't see where it is
registered in the driver code.
Anyway I have hardcoded GPMI_DEBUG_CRAZY in gpmi_debug_setup.

log file attached.

Regards,
Koen

>
>
> Best Regards
> Huang Shijie
>>
>> Every subsequent action (e.g. using ubiformat or flash_eraseall) using
>> that dma channel is failing.
>> I have put a printk in mxs-dma.c around line 387:
>>
>> =C2=A0 =C2=A0 if (mxs_chan->status =3D=3D DMA_IN_PROGRESS&& =C2=A0!appen=
d)
>> =C2=A0 =C2=A0 {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("dma already in progess!\n");
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;
>> =C2=A0 =C2=A0 }
>>
>> I see that printk also in the log file in attach. Seems like the
>> mxs-dma is failing at some point and for the rest of the time always
>> keeps it's status at DMA_IN_PROGRESS
>>
>> Any input or feedback is welcome.
>>
>> Regards,
>> Koen
>>
>>
>> On Sun, Jul 31, 2011 at 3:51 PM, Marek Vasut<marek.vasut@gmail.com>
>> =C2=A0wrote:
>>>
>>> On Friday, July 29, 2011 05:00:48 PM Koen Beel wrote:
>>>>
>>>> On Fri, Jul 29, 2011 at 2:41 PM, Lothar Wa=C3=9Fmann<LW@karo-electroni=
cs.de>
>>>
>>> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> Koen Beel writes:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On Fri, Jul 29, 2011 at 9:20 AM, Lothar
>>>>>> Wa=C3=9Fmann<LW@karo-electronics.de>
>>>
>>> wrote:
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> Koen Beel writes:
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> I have test on mx23evk board. Still see the same issues.
>>>>>>>>
>>>>>>>> On Wed, Jul 27, 2011 at 3:53 AM, Huang Shijie<b32955@freescale.com=
>
>>>
>>> wrote:
>>>>>>>>>
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> Thanks for your test.
>>>>>>>>>
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> It's not really working for me.
>>>>>>>>>> I've applied all gpmi-nand driver patches and the dma driver
>>>>>>>>>> patches.
>>>>>>>>>>
>>>>>>>>>> I have added following kernel parameters:
>>>>>>>>>> mtdparts=3Dgpmi-nand:20m(boot),-(user) ubi.mtd=3D1 root=3Dubi0:r=
ootfs0
>>>>>>>>>> rootfstype=3Dubifs gpmi_debug_init
>>>>>>>>>>
>>>>>>>>>> During boot I get already get DMA timeout:
>>>>>>>>>> [ =C2=A0 =C2=A02.560000] [ start_dma_without_bch_irq : 392 ] DMA=
 timeout,
>>>>>>>>>> last DMA
>>>>>>>>>>
>>>>>>>>>> :1
>>>>>>>>>>
>>>>>>>>>> [ =C2=A0 =C2=A03.560000] [ start_dma_with_bch_irq : 427 ] bch ti=
meout!!!
>>>>>>>>>> ...
>>>>>>>>>> (see log file in attach line 89)
>>>>>>>>
>>>>>>>> I still see this DMA timeout when booting.
>>>>>>>> What kernel parameters do you use? I still use same as above.
>>>>>>>
>>>>>>> Do you have an SD card in the system? I'm getting the same error wh=
en
>>>>>>> accessing an SD card. Without SD card I can use the flash without a=
ny
>>>>>>> errors.
>>>>>>
>>>>>> No SD card in the system. At least not on my mx23evk board.
>>>>>> My real target hardware has a SDIO wifi chip.
>>>>>>
>>>>>> Are you also testing on the mx23evk board? Really strange it is not
>>>>>> reproducible here then.
>>>>>> Anyone using mx23evk please give:
>>>>>> - revision number of board (I have tested on rev C1)
>>>>>> - kernel parameter used (see previous mail for mine)
>>>>>
>>>>> It's getting ever more strange. I only have problems with concurrent
>>>>> access to the flash and SD-card when I do file system based accessed
>>>>> to the SD card.
>>>>> A 'dd if=3D/dev/mmcblk0 of=3D/dev/null' while excessively using the f=
lash
>>>>> works well, while mounting the SD card and doing an 'ls' produces
>>>>> immediate BCH DMA timeouts.
>>>>>
>>>>> Perhaps someone can make anything out of that.
>>>>
>>>> I have checked and the function dma_irq_callback is never called
>>>> during my tests. This means the DMA transfer does not even works once.
>>>>
>>>> Also no clue here ...
>>>
>>> Aren't you getting some undervolt on the powerrail for example ? btw th=
e
>>> driver
>>> looks a bit crappy to me, but let's believe it works ;-)
>>>
>>>>> Lothar Wa=C3=9Fmann
>>>>> --
>>>>> ___________________________________________________________
>>>>>
>>>>> Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
>>>>> Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
>>>>> Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
>>>>> Handelsregistereintrag: Amtsgericht Aachen, HRB 4996
>>>>>
>>>>> www.karo-electronics.de | info@karo-electronics.de
>>>>> ___________________________________________________________
>>>>
>>>> _______________________________________________
>>>> linux-arm-kernel mailing list
>>>> linux-arm-kernel@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
>

--0016e6db2980d4139904a980c4d3
Content-Type: application/octet-stream; name=log2
Content-Disposition: attachment; filename=log2
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gqujwtu70

IyBmbGFzaF9lcmFzZWFsbCAvZGV2L210ZDEKZmxhc2hfZXJhc2VhbGwgaGFzIGJlZW4gcmVwbGFj
ZWQgYnkgYGZsYXNoX2VyYXNlIDxtdGRkZXY+IDAgMGA7IHBsZWFzZSB1c2UgaXQKRXJhc2luZyA1
MTIgS2lieXRlIEAgNWMwMDAwMCAtLSAgMiAlIGNvbXBsZXRlIGZsYXNoX2VyYXNlOiBTa2lwcGlu
ZyBiYWQgYmxvY2sgYXQgMDVjODAwMDAKRXJhc2luZyA1MTIgS2lieXRlIEAgZmViODAwMDAgLS0g
MTAwICUgY29tcGxldGUKIwojCiMKIyB1Ymlmb3JtYXQgL2Rldi9tdGQwCnViaWZvcm1hdDogbXRk
MCAobmFuZCksIHNpemUgMjA5NzE1MjAgYnl0ZXMgKDIwLjAgTWlCKSwgNDAgZXJhc2VibG9ja3Mg
b2YgNTI0Mjg4IGJ5dGVzICg1MTIuMCBLaUIpLCBtaW4uIEkvTyBzaXplIDQwOTYgYnl0ZXMKbGli
c2Nhbjogc2Nhbm5pbmcgZXJhc2VibG9jayAwIC0tICAyICUgY29tcGxldGUgIFsgIDQ0OS43NjAw
MDBdIFsgc3RhcnRfZG1hX3dpdGhvdXRfYmNoX2lycSA6IDM5MiBdIERNQSB0aW1lb3V0LCBsYXN0
IERNQSA6MQpbICA0NDkuNzYwMDAwXSBbIGdwbWlfc2hvd19yZWdzIDogMDc2IF0gLS0tLS0tLS0t
LS0tLS0gU2hvdyBHUE1JIHJlZ2lzdGVycyAtLS0tLS0tLS0tClsgIDQ0OS43NzAwMDBdIFsgZ3Bt
aV9zaG93X3JlZ3MgOiAwNzkgXSBvZmZzZXQgMHgwMDAgOiAweDIzODAxMGRhClsgIDQ0OS43ODAw
MDBdIFsgZ3BtaV9zaG93X3JlZ3MgOiAwNzkgXSBvZmZzZXQgMHgwMTAgOiAweDAwMDAwMDAwClsg
IDQ0OS43ODAwMDBdIFsgZ3BtaV9zaG93X3JlZ3MgOiAwNzkgXSBvZmZzZXQgMHgwMjAgOiAweDAw
MDAxMWZmClsgIDQ0OS43OTAwMDBdIFsgZ3BtaV9zaG93X3JlZ3MgOiAwNzkgXSBvZmZzZXQgMHgw
MzAgOiAweDAwMDAxMGRhClsgIDQ0OS44MDAwMDBdIFsgZ3BtaV9zaG93X3JlZ3MgOiAwNzkgXSBv
ZmZzZXQgMHgwNDAgOiAweDQwZGE0NDgwClsgIDQ0OS44MDAwMDBdIFsgZ3BtaV9zaG93X3JlZ3Mg
OiAwNzkgXSBvZmZzZXQgMHgwNTAgOiAweDQwZDk1MDAwClsgIDQ0OS44MTAwMDBdIFsgZ3BtaV9z
aG93X3JlZ3MgOiAwNzkgXSBvZmZzZXQgMHgwNjAgOiAweDAwMDQwMDBjClsgIDQ0OS44MjAwMDBd
IFsgZ3BtaV9zaG93X3JlZ3MgOiAwNzkgXSBvZmZzZXQgMHgwNzAgOiAweDAwMDEwMjAzClsgIDQ0
OS44MjAwMDBdIFsgZ3BtaV9zaG93X3JlZ3MgOiAwNzkgXSBvZmZzZXQgMHgwODAgOiAweDA1MDAw
MDAwClsgIDQ0OS44MzAwMDBdIFsgZ3BtaV9zaG93X3JlZ3MgOiAwNzkgXSBvZmZzZXQgMHgwOTAg
OiAweDA5MDIwMTAxClsgIDQ0OS44NDAwMDBdIFsgZ3BtaV9zaG93X3JlZ3MgOiAwNzkgXSBvZmZz
ZXQgMHgwYTAgOiAweDAwMDAwMDMwClsgIDQ0OS44NDAwMDBdIFsgZ3BtaV9zaG93X3JlZ3MgOiAw
NzkgXSBvZmZzZXQgMHgwYjAgOiAweDgwMDAwMDEwClsgIDQ0OS44NTAwMDBdIFsgZ3BtaV9zaG93
X3JlZ3MgOiAwNzkgXSBvZmZzZXQgMHgwYzAgOiAweDEwMDAwMGJhClsgIDQ0OS44NjAwMDBdIFsg
Z3BtaV9zaG93X3JlZ3MgOiAwNzkgXSBvZmZzZXQgMHgwZDAgOiAweDAzMDAwMDAwClsgIDQ0OS44
NjAwMDBdIFsgZ3BtaV9zaG93X3JlZ3MgOiAwODEgXSAtLS0tLS0tLS0tLS0tLSBTaG93IEdQTUkg
cmVnaXN0ZXJzIGVuZCAtLS0tLS0tLS0tClsgIDQ0OS44NzAwMDBdIEtlcm5lbCBwYW5pYyAtIG5v
dCBzeW5jaW5nOiAtLS0tLS0tLS0tLURNQSBGQUlMRUQtLS0tLS0tLS0tLS0tLS0tLS0KWyAgNDQ5
Ljg4MDAwMF0gWzxjMDMzYjliMD5dICh1bndpbmRfYmFja3RyYWNlKzB4MC8weGYwKSBmcm9tIFs8
YzA1Y2ZhY2M+XSAocGFuaWMrMHg1OC8weDE4YykKWyAgNDQ5Ljg5MDAwMF0gWzxjMDVjZmFjYz5d
IChwYW5pYysweDU4LzB4MThjKSBmcm9tIFs8YzA1MThhYzQ+XSAoc3RhcnRfZG1hX3dpdGhvdXRf
YmNoX2lycSsweDk4LzB4YWMpClsgIDQ0OS45MDAwMDBdIFs8YzA1MThhYzQ+XSAoc3RhcnRfZG1h
X3dpdGhvdXRfYmNoX2lycSsweDk4LzB4YWMpIGZyb20gWzxjMDUxOGIwND5dIChzdGFydF9kbWFf
d2l0aF9iY2hfaXJxKzB4MmMvMHg3OCkKWyAgNDQ5LjkxMDAwMF0gWzxjMDUxOGIwND5dIChzdGFy
dF9kbWFfd2l0aF9iY2hfaXJxKzB4MmMvMHg3OCkgZnJvbSBbPGMwNTE5NzVjPl0gKGdwbWlfcmVh
ZF9wYWdlKzB4MTYwLzB4MWNjKQpbICA0NDkuOTIwMDAwXSBbPGMwNTE5NzVjPl0gKGdwbWlfcmVh
ZF9wYWdlKzB4MTYwLzB4MWNjKSBmcm9tIFs8YzA1MTgyMmM+XSAobWlsX2VjY19yZWFkX3BhZ2Ur
MHg2NC8weDFkYykKWyAgNDQ5LjkzMDAwMF0gWzxjMDUxODIyYz5dIChtaWxfZWNjX3JlYWRfcGFn
ZSsweDY0LzB4MWRjKSBmcm9tIFs8YzA1MTM0OGM+XSAobmFuZF9kb19yZWFkX29wcysweDFkOC8w
eDQ2OCkKWyAgNDQ5Ljk0MDAwMF0gWzxjMDUxMzQ4Yz5dIChuYW5kX2RvX3JlYWRfb3BzKzB4MWQ4
LzB4NDY4KSBmcm9tIFs8YzA1MTNhOTA+XSAobmFuZF9yZWFkKzB4OTQvMHhiMCkKWyAgNDQ5Ljk1
MDAwMF0gWzxjMDUxM2E5MD5dIChuYW5kX3JlYWQrMHg5NC8weGIwKSBmcm9tIFs8YzA1MGQ2NTQ+
XSAocGFydF9yZWFkKzB4NjAvMHhlNCkKWyAgNDQ5Ljk2MDAwMF0gWzxjMDUwZDY1ND5dIChwYXJ0
X3JlYWQrMHg2MC8weGU0KSBmcm9tIFs8YzA1MGYwZGM+XSAobXRkX3JlYWQrMHhkOC8weDIwYykK
WyAgNDQ5Ljk3MDAwMF0gWzxjMDUwZjBkYz5dIChtdGRfcmVhZCsweGQ4LzB4MjBjKSBmcm9tIFs8
YzAzZGM4OTA+XSAodmZzX3JlYWQrMHhiMC8weDE4MCkKWyAgNDQ5Ljk3MDAwMF0gWzxjMDNkYzg5
MD5dICh2ZnNfcmVhZCsweGIwLzB4MTgwKSBmcm9tIFs8YzAzZGM5YTA+XSAoc3lzX3JlYWQrMHg0
MC8weDcwKQpbICA0NDkuOTgwMDAwXSBbPGMwM2RjOWEwPl0gKHN5c19yZWFkKzB4NDAvMHg3MCkg
ZnJvbSBbPGMwMzM2NzgwPl0gKHJldF9mYXN0X3N5c2NhbGwrMHgwLzB4MmMpCgo=
--0016e6db2980d4139904a980c4d3--
