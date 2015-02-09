Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKmN2-0002jD-AZ
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 11:19:16 +0000
Message-ID: <1423480731.2573.40.camel@sauron.fi.intel.com>
Subject: Re: [RFC] UBIFS recovery
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Mon, 09 Feb 2015 13:18:51 +0200
In-Reply-To: <54D88E31.10402@huawei.com>
References: <54D33C36.9060805@huawei.com>
 <1423242166.8637.566.camel@sauron.fi.intel.com>
 <54D81C9B.8070500@huawei.com>
 <1423468308.2573.4.camel@sauron.fi.intel.com> <54D86858.2070705@nod.at>
 <54D88E31.10402@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
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

On Mon, 2015-02-09 at 18:38 +0800, hujianyang wrote:
> I think mount R/O is a good beginning. We don't need consider much about how
> to recover but can provide a usable(in some cases) file-system. And a R/O
> mount means we could do some cleanup to revert to this R/O state. This R/O
> mount should be provided by driver itself without any userspace tools.

I guess if we decompose the problem this way it will also be helpful (to
you and the readers).

1. There are types of corruptions when UBIFS mounts the file-system just
fine. For example, a committed data node is currupted. You will only
notice this when you read the corresponding file, and this is the point
when the file-system becomes read-only.


2. There are types of corruptions when UBIFS refuses to mount. These are
related to the replay process. Whenever there is a corrupted node which
does not look like a result of power-cut, UBIFS refuses to mount.


It appears to me that you are after nailing down the problem #2. You
want UBIFS to still mount the FS, and stay R/O. Is this correct?


I would like you to consider problem #1 too. Consider cases like: a data
node is corrupted, an inode is corrupted (both directory and
non-directory), a dentry is corrupted, an index node is corrupted, an
LPT are is corrupted.

What happens in each of these cases? Are you OK with that or you'd like
to change that? What the product team does in these cases?

You do not have to answer these questions in this e-mail. You can, but
these are mostly for you, so that you see the bigger picture.


Now, regarding problem #2.


There are multiple cases here too: master nodes are corrupted, a
corruption in the log, and corruption in the journal (buds), a
corruption in the LPT area, a corruption in the index.

I'd like you to think about all these cases. Again, just for yourself,
to understand the broader picture.


It looks like you are focusing on corruptions in buds, right? Is it
because this is the most probable situation, or is this something which
show problems in the field/testing?


You suggest that in case of a corrupted bud, you just try to go back to
the previous commited state.


This sounds rational to me. As I described, though, the problem is that
'fsync()' does not mean 'commit'. So what this means is that, say, mysql
fsync()'s its database, and believes it is now on the media. But then
there is a problem in the journal, in some LEB which is not related to
the fsync()'ed mysql database at all, and you drop the database changes.


So the better thing to do is to try dropping just the corrupted nodes,
not the entire journal. It does not sound too hard - you just keep
scanning and skip corrupted nodes. Replay as usual. Just mark the FS as
R/O if corruptions were not power-cut-related.
