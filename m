Received: from yx-out-1718.google.com ([74.125.44.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWNFk-0002c0-O1
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 03:23:57 +0000
Received: by yx-out-1718.google.com with SMTP id 3so181763yxi.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 20:23:56 -0700 (PDT)
Message-ID: <6934efce0808212023x758babf0w500da6801bd66f45@mail.gmail.com>
Date: Thu, 21 Aug 2008 20:23:55 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Phillip Lougher" <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
In-Reply-To: <48AE22F5.3000309@lougher.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00F0.5030403@gmail.com> <200808211417.14425.arnd@arndb.de>
	<48AE22F5.3000309@lougher.demon.co.uk>
Cc: cotte@de.ibm.com, Arnd Bergmann <arnd@arndb.de>,
	linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Squashfs has much larger block sizes than cramfs (last time I looked it was
> limited to 4K blocks), and it compresses the metadata which helps to get
> better compression.  But tail merging (fragments in Squashfs terminology) is
> obviously a major reason why Squashfs gets good compression.
>
> The AXFS code is rather obscure but it doesn't look to me that it does tail
> merging.  The following code wouldn't work if the block in question was a
> tail contained in a larger block.  It assumes the block extends to the end
> of the compressed block (cblk_size - cnode_offset).

A c_block is the unit that gets compressed.  It can contain multiple
c_nodes.  The c_block can be PAGE_SIZE to 4GB in size, in theory :)
The c_nodes can be 1B to PAGE_SIZE. in any alignment.  I pack many
tails as c_nodes in a c_block.

>>> +               max_len = cblk_size - cnode_offset;
>>> +               len = max_len > PAGE_CACHE_SIZE ? PAGE_CACHE_SIZE :
>>> max_len;
>>> +               src = (void *)((unsigned long)cblk0 + cnode_offset);
>>> +               memcpy(pgdata, src, len);
>
> Perhaps the AXFS authors could clarify this?

The memcpy in question copies a c_node to the page.  The len is either
the max length of a c_node and size of the buffer I'm copying to
(PAGE_CACHE_SIZE) or it is the difference between the beginning of the
c_node in the c_block and the end of the c_block, whichever is
smaller.  The confusion is probably because of the fact that this
copies extra crap to the page for tails.
