Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMyhK-0007Cj-Dq
 for linux-mtd@lists.infradead.org; Thu, 07 Dec 2017 16:06:56 +0000
Received: by mail-wm0-x235.google.com with SMTP id r78so14023869wme.5
 for <linux-mtd@lists.infradead.org>; Thu, 07 Dec 2017 08:06:33 -0800 (PST)
Subject: Re: [PATCH 0/5] Add flight recorder to MTDRAM
To: Richard Weinberger <richard@nod.at>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, linux-mtd@lists.infradead.org,
 boris.brezillon@free-electrons.com, david.oberhollenzer@sigma-star.at
References: <20171206085039.27164-1-dirk.behme@de.bosch.com>
 <8663ba73-5159-d1ac-5a3b-6d158dcf9923@colorfullife.com>
 <1944158.Wp3g4lm68D@blindfold> <1586330.7x2FQLeB9A@blindfold>
From: Manfred Spraul <manfred@colorfullife.com>
Message-ID: <971a70bc-3ef8-0e4a-74ce-e01ee7fa2116@colorfullife.com>
Date: Thu, 7 Dec 2017 17:06:29 +0100
MIME-Version: 1.0
In-Reply-To: <1586330.7x2FQLeB9A@blindfold>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ricard,

On 12/06/2017 09:57 PM, Richard Weinberger wrote:
> Manfred,
>
> Am Mittwoch, 6. Dezember 2017, 20:59:43 CET schrieb Richard Weinberger:
>>> I have uploaded the initial image, the final image and the flight
>>> recording.
>>>
>>> https://sourceforge.net/projects/calculix-rpm/files/ubifs/xattr/
>> Cool! I'll give it a try.
> Hmm, I did:
> ./replay -e 131072 -w 2048 dump-before.bin record.bin 168167
>   
> This applies 168167 to dump-before.bin, right?
> So I expect dump-before.bin to match the sha1sum of image-168167.bin.
> But it doesn't.
./replay dump-before.bin record.bin 168167

If you specify "-w 2048", then replay.cpp splits large writes into 
multiple operations.
e.g.: there are some 126 kB writes.
> Thanks,
> //richard
