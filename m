Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CMO7d-0007Fg-NC
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2004 06:00:13 -0400
Message-ID: <417E1FFF.7030902@oktetlabs.ru>
Date: Tue, 26 Oct 2004 13:59:27 +0400
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <41767593.9030004@inf.u-szeged.hu>	<1098365059.13633.1257.camel@hades.cambridge.redhat.com>	<41781683.3020602@inf.u-szeged.hu>
	<4179009D.8010409@oktetlabs.ru>	<417CC91D.6060002@inf.u-szeged.hu>
	<417CDBDD.1010004@oktetlabs.ru> <417D1C0C.7080709@inf.u-szeged.hu>
In-Reply-To: <417D1C0C.7080709@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	jffs-dev@axis.com
Subject: Re: JFFS2 mount time
Reply-To: dedekind@oktetlabs.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Ferenc,

Ferenc Havasi wrote:
> In the kernel we will have to modify
> 1. jffs2_scan_eraseblock(), as it is already in our patch
> 2. jeb struct to store generated the summary dinamically (one plus field)
IMHO, since the summary relates only to one block, the current block, it 
is logical to refer the summary from the jffs2_sb_info, not from 
jffs2_erase_blocks. It is also not very nice to store it in the 
jffs2_erase_blocks since it will increase the size of array of JFFS2 
blocks (c->blocks[]).

> 3. jffs2_reserve_space(), which will have a new parameter (summary 
> size), which can be JFFS2_SUMMARY_INODE_SIZE or 
> JFFS2_SUMMARY_DIRENT_SIZE(namelen). It can decide when to generate 
> summary and it can do this generation.
Yes, I also think so.

Currently the jffs2_do_reserve_space() do (as I understand):
1. If the current block (c->nextblock) have space and it is sufficient 
for request, it reserves it.
2. If the c->nextblock has fewer size, than requested, the c->nextblock 
is wasted, put to the correspondent list (dirty_list, etc), free block 
is taken and reserved.

Thus, the jffs2_do_reserve_space() should be improved to be able to save 
some space for summary. And, some function like jffs2_write_summary() 
which will be called before jffs2_do_reserve_space() takes new block 
from the free_list.

> 4. jffs2_flash_writev(), which is used to write info to flash. It can 
> parse the node (similar to sumtool) and store the summary of it in its jeb.
May be write here... Didn't think a lot... May be as I wrote, in 
jffs2_do_reserve_space()...

I also offer you to include direntries in summaries and compress them. See:

sizeof(struct jffs2_raw_dirent) = 40 (without name)
you will need to store in your summary only:

totlen
pino
version
ino
nsize
type
name

which is 24 bytes. You don't store all data! Of course, in case of long 
names things are not so good...

If you also compress them, they will be smaller (minus 50-70%)!

So, if there are few direntries in block, why not to store them in summary?

Did you measured the time of summary uncompress on your system? I can't 
know for sure, but I suspect that if you have, say, 200MHz system, the 
time of uncompression = o(time of block read)!

There is one more issue: if there are too many direntries in block, 
summary may become too large (the compression helps here). In this case 
you may not write summary or don't mention direntries in summary.

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
