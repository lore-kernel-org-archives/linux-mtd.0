Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1clI-0003Qa-5z
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 15:13:09 +0000
Message-ID: <5492EEEA.7090501@nod.at>
Date: Thu, 18 Dec 2014 16:12:42 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dolev Raviv <draviv@codeaurora.org>
Subject: Re: Synchronization in UBIFS (zero length files)
References: <5492918F.2060704@codeaurora.org> <5492B6B8.5010705@nod.at>
 <5492EA79.7070107@codeaurora.org>
In-Reply-To: <5492EA79.7070107@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tanya,

Am 18.12.2014 um 15:53 schrieb Tanya Brokhman:
> Hi Richard,
> 
> On 12/18/2014 1:12 PM, Richard Weinberger wrote:
>> Tanya,
>>
>> Am 18.12.2014 um 09:34 schrieb Tanya Brokhman:
>>> Hi Artem/Richard
>>>
>>> I've been looking into the "zero length files" issue in UBIFS and came across "Synchronization exceptions for buggy applications" @
>>> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_sync_semantics. This section concludes with:
>>>
>>> "We have plans to implement these features in UBIFS, but this has not been done yet. The problem is that UBI/MTD are fully synchronous and we cannot initiate asynchronous
>>> write-out, so we'd have to synchronously write files on close/rename, which is slow. So implementing these features would require implementing asynchronous I/O in UBI, which is a
>>> big job. But feel free to do this :-)."
>>>
>>> So two questions:
>>> 1. was anything done in ubifs to handle file truncation and rename similar to ext4? Didn't find anything but afraid I might be missing something
>>
>> I don't think so.
>>
>>> 2. Not sure I understand why "implementing these features would require implementing asynchronous I/O in UBI". Could you please elaborate on this?
>>
>> If we'd do it synchronous it would horrible slow down UBIFS. That's why ext4 is doing it async.
> 
> Regarding EXT4. In Theodore Tso article about this (http://thunk.org/tytso/blog/2009/03/12/delayed-allocation-and-the-zero-length-file-problem/) he mentioned 3 ext4 patches that
> are handling this issue but I can't find them by their git id:
> "These three patches (with git id’s bf1b69c0, f32b730a, and 8411e347) will cause a file to have any delayed allocation blocks to be allocated immediately when a file is replaced."
> Are you familiar with the patches in question?

Nope.

>> Having async IO for UBI is not trivial. Especially because of powercut safety.
> 
> Is it even doable? It seems to me that if we add async functionality to ubi it will become not power-cut tolerant, unless we implement a journal there (really don't want to do
> that....)

In software you can do everything but I fear it will be messy.

> Another idea: from what I've read on the subject so far (this is new to me so be patient), zero-length files can result due to several use cases one of them is renaming files in
> the following scheme:
> 1. write to temp file A - written to cache
> 2. rename A to B - written directly to disk
> 3. eventually data is flashed to disk
> If power cut occurs between #2 and #3 we end up with empty file B. But what if we call fdatasync on A as part of the rename operation?
> More specifically: I'm looking @ fs/ubifs/dir.c-ubifs_rename(). What if we force sync of old_inode by:
> 1. err = old_inode->i_sb->s_op->write_inode(old_inode, NULL);
> 2. err = ubifs_sync_wbufs_by_inode(c, old_inode);
> If I understand the code correctly it is basically the same as adding fsync() in userspace after #2 above.
> 
> What do you think?

Let's wait what Artem says.
I bet here are more dragons. :)

Thanks,
//richard
