Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JsQM-0002Hl-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 10:03:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D0DA13D.70803@emsoftltd.com> 
References: <3D0DA13D.70803@emsoftltd.com>  <3D0D9DA9.6090404@emsoftltd.com> <3D0D981D.8040602@emsoftltd.com> <18852.1024302161@redhat.com> <19294.1024303310@redhat.com> 
To: Jason Chan <jason@emsoftltd.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bad Block management routine for MTD NandFlash driver? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Jun 2002 10:03:42 +0100
Message-ID: <19702.1024304622@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

jason@emsoftltd.com said:
>     Sorry, I don't fully understand your 2nd suggestion, 'translation
> layer' like the SmartMedia one. Is that means the smartmedia mtd
> driver already has bad block management? 

You need more than just bad block management. You need a complete file 
system, to give you wear levelling and reliable operation.

The 'mtdblock' driver is not meant for read/write use in normal
circumstances. When you write a sector to the 'mtdblock' device, it reads
the whole erase block from the flash, modifies the sector you wanted to
change, erases the flash erase block and writes back the modified data.

If you lose power or crash between the erase and the writeback, you lose a 
whole erase block of data, not just the sector you were overwriting. And 
there's no wear levelling -- so some blocks will be worn to the point of 
destruction while others still have plenty of life.

You must have some kind of file system on the flash, whether that's a real 
file system such as JFFS2 or a pseudo-filesystem like SmartMedia or NFTL 
which emulates a block device, on top of which you put a 'normal' file 
system.

We don't yet have an implementation of the SmartMedia translation layer in 
CVS, although I think someone _has_ implemented it. NFTL has patent issues 
so I wouldn't advise using that. In fact, emulating a block device is 
the wrong approach entirely -- it's no longer justifiable now that we're 
not using DOS, and you should probably be using JFFS2. 

JFFS2 recognises bad blocks during the medium scan at mount time, and 
does not keep a separate table of bad blocks. If this approach is 
insufficient, patches are welcome. 

--
dwmw2
