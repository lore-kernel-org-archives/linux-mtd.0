Received: from mail-wj0-x22c.google.com ([2a00:1450:400c:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEd4a-0005Au-QQ
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 14:19:53 +0000
Received: by mail-wj0-x22c.google.com with SMTP id v7so362062097wjy.2
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2016 06:19:32 -0800 (PST)
Subject: Re: Add --skip-all-ffs option to mtd-utils nandwrite
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Kees Trommel <ctrommel@aimvalley.nl>, linux-mtd@lists.infradead.org
References: <82cbfdbc-c79b-01b0-bc64-a4259d7a150e@aimvalley.nl>
 <16abefc9-61e8-3b0d-c44c-6d02764ec8e9@sigma-star.at>
 <33437f45-d3e8-17ec-d5b0-0118d50ff6ec@aimvalley.nl>
 <cb18365f-4fe0-9e07-f7cc-6c2bf72018b3@sigma-star.at>
 <15c62cdb-38f7-76b8-b3fc-6b3c2766e9df@gmail.com>
 <b2a82878-d9f8-f22b-1993-aeae926a0e40@sigma-star.at>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d4a1082b-d79a-8c90-b17d-5d559e32308a@gmail.com>
Date: Wed, 7 Dec 2016 15:09:49 +0100
MIME-Version: 1.0
In-Reply-To: <b2a82878-d9f8-f22b-1993-aeae926a0e40@sigma-star.at>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/07/2016 09:21 AM, David Oberhollenzer wrote:
> On 12/07/2016 06:01 AM, Marek Vasut wrote:
>> +               if (skipallffs)
>> +               {
>> +                       for (ii = 0; ii < mtd.min_io_size; ii +=
>> sizeof(uint32_t))
>> +                       {
>> +                               if (*(uint32_t*)(writebuf + ii) !=
>> 0xffffffff)
>> +                                       break;
>>
>> Is this memcmp()-alike function ?
>>
>> +                       }
>> +                       if (ii == mtd.min_io_size)
>> +                               allffs = 1;
>> +               }
>> +               if (!allffs) {
> The point of the patch is not to write a page that is filled with 0xFF bytes.
> A feature that is turned off by default and can be activated via a command
> line switch.

That much I figured out

> The code you are trying to replace tries to figure out if an entire block of
> memory is set to 0xFF. The code path should be conditional, as this feature
> is turned off unless explicitly requested.

And to do that, we need to open-code it like above ?
Looks pretty crappy.

>> This could be simply turned to:
>>
>> ret = 0;
>> if (!memcmp(writebuf, writebuf + 1, mtd.min_io_size - 1)) {
>>     ret = mtd_write(....);
>> }
> This does something completely different.

It checks whether the buffer if full of the same bytes, yes ?
Add additional conditions as needed (check whether user provided
the arg and whether byte 0 in the buffer is 0xff and you should
be done).

-- 
Best regards,
Marek Vasut
