Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CM1E3-0003ZV-Un
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2004 05:33:18 -0400
Message-ID: <417CC91D.6060002@inf.u-szeged.hu>
Date: Mon, 25 Oct 2004 11:36:29 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: dedekind@oktetlabs.ru, David Woodhouse <dwmw2@infradead.org>
References: <41767593.9030004@inf.u-szeged.hu>	<1098365059.13633.1257.camel@hades.cambridge.redhat.com>
	<41781683.3020602@inf.u-szeged.hu> <4179009D.8010409@oktetlabs.ru>
In-Reply-To: <4179009D.8010409@oktetlabs.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
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

> So, for this purpose you are going to distribute the inode nodes and 
> other (including direntry nodes) by different blocks. Those blocks, who 
> contain only the inode nodes, will have summaries, other blocks - will not.

Yes, I think there are three kinds of nodes:
- type A contains relevant amount of data which is not needed at mount 
time (jffs2_raw_inode)
- type B is (almost) fully needed at mount time (jffs2_raw_dirent)
- type C is any other (unkown, developements in the future...)

To achieve as much mount time speed up as possible I think we should 
distinguish them.

Using summary the really relevant speed up will be only at node type
A. We can also generate summary for type B, but that (as you wrote) 
relevant ratio of the information will be duplicated.

So we whould like to intorduce two kinds of erase blocks:
- erase blocks with summary: it will store (now only) type A nodes, 
maybe later some of type B
- erase block without summary: it will store all of type C and B nodes 
which is not stored before

> 1. Your change will affect JFFS2 very heavily. You will introduce 
> restriction into JFFS2. Another improvements may not work with such 
> restriction. Now all the blocks are equivalent. But you want to 
> distinguish between two kins of blocks. Don't you think it is too 
> complicated decision?

What kind of restriction do you mean? We don't introduce any 
restrictions. The "type C" kind of nodes are processed as before, using 
the usual scanning method. If you what to force for every node to make 
their represenation in the summary, that whould be a restriction.

I think for some kinds of node summary is meaningful, and for some kinds 
not.

If we mix them that can be a very big slow down, if you what to process 
them only with making a reference in the summary to its offset, because 
if you (for example) what to read only 50 bytes (size of the node) you 
will have to read 512/2048 bytes depening on the flash. (where mostly 
there will be inode nodes which is not neccesery to read because that is 
int he summary)

But if all of this "not summarized, small" nodes are stored in a
"seperated" erase block than the this 512/2048 byte reading will not be 
unnecessary (because on the remaining 462-1998 bytes will store also 
relevant information, which is not in the summary).

> 2. Think about the wear-leveling. In JFFS it was ideal. In JFFS2 it is 
> good, but not so ideal. I average, the inode nodes are changed more 
> often (just think about FIFOs, we told about them in this list 
> recently). So, you will need to Garbage Collect the NODE_ONLY blocks 
> more often. So, I afraid the wear-leveling will suffer from your 
> improvement.

I think the GC solves it "automaticly". This mark 
(SUMMARIZED/NOT_SUMMARIZED) is not a premament thing, it is done "pseudo 
randomly".

I aggree that it cause some different behavior in wear-leveling but I 
don't think it makes it relevantly worse.

> 4. It seems for me you will need to increase the number of blocks which 
> are reserved for the garbage collection (double ?). This is also minor 
> drawback.

I don't understand what do you mean here.

> I believe that if we have directory references in summaries, this will 
> increase the mount speed.
> 1. At first, we will store fewer data! We don't need to keep the common 
> headers, CRCs and mctimes.
> 2. At the second, we may compress summary (direntries aren't compressed)!
> 3. And the third, on NAND there is difference between reading lots of 
> different pages or few pages.

Yes, we should try it - to store dirents in SUMMARIZED erase blocks. But 
it can be a improvement later, for first we need a well working stable 
system - and this is urgent for us now.

> 2. Compress summaries.

It makes harder to determine the optimal time of summary generation (it 
is easy to see the summary size, but here the compressed size of it the 
relevant). It can cause smaller image but may cause some slow down, too. 
We may introduce it later as an option.

So now we have two open discussion:
- is the SUMMARIZED / NOT_SUMMARIZED distiguishment good or not
- in the first version do we need dirents in the summary or not

Fortunatelly the effects (and side effects) of this improvements will be 
active only if the new kernel option is enabled, and don't kill any 
other future improvements.

I curious about (at least) David's optinion about these topics.

Bye,
Ferenc
