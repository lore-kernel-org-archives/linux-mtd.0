Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a19Zb-00054Y-Ub
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2015 09:08:02 +0000
Subject: Re: [RFC PATCH 2/2] mtd: ubi: wl: avoid erasing a PEB which is empty
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-3-git-send-email-bigeasy@linutronix.de>
 <56538568.2040800@nod.at> <56541F3B.3070009@linutronix.de>
 <5654225A.9070702@nod.at> <56542308.1020409@linutronix.de>
 <565427AF.8040906@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, tglx@linutronix.de,
 Peter Zijlstra <peterz@infradead.org>
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <565428C4.8030304@linutronix.de>
Date: Tue, 24 Nov 2015 10:07:16 +0100
MIME-Version: 1.0
In-Reply-To: <565427AF.8040906@nod.at>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/24/2015 10:02 AM, Richard Weinberger wrote:
> Am 24.11.2015 um 09:42 schrieb Sebastian Andrzej Siewior:
>> On 11/24/2015 09:39 AM, Richard Weinberger wrote:
>>>>>> +	} else {
>>>>>> +		err = do_sync_erase(ubi, e2, vol_id, lnum, torture);
>>>>>> +		if (err) {
>>>>>> +			wl_entry_destroy(ubi, e2);
>>>>>
>>>>> Why that? The erase_worker will free e2 if it encounters
>>>>> a fatal error and gives up this PEB. You're introducing a double free.
>>>>
>>>> Hmmm. That is real bad error handling you have there. So you invoke
>>>> do_sync_erase(), the kmalloc() fails and how exactly you free e2 here?
>>>
>>> Why do you want to free e2? We free an erase entry only if we give
>>> it up. wear leveling entries are allocated at init time and destroyed
>>> when you detach UBI.
>>
>> The reference to it in the RB-tree (free) was removed. Is there another
>> reference to it?
> 
> UBI supports only single references.
> Everything else would be a bug.

So if there is no reference to e2 which was just removed from the
RB-tree free and do_sync_erase() can't kmalloc() then we leak e2,
correct?

> Thanks,
> //richard
> 
Sebastian
