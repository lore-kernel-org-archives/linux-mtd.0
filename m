Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZ424-0000GS-4z
 for linux-mtd@lists.infradead.org; Tue, 18 Dec 2018 01:18:50 +0000
Subject: Re: [bug report] Got "read_pnode: error -22 reading pnode" during
 ubifs mount
To: Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <402695c6-7ba9-abe9-4ccd-ea598ea2511e@huawei.com>
 <1744858.UbCnKIVnxf@blindfold>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <762a7385-0caf-9a5a-ff62-603452fb1bd1@huawei.com>
Date: Tue, 18 Dec 2018 09:18:22 +0800
MIME-Version: 1.0
In-Reply-To: <1744858.UbCnKIVnxf@blindfold>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On 2018/12/15 22:41, Richard Weinberger wrote:
> Tao,
> 
> Am Samstag, 15. Dezember 2018, 13:28:12 CET schrieb Hou Tao:
>> We had encountered an ubi-fs mount failure during our repeated power-cut tests,
>> and the failure was caused by an invalid pnode during commit:
>>
>> <5>[   25.557349]UBI: attaching mtd9 to ubi2
>> <5>[   28.835135]UBI: scanning is finished
>> <5>[   28.894720]UBI: attached mtd9 (name "system", size 415 MiB) to ubi2
>> <5>[   28.894754]UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> <5>[   28.894771]UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> <5>[   28.894784]UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
>> <5>[   28.894798]UBI: good PEBs: 3320, bad PEBs: 0, corrupted PEBs: 0
>> <5>[   28.894811]UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
>> <5>[   28.894827]UBI: max/mean erase counter: 1528/269, WL threshold: 4096, image sequence number: 1247603810
>> <5>[   28.894843]UBI: available PEBs: 0, total reserved PEBs: 3320, PEBs reserved for bad PEB handling: 65
>> <5>[   28.895130]UBI: background thread "ubi_bgt2d" started, PID 2056
>> <5>[   29.033842]UBIFS: background thread "ubifs_bgt2_0" started, PID 2066
>> <5>[   29.056907]UBIFS: recovery needed
>> <3>[   29.477167]UBIFS error (pid 2064): read_pnode: error -22 reading pnode at 12:34909
>> <3>[   29.477201](pid 2064) dumping pnode:
>> <3>[   29.477220]	address ddd75840 parent ddc43a80 cnext 0
>> <3>[   29.477234]	flags 0 iip 0 level 0 num 0
>> <3>[   29.477248]	0: free 0 dirty 2656 flags 1 lnum 0
>> <3>[   29.477263]	1: free 0 dirty 127304 flags 1 lnum 0
> 
> The dirty counter is larger than LEB size. :-(
> So, your LPT is inconsistent.
> 
>> The problem is hard to reproduce and we are still trying.  As showed in the
>> above dmesg, the version of our kernel is v3.10.53, but the problem also
>> had been occurred on board using v4.1.
> 
> This sounds a lot like the xattr issue I've hunting down for some time now.
> The issue is very hard to reproduce and it took a long time for me to understand
> what is going on.
> 
> Can you please check whether the filesystem has xattr nodes?
> Please note that xattrs can be used for many reasons, including SELinux, SMACK,
> fscrypt, file capabilities, journald, ...
>
We use overlayfs over ubifs, so xattr is used. But I'm not sure whether or not
it's xattr related because in our reproduction environment we rarely modify the
lower-layer files through overlayfs.

> In doubt, try to reproduce with 7e5471ce6dba5f28a3c7afdfe168655d236f677b applied
> and disable UBIFS xattr support completely.
> 
Thanks for your suggestion. We will try once we have shorten the period of reproduction.

>> It seems there is no easy way to fix or circumvent the problem (e.g. fsck.ubifs),
>> so does anyone or any-organization have a plan to implement fsck.ubifs ?
> 
> The thing is, a fsck.ubifs cannot recover a failed filesystem (failed due to a bug).
> It may be able to bring it back in a mountable shape but user data will be lost
> in any case.
> In your case, the corrupt LPT is not the root cause, recreating it from scratch
> will not solve anything.
> 
Recreating it may will not solve anything, but how about making its space free again
or trimming the dirty space to a legal valid. I think loss of some data is much more
acceptable than making the system stop working.

>> We have checked ubifs_change_lp() and found it doesn't check whether or not
>> the new free space or dirty space is less the leb_size, and we will add these
>> checks during reproduction first.
>>
>> So any direction or suggestion for the reproduction & the solution ?
> 
> If you are using xattrs, please give the attached patch series a try.
> This is my current work.
> 
> Patchs 1/4 and 2/4 fix the xattr problem. 3/4 and 4/4 enforce new rules
> for xattrs. Before that, UBIFS supported up to 2^16 xattrs per inode and tried
> to be smart. It assumed that upon journal replay it can lookup the position of
> all xattr inodes from the TNC. Since these TNC entries can get garbage collected
> in the mean while, it fails to find them and the free-space accounting (LPT)
> goes nuts.
> 
I found another fix related with xattr and journal replay: 1cb51a15b576
"ubifs: Fix journal replay wrt. xattr nodes". It seems that both this fix
and your new patches are fixing the same problem, right ?

I still don't understand how the free-space accounting is influenced by
the GC-ed index nodes, could you elaborate on the procedure ?

> One solution is to insert xattr inodes also to the journal.
> Hence the number of xattrs is now stricter limited.
> On a typical NAND still more than 100...
> I plan also to add a new xattr-deltion-inode to support deleting xattr inodes
> in bulk, but this needs changes to the on-disk format.
>Yes, it will a write-incompatible fix, but can we make the old kernel mounts
the new images as read-only ?

> One open question is, what to do with UBIFS filesystem which have already more xattrs
> per inode than the new limit allows?
Maybe the user can be instructed to use a user-space utility to remove these extra xattrs ?

> I tend to claim that nobody runs such an UBIFS for a single reason, such an user
> would face the xattrs bug much more likely and lose all his data.  
> Filesystems like ext4 also support not that many xattrs.
> 
> Thanks,
> //richard
> 
