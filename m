Received: from mail-ob0-x22d.google.com ([2607:f8b0:4003:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCb6f-0000w9-3C
 for linux-mtd@lists.infradead.org; Thu, 22 Aug 2013 20:03:46 +0000
Received: by mail-ob0-f173.google.com with SMTP id ta17so4579323obb.32
 for <linux-mtd@lists.infradead.org>; Thu, 22 Aug 2013 13:03:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130822194345.GB14837@ld-irv-0074.broadcom.com>
References: <1369226342-20102-1-git-send-email-zajec5@gmail.com>
 <20130822194345.GB14837@ld-irv-0074.broadcom.com>
Date: Thu, 22 Aug 2013 22:03:22 +0200
Message-ID: <CACna6rwbARGHmD=CkvR_vRBLfkTamOrEXEyJhqBesXX5gS0csg@mail.gmail.com>
Subject: Re: [RFC][PATCH] mtd: bcm47xxsflash: writing support
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/8/22 Brian Norris <computersforpeace@gmail.com>:
> Hi Rafal,
>
> On Wed, May 22, 2013 at 02:39:02PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> ---
>>  drivers/mtd/devices/bcm47xxsflash.c |  130 ++++++++++++++++++++++++++++=
+++++--
>>  1 file changed, 126 insertions(+), 4 deletions(-)
>
> Can I get a 'Signed-off-by'? Otherwise, is this patch good to go?

Of course! I posted it as RFC, so didn't add S-o-b, but no-one
objected and this patch seems to be fine. I use it daily for half a
year, it was recently picked up by OpenWrt and I didn't get any bug
reports. So I think it's totally fine to push it :)

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
