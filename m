Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Onovc-00028S-Nf
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 08:32:21 +0000
Received: by yxf34 with SMTP id 34so2942657yxf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 01:32:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1282574489.24044.74.camel@localhost>
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
	<AANLkTinqAT=aCYFBi8Nri72L898U0k6dTk3z90OJOpRc@mail.gmail.com>
	<1282574489.24044.74.camel@localhost>
Date: Tue, 24 Aug 2010 10:32:18 +0200
Message-ID: <AANLkTik+T6HA+umRvxj5oPmGwf5=tQvk-sNzSTqaq8VB@mail.gmail.com>
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

2010/8/23 Artem Bityutskiy <dedekind1@gmail.com>:
> On Mon, 2010-08-23 at 16:13 +0200, Arno Steffen wrote:
>> My results are: (other will follow next day)
>
> ... snip ...
>
>> mtd_readtest: MTD device: 0
>> mtd_readtest: MTD device size 262144, eraseblock size 131072, page
>> size 2048, count of eraseblocks 2, pages per eraseblock 64, OOB size
>> 64
>> mtd_readtest: scanning for bad eraseblocks
>> mtd_readtest: scanned 2 eraseblocks, 0 are bad
>> mtd_readtest: testing page read
>> uncorrectable error :
>> uncorrectable error :
>> uncorrectable error :
>> mtd_readtest: error: read failed at 0x0
>> uncorrectable error :
>> uncorrectable error :
>> uncorrectable error :
>> uncorrectable error :
>> mtd_readtest: error: read failed at 0x800
>> uncorrectable error :
>
> They do not look very too well :-)
>
> No wonder UBI hates your flash and refuses it.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>

Please let me know, whether I used it right. I enabled in config
build test modules, "make modules" and copied this modules to my
embedded device. There I just typed insmod mtd_readtest.ko
As far as I could see it just accesses /dev/mtd0. This is read only
(Xloader and HW-ECC). Can this cause this problems? How to check other
parts of Flash. Couldn't found some docu to the test modules.

What does this mean:

mtd_readtest: finished with errors
mtd_readtest: error -74 occurred
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
insmod: cannot insert 'mtd_readtest.ko': Bad message
