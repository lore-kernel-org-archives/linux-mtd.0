Received: from dd6426.kasserver.com ([85.13.131.52])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3aVc-0001xW-AC
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 04:58:58 +0000
Subject: Re: UBIFS - ubifs_get_pnode.part.4: error -22 reading pnode
To: Richard Weinberger <richard@sigma-star.at>, linux-mtd@lists.infradead.org
References: <95F51F4B902CAC40AF459205F6322F01B80E921AE3@BMK019S01.emtrion.local>
 <s1l9q5oc97q87j6d75pkp49b.1522781343251@email.android.com>
 <c3a2d38b-a789-81e6-bf3f-7a573778a054@erdrich.net>
 <4391036.Fuyg1DPom3@blindfold>
From: Frank Erdrich <frank@erdrich.net>
Message-ID: <fac82fd0-1c68-8ea7-d066-65c5901ff539@erdrich.net>
Date: Wed, 4 Apr 2018 06:58:40 +0200
MIME-Version: 1.0
In-Reply-To: <4391036.Fuyg1DPom3@blindfold>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Richard,

thanks again for the quick response.

Am 03.04.2018 um 23:28 schrieb Richard Weinberger:
>>> On Tue, Apr 3, 2018 at 10:28 AM, Erdrich, Frank
>>> <Frank.Erdrich@emtrion.de> wrote:
>>>   > Hello,
>>>   >
>>>   > we are encountering an error on UBIFS that prevents mounting of a
>>> partition. Maybe one of you can tell me the directly the reason for that
>>> or can help me hunting this error down.
>>>
>>> UBIFS got confused wrt. free space accounting.
>>> Can you tell me more on your setup? Do you use Fastmap? fscrypt? xattr?
>>
>> We use only extended attributes. fastmap and fscrypt are not used. That
>> are the kernel options we have set:
>>
>> CONFIG_MTD_UBI=y
>> CONFIG_MTD_UBI_WL_THRESHOLD=4096
>> CONFIG_MTD_UBI_BEB_LIMIT=20
>> # CONFIG_MTD_UBI_FASTMAP is not set
>> # CONFIG_MTD_UBI_GLUEBI is not set
>> # CONFIG_MTD_UBI_BLOCK is not set
>> CONFIG_UBIFS_FS=y
>> CONFIG_UBIFS_FS_ADVANCED_COMPR=y
>> CONFIG_UBIFS_FS_LZO=y
>> CONFIG_UBIFS_FS_ZLIB=y
>> # CONFIG_UBIFS_ATIME_SUPPORT is not set
> 
> Good.
> 
>> The Flash itself is divided into three mtd partitions to get some sort
>> of separation of critical data against other data. The partition that
>> shows that error is a logging partition which is, of course, written on
>> a regular base. We are not using the sync mount option at the moment.
>> Writeback timers (for dirty data) are on default value.
> 
> Side note: Having multiple UBI instances on the same MTD is not a good idea.
> Usually you want the wear leveling domain as large as possible.

Yeah, I know. But we had some more issues with the flash and the 
filesystem and that was the safest way to have a running system even if 
the log partition fails. That gives us the ability to do updates on a 
corrupted system an bring it back to a good state.

The easiest thing would be to disable the logging. I would do that 
because logging is totally unneeded on that device, but the customer 
gets what he wants...

>>>   > I'm not deep enough in the ubifs system to completely understand what
>>> is happening here but for me it seems that there are more dirty data to
>>> write than the size of the LEB.
>>>   > -> 3: free 507904 dirty 524128 flags 34 lnum 0
>>>   > I've seen that the values are checked in validate_pnode() where the
>>> -EINVAL (-22) comes from. The question is, how can dirty data bigger
>>> that the LEB size?
>>>
>>> Yes, this can happen. That's why UBIFS does in some cases a fixup of
>>> the used/free numbers.
>>> These numbers are not always updated immediately and when a power-cut
>>> happens their state might be inconsistent.
>>
>> I'm totally fine with that behaviour as a power-cut can happen anytime
>> in an embedded system but I would assume that the ubifs-recovery would
>> bring back the system to a operable state. Or is there an error in my
>> reasoning?
> 
> Of course UBIFS should be able to recover.
> I suspect a very subtle but in UBIFS' xattr code.
> Other bug reports point in that direction too.
> 
> Sadly so far I was not able to pinpoint the exact issue.
> Therefore I started to review the code. So far I've found some odds but
> I'm not 100% sure whether these cause the trouble you see.
> 
>> Please let me know if you need more information or if I should do
>> special testing.
> 
> Can you reproduce the issue?
> If so, please retry with the attached patches.
> They will not fix your already broken UBIFS but they (hopefully) will
> make sure that the accounting problem will not happen again.

That's the biggest problem. There is no way to reproduce it on a proper 
way. The only thing I can do at the moment is to write to the partition 
and do random power-cuts.

I will try the patches you have provided an will check if the error 
comes up with them or not. Unluckily I'm out of office for today, so I 
can start testing tomorrow.

> Can you also share me the broken UBIFS image?

I have to talk to our customer if that is ok for him, but I think that 
will not be a big problem. Can you give me a command line to extract 
that image from the flash in a way, that it is directly usable by you 
without do conversion stuff?.


Thanks,
Frank
