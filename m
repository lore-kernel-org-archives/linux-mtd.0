Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6dOG-0003B9-Pd
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 08:12:45 +0000
Received: by weyr3 with SMTP id r3so167253wey.36
 for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2012 01:12:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOiHx=mdnprqvxzm+127o+dqEo28LM78yZ8GQ1FLfaPiOVPhrg@mail.gmail.com>
References: <1346048155-28829-1-git-send-email-zajec5@gmail.com>
 <CAOiHx=mdnprqvxzm+127o+dqEo28LM78yZ8GQ1FLfaPiOVPhrg@mail.gmail.com>
Date: Wed, 29 Aug 2012 10:12:42 +0200
Message-ID: <CACna6rzUn85zGB1HoB+=st3qWV=w2oy7e2EEx0tqqzkY9ppu9g@mail.gmail.com>
Subject: Re: [PATCH V3] mtd: bcm47part driver for BCM47XX chipsets
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
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

2012/8/28 Jonas Gorski <jonas.gorski@gmail.com>:
>> +               /* CFE has small NVRAM at 0x400 */
>> +               fourcc =3D (u32 *)&buf[0x400];
>
> buf is only 0x401 bytes big, but here pointing to bytes 0x400-0x403 -
> does this even work?

Well, it does... but it means nothing more than another bug. This time
in my sflash driver.

--=20
Rafa=C5=82
