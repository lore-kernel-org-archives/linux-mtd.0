Received: from [61.155.106.76] (helo=www.mid-fun.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MdemC-00036P-0X
	for linux-mtd@lists.infradead.org; Wed, 19 Aug 2009 06:36:10 +0000
Subject: Re: about ubifs question
From: tommy <jiujin.hong@mid-fun.com>
To: dedekind@infradead.org
In-Reply-To: <1250658794.3885.1.camel@localhost>
References: <1250656786.11476.2.camel@tommy-desktop>
	<1250658794.3885.1.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2009 14:35:56 +0800
Message-Id: <1250663756.13486.4.camel@tommy-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,sir!

when i resume form suspend,i try to do following:

root@localhost:/# cp 1.ko 2.ko
root@localhost:/# sync
root@localhost:/# ls
UBIFS error (pid 1107): ubifs_read_node: bad node type (255 but expected
2)
UBIFS error (pid 1107): ubifs_read_node: bad node at LEB 502:7224
UBIFS error (pid 1107): ubifs_readdir: cannot find next direntry, error
-22
root@localhost:/# ls 
UBIFS error (pid 1108): ubifs_read_node: bad node type (255 but expected
2)
UBIFS error (pid 1108): ubifs_read_node: bad node at LEB 502:7224
UBIFS error (pid 1108): ubifs_readdir: cannot find next direntry, error
-22


can't access !

why ?
On 三, 2009-08-19 at 08:13 +0300, Artem Bityutskiy wrote:
> On Wed, 2009-08-19 at 12:39 +0800, tommy wrote:
> > about ubifs work under Kernel suspend and resume
> > 
> > When Kernel resume from suspend by apm -s ,
> > 
> > i touch file in nand flash and sync,but when Kernel restart ,my touched
> > file didn't occur!
> 
> How do you restart your kernel? Do you unmount cleanly?
> 
> > After Kernel resume ,i guess my touched file isn't in nand flash but
> > memory !
> 
> Try typing sync before restarting.
> 
