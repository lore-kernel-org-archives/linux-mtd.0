Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CM6jw-0004vD-Mq
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2004 11:26:35 -0400
Message-ID: <417D1C0C.7080709@inf.u-szeged.hu>
Date: Mon, 25 Oct 2004 17:30:20 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: dedekind@oktetlabs.ru
References: <41767593.9030004@inf.u-szeged.hu>	<1098365059.13633.1257.camel@hades.cambridge.redhat.com>
	<41781683.3020602@inf.u-szeged.hu> <4179009D.8010409@oktetlabs.ru>
	<417CC91D.6060002@inf.u-szeged.hu> <417CDBDD.1010004@oktetlabs.ru>
In-Reply-To: <417CDBDD.1010004@oktetlabs.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
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

>  > To achieve as much mount time speed up as possible I think we should
>  > distinguish them.
> This is what I really do not like.
> 
> Ok, let us discuss now only this topic. Lt I explain why I believe it is 
> vad and very *unnatural* to introduce two or more kinds of blocks.

You are right, it can be unnatural in point of the original design of 
the JFFS2. But I think in point of the connection of this optimization 
and JFFS2 it is more natural than simple store offsets in the summary, 
or copy all the information into it.

Our plan was modify wbuf (make a second one) and modify 
jffs2_reserve_space to select the right wbuf and generate summary. Never 
planded to introduce new clean_*, dirty_*, ... lists, thats really too 
difficult.


> 3. There is write buffer in the JFFS2 which is used in case of NAND. Are 
> you going to have two wbufs? This is also significant change.

Yes, we started to implement it yesterday and now agree. It is really 
not easy, and we don't write to rewrite the NAND handling part of JFFS2 
whithout a real NAND device. Maybe at the design of JFFS3 :)

So you convinced me. We will change the design of summary. The inodes 
and dirents will be also in the summary. All other nodes will be copied 
as itself into the summary and cause a warning. The summary support will 
be a required thing for new node types, too.

In the kernel we will have to modify
1. jffs2_scan_eraseblock(), as it is already in our patch
2. jeb struct to store generated the summary dinamically (one plus field)
3. jffs2_reserve_space(), which will have a new parameter (summary 
size), which can be JFFS2_SUMMARY_INODE_SIZE or 
JFFS2_SUMMARY_DIRENT_SIZE(namelen). It can decide when to generate 
summary and it can do this generation.
4. jffs2_flash_writev(), which is used to write info to flash. It can 
parse the node (similar to sumtool) and store the summary of it in its jeb.

If it works we'll check the effect of compressing the summary. (size and 
speed)

Comments?

Bye,
Ferenc

P.s.: Thanks for this good conversation.
