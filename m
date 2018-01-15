Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eb4Ji-00039v-Jq
 for linux-mtd@lists.infradead.org; Mon, 15 Jan 2018 12:56:48 +0000
Received: by mail-ot0-x233.google.com with SMTP id a24so10545197otd.4
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jan 2018 04:56:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180112161131.3cae7841@bbrezillon>
References: <20180112144034.6655-1-zajec5@gmail.com>
 <20180112144034.6655-3-zajec5@gmail.com>
 <20180112161131.3cae7841@bbrezillon>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 15 Jan 2018 13:56:34 +0100
Message-ID: <CACna6rxzvNyMrPb=OV1ius7wvZkQQM4N7ynFUkbiXvDJkQapjQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: get rid of the mtd_add_device_partitions function
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

On 12 January 2018 at 16:11, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
>> @@ -717,19 +702,19 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>>       ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
>>       if ((ret < 0 || parsed.nr_parts == 0) && parts && nr_parts) {
>>               /* Fall back to driver-provided partitions */
>> -             parsed = (struct mtd_partitions){
>> -                     .parts          = parts,
>> -                     .nr_parts       = nr_parts,
>> -             };
>> +             ret = add_mtd_partitions(mtd, parts, nr_parts);
>>       } else if (ret < 0) {
>>               /* Didn't come up with parsed OR fallback partitions */
>>               pr_info("mtd: failed to find partitions; one or more parsers reports errors (%d)\n",
>>                       ret);
>>               /* Don't abort on errors; we can still use unpartitioned MTD */
>> -             memset(&parsed, 0, sizeof(parsed));
>> +             if (!IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
>> +                     ret = add_mtd_device(mtd);
>> +             else
>> +                     ret = 0;
>> +     } else {
>> +             ret = add_mtd_partitions(mtd, parsed.parts, parsed.nr_parts);
>>       }
>
> How about:
>
>         ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
>         if (!ret && parsed.nr_parts) {
>                 parts = parsed.parts;
>                 nr_parts = parsed.nr_parts;
>         }
>
>         if (nr_parts)
>                 ret = add_mtd_partitions(mtd, parts, nr_parts);
>         else if (!device_is_registered(&mtd->dev))
>                 ret = add_mtd_device(mtd);
>         else
>                 ret = 0;

I spent a moment writing possible cases on a paper and your solution
should keep the same logic. Looks good!
