Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgyKv-0000V0-4a
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 17:05:05 +0000
Message-ID: <560AC4AA.1070906@codeaurora.org>
Date: Tue, 29 Sep 2015 10:04:42 -0700
From: Nikhilesh Reddy <reddyn@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
CC: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] ubifs: Add new mount option to force fdatasync before
 rename
References: <560984B4.7090105@codeaurora.org> <56099735.2060503@nod.at>
 <5609A52E.5010109@codeaurora.org> <5609A7D8.4000801@nod.at>
In-Reply-To: <5609A7D8.4000801@nod.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon 28 Sep 2015 01:49:28 PM PDT, Richard Weinberger wrote:
> Hi!
>
> Am 28.09.2015 um 22:38 schrieb Nikhilesh Reddy:
>>> ...and these applications are buggy by design.
>>> ext4 has some hacks to detect some misuses (IIRC replace by rename and replace by truncate)
>>> as these applications worked by chance on ext3.
>>> Adding such a hack now to UBIFS needs a bit more justification.
>>> Especially as your new mount option is a sledgehammer.
>>>
>>> Which application triggers this issue?
>>> I'm asking because UBIFS is more or less an embedded filesystem.
>>> On ext4 mostly broken GUI programs like eclipse or kwrite forgot to fsync().
>>
>> Thanks Richard for lookign into this patch.
>> I completely agree with you on the fact that these applications are indeed buggy.
>> But yes the issues were seen on embedded systems.
>> We saw this issue when debugging a few applications that used an xml parser library.
>> to write  data.
>
> libxml2?
No i believe its pugixml (not sure which version) or its variant.
>
>> There were a few other applications as well but i dont have access to their source.
>> Fixing all the applications is not exactly feasible since they may have bugs in multiple places.
>> And sometimes we dont have a legal go ahead to fix code that is from thirdparties who may never fix their code... or just distribute a s binaries.
>> This change was made due to multiple requests that came from our customers who ran into this issue on the applications that they run on their products.
>>
>> We could  use "-o sync" mount option. But this makes UBIFS perform badly that just syncing the old inode data alone.
>> The idea was to have a mount point option that could be enabled only as needed and taking a performance hit during a rename.
>> All the tests showed no real performance degradation.
>
> Hmm, I'd have assumed that programs with heavy rename() usage would degrade.
>
>> Since it would be disabled by default the normal mount without this would have no impact what so ever to the current behavior.
>> Only on filesystems that are mounted with this option will this new behavior kick in.
>>
>> Please do consider applying the patch.
>> If you have any suggestions on improving this patch to you liking please do let me know and I am happy to make any chances that you deem necessary.
>
> Instead of making all rename() synchronous it would be a good start to detect broken
> patterns like ext4 does.
> I'll happily test and review those. :-)

Unfortunately major changes would not be completely up to me :(
But before i spend time on it ... i was hoping to understand the 
disadvantages of this approach and the advantages of the other approach?
Can you kindly help me understand?

So the patch effectively converts all the rename to a fdatasync+rename 
which is what we would expect all the userspace applications to do 
anyway.
If the application already calls fdatasync then nothing new occurs as 
part of the rename. If it doesnt then we perform an implicit fdatasync.
So only the broken paths ( which do not fdatasync) would be impacted.

Hopefully that is ok?
If enough time had passed and the data is already written to flash 
before the rename then again nothing additional happens.
Hopefully i did not miss something obvious.
Please do correct me if i missed something or made wrong assumptions.

>
> Thanks,
> //richard



--
Thanks
Nikhilesh Reddy

Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project.
