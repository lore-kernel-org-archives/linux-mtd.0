Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUVR8-0005vE-HH
 for linux-mtd@lists.infradead.org; Thu, 18 Sep 2014 06:43:27 +0000
Received: by mail-ie0-f173.google.com with SMTP id tr6so578798ieb.32
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 23:43:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140918062722.GI7362@norris-Latitude-E6410>
References: <1408432456-27280-1-git-send-email-zajec5@gmail.com>
 <1408432456-27280-2-git-send-email-zajec5@gmail.com>
 <20140918062722.GI7362@norris-Latitude-E6410>
Date: Thu, 18 Sep 2014 08:43:05 +0200
Message-ID: <CACna6rynUEkid+6dJ0ev0r9wfCE7T-2KBz3irk7FWH_fi3=UcQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] mtd: bcm47xxnflash: add dev_ready and fill chip_delay
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18 September 2014 08:27, Brian Norris <computersforpeace@gmail.com> wrot=
e:
> On Tue, Aug 19, 2014 at 09:14:14AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> +
>> +     nand_chip->chip_delay =3D 50;
>
> I'm curious, did you have a good reason to use something other than the
> default provided by nand_base?

I simply followed what Broadcom used in their ugly code (don't look to
deep into that file, or you'll go crazy):
http://svn.dd-wrt.com/browser/src/linux/universal/linux-3.8/drivers/mtd/bcm=
947xx/nand/brcmnand_47xx.c?rev=3D22249#L2240

They set "dev_ready" as well as "chip_delay" (to the 50), so the only
case where they use this delay is
NAND_CMD_STATUS_ERROR
NAND_CMD_STATUS_ERROR[0-3]

Do you think we should try to stay with the default value?

--=20
Rafa=C5=82
