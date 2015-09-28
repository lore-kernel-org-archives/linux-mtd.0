Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgfBt-0003bj-T4
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 20:38:30 +0000
Message-ID: <5609A52E.5010109@codeaurora.org>
Date: Mon, 28 Sep 2015 13:38:06 -0700
From: Nikhilesh Reddy <reddyn@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
CC: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] ubifs: Add new mount option to force fdatasync before
 rename
References: <560984B4.7090105@codeaurora.org> <56099735.2060503@nod.at>
In-Reply-To: <56099735.2060503@nod.at>
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

On Mon 28 Sep 2015 12:38:29 PM PDT, Richard Weinberger wrote:
> Hi!
>
> Am 28.09.2015 um 20:19 schrieb Nikhilesh Reddy:
>> The rename operation in UBIFS is synchronous (or nearly synchronous)
>> while the write operation is not. This can result in zero length files when
>> renaming of files followed by an abrupt power down or a crash.
>>
>> For example:
>> 1) Say a file a.txt exists with size 1KB.
>> 2) Create a file b.tmp (open)
>> 3) Update the data in b.tmp with new values (write and close)
>> 4) rename b.tmp to a.txt
>> 5) Abrupt power down or crash
>>
>> This above scenario can result in a.txt becoming a file of zero length and
>> giving the impression of a.txt being truncated.
>> This scenario can ofcourse be prevented by calling fsync or fdatasync
>> before the rename operation.
>>
>> There are many applications and libraries that do not call fsync or
>> fdatasync since they were tested on EXT4 which has a hack to handle
>> the above case.
>
> ...and these applications are buggy by design.
> ext4 has some hacks to detect some misuses (IIRC replace by rename and replace by truncate)
> as these applications worked by chance on ext3.
> Adding such a hack now to UBIFS needs a bit more justification.
> Especially as your new mount option is a sledgehammer.
>
> Which application triggers this issue?
> I'm asking because UBIFS is more or less an embedded filesystem.
> On ext4 mostly broken GUI programs like eclipse or kwrite forgot to fsync().

Thanks Richard for lookign into this patch.
I completely agree with you on the fact that these applications are 
indeed buggy.
But yes the issues were seen on embedded systems.
We saw this issue when debugging a few applications that used an xml 
parser library.
to write  data.
There were a few other applications as well but i dont have access to 
their source.
Fixing all the applications is not exactly feasible since they may have 
bugs in multiple places.
And sometimes we dont have a legal go ahead to fix code that is from 
thirdparties who may never fix their code... or just distribute a s 
binaries.
This change was made due to multiple requests that came from our 
customers who ran into this issue on the applications that they run on 
their products.

We could  use "-o sync" mount option. But this makes UBIFS perform 
badly that just syncing the old inode data alone.
The idea was to have a mount point option that could be enabled only as 
needed and taking a performance hit during a rename.
All the tests showed no real performance degradation.
Since it would be disabled by default the normal mount without this 
would have no impact what so ever to the current behavior.
Only on filesystems that are mounted with this option will this new 
behavior kick in.

Please do consider applying the patch.
If you have any suggestions on improving this patch to you liking 
please do let me know and I am happy to make any chances that you deem 
necessary.
Thanks again for you consideration.



>
>> Add a new mount option of sync_before_rename which would implicitly
>> sync the data before renaming the file to help address cases where the
>> rename cases need to be handled implicitly and prevent the zero length
>> files as a result of a rename.
>>
>> Change-Id: I4e8771d40307543b532df7f46bd87864f0d3d294
>
> What is that?
Oops this was a leftover from an internal change id... can get rid of 
it.
Sorry about that.

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
