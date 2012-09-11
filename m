Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBNoN-0007vM-V6
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 10:35:20 +0000
Received: by wibhn17 with SMTP id hn17so285126wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2012 03:35:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1347358840.21359.67.camel@sauron.fi.intel.com>
References: <1346699237-414-1-git-send-email-zajec5@gmail.com>
 <1347358840.21359.67.camel@sauron.fi.intel.com>
Date: Tue, 11 Sep 2012 12:35:18 +0200
Message-ID: <CACna6ryroY=Xbv7+VsRfBYdhRd9P6uz935b9scQqCmTjneM7sQ@mail.gmail.com>
Subject: Re: [PATCH V2] mtd: basic (read only) driver for BCMA serial flash
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
> On Mon, 2012-09-03 at 21:07 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> This registers MTD driver for serial flash platform device. Right now it
>> supports reading only, writing still has to be implemented.
>> At this point it's marked as BROKEN, because it requires code present in
>> net tree that wasn't mainlined yet.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>
> What are exactly the changes it depends on? URL? Are they staged for
> 3.7?

http://git.kernel.org/?p=3Dlinux/kernel/git/linville/wireless-testing.git;a=
=3Dcommitdiff;h=3D23cb3b2121323443834296a8ecb582b8aeb78d75
http://git.kernel.org/?p=3Dlinux/kernel/git/linville/wireless-testing.git;a=
=3Dcommitdiff;h=3Dd57ef3a6a2eeb88df47e892c66692e3f59722ffe

(Yes, there are queued to be pulled during 3.7 merge window)


>> +static void bcm47xxsflash_fill_mtd(struct bcma_sflash *sflash,
>> +                                struct mtd_info *mtd)
>> +{
>> +     mtd->priv =3D sflash;
>> +     mtd->name =3D "bcm47xxsflash";
>> +     mtd->owner =3D THIS_MODULE;
>> +     mtd->type =3D MTD_ROM;
>> +     mtd->size =3D sflash->size;
>> +     mtd->_read =3D bcm47xxsflash_read;
>
> I guess also
> mtd->flags =3D MTD_CAP_ROM;
> would be good to add.

Thanks.


>> +     mtd->writesize =3D 1; /* FIXME */
>
> Is "FIXME" needed? Why? If needed, write a more descriptive comment.
>
> Also I guess
> mtd->writebufsize =3D mtd->writesize;

Well, I just didn't implement writing yet (it's more complicated than
that trivial reads) and I didn't know the correct values for the above
ones. I just set writesize to 1 to avoid some WARN/BUG (not remember
right now).


>> +static int __devexit bcm47xxsflash_remove(struct platform_device *pdev)
>> +{
>> +     struct bcma_sflash *sflash =3D dev_get_platdata(&pdev->dev);
>> +
>> +     if (!sflash->mtd) {
>> +             WARN_ON(1);
>> +             return -ENODEV;
>> +     }
>
> Why do you need this check with a warning? Can this happen, in which
> cases?

In case some other driver handling platform device was loaded earlier.
Is that wrong?

--=20
Rafa=C5=82
