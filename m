Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKz7m-00071z-JX
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2004 09:06:33 -0400
Message-ID: <4179009D.8010409@oktetlabs.ru>
Date: Fri, 22 Oct 2004 16:44:13 +0400
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <41767593.9030004@inf.u-szeged.hu>	<1098365059.13633.1257.camel@hades.cambridge.redhat.com>
	<41781683.3020602@inf.u-szeged.hu>
In-Reply-To: <41781683.3020602@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
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

At first, please, let me describe your design shortly to be sure I 
understand it and we both thinking the same way.

Essentially, your design is based on the fact that you do not want to 
refer directory entries in the summary nodes. Motivation that you will 
keep almost the copy of direntries in the summary, thus:
1. duplicating too many information.
2. you suppose there will not be the mount speed acceleration.

So, for this purpose you are going to distribute the inode nodes and 
other (including direntry nodes) by different blocks. Those blocks, who 
contain only the inode nodes, will have summaries, other blocks - will not.

I think this is not the best solution. Why? In general, because I do not 
like the following:
A. Your idea to distribute inode nodes and other nodes between different 
blocks.
B. Your assumption that the directory information in summaries will not 
affect the mount time.

The following are reasons concerning the item A.

1. Your change will affect JFFS2 very heavily. You will introduce 
restriction into JFFS2. Another improvements may not work with such 
restriction. Now all the blocks are equivalent. But you want to 
distinguish between two kins of blocks. Don't you think it is too 
complicated decision?

2. Think about the wear-leveling. In JFFS it was ideal. In JFFS2 it is 
good, but not so ideal. I average, the inode nodes are changed more 
often (just think about FIFOs, we told about them in this list 
recently). So, you will need to Garbage Collect the NODE_ONLY blocks 
more often. So, I afraid the wear-leveling will suffer from your 
improvement.

3. Imagine the file system with *lots* of very small files. I this case, 
  the direntries portion on the media will be large enough. And the 
mount time of such file system will not be improved very well.

4. It seems for me you will need to increase the number of blocks which 
are reserved for the garbage collection (double ?). This is also minor 
drawback.

The following are reasons concerning the item B.

I believe that if we have directory references in summaries, this will 
increase the mount speed.

1. At first, we will store fewer data! We don't need to keep the common 
headers, CRCs and mctimes.
2. At the second, we may compress summary (direntries aren't compressed)!
3. And the third, on NAND there is difference between reading lots of 
different pages or few pages.

I propose the another design.

1. Keep direntry references in summaries too and hence, do not 
distinguish between blocks with inode nodes and direntries.
2. Compress summaries.

So, you will avoid a lot of problems related to teaching the GC 
distinguish between different blocks. This will be more natural. I 
believe, summaries must refer *any* node in block. This is more simple 
and clean design.

Why you do not like this?

I see only one potential problem: direntries may have long names (up to 
255 symbols). this may lead to large summaries.

But in this case we may do:
1. Improve the JFFS2 itself. Keep, say, only 20, characters in the 
full_dirent structure. Most of direntries will fit. For other, we will 
just read the flash.
2. We may not touch JFFS2, and keep only 20 characters in summaries. For 
other direntries, we may read them from flash (keeping theirs flash 
offsets instead of names).

Comments?

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
