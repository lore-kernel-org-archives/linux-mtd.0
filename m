Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqgpY-0002HV-5Z
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 14:01:47 +0000
Received: by mail-wr0-x230.google.com with SMTP id u108so130183274wrb.3
 for <linux-mtd@lists.infradead.org>; Wed, 22 Mar 2017 07:01:18 -0700 (PDT)
Received: from [192.168.65.138] (AAnnecy-653-1-42-194.w90-41.abo.wanadoo.fr.
 [90.41.1.194])
 by smtp.gmail.com with ESMTPSA id n14sm1956557wrn.28.2017.03.22.07.01.14
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Mar 2017 07:01:16 -0700 (PDT)
Subject: Re: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
To: linux-mtd@lists.infradead.org
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
 <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
 <20170322144507.4d80d2cc@bbrezillon>
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Message-ID: <fe83ef55-54ee-2b82-62c1-9b733185957f@gmail.com>
Date: Wed, 22 Mar 2017 15:01:08 +0100
MIME-Version: 1.0
In-Reply-To: <20170322144507.4d80d2cc@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

On 22/03/2017 14:45, Boris Brezillon wrote:
> Hi Bean,
>
> On Wed, 22 Mar 2017 13:20:04 +0000
> "Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:
>
> [...]
>> NAND_STATUS_FAIL:
>> For the both of series SLC NAND with on-die ECC, SR bit 0 (NAND_STATUS_FAIL) indicates an uncorrectable read fail,
>> data is lost, no recovery possible, unless we have software additional protection, the block is not necessarily
>> bad but the data is lost.
>>
>> NAND_STATUS_WRITE_RECOMMENDED:
>>
>> For the NAND_STATUS_WRITE_RECOMMENDED, it only works on 60s NAND, it is 4 bit ECC, the status register only
>> indicates if there is 0 or 1-4 correctable error bits. We don't want to trigger refresh if only 1 or 2 bits fail.
>> the base refresh is that if there 3 or 4 bitflips. But unfortunately we can't get failed bit count trough read status register.
>> SW workaround proposal:
>> 1. If SR bit 3 is set to 1 it means 1~4 bitflips and correctable.
>> 2. Read out the page with ECC ON
>> 3. Read out the page with ECC OFF
>> 4. Compare the data
>> 5. Count the number of bitflips for the sectors (there are 4 ECC sectors)
>> 6. if 3 or more fail bits, trigger fresh.
>> I know this is not good solution, but if as long as NAND_STATUS_WRITE_RECOMMENDED is set, and trigger refresh,
>> this will definitely increase NAND PE cycle.
> We discussed that with Thomas when developing the solution. I suggested
> to first go for a simple solution even if it implies unneeded PE
> cycles when bitflips are detected, but maybe I was wrong. In any case,
> it shouldn't be to hard to do what you suggest.

Just to share my experience with MX35LF1GE4AB device (a spinand one).

This device is able to fix up to 4 bits per 512 bytes page, but is not 
able to tell how many bit were fixed.
My first option was to say "and so, erasing/re-write will not be an issue !"
Well, quickly some blocks were scrubbed more than 100K by UBI... This 
was an issue !
(see 
http://lists.infradead.org/pipermail/linux-mtd/2016-April/066628.html 
for details)

So, for this particular device, I need to do something suggested by 
Bean: read the page with and without ECC, and count errors one by one.
This kind of patch is in my queue waiting for spinand integration, but 
it seems that something at nand level may be required.

My 2 cents
Arnaud

>
>> For the 70s, it is 8 bits on-die ECC, the status register can report 7-8 bitflips (refresh recommended), 4-6 bitflips and 1-3 bitflips.
>> So we can trigger refresh according to its bitflips status.
> That's good news!
>
> Thanks for your feedback.
>
> Boris
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
