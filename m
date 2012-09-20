Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TEgjR-0006eF-C2
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2012 13:23:53 +0000
Received: by wibhq4 with SMTP id hq4so476737wib.0
 for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2012 06:23:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1348145107.2388.17.camel@sauron.fi.intel.com>
References: <1348131625-24349-1-git-send-email-zajec5@gmail.com>
 <1348145107.2388.17.camel@sauron.fi.intel.com>
Date: Thu, 20 Sep 2012 15:23:50 +0200
Message-ID: <CACna6rz2XYu4LHq9y34m_Asm6Vmxt-9MvwTnWTsZ+SZscXc6ww@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: just use memcpy_fromio for reading
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

2012/9/20 Artem Bityutskiy <dedekind1@gmail.com>:
> On Thu, 2012-09-20 at 11:00 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>
> Squashed this one to the previous one. Fixed up the following aiaiai
> complaint:
>
> Successfully built configuration "mips-bcm47xx_defconfig,mips,mips-linux-=
", results:

Thanks!

I hope to learn using "verify + aiaiai" and send clean NAND driver soon :)

--=20
Rafa=C5=82
