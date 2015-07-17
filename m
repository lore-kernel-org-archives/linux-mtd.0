Received: from mail-lb0-x22d.google.com ([2a00:1450:4010:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZG1VP-0008Mi-PC
 for linux-mtd@lists.infradead.org; Fri, 17 Jul 2015 09:00:32 +0000
Received: by lbbyj8 with SMTP id yj8so57703787lbb.0
 for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2015 02:00:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55A8B893.1020307@nod.at>
References: <55A7B004.2090705@dave-tech.it>
 <CAFLxGvxgKeKq1_cLNG9rS53NDT=OZsO9h6cizBnkU5Zv69EwSQ@mail.gmail.com>
 <55A8A7A4.906@dave-tech.it> <55A8ADA9.70402@nod.at>
 <55A8B70B.5030405@dave-tech.it> <55A8B893.1020307@nod.at>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 17 Jul 2015 10:59:49 +0200
Message-ID: <CACQ1gAhx0C9PqvXd=+wMBC58W6h5PirTY8QEkMpUb+yNDixdYw@mail.gmail.com>
Subject: Re: UBIFS: recovery of master node
To: Richard Weinberger <richard@nod.at>
Cc: Andrea Scian <rnd4@dave-tech.it>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2015-07-17 10:10 GMT+02:00 Richard Weinberger <richard@nod.at>:
> Am 17.07.2015 um 10:04 schrieb Andrea Scian:
>>
>> Dear Richard,
>>
>> Il 17/07/2015 09:24, Richard Weinberger ha scritto:
>>> Am 17.07.2015 um 08:58 schrieb Andrea Scian:
>>>> Il 16/07/2015 17:29, Richard Weinberger ha scritto:
>>>>> Andrea,
>>>>>
>>>>> On Thu, Jul 16, 2015 at 3:22 PM, Andrea Scian <rnd4@dave-tech.it> wrote:
>>>>>>
>>>>>> If I bypass that check too, I can mount UBIFS and everything inside the FS
>>>>>> is there but, of course, I'm sure I'm doing something that may be wrong..
>>>>>>
>>>>>> WDYT?
>>>>>
>>>>> So, you're facing bitflips on empty space?
>>>>
>>>> Another UBI/UBIFS "implementation" question: are there some other places,
>>>> apart from get_master_node(),
>>>> where UBIFS check empty space corruption and fails
>>>> badly if something wrong?
>>>
>>> Having non-corrupted empty space is a fundamental requirement of UBIFS.
>>> If you patch it out you'll hurt UBIFS's ability to recover from a power cut.
>>> Someone tried to do so already.
>>
>> Thanks, this are the internals of UBIFS I'm not aware of, and for this I'm asking the experts :-)
>>
>>> I know, cheap modern NAND, especially MLC seems to show bitflips also on empty pages.
>>> Not all NAND controllers can deal with that and will just return an uncorrectable ECC error
>>> upon reading.
>>
>> Is the any NAND controller able to do so? ;-)
>
> TBH, I don't know. :-)
The atmel nand controllers since SAMA5 can do that (and that quite easy to do) :
All they have to do is set an XOR value at the end of the ECC
computation so that ECC(blank_page)==0xFFFFFFFFF...
(maybe it's more complicated that that, but that's the idea).

As far as I've seen, the actual implementation (in atmel_nand for
chips >SAMA5) is buggy :
http://lxr.free-electrons.com/source/drivers/mtd/nand/atmel_nand.c#L857
If the ECC is all FF, the page is considered to be a blank page (but
it's not memset-ed to 0)
and a bitflip in the ecc area is not handled either.

I didn't have time to rebound on Brian's patch proposal yet (
http://patchwork.ozlabs.org/patch/328994/ ) but it's clear that we
have to do something to address that.
At least, UBIFS is screaming out loud when a blank page is not blank !
others FS may just write corrupted data...


Richard.
