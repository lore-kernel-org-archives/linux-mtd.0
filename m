Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnXm4-0007n5-Dv
	for linux-mtd@lists.infradead.org; Mon, 23 Aug 2010 14:13:21 +0000
Received: by iwn41 with SMTP id 41so6409687iwn.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Aug 2010 07:13:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1282566891.24044.32.camel@localhost>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
	<1280150054.14917.108.camel@localhost>
	<AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
	<1280244340.3021.38.camel@localhost.localdomain>
	<AANLkTi=7-Ur35OzqF7iJtiPzfc-Jp-ANGwa3g_Y=+ae8@mail.gmail.com>
	<1280471755.2838.29.camel@localhost.localdomain>
	<AANLkTikZb=R=8BObvTN6uGaZGAmvvUZd4oYKvkCJih7H@mail.gmail.com>
	<AANLkTikkRNqnEX0PkHigv=zT+Z36J52DEtoVeMGbBExf@mail.gmail.com>
	<AANLkTim6U4uO_2yf-VyoL+4j9-yDkouTQdP_aszpEXwW@mail.gmail.com>
	<1282566891.24044.32.camel@localhost>
Date: Mon, 23 Aug 2010 16:13:19 +0200
Message-ID: <AANLkTinqAT=aCYFBi8Nri72L898U0k6dTk3z90OJOpRc@mail.gmail.com>
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: Arno Steffen <arno.steffen@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, twebb <taliaferro62@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/8/23 Artem Bityutskiy <dedekind1@gmail.com>:
> On Mon, 2010-08-16 at 13:27 +0200, Arno Steffen wrote:
>> Sorry for delay, have been out of office.
>> Haven't found neither /etc/udev nor /lib/udev on my embedded system.
>> udev is not mention in dmesg | grep udev
>> But after creating /etc/udev/rules/10-udev.rules I could see this in
>> =C2=A0cat /dev/udev/rules.d/10-udev.rules
>> As I don't have any idea what rule I have to write in I left it blank.
>> So no success with this method
>
> OK, anyway, I believe this is not related to UBI. I gave you several
> other ideas, cannot help more than that.
>
>> ubimkvol /dev/ubi0 -N test -m
>> Set volume size to 9805824UBI error: ubi_io_write: error -5 while
>> writing 512 bytes to PEB 81:512, written 0 bytes
>>
>> UBI warning: ubi_eba_write_leb: failed to write VID header to LEB
>> 2147479551:0, PEB 81
>
> This is independent problem, I think. Your driver returns EIO when UBI
> writes to the flash. Looks like you have issues in the driver or HW
> level.
>
> Did you run mtd tests? Please run and validate your flash. Take a look
> here, for reference:
>
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>

My results are: (other will follow next day)

[root@or:/opt/configs]# insmod mtd_nandecctest.ko
mtd_nandecctest: ok - nand-ecc-256
mtd_nandecctest: ok - nand-ecc-512
[root@Visor:/opt/configs]# insmod mtd_oobtest.ko

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_oobtest: MTD device: 0
mtd_oobtest: MTD device size 262144, eraseblock size 131072, page size
2048, count of eraseblocks 2, pages per eraseblock 64, OOB size 64
mtd_oobtest: scanning for bad eraseblocks
mtd_oobtest: scanned 2 eraseblocks, 0 are bad
mtd_oobtest: test 1 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: error -30 while erasing EB 0
mtd_oobtest: error -30 occurred
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
insmod: cannot insert 'mtd_oobtest.ko': Read-only file system
[root@or:/opt/configs]# insmod mtd_pagetest.ko

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_pagetest: MTD device: 0
mtd_pagetest: MTD device size 262144, eraseblock size 131072, page
size 2048, count of eraseblocks 2, pages per eraseblock 64, OOB size
64
mtd_pagetest: scanning for bad eraseblocks
mtd_pagetest: scanned 2 eraseblocks, 0 are bad
mtd_pagetest: erasing whole device
mtd_pagetest: error -30 while erasing EB 0
mtd_pagetest: error -30 occurred
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
insmod: cannot insert 'mtd_pagetest.ko': Read-only file system
[root@or:/opt/configs]# insmod mtd_readtest.ko

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_readtest: MTD device: 0
mtd_readtest: MTD device size 262144, eraseblock size 131072, page
size 2048, count of eraseblocks 2, pages per eraseblock 64, OOB size
64
mtd_readtest: scanning for bad eraseblocks
mtd_readtest: scanned 2 eraseblocks, 0 are bad
mtd_readtest: testing page read
uncorrectable error :
uncorrectable error :
uncorrectable error :
mtd_readtest: error: read failed at 0x0
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
mtd_readtest: error: read failed at 0x800
uncorrectable error :
