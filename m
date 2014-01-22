Received: from mail-ob0-x22d.google.com ([2607:f8b0:4003:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5ypu-0008Fs-KB
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2014 14:31:23 +0000
Received: by mail-ob0-f173.google.com with SMTP id vb8so479962obc.4
 for <linux-mtd@lists.infradead.org>; Wed, 22 Jan 2014 06:31:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20140122150959.78cf2827@ipc1.ka-ro>
References: <1389608739-10945-1-git-send-email-LW@KARO-electronics.de>
 <20140122150959.78cf2827@ipc1.ka-ro>
Date: Wed, 22 Jan 2014 23:31:00 +0900
Message-ID: <CAC5umyhC+9zwwX7Mswo2uAc0pFqp7Np1D+nFwr7Y3TS3OLT6-A@mail.gmail.com>
Subject: Re: [PATCH] mtd: mtd_oobtest: fix verify errors due to incorrect use
 of prandom_bytes_state()
From: Akinobu Mita <akinobu.mita@gmail.com>
To: =?ISO-8859-1?Q?Lothar_Wa=DFmann?= <LW@karo-electronics.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2014/1/22 Lothar Wa=DFmann <LW@karo-electronics.de>:
> Hi,
>
> Is anyone taking care of this?
>
> Lothar Wa=DFmann wrote:
>> When using prandom_bytes_state() it is critical to use the same block
>> size in all invocations that are to produce the same random sequence.
>> Otherwise the state of the PRNG will be out of sync if the blocksize
>> is not divisible by 4.
>> This leads to bogus verification errors in several tests which use
>> different block sizes to initialize the buffer for writing and
>> comparison.
>>
>> Signed-off-by: Lothar Wa=DFmann <LW@KARO-electronics.de>
>> ---
>>  drivers/mtd/tests/oobtest.c |   14 ++++++++++++--
>>  1 files changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
>> index 2e9e2d1..72c7359 100644
>> --- a/drivers/mtd/tests/oobtest.c
>> +++ b/drivers/mtd/tests/oobtest.c
>> @@ -213,8 +213,15 @@ static int verify_eraseblock_in_one_go(int ebnum)
>>       int err =3D 0;
>>       loff_t addr =3D ebnum * mtd->erasesize;
>>       size_t len =3D mtd->ecclayout->oobavail * pgcnt;
>> +     int i;
>> +
>> +     for (i =3D 0; i < pgcnt; i++)
>> +             prandom_bytes_state(&rnd_state, &writebuf[i * use_len],
>> +                             use_len);
>> +     if (len % use_len)
>> +             prandom_bytes_state(&rnd_state, &writebuf[i * use_len],
>> +                             len % use_len);
>>
>> -     prandom_bytes_state(&rnd_state, writebuf, len);
>>       ops.mode      =3D MTD_OPS_AUTO_OOB;
>>       ops.len       =3D 0;
>>       ops.retlen    =3D 0;

I would rather fix the use of prandom_bytes_state() in write_eraseblock()
than fix in verify_eraseblock_in_one_go().

>> @@ -594,7 +601,10 @@ static int __init mtd_oobtest_init(void)
>>               if (bbt[i] || bbt[i + 1])
>>                       continue;
>>               prandom_bytes_state(&rnd_state, writebuf,
>> -                                     mtd->ecclayout->oobavail * 2);
>> +                                     mtd->ecclayout->oobavail);
>> +             prandom_bytes_state(&rnd_state,
>> +                                     writebuf + mtd->ecclayout->oobavai=
l,
>> +                                     mtd->ecclayout->oobavail);
>>               addr =3D (i + 1) * mtd->erasesize - mtd->writesize;
>>               ops.mode      =3D MTD_OPS_AUTO_OOB;
>>               ops.len       =3D 0;

The same goes for this.  I would rather fix prandom_bytes_state() when
writing OOBs.
