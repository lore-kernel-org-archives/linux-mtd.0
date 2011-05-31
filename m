Received: from [74.125.149.201] (helo=na3sys009aog109.obsmtp.com)
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRRaU-0005vt-7T
	for linux-mtd@lists.infradead.org; Tue, 31 May 2011 16:14:45 +0000
Received: by mail-vx0-f182.google.com with SMTP id 34so4527374vxc.41
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 May 2011 09:10:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTinyQ1hoRDzJ8QKNZYP1m8X+AyPUGQ@mail.gmail.com>
References: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
	<BANLkTin9hvdNCMeVRSj806R19obN_91v5w@mail.gmail.com>
	<BANLkTinyQ1hoRDzJ8QKNZYP1m8X+AyPUGQ@mail.gmail.com>
Date: Tue, 31 May 2011 12:10:47 -0400
Message-ID: <BANLkTim+sNbXG3yk_DGZk4=+0Za+gb65BA@mail.gmail.com>
Subject: Re: ubifs_decompress: cannot decompress ...
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: "Matthew L. Creech" <mlcreech@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthew,

On Tue, May 31, 2011 at 11:47 AM, Matthew L. Creech <mlcreech@gmail.com> wr=
ote:
> On Mon, May 30, 2011 at 8:29 AM, Ben Gardiner
> <bengardiner@nanometrics.ca> wrote:
>>
>> I don't see any debug statements in lzo1x_decompress_safe() that can
>> be enabled, so you might want to add some printing to
>> lzo1x_decompress_safe() or at least print the non-ok return code of
>> lzo1x_decompress_safe() in lzo_decompress() to get an idea of how the
>> decompressor is failing.
>>
>
> Looks like it's returning LZO_E_LOOKBEHIND_OVERRUN. =A0I don't know what
> that indicates, but there is trailing 0xff data in the block to be
> decompressed if that matters:

Interesting -- does the trailing 0xff have ECC set, or is it erased
pages of 0xff?

> XXXX: LZO_E_LOOKBEHIND_OVERRUN

Can't say much more about this than lzo-2.05/doc/LZOAPI.TXT [1] does:

  LZO_E_LOOKBEHIND_OVERRUN
    Your data is corrupted.

> UBIFS error (pid 428): ubifs_decompress: cannot decompress 1010 bytes,
> compressor lzo, error -22
> 00000000: 00 0f 69 6e 3a 61 74 74 72 00 c2 38 1c 03 39 03 =A0..in:attr..8=
..9.
> 00000010: 2f 30 31 2f 6d 57 43 2f 2e 56 61 6c 75 65 4d 61 =A0/01/mWC/.Val=
ueMa
> 00000020: 78 3a 61 91 03 94 31 72 00 69 6e d0 03 00 01 37 =A0x:a...1r.in.=
...7
> 00000030: 1c 03 3d 01 2f 53 65 72 69 61 6c 4e 75 6d 62 65 =A0..=3D./Seria=
lNumbe
> 00000040: 72 2f 98 07 98 03 00 0a 04 2f 03 63 01 2f 53 6f =A0r/......./.c=
./So
> 00000050: 66 74 77 61 72 65 2f 43 6f 6d 6d 61 6e 64 73 2f =A0ftware/Comma=
nds/
> 00000060: 6e 65 78 74 d2 01 49 44 29 bc 00 03 06 47 04 81 =A0next..ID)...=
.G..
> 00000070: 0d 03 28 c0 00 00 04 44 61 74 61 20 53 65 72 76 =A0..(....Data =
Serv
> 00000080: 65 72 73 2f 42 41 43 6e 65 74 2d 49 50 c4 01 0b =A0ers/BACnet-I=
P...
> 00000090: 44 65 76 69 63 65 49 6e 73 74 61 6e 63 65 29 14 =A0DeviceInstan=
ce).
> 000000a0: 01 05 00 f7 28 41 04 81 03 02 20 0c 1f 01 4d 41 =A0....(A.... .=
..MA
> 000000b0: 43 29 08 01 03 02 19 42 04 81 05 20 0d 07 01 4e =A0C).....B... =
...N
> 000000c0: 61 6d 2a 14 02 02 02 18 3c 03 7b 20 02 04 01 07 =A0am*.....<.{ =
....
> 000000d0: 42 4d 44 41 64 64 72 65 73 73 2a fc 01 02 1d 40 =A0BMDAddress*.=
...@
> 000000e0: 04 81 01 20 05 f4 00 06 54 69 6d 65 54 6f 4c 69 =A0... ....Time=
ToLi
> 000000f0: 76 2b f5 01 1e 20 05 f4 01 02 61 73 65 49 64 80 =A0v+... ....as=
eId.
> 00000100: 36 2a f5 01 20 20 05 f4 03 07 44 65 66 61 75 6c =A06*.. =A0....=
Defaul
> 00000110: 74 4e 65 74 2f e4 07 03 02 1a 46 04 81 0d 20 01 =A0tNet/.....F.=
.. .
> 00000120: 00 03 00 02 45 6e 61 62 6c 65 42 61 73 65 46 6f =A0....EnableBa=
seFo
> 00000130: 72 47 61 74 65 77 61 79 2a 24 02 02 1f 45 04 81 =A0rGateway*$..=
.E..
> 00000140: 0b 20 0e 18 01 03 52 6f 75 74 65 64 2a 14 01 02 =A0. ....Routed=
*...
> 00000150: 21 50 04 81 21 20 01 14 01 c2 07 30 31 3e 84 09 =A0!P..! .....0=
1>..
> 00000160: 03 01 f4 4b 04 81 17 20 17 40 01 2d a8 09 02 24 =A0...K... .@.-=
...$
> 00000170: 4c 04 81 19 20 17 2c 01 2e d0 09 01 23 3a 03 77 =A0L... .,.....=
#:.w
> 00000180: 20 07 2c 01 2d 1d 02 1c 20 05 d0 0c b0 24 33 cc =A0 .,.-... ...=
.$3.
> 00000190: 07 02 1b 00 00 00 11 6c 00 00 3f 6a 68 2e 73 ec =A0.......l..?j=
h.s.
> 000001a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000001b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000001c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000001d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000001e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000001f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000200: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000210: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000220: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000230: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000240: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000250: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000260: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000270: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000280: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000290: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000002a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000002b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000002c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000002d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000002e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000002f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000300: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000310: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000320: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000330: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000340: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000350: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000360: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000370: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000380: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 00000390: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000003a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000003b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000003c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000003d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000003e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =A0............=
....
> 000003f0: ff ff
> UBIFS error (pid 428): read_block: bad data node (block 388, inode 556196=
)
> UBIFS error (pid 428): do_readpage: cannot read page 388 of inode
> 556196, error -22


Could it be possible that writing the page was interrupted? I guess
the CRC checks above decompress would catch that though.

Sorry I can't be of more help here.

Best Regards,
Ben Gardiner

[1] http://www.oberhumer.com/opensource/lzo/download/

---
Nanometrics Inc.
http://www.nanometrics.ca
