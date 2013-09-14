Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VKjub-0007No-GW
 for linux-mtd@lists.infradead.org; Sat, 14 Sep 2013 07:04:58 +0000
Received: by mail-wg0-f50.google.com with SMTP id f12so1954283wgh.17
 for <linux-mtd@lists.infradead.org>; Sat, 14 Sep 2013 00:04:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2030071.nWr24CInOj@lenovo>
References: <1379090297-2880-1-git-send-email-zajec5@gmail.com>
 <1379103930-3987-1-git-send-email-zajec5@gmail.com>
 <2030071.nWr24CInOj@lenovo>
Date: Sat, 14 Sep 2013 09:04:35 +0200
Message-ID: <CACna6rwi2VrmUkta-g3w4LHz930AvHrs1u2=Ni=bMmnAor+U5g@mail.gmail.com>
Subject: Re: [PATCH V2] mtd: bcm47xxpart: detect block aligned Squashfs
 partition
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
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

2013/9/13 Florian Fainelli <f.fainelli@gmail.com>:
> Le vendredi 13 septembre 2013 22:25:30 Rafa=C5=82 Mi=C5=82ecki a =C3=A9cr=
it :
>> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
>> index 9279a91..61213f9 100644
>> --- a/drivers/mtd/bcm47xxpart.c
>> +++ b/drivers/mtd/bcm47xxpart.c
>> @@ -32,6 +32,7 @@
>>  #define ML_MAGIC1                    0x39685a42
>>  #define ML_MAGIC2                    0x26594131
>>  #define TRX_MAGIC                    0x30524448
>> +#define SQSH_MAGIC                   0x71736873      /* shsq */
>
> You could include uapi/linux/magic.h and use the SQUASHFS_MAGIC constant
> directly, sorry for not noticing earlier.

OK, I need help with that crazy endianness here... When I look at
flash dump in hexdump (or Okteta for gui) I see:
37:0000 | 73 68 73 71 BB 03 00 00 00 00 00 00 88 1B 00 40 | shsq=C2=BB.....=
.....@

bcm47xx is LE, so reading first 4 bytes results in: 0x71'73'68'73 ([3]
+ [2] + [1] + [0]). That is what I used for my SQSH_MAGIC.

However SQUASHFS_MAGIC is 0x73717368. So I need to read [2] + [3] +
[0] + [1]... Any help how to achieve that?

--=20
Rafa=C5=82
