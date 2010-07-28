Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oe4R5-0008GD-Kr
	for linux-mtd@lists.infradead.org; Wed, 28 Jul 2010 11:04:32 +0000
Received: by bwz15 with SMTP id 15so4833739bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Jul 2010 04:04:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1280244340.3021.38.camel@localhost.localdomain>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
	<1280150054.14917.108.camel@localhost>
	<AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
	<1280244340.3021.38.camel@localhost.localdomain>
Date: Wed, 28 Jul 2010 13:04:29 +0200
Message-ID: <AANLkTi=7-Ur35OzqF7iJtiPzfc-Jp-ANGwa3g_Y=+ae8@mail.gmail.com>
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

Thanks Artem,
I am using a 2.6.33 kernel, this should be new enough. It is right,
that it is as a block device (in  /dev/ ) ?

[root@or:/]# ubiattach /dev/ubi_ctrl -m 8 -d 8
UBI: attaching mtd8 to ubi8
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB
handling, reserved 1, need 3
UBI: attached mtd8 to ubi8
UBI: MTD device name:            "extra"
UBI: MTD device size:            41 MiB
UBI: number of good PEBs:        331
UBI: number of bad PEBs:         1
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 331
UBI: number of PEBs reserved for bad PEB handling: 1
UBI: max/mean erase counter: 1/0
UBI: image sequence number: 228182237
UBI: background thread "ubi_bgt8d" started, PID 386
UBI device number 8, total 331 LEBs (42706944 bytes, 40.7 MiB),
available 0 LEBs (0 bytes), LEB size 129024 bytes (126.0 KiB)
[root@or:/]# ll /dev/ubi*
brw-rw----    1 root     root     253,   0 Jan  1 00:00 /dev/ubi8
brw-rw----    1 root     root     253,   1 Jan  1 00:00 /dev/ubi8_0
crw-rw----    1 root     root      10,  63 Jan  1 00:00 /dev/ubi_ctrl
[root@or:/]#
[root@or:/]# mount -t ubifs /dev/ubi8 /tmp
mount: mounting /dev/ubi8 on /tmp failed: No such device
[root@or:/]# mount -t ubifs /dev/ubi8_0 /tmp
mount: mounting /dev/ubi8_0 on /tmp failed: No such device
[root@or:/]# mount -t ubifs ubi8_0 /tmp
mount: mounting ubi8_0 on /tmp failed: No such device
[root@or:/]# mount -t ubifs ubi8 /tmp
mount: mounting ubi8 on /tmp failed: No such device

(of cource /tmp is available rwx for all)


2010/7/27 Artem Bityutskiy <dedekind1@gmail.com>:
> On Mon, 2010-07-26 at 15:49 +0200, Arno Steffen wrote:
>> [root@or:/]# mount -t ubifs /dev/ubi0_0 /tmp
>> mount: mounting /dev/ubi0_0 on /tmp failed: No such device
>
> Try mount -t ubifs ubi0_0 /tmp
>
> Mounting by character device was added only recently, probably your
> kernel is older?
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
