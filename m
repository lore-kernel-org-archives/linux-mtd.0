Received: from cluster-a.mailcontrol.com ([85.115.52.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTd0G-0003ms-El
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 14:41:23 +0000
Received: from rly02a.srv.mailcontrol.com (localhost.localdomain [127.0.0.1])
	by rly02a.srv.mailcontrol.com (MailControl) with ESMTP id
	n6MEdjZn029077
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jul 2009 15:41:00 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by rly02a.srv.mailcontrol.com (MailControl) id n6MEcfcU018935
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jul 2009 15:38:48 +0100
From: Canella Matteo <Matteo.Canella@mta.it>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 22 Jul 2009 16:38:19 +0200
Subject: FW: LEB size configuration (was: UBI FS mounting time)
Message-ID: <BD9F3F3F5A6CCF4BA032B9FED4DD312E5D09531F37@mta-digimail.MTA.INT>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Bityutskiy Artem \(Nokia-M/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian, thank you for your reply,

> The possibility exists to double the eraseblock size by treating 2
> eraseblocks as
> though it was 1.  That should halve the UBI load time to 3 seconds but
> it would
> use a bit more memory in UBIFS.  Of course you could double again, with
> yet
> more memory required by UBIFS.

I'm a little bit jammed...  I surfed all the docs and faqs but I can't find=
 the answers.
I'm trying to double the logical erase block size.
I've a 1Gb NAND flash.

Here's my steps:

Looking to the old dmesg of the flash mounting I see:
[    6.705712] UBI: logical eraseblock size:    126976 bytes

First question: Why LEB size needs to be smaller than PEB size? PEB size is=
 128KiB =3D 131072 byte. Is it mandatory to have LEB size smaller than PEB =
size? How much smaller?

Whatever, I try to double this value:
mkfs.ubifs  -m 2048 -e 253952 -c 4096 -o ubifs.img

the "-e" option is the LEB size (126976 * 2 =3D 253952)
"-c" option is the max LEB count, so I guess 4096 for 1 Gigabyte is the rig=
ht number.

This is the output of the command with verbose option on:

root@mpc5121:~# mkfs.ubifs  -m 2048 -e 253952 -c 4096 -o ubifs.img -v
mkfs.ubifs
        root:         (null)
        min_io_size:  2048
        leb_size:     253952
        max_leb_cnt:  4096
        output:       ubifs.img
        jrn_size:     8388608
        reserved:     0
        compr:        lzo
        keyhash:      r5
        fanout:       8
        orph_lebs:    1
        super lebs:   1
        master lebs:  2
        log_lebs:     4
        lpt_lebs:     2
        orph_lebs:    1
        main_lebs:    3
        gc lebs:      1
        index lebs:   1
        leb_cnt:      13
        UUID:         A9CECA68-0BFB-4753-A886-3D76ADD2D067
Success!

Ok, now I have my ubifs.img
Next step: ubinize.
This is my cfg file:

root@mpc5121:~# vi ubinize.cfg

[ubifs]
mode=3Dubi
image=3Dubifs.img
vol_id=3D0
vol_size=3D992MiB
vol_type=3Dstatic
vol_name=3DfredubifsNand
vol_alignment=3D1


I choose vol_size =3D 992Mib because 253952 (LEB size) * 4096 (N=B0 of LEB)=
 =3D 992 Mib
Ok, now launch ubinize:
root@mpc5121:~# ubinize -o ubi.img -m 2048 -p 128KiB -s 2048 ubinize.cfg -v
ubinize: LEB size:      126976
ubinize: PEB size:      131072
ubinize: min. I/O size: 2048
ubinize: sub-page size: 2048
ubinize: VID offset:    2048
ubinize: data offset:   4096
ubinize: loaded the ini-file "ubinize.cfg"
ubinize: count of sections: 1

ubinize: parsing section "ubifs"
ubinize: mode=3Dubi, keep parsing
ubinize: volume type: static
ubinize: volume ID: 0
ubinize: volume size: 1040187392 bytes
ubinize: volume name: fredubifsNand
ubinize: volume alignment: 1
ubinize: adding volume 0
ubinize: writing volume 0
ubinize: image file: ubifs.img

ubinize: writing layout volume
ubinize: done

Why LEB size is 126976 and not 253952 as I set up?

Now I format the MTD device (/dev/mtd10) passing ubi.img to ubiformat:

root@mpc5121:~# ubiformat /dev/mtd10 -f ubi.img -s 2048
ubiformat: mtd10 (nand), size 1073741824 bytes (1024.0 MiB), 8192 erasebloc=
ks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 8191 -- 100 % complete
ubiformat: 8159 eraseblocks have valid erase counter, mean value is 9
ubiformat: bad eraseblocks: 907, 1655, 2580, 2604, 3713, 3715, 3717, 4344, =
4520, 4526, 4532, 5335, 5345, 5347, 5349, 5351, 5353, 5355, 5357, 5359, 556=
1, 5711, 6118, 6120, 6138, 6192, 6202, 6204, 7931, 8188, 8189, 8190, 8191
ubiformat: flashing eraseblock 27 -- 100 % complete
ubiformat: formatting eraseblock 8191 -- 100 % complete


Then I try to attach the MTD device:

root@mpc5121:~# ubiattach /dev/ubi_ctrl -m 10 -O 2048
[13244.254538] UBI: attaching mtd10 to ubi0
[13244.258893] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[13244.265508] UBI: logical eraseblock size:    126976 bytes
[13244.271235] UBI: smallest flash I/O unit:    2048
[13244.276259] UBI: sub-page size:              512
[13244.281185] UBI: VID header offset:          2048 (aligned 2048)
[13244.287513] UBI: data offset:                4096
[13249.422873] UBI error: vtbl_check: volume table check failed: record 0, =
error 9
ubiattach: error!: cannot attach mtd10
           error 22 (Invalid argument)


Here I've got an error and the logical eraseblock size that isn't what I ex=
pected (126976 instead of 253952).

Where I'm wrong?
Thank you
Regards

Matteo Canella
