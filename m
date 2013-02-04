Received: from mail-ob0-f171.google.com ([209.85.214.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U2Hd2-0001Vt-3Z
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 08:42:16 +0000
Received: by mail-ob0-f171.google.com with SMTP id lz20so6091026obb.30
 for <linux-mtd@lists.infradead.org>; Mon, 04 Feb 2013 00:42:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1359966902.13791.19.camel@sauron.fi.intel.com>
References: <1359368750-19763-3-git-send-email-zajec5@gmail.com>
 <1359966902.13791.19.camel@sauron.fi.intel.com>
Date: Mon, 4 Feb 2013 09:42:14 +0100
Message-ID: <CACna6ry0B9nPZDUEDgYZnqM7YsGeDkWG9r6eKihbK+=WLqUcLw@mail.gmail.com>
Subject: Re: [PATCH V2 3/6] mtd: bcm47xxnflash: fix message
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

2013/2/4 Artem Bityutskiy <dedekind1@gmail.com>:
> On Mon, 2013-01-28 at 11:25 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Hauke Mehrtens <hauke@hauke-m.de>
>>
>> This is not a serial flash driver, but a nand flash driver
>>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>> ---
>> V2: break line to match 80 chars
>
> When sending v2 for individual patches, please, remember 2 things:
>
> 1. Keep them part of the original thread (ensure correct In-Reply-To:).

Whoops, I've to learn how to make that with git send-email.


> 2. Add your own signed-off-by.

It was so trivial... I wasn't sure if it's worth signing-it-by... ;)

--=20
Rafa=C5=82
