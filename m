Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eb2TH-0008TQ-Qj
 for linux-mtd@lists.infradead.org; Mon, 15 Jan 2018 10:58:33 +0000
Received: by mail-ot0-x231.google.com with SMTP id d10so10285074oti.7
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jan 2018 02:58:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180112160127.0bfc3c57@bbrezillon>
References: <20180112144034.6655-1-zajec5@gmail.com>
 <20180112144034.6655-2-zajec5@gmail.com>
 <20180112160127.0bfc3c57@bbrezillon>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 15 Jan 2018 11:58:18 +0100
Message-ID: <CACna6ryuzV9aqWt+rrYkcPbibArtvo0OED8Z8dUgv4Cx2+cUwg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: move code adding master MTD out of
 mtd_add_device_partitions
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 January 2018 at 16:01, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index f80e911b8843..f6460862e2ad 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -641,20 +641,12 @@ static int mtd_add_device_partitions(struct mtd_info *mtd,
>>  {
>>       const struct mtd_partition *real_parts = parts->parts;
>>       int nbparts = parts->nr_parts;
>> -     int ret;
>>
>> -     if (nbparts == 0 || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
>> -             ret = add_mtd_device(mtd);
>> -             if (ret)
>> -                     return ret;
>> -     }
>> +     if (nbparts == 0 && !IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
>> +             return add_mtd_device(mtd);
>
> Why not moving this part in mtd_device_parse_register() as well.

I move that in 2/2. I prefer to handle these changes in 2 steps as it
should be quite easier to review it that way.


> And I'd prefer something like:
>
>         if (!nbparts && !device_is_registered(&mtd->dev))
>                 ...

Nice idea with that device_is_registered.
