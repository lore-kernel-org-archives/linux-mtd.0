Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDBlF-0007dE-6Z
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 10:39:49 +0000
Received: by mail-wi0-f174.google.com with SMTP id hi8so255616wib.1
 for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2013 02:39:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362561831.21850.26.camel@sauron>
References: <1361341929-11153-1-git-send-email-zajec5@gmail.com>
 <1362561831.21850.26.camel@sauron>
Date: Wed, 6 Mar 2013 11:39:46 +0100
Message-ID: <CACna6rw6LS_m4KsL1LAYzKaBxK6u8GRM_YdpHFOTANRerQKBnQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: bcm47xxsflash: store info about flash type
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/3/6 Artem Bityutskiy <dedekind1@gmail.com>:
> On Wed, 2013-02-20 at 07:32 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> It's going to be needed for erase and write operations, they differ
>> between Atmel and ST flashes.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>
> Aiaiai!
>
> -------------------------------------------------------------------------=
-------
>
> Bisectability test results for configuration "mips-bcm47xx_defconfig,mips=
,mips-linux-"
>
> Failed to build the following commit for configuration "mips-bcm47xx_defc=
onfig"":
>
> ab61426 mtd: bcm47xxsflash: store info about flash type
>
>
> drivers/mtd/devices/bcm47xxsflash.c: In function 'bcm47xxsflash_bcma_prob=
e':
> drivers/mtd/devices/bcm47xxsflash.c:64:14: error: 'struct bcm47xxsflash' =
has no member named 'bcma_cc'
> make[4]: *** [drivers/mtd/devices/bcm47xxsflash.o] Error 1

For some unknown reason it seems I haven't noticed anything above
> Successfully built configuration "mips-bcm47xx_defconfig,mips,mips-linux-=
", no issues
:/ Sorry

--=20
Rafa=C5=82
