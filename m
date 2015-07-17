Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZG43e-0005eU-P2
 for linux-mtd@lists.infradead.org; Fri, 17 Jul 2015 11:44:03 +0000
Message-ID: <55A8EA6A.8080405@nod.at>
Date: Fri, 17 Jul 2015 13:43:38 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com, Andrea Scian <rnd4@dave-tech.it>
CC: mtd_mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: UBIFS: recovery of master node
References: <55A7B004.2090705@dave-tech.it>	
 <CAFLxGvxgKeKq1_cLNG9rS53NDT=OZsO9h6cizBnkU5Zv69EwSQ@mail.gmail.com>	
 <55A8A7A4.906@dave-tech.it> <55A8ADA9.70402@nod.at>
 <1437133082.2507.114.camel@gmail.com>
In-Reply-To: <1437133082.2507.114.camel@gmail.com>
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

Am 17.07.2015 um 13:38 schrieb Artem Bityutskiy:
> On Fri, 2015-07-17 at 09:24 +0200, Richard Weinberger wrote:
>> Am 17.07.2015 um 08:58 schrieb Andrea Scian:
>>> Il 16/07/2015 17:29, Richard Weinberger ha scritto:
>>>> Andrea,
>>>>
>>>> On Thu, Jul 16, 2015 at 3:22 PM, Andrea Scian <rnd4@dave-tech.it> 
>>>> wrote:
>>>>>
>>>>> If I bypass that check too, I can mount UBIFS and everything 
>>>>> inside the FS
>>>>> is there but, of course, I'm sure I'm doing something that may 
>>>>> be wrong..
>>>>>
>>>>> WDYT?
>>>>
>>>> So, you're facing bitflips on empty space?
>>>
>>> Another UBI/UBIFS "implementation" question: are there some other 
>>> places, apart from get_master_node(), where UBIFS check empty space 
>>> corruption and fails badly if something wrong?
>>
>> Having non-corrupted empty space is a fundamental requirement of 
>> UBIFS.
> 
> I am not sure it is that fundamental. What UBIFS needs is to
> distinguish between used and usused flash areas. It does this by
> comparing agains 0xFFs. Simple, worked fine in the past.

Okay. This good to know. I thought it is much more fundamental. :-)

> If the space is empty, UBIFS assumes it can write to it. UBIFS is being
> paranoid and also verifies that entire empty space contains all 0xFFs.
> Also very simple, worked fine in the past.
> 
> Now if you have "corrupted empty space" (i.e., you cannot write to it),
> this does not have to be the end of the world, you can clean it up by
> doing the "atomic LEB change" operation. It is just not implemented,
> but it could be done - matter of engineer-hours spent.

Thanks for pointing this out, Artem!

Thanks,
//richard
