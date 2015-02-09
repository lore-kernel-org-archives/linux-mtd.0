Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKn3f-0007iO-54
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 12:03:20 +0000
Message-ID: <54D8A1CC.10804@huawei.com>
Date: Mon, 9 Feb 2015 20:02:20 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [RFC] UBIFS recovery
References: <54D33C36.9060805@huawei.com>
 <1423242166.8637.566.camel@sauron.fi.intel.com> <54D81C9B.8070500@huawei.com>
 <1423468308.2573.4.camel@sauron.fi.intel.com> <54D86858.2070705@nod.at>
 <54D88E31.10402@huawei.com> <1423480731.2573.40.camel@sauron.fi.intel.com>
In-Reply-To: <1423480731.2573.40.camel@sauron.fi.intel.com>
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

On 2015/2/9 19:18, Artem Bityutskiy wrote:
> On Mon, 2015-02-09 at 18:38 +0800, hujianyang wrote:
>> I think mount R/O is a good beginning. We don't need consider much about how
>> to recover but can provide a usable(in some cases) file-system. And a R/O
>> mount means we could do some cleanup to revert to this R/O state. This R/O
>> mount should be provided by driver itself without any userspace tools.
> 
> I guess if we decompose the problem this way it will also be helpful (to
> you and the readers).
> 
> 1. There are types of corruptions when UBIFS mounts the file-system just
> fine. For example, a committed data node is currupted. You will only
> notice this when you read the corresponding file, and this is the point
> when the file-system becomes read-only.
> 
> 
> 2. There are types of corruptions when UBIFS refuses to mount. These are
> related to the replay process. Whenever there is a corrupted node which
> does not look like a result of power-cut, UBIFS refuses to mount.
> 
> 
> It appears to me that you are after nailing down the problem #2. You
> want UBIFS to still mount the FS, and stay R/O. Is this correct?
> 
> 
> I would like you to consider problem #1 too. Consider cases like: a data
> node is corrupted, an inode is corrupted (both directory and
> non-directory), a dentry is corrupted, an index node is corrupted, an
> LPT are is corrupted.
> 
> What happens in each of these cases? Are you OK with that or you'd like
> to change that? What the product team does in these cases?
> 

Er, it's a good view. I'm not sure about it, I'd like to talk with them
about it. But I think maybe they don't consider about this problem either.

I don't want to change current behavior. But maybe we could repair these
kinds of problems by a userspace tool or a repair mode in kernel in this
progress.

> You do not have to answer these questions in this e-mail. You can, but
> these are mostly for you, so that you see the bigger picture.
> 
> 
> Now, regarding problem #2.
> 
> 
> There are multiple cases here too: master nodes are corrupted, a
> corruption in the log, and corruption in the journal (buds), a
> corruption in the LPT area, a corruption in the index.
> 
> I'd like you to think about all these cases. Again, just for yourself,
> to understand the broader picture.
> 
> 
> It looks like you are focusing on corruptions in buds, right? Is it
> because this is the most probable situation, or is this something which
> show problems in the field/testing?
> 

No. It's because the buds corruptions come out in our environment, so we
firstly fix it in a rude way. It not means we just focus on this corruption
and we don't insist on our existing code. A better solution is welcomed.

> 
> You suggest that in case of a corrupted bud, you just try to go back to
> the previous commited state.
> 
> 
> This sounds rational to me. As I described, though, the problem is that
> 'fsync()' does not mean 'commit'. So what this means is that, say, mysql
> fsync()'s its database, and believes it is now on the media. But then
> there is a problem in the journal, in some LEB which is not related to
> the fsync()'ed mysql database at all, and you drop the database changes.
> 

Yes, you had explained on it. I'm considering it these days.

> 
> So the better thing to do is to try dropping just the corrupted nodes,
> not the entire journal. It does not sound too hard - you just keep
> scanning and skip corrupted nodes. Replay as usual. Just mark the FS as
> R/O if corruptions were not power-cut-related.
> 
> 

Mark R/O will not change anything on flash, write/flush are disallowed.

I'm thinking about snapshot, Do you think it's a acceptable solution?
Leaving any kinds of corruptions behind, directly keep a usable snapshot
and user could apply it if the current partition refuse to mount. I don't
want to make the discuss complex, just a new thought.

Come back to recovery, I really know it's a hard work as you described,
we should consider a lot. But we don't need to have a integrated plan at
begin, we could make our solution deal with corruptions step by step, and
make it a useful solution after days.

Thanks,
Hu
