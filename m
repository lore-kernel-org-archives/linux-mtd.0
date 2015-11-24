Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a19VB-0000VX-LU
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2015 09:05:11 +0000
Subject: Re: [RFC PATCH 2/2] mtd: ubi: wl: avoid erasing a PEB which is empty
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-3-git-send-email-bigeasy@linutronix.de>
 <56538568.2040800@nod.at> <56541F3B.3070009@linutronix.de>
 <5654225A.9070702@nod.at> <56542308.1020409@linutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, tglx@linutronix.de,
 Peter Zijlstra <peterz@infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <565427AF.8040906@nod.at>
Date: Tue, 24 Nov 2015 10:02:39 +0100
MIME-Version: 1.0
In-Reply-To: <56542308.1020409@linutronix.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 24.11.2015 um 09:42 schrieb Sebastian Andrzej Siewior:
> On 11/24/2015 09:39 AM, Richard Weinberger wrote:
>>>>> +	} else {
>>>>> +		err = do_sync_erase(ubi, e2, vol_id, lnum, torture);
>>>>> +		if (err) {
>>>>> +			wl_entry_destroy(ubi, e2);
>>>>
>>>> Why that? The erase_worker will free e2 if it encounters
>>>> a fatal error and gives up this PEB. You're introducing a double free.
>>>
>>> Hmmm. That is real bad error handling you have there. So you invoke
>>> do_sync_erase(), the kmalloc() fails and how exactly you free e2 here?
>>
>> Why do you want to free e2? We free an erase entry only if we give
>> it up. wear leveling entries are allocated at init time and destroyed
>> when you detach UBI.
> 
> The reference to it in the RB-tree (free) was removed. Is there another
> reference to it?

UBI supports only single references.
Everything else would be a bug.

That said, I agree that the error handling in the wear_leveling_worker()
can be improved.
Especially as currently an error while do_sync_erase() puts UBI into read-only
mode and cleanup is skipped as we're in read-only anyway then.
Would you volunteer? :-)

Thanks,
//richard
