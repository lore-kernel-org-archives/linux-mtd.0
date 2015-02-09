Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKeBv-0005Zr-B5
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 02:35:17 +0000
Message-ID: <54D81C9B.8070500@huawei.com>
Date: Mon, 9 Feb 2015 10:34:03 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [RFC] UBIFS recovery
References: <54D33C36.9060805@huawei.com>
 <1423242166.8637.566.camel@sauron.fi.intel.com>
In-Reply-To: <1423242166.8637.566.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, Sheng Yong <shengyong1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On 2015/2/7 1:02, Artem Bityutskiy wrote:
> Hi Hujianyang,
> 
> On Thu, 2015-02-05 at 17:47 +0800, hujianyang wrote:
>> Current UBIFS is lack of recovery method, that means, once a UBIFS
>> partition refuse to mount, all data on that partition may lose.
>> The default recovery mechanism in UBIFS now can deal with corruption
>> on master node or power cut cleanup. But it's not enough. UBIFS
>> on flash may suffer different kinds of data corrupted, the most
>> common case, ECC error.
> 
> First of all, it is important to agree on terminology.
> 
> I think I understand what you mean in this paragraph, but other people
> may get wrong impression. Simply because "UBIFS has no recovery" is
> _absolutely_ not True. UBIFS has _a lot_ of recovery, just check
> 'recovery.c' :-)
> 
> But I understand that this is not the recovery you mean. And I
> understand that it may be difficult to express things in English.
> And good terminology will help - let's introduce it and and stick to it.
> 
> Here is what UBIFS "things" about file-system recovery.
> 
> There are 2 types of recovery:
> 
> 1. Power-cut recovery
> 2. Corruption recovery.
> 
> "Power-cut recovery" is, obviously, recovering from power cuts. Indeed,
> power-cuts may happen in the middle of write or erase operations and
> cause rubbish on the flash media. Cleaning up this rubbish at mount time
> is the power-cut recovery.
> 
> "Corruption recovery" is recovery from media corruptions. E.g., the
> flash is just too worn-out and does not keep data, or part of the flash
> is erased and part of the UBIFS meta-data and data are gone.
> 
> And these are 2 completely different cases, right?

Yes, nice definition.

I know power-cut recovery in recovery.c. But I don't express well. Thanks!

> 
> Now, UBIFS _does_ support power-cut recovery. In practice this means
> that you should always be able to mount the file-system after a power
> cut. All the garbage caused by the power cut should go away. No data
> which were on the flash media before the power cut should be lost. Any
> file which was fsync()'ed be before the power cut should be stay intact.
> 
> And this is not a trivial task. Power cuts may happen during garbage
> collecting, during commit. There may be a sequence of power cut:
> power-cut -> mount proces -> another power cut while we are recovering
> from the previous one -> and again and again.
> 
> UBIFS tries hard to provide power-cut recovery. There may be issues, and
> if there are, they are bugs which should be fixed.
> 
> The _corruption recovery_, on the other hand, is not implemented in the
> driver. And yes, there is not user-space tool. If UBIFS sees that some
> data structure is missing or corrupted, and at the same time UBIFS
> "knows" that this can't be because of a power cut - UBIFS refuses to
> mount the file-system or switches to R/O mode.
> 
> UBIFS does not make any attempt to do corruption recovery.
> 
> UBIFS authors believed it is simply impossible to do inside the driver
> for the generic case. E.g., what do you do if the LEB which should
> contain the UBIFS index now contains "rubbish"? Will you erase it? If
> yes, what if this turns out to be my favorite cat's picture? Or will you
> move it? If yes, what if there is no space to move to?

Power-cut recovery is predictable, or can say:

1) Where are corrupted data could be known.
2) What kinds of corrupted data could be known.

But corruption recovery is quite different. Corrupted data may exist
in any place and be any form. Even if we successfully mount a partition,
we don't whether there are any corruptions still on the flash.

In this respect, userspace tool is better. It can do whole scan, pick
up corruptions, check and fix them.

> 
> User-space tools may start asking user questions, etc. Kernel driver
> can't. User-space tools may copy the "rubbish" somewhere so that users
> had chance to recover the picture of the beloved animal.
> 
>> I've scanned the archive of maillist and found the recovery method
>> was once requested(Sorry, I can't find the link). Artem suggested
>> we could introduce a new repairing mount option instead of working
>> on a new userspace repairing tool. But seems no more efforts had
>> been done so far.
> 
> I do not remember what I suggested, but I do not think corruption
> recover is possible to implement in the driver.
> 
> But I can imagine that there may be some specific cases which could be
> covered. If there is good justification for that, I am fine.
> 
>> +	/*
>> +	 * If an error occur during buds replay, try to revert filesystem
>> +	 * to last commit state. Should not apply corrupt replay list.
>> +	 */
>> +	if (!replay_buds(c)) {
>> +		err = apply_replay_list(c);
>> +		if (err)
>> +			goto out;
>> +	}
> 
> Reverting to the last committed state _may_ make sense. Probably this
> could be a mount option. In this case, though, UBIFS should periodically
> commit, say, every 5-10 seconds.
> 

Good suggestions. I will try to realize periodically commit first. But I
don't know if this feature is really needed. Switch to R/O and revert to
last comitted state? But we just consider about log before, never think
about index.

I think maybe we can first make sure what kinds of corruptions we could
recovery, what kinds of corruptions we could fix by adding some simple
mechanism.

Thanks,
Hu
