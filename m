Received: from mail-wi0-f178.google.com ([209.85.212.178])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Txxzg-0002f9-9B
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2013 10:55:49 +0000
Received: by mail-wi0-f178.google.com with SMTP id hn3so571213wib.17
 for <linux-mtd@lists.infradead.org>; Wed, 23 Jan 2013 02:55:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <50FFBDD7.500@hauke-m.de>
References: <1358935626-10974-1-git-send-email-zajec5@gmail.com>
 <50FFBDD7.500@hauke-m.de>
Date: Wed, 23 Jan 2013 11:55:46 +0100
Message-ID: <CACna6rwzy3rc0uAYM664=QGjStG0z8sDNxddu4XNG8hrzfV2rA@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxpflash: add driver for parallel flash on
 BCM47xx
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/1/23 Hauke Mehrtens <hauke@hauke-m.de>:
> On 01/23/2013 11:07 AM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>> ---
>>  drivers/mtd/maps/Kconfig         |   18 ++++
>>  drivers/mtd/maps/Makefile        |    1 +
>>  drivers/mtd/maps/bcm47xxpflash.c |  163 +++++++++++++++++++++++++++++++=
+++++++
>>  3 files changed, 182 insertions(+), 0 deletions(-)
>>  create mode 100644 drivers/mtd/maps/bcm47xxpflash.c
>
> Why do you not just use the physmap-flash driver from
> drivers/mtd/maps/physmap.c ?

Looks sane. Didn't know about this. Please drop the patch.

--=20
Rafa=C5=82
