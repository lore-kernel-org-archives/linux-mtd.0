Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDCDR-0005Tr-Qk
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 11:08:58 +0000
Received: by mail-we0-f170.google.com with SMTP id z53so7961477wey.29
 for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2013 03:08:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362568069.21850.28.camel@sauron>
References: <1362567695-17523-1-git-send-email-zajec5@gmail.com>
 <1362568069.21850.28.camel@sauron>
Date: Wed, 6 Mar 2013 12:08:53 +0100
Message-ID: <CACna6ryh0Ko3edT_dSHcP6U21rmxAuHgc--Y=sK5e=z2pVPCmg@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] mtd: bcm47xxsflash: keep a reference to the BCMA
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
> On Wed, 2013-03-06 at 12:01 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> struct bcma_drv_cc;
>> +
>>  struct bcm47xxsflash {
>> +     union {
>> +             struct bcma_drv_cc *bcma_cc;
>> +     };
>
> Why union?

It's about adding support for different buses in the future (ssb) I
was describing in the other patch.

--=20
Rafa=C5=82
