Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zdss6-0002W3-IT
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2015 04:38:35 +0000
Message-ID: <55FF882B.4030003@cn.fujitsu.com>
Date: Mon, 21 Sep 2015 12:31:39 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Jan Kara <jack@suse.cz>
CC: <viro@ZenIV.linux.org.uk>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v3 11/39] fs: quota: replace opened calling of ->sync_fs
 with sync_filesystem
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-12-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20150916101402.GE13325@quack.suse.cz> <55FA5D8A.9030108@cn.fujitsu.com>
 <20150917110547.GB32280@quack.suse.cz> <55FBA5E5.1040201@cn.fujitsu.com>
 <20150918090038.GA14330@quack.suse.cz>
In-Reply-To: <20150918090038.GA14330@quack.suse.cz>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/18/2015 05:00 PM, Jan Kara wrote:
> On Fri 18-09-15 13:49:25, Dongsheng Yang wrote:
>> On 09/17/2015 07:05 PM, Jan Kara wrote:
>>> On Thu 17-09-15 14:28:26, Dongsheng Yang wrote:
>>>> On 09/16/2015 06:14 PM, Jan Kara wrote:
>>>>> On Tue 15-09-15 17:02:06, Dongsheng Yang wrote:
>>>>>> There are only two places in whole kernel to call ->sync_fs directly. It
>>>>>> will sync fs even in read-only mode. It's not a good idea and some filesystem
>>>>>> would warn out if you are syncing in read-only mode. But sync_filesystem()
>>>>>> does filter this case out. Let's call sync_filesystem() here instead.
>>>>>>
>>>>>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>>>>>
>>>>> So I'd prefer ubifs used hidden system inodes for quota files, set
>>>>> DQUOT_QUOTA_SYS_FILE flag and so this code calling sync_fs() could be
>>>>> completely avoided.
>>>>
>>>> Hmmm, I think it's a good idea to make quota files SYS_FILEs. But how
>>>> about quota-tools? E.g, if quotacheck do some modification
>>>> on quota files, we would not read them without a sync_fs().
>>>>
>>>> Could you help explain how quota works in this case?
>>>
>>> So tools like quota(1) or setquota(1) work using quotactl so they don't
>>> need access to quota files. When quota files are system files, quotacheck
>>> functionality belongs into the fsck - so fsck.ubifs is responsible for
>>> checking consistency of quota files. How e.g. e2fsck does it is that when
>>> scanning inodes, it computes usage for each user / group, loads limits
>>> information from old quota files and then just creates new quota files with
>>> updated information if there's any difference to the old quota files.
>>
>> About quotacheck, I think just call fsync() in it sounds good to me.
>> Maybe something like the attachment.
>>
>> OKEY, but I found repquota is still using read() to access quota files.
>
> repquota(8) uses read on quota files only if quota files are visible to
> userspace. If quota files are invisible (they are system files),
> repquota(8) uses Q_GETQUOTA quotactl to report quotas. So this is not an
> issue.
>
>> Please consider that case: 1.we read quota file and there is a pagecache
>> for it. 2. Then kernel did some modification on quota files. But
>> if the files is SYS_FILES marked, dquot_quota_sync() would not drop
>> the pagecache, then 3. repquota would get an outdated data from pagecache.
>
> You can mark quota files as SYS_FILES only if they are invisible to
> userspace - usually they are stored in inodes not attached to any directory
> (their inode numbers are stored in superblock or similarly so that fs can
> find them when it is mounted).
>
>> I am not sure why ext4 works well in this case. There must be something
>> I am missing.
>
> Ext4 marks quota files as SYS_FILES only if it is configured to have quota
> files in hidden system inodes. So everything works fine.
>
>> Maybe we can introduce a Q_GETBLK for quotactl() to make all
>> quota tools getting informations from ioctl.
>
> The idea is we don't want to expose raw quota blocks to quota tools
> anymore and there's no real need to. The only suboptimal thing is
> repquota(8) which would benefit from a way to iterate over all quota
> entries of a particular quota type to make it more efficient if it doesn't
> have access to quota file. For that we could create a new quotactl
> but it was never pressing enough so that it would get implemented.
>
>>> Another advantage of the checking functionality being in fsck is that
>>> fs-specific fsck can gather usage information much more efficiently (and
>>> fsck has to do full fs scan anyway) and there's no need to propagate quota
>>> usage information to userspace using FIQSIZE ioctl() and similar stuff...
>>
>> So, let me try to summary the my opinions about it.
>> Pros:
>> 	(1). Security. quota files shouldn't be accessible to usespace.
>> 	(2). Efficiency. No need for quotacheck, just do it in fsck.
>> 	(3). No need FIOQSIZE any more.
>> Cons:
>> 	(1). Incompatibility:
>> 		If I set DQUOT_QUOTA_SYS_FILE currently, there are at
>> least two commands would not work: quotacheck and repquota. Actually
>> that means the whole quota is not usable to user.
>
> When quota file is a system file, quotacheck(8) is not needed - fsck does
> all the work. So that isn't an issue. Repquota(8) knows how to deal with a
> situation when quota file is not visible (when it is a system file), so
> that works as well.  Believe me, both ext4 and ocfs2 use this mechanism and
> it works fine. XFS and GFS2 use the same principles but the don't fully use
> the quota framework (only quotactl interface) so that's a bit different
> case.
>
>> So, I think the compatibility is important to me. Then what about
>> setting quota files as regular files at first. After all tools (quota
>> tools, quotacheck, repquota, fsck) prepared, setting the
>> DQUOT_QUOTA_SYS_FILE seems better.
>
> Quota tools are prepared for this. And ext4 originally used quota files as
> regular files and later transitioned to store quota in system files and the
> transition isn't a trivial process so it's better to avoid it.

Okey, so I need to do my work similar with what ext4 is doing. I will read
more about it in ext4 and quota-tools to see how to implement it in
ubifs.
>
> Furthermore I'm not inclined to accept changes to generic quota
> infrastructure just to accommodate ubifs to store quotas in regular files
> when storing them in system files will solve these problems without changes
> to the generic infrastructure.

Yes, I agree with that. We should keep the generic
infrastructure until we have to change it. :)

Yang
>
> 								Honza
>
