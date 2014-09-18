Received: from mail-qc0-x229.google.com ([2607:f8b0:400d:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUVbn-0002Zi-1N
 for linux-mtd@lists.infradead.org; Thu, 18 Sep 2014 06:54:27 +0000
Received: by mail-qc0-f169.google.com with SMTP id r5so646248qcx.28
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 23:54:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACna6rynUEkid+6dJ0ev0r9wfCE7T-2KBz3irk7FWH_fi3=UcQ@mail.gmail.com>
References: <1408432456-27280-1-git-send-email-zajec5@gmail.com>
 <1408432456-27280-2-git-send-email-zajec5@gmail.com>
 <20140918062722.GI7362@norris-Latitude-E6410>
 <CACna6rynUEkid+6dJ0ev0r9wfCE7T-2KBz3irk7FWH_fi3=UcQ@mail.gmail.com>
Date: Wed, 17 Sep 2014 23:54:05 -0700
Message-ID: <CAN8TOE8nFkmSorKRh59scUBFikBkaW+bD0MOgm22zjVTwUAVJw@mail.gmail.com>
Subject: Re: [PATCH 2/4] mtd: bcm47xxnflash: add dev_ready and fill chip_delay
From: Brian Norris <computersforpeace@gmail.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
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

On Wed, Sep 17, 2014 at 11:43 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com=
> wrote:
> On 18 September 2014 08:27, Brian Norris <computersforpeace@gmail.com> wr=
ote:
>> On Tue, Aug 19, 2014 at 09:14:14AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>>> +
>>> +     nand_chip->chip_delay =3D 50;
>>
>> I'm curious, did you have a good reason to use something other than the
>> default provided by nand_base?
>
> I simply followed what Broadcom used in their ugly code (don't look to
> deep into that file, or you'll go crazy):
> http://svn.dd-wrt.com/browser/src/linux/universal/linux-3.8/drivers/mtd/b=
cm947xx/nand/brcmnand_47xx.c?rev=3D22249#L2240
>
> They set "dev_ready" as well as "chip_delay" (to the 50), so the only
> case where they use this delay is
> NAND_CMD_STATUS_ERROR
> NAND_CMD_STATUS_ERROR[0-3]
>
> Do you think we should try to stay with the default value?

No, it's fine as-is.

Brian
