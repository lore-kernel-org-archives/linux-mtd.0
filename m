Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pydb-0001SH-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 21:33:19 +0100
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pydU-0001SB-00
	for mtd@infradead.org; Wed, 18 Apr 2001 21:33:12 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <mtd@infradead.org>; Wed, 18 Apr 2001 20:32:52 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Wed, 18 Apr 2001 20:32:51 +0000
content-class: urn:content-classes:message
Subject: RE: Intel Flash
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C0C846.BCFAA3C2"
Date: Wed, 18 Apr 2001 20:32:51 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A913F@kolkrabbi.flaga.is>
From: =?Windows-1252?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: "Vipin Malik" <vipin.malik@daniel.com>,
	"Marcio Koch" <koch@inf.pucrs.br>
Cc: "jffs-dev" <jffs-dev@axis.com>,
	"mtd" <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C0C846.BCFAA3C2
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

I believe that the problem you are seeing is
that the device is using cmdset 0x0003, which
is close to cmdset 0x0001. Cmdset 0x0001 is=20
supported by mtd so a quick and not so dirty
fix is to add the following two lines in=20
cfi_probe.c, function cfi_cfi_probe(),

if(cfi.cfiq->P_ID =3D=3D 3)
	cfi.fgiq->P_ID =3D 1;

after the two lines (around line 343)

/* Do any necessary byteswapping */
cfi.cfiq->P_ID =3D le16_to_cpu(cfi.cfiq->P_ID);

Hope this helps,

K.D.


-----Original Message-----
From:	Vipin Malik
Sent:	Wed 4/18/2001 6:57 PM
To:	Marcio Koch
Cc:	jffs-dev; mtd
Subject:	Re: Intel Flash

Marcio Koch wrote:

> TE28F320

^^^^^^^^^^^^^ This is the part #. You can ignore the rest of the stuff.
Go to www.intel.com and download the datasheet on this part and see if
it is a
CFI compatable NOR flash or not.

If not CFI, but is NOR, then try to use the JDEC module, rather than the
CFI
module. If Not NOR (i.e. if NAND)
then I don't know.

Hope this helps.

Vipin
P.S. This is really a MTD issue and you will probably have more luck
posting
to that list. I've CC to that list if you
need the email.

>
> B3BA110
> U9490626A
> (c)1998
>
> Does anybody know if this flash is supported by linux ? If so what
kernel
> and mtd code should I use ?
>
> For MPC8xx.
>
> I'm using kernel 2.4.3-pre4 and it fails when I try to load the
physmap
> module.
>
> Here is what I did and the error I got:
>
> sh-2.03# modprobe -a mtdchar mtdblock cfi_cmdset_0001  map_rom
cfi_probe
> sh-2.03# lsmod
> Module                  Size  Used by
> cfi_probe               7920   0  (unused)
> map_rom                 1072   0  (unused)
> cfi_cmdset_0001         8000   0  (unused)
> mtdblock                6528   0  (unused)
> mtdchar                 5408   0  (unused)
> mtdcore                 2976   2  [mtdblock mtdchar]
> sh-2.03# modprobe -a physmap
> physmap flash device: 3fffff at fe000000
> Physically mapped flash: Found no CFI device at location zero
> /lib/modules/2.4.3-pre4/kernel/drivers/mtd/physmap.o: init_module:
Device
> not configured
> Hint: insmod errors can be caused by incorrect module parameters,
including
> invalid IO or IRQ parameters
> /lib/modules/2.4.3-pre4/kernel/drivers/mtd/physmap.o: insmod
> /lib/modules/2.4.3-pre4/kernel/drivers/mtd/physmap.o failed
> /lib/modules/2.4.3-pre4/kernel/drivers/mtd/physmap.o: insmod physmap
failed
>
> Any help would be appreciated.
>
> Thanks,
>
> Marcio Koch
> koch@inf.pucrs.br
> PUCRS/ELinux
>
> To unsubscribe from this list: send the line "unsubscribe jffs-dev" in
> the body of a message to majordomo@axis.com



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org




