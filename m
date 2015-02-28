Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRbtW-0003EV-UV
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 07:33:04 +0000
Message-ID: <54F16EC2.3070703@huawei.com>
Date: Sat, 28 Feb 2015 15:31:14 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Andreas Dilger <adilger@dilger.ca>, <dedekind1@gmail.com>
Subject: Re: UBIFS: Is it possible to get the compressed size of a file?
References: <trinity-a1228aa8-8eaa-4950-9c14-5d6b6db5f3d7-1418371801058@3capp-1and1-bs02>
 <, > <54912109.50505@huawei.com>
 <trinity-03861656-4f4e-47fd-bcc5-aa493202c0bd-1418900934280@3capp-1and1-bs05>
 <1422869610.8637.352.camel@sauron.fi.intel.com>
 <7B8DF06B-EBC8-4C85-AEEA-C2C6A52B8789@dilger.ca>
In-Reply-To: <7B8DF06B-EBC8-4C85-AEEA-C2C6A52B8789@dilger.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Linux Filesystem Development List <linux-fsdevel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.cz>,
 "markus.heininger@online.de" <markus.heininger@online.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem and Andreas,

I had worked on this feature for a few days. Now I meet some problems,
I want to discuss them with you and wish you could give me some advises.

On 2015/2/3 13:45, Andreas Dilger wrote:
> On Feb 2, 2015, at 2:33 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>>
>> Yes, no easy way, but I think implementing what you need is possible. I
>> do not have plans and time to work on this, but I can help by giving
>> advises and review.
>>
>> The question has 2 major parts.
>>
>> 1. The interface
>> 2. The implementation
>>
>> For the former, one need to carefully investigate if there is something
>> like this already implemented for other file-systems. I think btrfs may
>> have it. If it is, then UBIFS should use similar interface, probably.
>>
>> And whatever is the interface choice, it should be discussed in the
>> linux-fsdevel@vger.kernel.org mailing list, which I am CCing.
>

First, talking about the interface.

> One option that was discussed for btrfs was to use the first fe_reserved
> field for the FIEMAP ioctl struct fiemap_extent to fe_phys_length to
> hold the compressed size of each extent in the file.
>

I don't think fiemap is a good interface for UBIFS and for compressed
size reporting feature.

The contents of files in UBIFS are sorted into *ubifs_data_node* which
contains as much as UBIFS_BLOCK_SIZE(4096) bytes of data. A single file
may contain lots of data nodes and these data nodes may locate on flash
in order or in disorder because of out of place update.

An fiemap ioctl from userspace need lots of memory to store discontinuous
data mapping and copy these fiemap_extent may cost a lot of time.

> http://lwn.net/Articles/607552/
> http://thread.gmane.org/gmane.comp.file-systems.btrfs/37312
> 
> I'm not sure what happened to that patch series - I was looking forward
> to it landing, and it was in very good shape I think.
> 

Since the *fe_phys_length* of fiemap_extent is not import to mainline,
current fiemap can only report logical data length of an extent. Regret
to say, it's no use for getting the compressed size of a file in UBIFS.


Then, looking at the implement.

>>
>> a. 'struct ubifs_ino_node' has unused space, use it to add the
>> compressed size field.
>> b. maintain this field
>> c. this field will only be correct for the part of the file which are on
>> the media. The dirty data in the page cache has not yet been compressed,
>> so we do not know its compressed size yet.
>> e. when user asks for the compressed size, you have to sync the inode
>> first, in order to make sure the compressed size is correct.
>>
>> And the implementation should be backward-compatible. That is, if new
>> driver mounts the old media, you return something predicatable. I guess
>> uncompressed size could be it.
>>

I'm worry about power cut recovery of compressed size if we introduce it
into 'struct ubifs_ino_node'. We can't write a new metadata node after each
changing of data node. Dirty data may not change the logical size of a file,
but it must change the compressed size. How to keep the consistency between
real compressed size(amount of each data nodes) and the record in metadata
node?

In logic size case, we could solve this problem by block number, because the
size of each blocks are UBIFS_BLOCK_SIZE, each exist data node could tell
the logic size of a file. Actually we use this method to fix the logic size
of a file in recovery path. Since the physic size of each data node are not
equal, we couldn't get the physic size of a file by a single data node in
journal. And we couldn't record the total compressed size of a file in data
node because it doesn't have enough reserve space, we couldn't use the same
functionality for compressed size.

Since metadata node(ubifs_ino_node) and data node(ubifs_data_node) are stored
in different journals, I didn't find a easy way to keep consistency when a
power cut happen. Seems a rebuilding whole scan can not be avoid in this case.


So could we use a simply method? just a private ioctl which scan the tnc tree
and report the compressed size of a UBIFS file? I found an old patch for Btrfs,
but it is not import to mainline.

https://patchwork.kernel.org/patch/117782/

Since the files in UBIFS are not too large, maybe we could test if the cost of
time is acceptable for ordinary use case.

Further, for both fiemap or this private ioctl method, current tnc tree lookup
mechanism seems always copying the whole ubifs node, but only the header of a
node is used in this case. Do we have a way to only read part of a node from
tnc tree?

Thanks,
Hu
