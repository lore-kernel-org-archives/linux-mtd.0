Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CMOOB-0007Qn-Ey
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2004 06:17:17 -0400
Message-ID: <417E2518.4010007@inf.u-szeged.hu>
Date: Tue, 26 Oct 2004 12:21:12 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: dedekind@oktetlabs.ru
References: <41767593.9030004@inf.u-szeged.hu>	<1098365059.13633.1257.camel@hades.cambridge.redhat.com>	<41781683.3020602@inf.u-szeged.hu>
	<4179009D.8010409@oktetlabs.ru>	<417CC91D.6060002@inf.u-szeged.hu>
	<417CDBDD.1010004@oktetlabs.ru> <417D1C0C.7080709@inf.u-szeged.hu>
	<417E1FFF.7030902@oktetlabs.ru>
In-Reply-To: <417E1FFF.7030902@oktetlabs.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	jffs-dev@axis.com
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> IMHO, since the summary relates only to one block, the current block, it 
> is logical to refer the summary from the jffs2_sb_info, not from 
> jffs2_erase_blocks. It is also not very nice to store it in the 
> jffs2_erase_blocks since it will increase the size of array of JFFS2 
> blocks (c->blocks[]).

Is it sure than only one non-full erase block is in the filesystem? 
Non-full means here that there is some nodes already in that, but also 
there is some free space at the end of it.

>> 4. jffs2_flash_writev(), which is used to write info to flash. It can 
>> parse the node (similar to sumtool) and store the summary of it in its 
>> jeb.
> 
> May be write here... Didn't think a lot... May be as I wrote, in 
> jffs2_do_reserve_space()...

As I see jffs2_do_reserve space is called before inode/... allocation in 
most cases. So at that time the summary information is not know - but at 
writing it have to be known certainly.

> So, if there are few direntries in block, why not to store them in summary?

You may misunderstood me. In the previous letter I wrote: "So you 
convinced me. We will change the design of summary. The inodes and 
dirents will be also in the summary."

So now we do plan to store dirents in the summary. :)

> Did you measured the time of summary uncompress on your system? I can't 
> know for sure, but I suspect that if you have, say, 200MHz system, the 
> time of uncompression = o(time of block read)!

It depends on the compressor.

We will test it with zlib/rtime. I whould like to implement as an 
optional feature.

> There is one more issue: if there are too many direntries in block, 
> summary may become too large (the compression helps here). In this case 
> you may not write summary or don't mention direntries in summary.

Let see how it work, and after we can make it more optimal :)

Bye,
Ferenc
