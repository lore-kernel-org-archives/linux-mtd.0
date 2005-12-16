Received: from allen.werkleitz.de ([80.190.251.108])
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EnJMT-0007Ve-Kx
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2005 17:27:18 +0000
Received: from p54bea8c6.dip0.t-ipconnect.de ([84.190.168.198] helo=void.local)
	by allen.werkleitz.de with esmtpsa
	(TLS-1.0:DHE_RSA_3DES_EDE_CBC_SHA1:24) (Exim 4.60)
	(envelope-from <js@linuxtv.org>) id 1EnJMC-0000OD-Fv
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2005 18:27:05 +0100
Received: from js by void.local with local (Exim 3.35 #1 (Debian))
	id 1EnJMA-0002iG-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Dec 2005 18:26:58 +0100
Date: Fri, 16 Dec 2005 18:26:58 +0100
From: Johannes Stezenbach <js@linuxtv.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20051216172658.GB6953@linuxtv.org>
References: <20051214153740.GB10310@linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20051214153740.GB10310@linuxtv.org>
Subject: Re: padding in mkfs.jffs2 and nandwrite
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 14, 2005, Johannes Stezenbach wrote:
> I've prepared a jffs2 image with mkfs.jffs2 and written it to
> NAND flash using nandwrite (details below). When the file system
> is mounted r/w and written to, on future mounts the following
> warning appears:
> 
> 	Empty flash at 0x000000f8 ends at 0x00000200
> 
> This is caused by the padding added by either mkfs.jffs2 -p512
> or nandwrite -p, because this padding is 0xff, which jffs2
> sees as "free space which was wasted" (when jffs2 flushes
> a page to disk it pads with 0x00, so it can tell that this space
> was deliberately left unused).
> (I think this warning will evetually go away when the block is garbage
> collected, but this can take a loooong time.)
> 
> To avoid this warning I would like to suggest that we either
> change mkfs.jffs2 and nandwrite to pad with 0x00, or add
> an option to both to choose the padding value.
> 
> One additional question: Why does mkfs.jffs2 -p by default
> pad to the end of the erase block? When whole pages are written
> with all 0xff, but the first N pages of an erase block contain
> valid nodes, jffs2 will assume that these pages are freshly
> erased and good to write in.
> Won't this cause instable bits when written again by jffs2?
> (The data sheet for my flash says that there may be up to
> three partial page write before erase is needed, but I'm not sure
> if this allows to write the same byte twice.)
> 
> What I currently do to avoid the issue:
> 
> $ mkfs.jffs2 -v -e16384 -d foo -b -n -q | dd bs=512 conv=sync >foo.jffs2
> $ flash_eraseall -j /dev/mtd0
> $ nandwrite /dev/mtd0 foo.jffs2

Would someone be so kind and comment on this?

Why is padding handled differently in fs/jffs2/ and mkfs.jffs2?
Is it a bug?

Greetings,
Johannes
