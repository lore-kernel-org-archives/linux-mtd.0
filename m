From: dwmw2@infradead.org (David Woodhouse)
Date: 25 Mar 2003 12:51:06 +0000
Subject: not enough blocks for JFFS?
In-Reply-To: <20030325000503.GA14469@wohnheim.fh-wedel.de>
References: <3E7E6DE5.5000003@interepoch.com.tw>
 <1048483100.3593.3.camel@gobbles>
 <20030325000503.GA14469@wohnheim.fh-wedel.de>
Message-ID: <1048596666.12528.39.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, 2003-03-25 at 00:05, J??rn Engel wrote:
> But a filesystem is nicer than a quick user space implementation. :)
> 
> Today I have tweaked jffs2 a little to work without compression,
> depending on mount options. (patch will follow)

Hmmm. Why mount options and not take the path which was already sort-of
planned, which was to implement ioctl() and have a per-inode (and
inheritable for directories) set of flags, a la chattr?

> The nice effect of this is that you should be able to work with less
> reserved blocks. My estimate is somewhere between one and three. In
> Tims case, that would leave him with 16kB net space, enough for his
> data. Cool.

I'm not really convinced that the _compression_ makes much difference
here. You still get pages taking up more space when you GC them from a
single node to a pair of nodes because your new node would have crossed
an eraseblock boundary. OK, so the loss of compression efficiency makes
the resulting data payloads slightly larger _too_ but not by much, and
if you want formal proof of correctness you have to have accounted for
the expansion _anyway_.

Turning off compression because you don't have a lot of flash space
available seems rather bizarre to me :)

> Tim, would you volunteer to test patches?

TBH I'm not sure I want stuff that's just tested, I really want stuff
that is shown _mathematically_ to be correct in theory, although I do
tend to prefer if if that's backed up in practice of course :)

First I want to start using the REF_PRISTINE bits we already have to
write clean nodes to _different_ blocks, so we don't keep mixing old
data with new and we get to improve GC efficiency. Then I want to look
at eliminating all cases where the size of the data on the medium could
expand, except for the one where we have to split a GC'd node into two.
Then the amount of space we require for GC is basically calculable and
not too large.

-- 
dwmw2
