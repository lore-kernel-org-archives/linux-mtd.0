Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ogz2O-00075W-Pr
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 11:55:06 +0000
Received: by iwn3 with SMTP id 3so125124iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 04:55:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1280471755.2838.29.camel@localhost.localdomain>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
	<1280150054.14917.108.camel@localhost>
	<AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
	<1280244340.3021.38.camel@localhost.localdomain>
	<AANLkTi=7-Ur35OzqF7iJtiPzfc-Jp-ANGwa3g_Y=+ae8@mail.gmail.com>
	<1280471755.2838.29.camel@localhost.localdomain>
Date: Thu, 5 Aug 2010 13:55:02 +0200
Message-ID: <AANLkTikZb=R=8BObvTN6uGaZGAmvvUZd4oYKvkCJih7H@mail.gmail.com>
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: Arno Steffen <arno.steffen@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/7/30 Artem Bityutskiy <dedekind1@gmail.com>:
> On Wed, 2010-07-28 at 13:04 +0200, Arno Steffen wrote:
>> Thanks Artem,
>> I am using a 2.6.33 kernel, this should be new enough. It is right,
>> that it is as a block device (in =C2=A0/dev/ ) ?
>
> No, _all_ UBI devices are character devices. New UBIFS can mount these
> character devices, old UBIFS cannot, and requires deviceless mounting.
>
> As documented here:
>
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_mount_ubifs
>
> 2.6.33 indeed should be able to mount /dev/ubi0_0.
>
> But because your system is strange in a way that your UBI devices are
> block devices, this does not work.
>
>> [root@or:/]# ubiattach /dev/ubi_ctrl -m 8 -d 8
>> UBI: attaching mtd8 to ubi8
>> UBI: physical eraseblock size: =C2=A0 131072 bytes (128 KiB)
>> UBI: logical eraseblock size: =C2=A0 =C2=A0129024 bytes
>> UBI: smallest flash I/O unit: =C2=A0 =C2=A02048
>> UBI: sub-page size: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0512
>> UBI: VID header offset: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0512 (aligned 5=
12)
>> UBI: data offset: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A02048
>> UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB
>> handling, reserved 1, need 3
>> UBI: attached mtd8 to ubi8
>> UBI: MTD device name: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"extra"
>> UBI: MTD device size: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A041 MiB
>> UBI: number of good PEBs: =C2=A0 =C2=A0 =C2=A0 =C2=A0331
>> UBI: number of bad PEBs: =C2=A0 =C2=A0 =C2=A0 =C2=A0 1
>> UBI: max. allowed volumes: =C2=A0 =C2=A0 =C2=A0 128
>> UBI: wear-leveling threshold: =C2=A0 =C2=A04096
>> UBI: number of internal volumes: 1
>> UBI: number of user volumes: =C2=A0 =C2=A0 1
>> UBI: available PEBs: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0
>> UBI: total number of reserved PEBs: 331
>> UBI: number of PEBs reserved for bad PEB handling: 1
>> UBI: max/mean erase counter: 1/0
>> UBI: image sequence number: 228182237
>> UBI: background thread "ubi_bgt8d" started, PID 386
>> UBI device number 8, total 331 LEBs (42706944 bytes, 40.7 MiB),
>> available 0 LEBs (0 bytes), LEB size 129024 bytes (126.0 KiB)
>> [root@or:/]# ll /dev/ubi*
>> brw-rw---- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 253, =C2=
=A0 0 Jan =C2=A01 00:00 /dev/ubi8
>> brw-rw---- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 253, =C2=
=A0 1 Jan =C2=A01 00:00 /dev/ubi8_0
>> crw-rw---- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A010=
, =C2=A063 Jan =C2=A01 00:00 /dev/ubi_ctrl
>
> Wrong. Everything has to be character devices.
>
>> [root@or:/]#
>> [root@or:/]# mount -t ubifs /dev/ubi8 /tmp
>> mount: mounting /dev/ubi8 on /tmp failed: No such device
>> [root@or:/]# mount -t ubifs /dev/ubi8_0 /tmp
>> mount: mounting /dev/ubi8_0 on /tmp failed: No such device
>
> These do not work because /dev/ubi* have to be chdev.
>
>> [root@or:/]# mount -t ubifs ubi8_0 /tmp
>> mount: mounting ubi8_0 on /tmp failed: No such device
>> [root@or:/]# mount -t ubifs ubi8 /tmp
>> mount: mounting ubi8 on /tmp failed: No such device
>
> Do you have volume 0 on ubi8?
>
> Please, send me ls /sys/class/ubi/ and ls /sys/class/ubi/ubi8/
>
> Also, please, check /proc/devices and make sure ubi is in "Character
> devices" list.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>

Thanks Artem for your mail. To answer you requests:

[root@or:/]# ls -l /sys/class/ubi/
lrwxrwxrwx    1 root     root            0 Jan  1 00:00 ubi8 ->
../../devices/virtual/ubi/ubi8
lrwxrwxrwx    1 root     root            0 Jan  1 00:01 ubi8_0 ->
../../devices/virtual/ubi/ubi8/ubi8_0
-r--r--r--    1 root     root         4096 Jan  1 00:00 version
[root@or:/]# ls -l /sys/class/ubi/ubi8/
-r--r--r--    1 root     root         4096 Jan  1 00:00 avail_eraseblocks
-r--r--r--    1 root     root         4096 Jan  1 00:00 bad_peb_count
-r--r--r--    1 root     root         4096 Jan  1 00:01 bgt_enabled
-r--r--r--    1 root     root         4096 Jan  1 00:00 dev
-r--r--r--    1 root     root         4096 Jan  1 00:00 eraseblock_size
-r--r--r--    1 root     root         4096 Jan  1 00:00 max_ec
-r--r--r--    1 root     root         4096 Jan  1 00:00 max_vol_count
-r--r--r--    1 root     root         4096 Jan  1 00:00 min_io_size
-r--r--r--    1 root     root         4096 Jan  1 00:01 mtd_num
drwxr-xr-x    2 root     root            0 Jan  1 00:01 power
-r--r--r--    1 root     root         4096 Jan  1 00:00 reserved_for_bad
lrwxrwxrwx    1 root     root            0 Jan  1 00:01 subsystem ->
../../../../class/ubi
-r--r--r--    1 root     root         4096 Jan  1 00:00 total_eraseblocks
drwxr-xr-x    3 root     root            0 Jan  1 00:00 ubi8_0
-rw-r--r--    1 root     root         4096 Jan  1 00:01 uevent
-r--r--r--    1 root     root         4096 Jan  1 00:01 volumes_count
[root@or:/]# ls -l /dev/u*
brw-rw----    1 root     root     252,   0 Jan  1 00:00 /dev/ubi8
brw-rw----    1 root     root     252,   1 Jan  1 00:00 /dev/ubi8_0
crw-rw----    1 root     root      10,  63 Jan  1 00:00 /dev/ubi_ctrl
cr--r--r--    1 root     root       1,   9 Jan  1 00:00 /dev/urandom

cat /proc/devices give me back, that  (252 ubi8) is a character device.
But looking above, in /dev it is listed as block device !?!

For me creating entries are not transparent, this happend with
ubiattach. No idea how to force ubiattach to write ubi8 in the
devicelist as character device.
Best regards
Arno
