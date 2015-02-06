Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJmb0-0003WE-N4
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 17:21:35 +0000
Message-ID: <1423243270.8637.574.camel@sauron.fi.intel.com>
Subject: Re: [RFC] UBIFS recovery
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: shengyong <shengyong1@huawei.com>
Date: Fri, 06 Feb 2015 19:21:10 +0200
In-Reply-To: <54D36B71.7070008@huawei.com>
References: <54D33C36.9060805@huawei.com> <54D36B71.7070008@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-02-05 at 21:09 +0800, shengyong wrote:
> No matter how fs is recovered, data is corrupted. For the default recovery
> machanism, the recovery just drops the last node, and the lost data can be
> limited in the mininum range. For other situations, like data corrupted in
> the middle of log area, it may be hard to figure out which nodes should be
> droped. So we'd prefer to roll the whole fs back to the last checkpoint,
> rather than losing all data.

So are you focused on log corruptions only? Why is this case important
for you?

> Here is a simple recovery procedure, something could be easily missed in the
> procedure:
> 1. if the default recovery fails, we start to roll the whole filesystem
>    back to the last checkpoint.

Lets use word "commit" instead, just for clarity.

> 2. scan all buds already in replay_buds list, if last commit in the bud starts
>    from the begining of the LEB, then all nodes in the bud are new, and we
>    unmap it; if last commit starts in the middle of the bud, we leb_change the
>    bud, keep old nodes and drop new nodes.

I do not really understand this. A bud is an ucommitted LEB, the journal
consists of buds. The log contains references to the buds, plus commit
start/end nodes.

Also, do you realize that if I fsync() a file, it does not mean a
commit, it just means write all data to the journal.

Do you suggest to just erase the entire journal LEBs which contain
pieces of a file I fsync()'ed?

We really need to step back, think, and come with a good English
description of the specific problem we are trying to solve here.


> BTW, the current ubifs will update master node when mounting, no matter whether
> the mount succeeds or fails. So if need_recovery is detected, the master node
> should not be updated.

This sounds like a bug!