------_=_NextPart_001_01C0C846.BCFAA3C2
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+IjQUAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEAEAAAAFJFOiBJbnRlbCBGbGFzaAD7
BAEFgAMADgAAANEHBAASABQAIAAzAAMAWAEBIIADAA4AAADRBwQAEgAUACAAMwADAFgBAQmAAQAh
AAAAQjY4RTQ1MTkwRDlBNzM0N0E0OTYzMjJEQTE4QTE0MTgAAwcBA5AGAEgNAAA3AAAAAwA2AAAA
AABAADkAwqP6vEbIwAEeAD0AAQAAAAUAAABSRTogAAAAAAIBRwABAAAAMAAAAGM9SVM7YT0gO3A9
RmxhZ2E7bD1LT0xLUkFCQkktMDEwNDE4MjAzMjUxWi0xNjc1AB4ASQABAAAAEAAAAFJlOiBJbnRl
bCBGbGFzaABAAE4AAE6kYjnIwAEeAFoAAQAAAAwAAABWaXBpbiBNYWxpawACAVsAAQAAAEAAAAAA
AAAAgSsfpL6jEBmdbgDdAQ9UAgAAAABWaXBpbiBNYWxpawBTTVRQAHZpcGluLm1hbGlrQGRhbmll
bC5jb20AAgFcAAEAAAAcAAAAU01UUDpWSVBJTi5NQUxJS0BEQU5JRUwuQ09NAB4AXQABAAAADAAA
AFZpcGluIE1hbGlrAAIBXgABAAAAQAAAAAAAAACBKx+kvqMQGZ1uAN0BD1QCAAAAAFZpcGluIE1h
bGlrAFNNVFAAdmlwaW4ubWFsaWtAZGFuaWVsLmNvbQACAV8AAQAAABwAAABTTVRQOlZJUElOLk1B
TElLQERBTklFTC5DT00AHgBmAAEAAAAFAAAAU01UUAAAAAAeAGcAAQAAABcAAAB2aXBpbi5tYWxp
a0BkYW5pZWwuY29tAAAeAGgAAQAAAAUAAABTTVRQAAAAAB4AaQABAAAAFwAAAHZpcGluLm1hbGlr
QGRhbmllbC5jb20AAB4AcAABAAAADAAAAEludGVsIEZsYXNoAAIBcQABAAAAGwAAAAHAyEMwozG0
DPjbIUm6nPLZ4Oc3zbkAALdF0gAeAHMAAQAAAA4AAABqZmZzLWRldjsgbXRkAAAAHgB0AAEAAAAM
AAAATWFyY2lvIEtvY2gAHgAaDAEAAAAPAAAAS+FyaSBEYXbt8HNzb24AAB4AHQ4BAAAADAAAAElu
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
0/z/I2DV49bLKCHYENo70QFgQLcBACsQsoBybUUdKn3iQB4ANRABAAAAPAAAADxFQURCMTBCQUMy
NjZBMTRBODVFQ0JGODY4NkE3M0UzMTBBOTEzRkBrb2xrcmFiYmkuZmxhZ2EuaXM+AB4ARxABAAAA
DwAAAG1lc3NhZ2UvcmZjODIyAAALAPIQAQAAAB8A8xABAAAALAAAAFIARQAlADMAQQAgAEkAbgB0
AGUAbAAgAEYAbABhAHMAaAAuAEUATQBMAAAACwD2EAAAAABAAAcwbjK4DUbIwAFAAAgwjsoBvUbI
wAEDAN4/5AQAAAMA8T8JAAAAHgD4PwEAAAAPAAAAS+FyaSBEYXbt8HNzb24AAAIB+T8BAAAAWgAA
AAAAAADcp0DIwEIQGrS5CAArL+GCAQAAAAAAAAAvTz1GTEFHQS9PVT1GSVJTVCBBRE1JTklTVFJB
VElWRSBHUk9VUC9DTj1SRUNJUElFTlRTL0NOPUtBUklEAAAAHgD6PwEAAAAVAAAAU3lzdGVtIEFk
bWluaXN0cmF0b3IAAAAAAgH7PwEAAAAeAAAAAAAAANynQMjAQhAatLkIACsv4YIBAAAAAAAAAC4A
AAADAP0/5AQAAAMAGUAAAAAAAwAaQAAAAAADAB1AAAAAAAMAHkAAAAAAHgAwQAEAAAAGAAAAS0FS
SUQAAAAeADFAAQAAAAYAAABLQVJJRAAAAB4AMkABAAAAFwAAAHZpcGluLm1hbGlrQGRhbmllbC5j
b20AAB4AM0ABAAAAFwAAAHZpcGluLm1hbGlrQGRhbmllbC5jb20AAB4AOEABAAAABgAAAEtBUklE
AAAAHgA5QAEAAAACAAAALgAAAAsAKQAAAAAACwAjAAAAAAADAAYQRtL+NAMABxCZBwAAAwAQEAAA
AAADABEQAAAAAB4ACBABAAAAZQAAAEhJLElCRUxJRVZFVEhBVFRIRVBST0JMRU1ZT1VBUkVTRUVJ
TkdJU1RIQVRUSEVERVZJQ0VJU1VTSU5HQ01EU0VUMFgwMDAzLFdISUNISVNDTE9TRVRPQ01EU0VU
MFgwMDAxQ00AAAAAAgF/AAEAAAA8AAAAPEVBREIxMEJBQzI2NkExNEE4NUVDQkY4Njg2QTczRTMx
MEE5MTNGQGtvbGtyYWJiaS5mbGFnYS5pcz4A99A=

------_=_NextPart_001_01C0C846.BCFAA3C2--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
