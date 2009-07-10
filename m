Received: from snt0-omc2-s23.snt0.hotmail.com ([65.55.90.98])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MPL3r-0003yb-7K
	for linux-mtd@lists.infradead.org; Fri, 10 Jul 2009 18:43:14 +0000
Message-ID: <SNT121-W16B0221E87C4D7934D7910B2270@phx.gbl>
From: "Laurent ." <sid6582@msn.com>
To: <dedekind@infradead.org>, <artem.bityutski@nokia.com>
Subject: UBIFS Question
Date: Fri, 10 Jul 2009 11:43:05 -0700
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Artem=2C

I am currently working on an embedded Linux project which has an ARM9 chip =
(NXP=92s 180MHz LPC3131) with a NAND Flash controller which supports 5bits =
or 8bits HW ECC.
I have a 256MB SLC NAND and run Linux 2.6.28.2

It is important to know the way my product is used=2C the user will always =
brutally power it off. It=92s not like I can nicely do this=2C do a sync et=
c etc=85
I would have a few questions=2C hopefully you can answer them.

1) The LPC3131 supports a USB DFU mode which basically allows an end-user t=
o upload a binary file into the chip's internal RAM and execute it.

I have coded a small USB application that I upload via DFU which allows me =
to completely control the NAND flash from the PC.
My goal was to create an application used in the factory that programs a bl=
ank NAND Flash.

It works :
with respect of bad blocks=2C I burn the LPC313x boot-block=2C my own small=
 uimage bootloader=2C the nand-bbt located at the end of the flash=2C the l=
inux uimage=2C and a ubi image that I generated doing

mkfs.ubifs -x none -r lolo -m 2048 -e 129024 -c 2047 -o ubifs.img

ubinize.cfg is:

[ubifs]
mode=3Dubi
image=3Dubifs.img
vol_id=3D0
vol_size=3D200MiB
vol_type=3Ddynamic
vol_name=3Drootfs
vol_alignment=3D1
vol_flags=3Dautoresize

ubinize -o ubi.img -m 2048 -p 128KiB -s 512 ubinize.cfg

I am not using LZO compression because I have seen that mount time is faste=
r without=2C and since my file system contents are already compressed file=
=2C this does not buy me must room.
But maybe I am missing something and LZO compression is really advised ?

2) I boot my embedded system ( I use OpenWrt )

root@OpenWrt:/# ubiattach /dev/ubi_ctrl -m 5

UBI: attaching mtd5 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: volume 0 ("rootfs") re-sized from 1626 to 1854 LEBs
UBI: attached mtd5 to ubi0
UBI: MTD device name:            "lpc313x-rootfs"
UBI: MTD device size:            235 MiB
UBI: number of good PEBs:        1876
UBI: number of bad PEBs:         6
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 1876
UBI: number of PEBs reserved for bad PEB handling: 18
UBI: max/mean erase counter: 1/0
UBI: background thread "ubi_bgt0d" started=2C PID 2059
UBI device number 0=2C total 1876 LEBs (242049024 bytes=2C 230.8 MiB)=2C av=
ailable 0 LEBs (0 bytes)=2C LEB size 129024 bytes (126.0 KiB)

root@OpenWrt:/# mount -t ubifs ubi0 /mnt

UBIFS: mounted UBI device 0=2C volume 0=2C name "rootfs"
UBIFS: file system size:   237791232 bytes (232218 KiB=2C 226 MiB=2C 1843 L=
EBs)
UBIFS: journal size:       9033728 bytes (8822 KiB=2C 8 MiB=2C 71 LEBs)
UBIFS: media format:       4 (latest is 4)
UBIFS: default compressor: no compression
UBIFS: reserved for root:  0 bytes (0 KiB)

root@OpenWrt:/# find /mnt

/mnt
/mnt/img
/mnt/img/00783_hongkongbynight_1920x1200.jpg
/mnt/img/00678_vancouverdusk_1920x1200.jpg
/mnt/img/00698_snowmountains_1920x1200.jpg
/mnt/music
/mnt/music/10 F Cuitad & Y Hayat - The Force.mp3
/mnt/music/07 Sakamoto - Forbidden Colours.mp3
/mnt/alphaflight
/mnt/alphaflight/indexOnline.html
/mnt/alphaflight/Lover_Charlie.zsid
/mnt/alphaflight/sid.java
/mnt/alphaflight/retroguard.jar
/mnt/alphaflight/retroguard.log
/mnt/alphaflight/obfuscAFL.bat
/mnt/alphaflight/aflClean.jar
/mnt/alphaflight/index.html
/mnt/alphaflight/sid.class
/mnt/alphaflight/afl.gif
/mnt/alphaflight/afl.jar
/mnt/alphaflight/afl.java
/mnt/alphaflight/afl.class
/mnt/alphaflight/AFL-06.prg
/mnt/alphaflight/indexObuscLocal.html
/mnt/alphaflight/sid_applet.java
/mnt/alphaflight/sid$sidVoice.class
/mnt/alphaflight/aflold.java

In /mnt/alphaflight I generate a small new.txt file with vi=2C which contai=
ns a few lines of characters.
After saving=2C I immediately power-off brutally.
I power-on again=2C mount=2C and the new.txt file is not there...

I recreate the file=2C I wait 20 seconds or so and power-off brutally.

I power-on again=2C mount and now I have:

-rw-r--r--    1 1000     1000          397 Dec 31  2002 indexOnline.html
-rw-r--r--    1 root     root            0 Jan  1 00:00 new.txt
-rw-r--r--    1 1000     1000          104 Dec 31  2002 obfuscAFL.bat

Size 0 ... I can understand that since I did not have time to sync.

It=92s funny though that the file is present in the directory but the conte=
nts are not there ?

If I do this programmatically=2C I presume I can force a sync after I close=
 the file ?
Is it safe to do so ? Would you know the C API to use to do a sync programm=
atically ?

I generate a new2.txt wait one minute...  Reboot=2C the file new2.txt is st=
ill 0
I generate a new3.txt wait two minutes... Reboot=2C now the file new3.txt h=
as correct size !

So=2C I am wondering=2C is this background thread "ubi_bgt0d" responsible f=
or automatically synching periodically ? Is this interval adjustable  ? Do =
you recommend it ? Like every 10 seconds=2C isn=92t it too much ?

Thank you=2C
Laurent
=20

=20

_________________________________________________________________
Insert movie times and more without leaving Hotmail=AE.=20
http://windowslive.com/Tutorial/Hotmail/QuickAdd?ocid=3DTXT_TAGLM_WL_HM_Tut=
orial_QuickAdd_062009=
