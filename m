Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CsKwJ-0000Ll-Nv
	for linux-mtd@lists.infradead.org; Sat, 22 Jan 2005 08:04:36 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce050121144619d2899d@mail.gmail.com>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
	<6934efce050121144619d2899d@mail.gmail.com>
Content-Type: text/plain
Date: Sat, 22 Jan 2005 16:03:49 +0300
Message-Id: <1106399029.29388.50.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-01-21 at 14:46 -0800, Jared Hulbert wrote:
> New idea.
> 
> Why should we waste time compressing the uncompressable?  JFFS2
> actually spent alot of time compressing.
Jared, I belive you have opened very important subject. I'll try to
count drawback of compression in JFFS2:

1. In a lot of cases, as Jared said, yes, we "waste time to compress
uncompressable".

2. Worse, compression impacts JFFS2 design globally. You know, that the
maximum amount of data JFFS2 may store in one inode node is the size of
RAM page, most often 4K. 

Q: Why we restrict ourself with this size? 
A: Because of compression.

This is the only way to implement quick read operation: VFS talks with
JFFS2 in terms of RAM pages - it reads pages of data and writes pages of
data. So having one page of compressed data in one node we may
uncompress nodes data directly to the provided by VFS RAM page, without
excessive copy operations.

Let me count which consequences do we have with this:

2.1. We now have two flavors of inode nodes: pristine inode node and
non-pristine inode nodes. Pristine inode nodes are those nodes who has
4K of data. Non-pristine inode nodes are those who have fewer then 4K
data.

2.2. GC not only collects garbage, it has additional task - it merges
non-pristine nodes producing pristine nodes, thus optimizing future read
operations. This additional policy slows down and complicates the
Garbage Collector.

2.3. It is know fact that JFFS2 for each node on flash keeps one small
object in RAM. So, more nodes we have, more RAM memory we waste. The
amount of memory (called in-core memory) JFFS2 needs is linear function
of number of nodes on flash. So, with growing sizes of flash chips,
JFFS2's chances to alive decrease.

Simple estimations shows that if we have 1 GigaByte flash partition with
JFFS2, and we fulfill it with data, JFFS2 will eat:

~3 MB of RAM in the best and probably not reachable situation.
~ 5 - 10 MB of RAM if your filesystem has many small files, like Linux
root FS with many files /dev/, etc.

This is if you only mount JFFS2. If you start opening big files, you
need much more RAM.

So, the need to split our data on 4K portions, leads to more nodes on
flash which lead to more RAM needed.

2.4. JFFS2 compresses 4K portions independently, so in many cases the
compression will be not so good.

Imagine we have compressed .avi film. We split it on 4K portions and
compress these 4K peaces independently. Then we join 64-byte JFFS2
header to each of 4K portion. Result: we waste a lot of space since we
have redundant inode node headers on flash. We waste CPU trying to
compress data.

Of course, there are advantages of compression either.

My conclusion:
~~~~~~~~~~~~~
Have or not have compression is very important question and this should
be carefully analyzed.

> 
> I can think of a few possible mechanisms:
> a) extension based
>         -Don't compress files with .mpg, .jpg, .avi, .gz, etc.  User
> defined list?
I belive this is *not JFFS2's deal* to distinguish extensions. Worse,
this is not kernel's buisness. Xattr again, may help here. User may
disable or enable compression for any file.

> b) test first data
>          Compress the first X sized chunk of data to determine if the
> file is compressable.  Make  determination and write data.
This is already implemented in JFFS2. There is "size" compression mode.
See JFFS2's sections when configure kernel.

> c) test node by node
>           If the last node didn't compress, stop compressing file.
May be...


Just want to stress, that:

1. If we just put out compression, we will have many possibilities to
simplify and optimize JFFS3. This will impact the JFFS3 design.

2. If we make compression optional, we possibly should implement the
possibility to have more then 4K data in inodes for which compression is
disabled.
