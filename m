Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Okxqm-0003qy-MB
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2010 11:27:33 +0000
Received: by iwn41 with SMTP id 41so1722345iwn.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Aug 2010 04:27:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTikkRNqnEX0PkHigv=zT+Z36J52DEtoVeMGbBExf@mail.gmail.com>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
	<1280150054.14917.108.camel@localhost>
	<AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
	<1280244340.3021.38.camel@localhost.localdomain>
	<AANLkTi=7-Ur35OzqF7iJtiPzfc-Jp-ANGwa3g_Y=+ae8@mail.gmail.com>
	<1280471755.2838.29.camel@localhost.localdomain>
	<AANLkTikZb=R=8BObvTN6uGaZGAmvvUZd4oYKvkCJih7H@mail.gmail.com>
	<AANLkTikkRNqnEX0PkHigv=zT+Z36J52DEtoVeMGbBExf@mail.gmail.com>
Date: Mon, 16 Aug 2010 13:27:30 +0200
Message-ID: <AANLkTim6U4uO_2yf-VyoL+4j9-yDkouTQdP_aszpEXwW@mail.gmail.com>
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: Arno Steffen <arno.steffen@googlemail.com>
To: twebb <taliaferro62@gmail.com>, dedekind1@gmail.com,
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/8/6 twebb <taliaferro62@gmail.com>:
>>
>> cat /proc/devices give me back, that =A0(252 ubi8) is a character device=
.
>> But looking above, in /dev it is listed as block device !?!
>>
>> For me creating entries are not transparent, this happend with
>> ubiattach. No idea how to force ubiattach to write ubi8 in the
>> devicelist as character device.
>> Best regards
>> Arno
>>
>
> Have you gotten anywhere on this problem? =A0I have looked and have not
> found the udev rules anywhere.
>
> Thanks,
> twebb
>

Sorry for delay, have been out of office.
Haven't found neither /etc/udev nor /lib/udev on my embedded system.
udev is not mention in dmesg | grep udev
But after creating /etc/udev/rules/10-udev.rules I could see this in
 cat /dev/udev/rules.d/10-udev.rules
As I don't have any idea what rule I have to write in I left it blank.
So no success with this method

Other way like in : free-electrons.com/doc/training/embedded-linux/slides.p=
df

cat /sys/class/ubi/ubi0/dev
252:0
rm /dev/ubi0
mknod /dev/ubi0 c 252 0
ll /dev/ubi*
crw-r--r--    1 root     root     252,   0 Jan  1 00:04 /dev/ubi0
crw-rw----    1 root     root      10,  63 Jan  1 00:00 /dev/ubi_ctrl

-> looks good so far. But finally I am screwed:

ubimkvol /dev/ubi0 -N test -m
Set volume size to 9805824UBI error: ubi_io_write: error -5 while
writing 512 bytes to PEB 81:512, written 0 bytes

UBI warning: ubi_eba_write_leb: failed to write VID header to LEB
2147479551:0, PEB 81
UBI: run torture test for PEB 81
UBI: try another PEB
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
0:512, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write VID header to LEB
2147479551:0, PEB 0
UBI: try another PEB
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
80:512, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write VID header to LEB
2147479551:0, PEB 80
UBI: try another PEB
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
79:512, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write VID header to LEB
2147479551:0, PEB 79
UBI warning: ubi_ro_mode: switch to read-only mode
UBI error: ubi_io_write: read-only mode
UBI error: ubi_create_volume: cannot create volume 0, error -30
ubimkvol: error!: cannot UBI creUBI error: erase_worker: failed to
erase PEB 81, error -30
ate volume
          error 30 (UBI error: do_work: work failed with error code -30
Read-only file system)
[root@ViUBI error: ubi_thread: ubi_bgt0d: work failed with error code -30
sor:/]#
