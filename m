Received: from ithilien.qualcomm.com ([129.46.51.59])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AC7Dm-0005D3-3T
	for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2003 01:51:31 +0100
Message-Id: <6.0.0.22.2.20031021173115.04768050@e2k.qualcomm.com>
Date: Tue, 21 Oct 2003 17:50:01 -0700
To: Nicolas Pitre <nico@cam.org>, linux-mtd@lists.infradead.org
From: Howard King <hking@qualcomm.com>
In-Reply-To: <Pine.LNX.4.44.0310031606230.29733-100000@xanadu.home>
References: <6.0.0.22.2.20031003125817.03ae9010@e2k.qualcomm.com>
 <Pine.LNX.4.44.0310031606230.29733-100000@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: Re: mtd support for 64-bit bus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At 01:08 PM 10/3/2003, you wrote:
>On Fri, 3 Oct 2003, Howard King wrote:
>
> > We have a customized board with 4 AMD 29L641V flash chips (4 * 8Mbyte) 
> with
> > 64-bit wide bus. The mtd driver in linux 2.4.18 kernel does not work for
> > this configuration.  Does anyone have similar experiences?  What is the
> > solution?  Thanks.
>
>Upgrade your MTD code to a more recent snapshot.
>
>
>Nicolas


I used the following commands which I found in the how-to question:

Follow the following steps:
1.Make sure that you are root.
2. cd /usr/src
3. cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs login
(password: anoncvs)
4. cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs co mtd
5. cd /usr/src/mtd/patches
6. sh patchin.sh -j /mykernel/kernel

== error message 1 ===
#fs/fs.o(.text+0x50eac): undefined reference to `zlib_compress'
#fs/fs.o(.text+0x50fac): undefined reference to `dynrubin_decompress'
#fs/fs.o(.text+0x50fc4): undefined reference to `zlib_decompress'

I found the zlib_.. and dynrubin_.. were added jffs2_.. prefix.  That is 
why it could not find those any more.  Since I want to use jffs2 so I 
include this flag. The -j flag is NOT in the how-to doc.  Will a newer 
kernel (2.4.20) work for this?


== error message 2 ==
#drivers/mtd/mtdlink.o(.text+0x1cc0): undefined reference to `__raw_readll'

Well, I did find that it missed raw_readll and raw_writell in 
include/linux/mtd/map.h.
Inside the map.h, it used raw_readll and raw_writell.
But I can't simply include cfi.h in map.h since cfi.h needs map.h 
definition too.
I need to add raw_readll and raw_writell definition in asm/io.h with 
raw_readl and raw_writel.
Isn't the patch supposed to work?  Did I miss something?
