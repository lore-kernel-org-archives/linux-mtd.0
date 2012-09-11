Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBNdJ-0004HI-TM
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 10:23:55 +0000
Received: by wibhn17 with SMTP id hn17so277010wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2012 03:23:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1347358968.21359.68.camel@sauron.fi.intel.com>
References: <1347201121-20590-1-git-send-email-zajec5@gmail.com>
 <1347358968.21359.68.camel@sauron.fi.intel.com>
Date: Tue, 11 Sep 2012 12:23:50 +0200
Message-ID: <CACna6rzcW17DchvNGgUYyKgfrZWbObjNfM1_ZiSfRoy6Uuj7bQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: prepare place for BCMA NAND flash driver(s)
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

2012/9/11 Artem Bityutskiy <dedekind1@gmail.com>:
> On Sun, 2012-09-09 at 16:32 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> BCMA bus can contain NAND flash memory, it's registered in system as
>> platform device. This adds required hooks and place for controler
>> specific drivers.
>> At this point it doesn't work yet, so it's marked as BROKEN.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>
> Why should it be merged upstream as BROKEN and without
> controller-specific drivers?

I'll resend this in a patchset proving some basic functionality.

--=20
Rafa=C5=82
