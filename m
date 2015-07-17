Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZG0jr-0005n1-Qt
 for linux-mtd@lists.infradead.org; Fri, 17 Jul 2015 08:11:24 +0000
Message-ID: <55A8B893.1020307@nod.at>
Date: Fri, 17 Jul 2015 10:10:59 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Andrea Scian <rnd4@dave-tech.it>
CC: mtd_mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: UBIFS: recovery of master node
References: <55A7B004.2090705@dave-tech.it>
 <CAFLxGvxgKeKq1_cLNG9rS53NDT=OZsO9h6cizBnkU5Zv69EwSQ@mail.gmail.com>
 <55A8A7A4.906@dave-tech.it> <55A8ADA9.70402@nod.at>
 <55A8B70B.5030405@dave-tech.it>
In-Reply-To: <55A8B70B.5030405@dave-tech.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 17.07.2015 um 10:04 schrieb Andrea Scian:
> 
> Dear Richard,
> 
> Il 17/07/2015 09:24, Richard Weinberger ha scritto:
>> Am 17.07.2015 um 08:58 schrieb Andrea Scian:
>>> Il 16/07/2015 17:29, Richard Weinberger ha scritto:
>>>> Andrea,
>>>>
>>>> On Thu, Jul 16, 2015 at 3:22 PM, Andrea Scian <rnd4@dave-tech.it> wrote:
>>>>>
>>>>> If I bypass that check too, I can mount UBIFS and everything inside the FS
>>>>> is there but, of course, I'm sure I'm doing something that may be wrong..
>>>>>
>>>>> WDYT?
>>>>
>>>> So, you're facing bitflips on empty space?
>>>
>>> Another UBI/UBIFS "implementation" question: are there some other places,
>>> apart from get_master_node(),
>>> where UBIFS check empty space corruption and fails
>>> badly if something wrong?
>>
>> Having non-corrupted empty space is a fundamental requirement of UBIFS.
>> If you patch it out you'll hurt UBIFS's ability to recover from a power cut.
>> Someone tried to do so already.
> 
> Thanks, this are the internals of UBIFS I'm not aware of, and for this I'm asking the experts :-)
> 
>> I know, cheap modern NAND, especially MLC seems to show bitflips also on empty pages.
>> Not all NAND controllers can deal with that and will just return an uncorrectable ECC error
>> upon reading.
> 
> Is the any NAND controller able to do so? ;-)

TBH, I don't know. :-)

>> IMHO the right place to deal with that is MTD core.
> 
> I agree with you, however I'm handling it at lowest level, inside the NAND controller.
> I know that having this code into the MTD NAND layer will allow us to have a "controller independent" implementation, however MTD see only a bigger picture: for example MTD sees
> only a NAND page (4k in my case) while the NAND controller usually apply ECC on smaller (1k in my case) section and here we have the right threshold to apply (ecc_strength or
> something a bit smaller if you prefer).
> 
> Finding the right threshold is, IMHO, the real trick.

Another problem is that on some controllers ECC simply does not work for empty
pages. So, you'll get an uncorrectable ECC error upon the first bitflip.

> Thanks for point this out.
> I've found some patches from one year ago from Huang Shijie (@freescale) which looks very close to mine. However I cannot see any inclusion in the mainline.

None of the proposed solutions went mainline so far. :(

Thanks,
//richard
