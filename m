Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TbRKZ-0007tG-8x
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 07:36:15 +0000
Received: by mail-wi0-f177.google.com with SMTP id c10so377929wiw.0
 for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2012 23:36:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1353569732.2701.19.camel@sauron.fi.intel.com>
References: <1352721805-14064-1-git-send-email-zajec5@gmail.com>
 <1353511181.2701.13.camel@sauron.fi.intel.com>
 <CACna6rzc1zvMQWD=eFoiNWjXV40BkDv-gCkH=tgKqEEb=b36wg@mail.gmail.com>
 <1353569732.2701.19.camel@sauron.fi.intel.com>
Date: Thu, 22 Nov 2012 08:36:10 +0100
Message-ID: <CACna6rz4+BXRdSy6CDahJtsqgU6Sz+qgNc-r4qwhZwv7LwXocQ@mail.gmail.com>
Subject: Re: [PATCH V2 0/6] bcm47xxnflash: read support for BCM4706
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
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

2012/11/22 Artem Bityutskiy <dedekind1@gmail.com>:
> On Wed, 2012-11-21 at 17:19 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> 2012/11/21 Artem Bityutskiy <dedekind1@gmail.com>:
>> > On Mon, 2012-11-12 at 13:03 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> >> I believe I've made "verify" tool working in my system and fixed
>> >> all warning/errors reported by it.
>> >
>> > Please, send me a configuration which I can use to compile-test this
>> > stuff.
>>
>> I think this is the .config user by OpenWRT building system. It has
>> CONFIG_MTD_NAND_BCM47XXNFLASH=3Dy
>> so looks sane.
>>
>> Unfortunately it's not a minimal config possible, that allows testing
>> bcm47xxnflash. Are you OK with that?
>
> Thanks. I've actually instead modified my own mips-bcm47xx_defconfig
> from the 'maintaining.git' project, so it has
> CONFIG_MTD_NAND_BCM47XXNFLASH=3Dm now.

Good idea, thanks :) I'll just use your config in the future for
testing changes.

--=20
Rafa=C5=82
