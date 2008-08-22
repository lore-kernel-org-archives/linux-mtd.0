Received: from yw-out-1718.google.com ([74.125.46.157])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWNJX-00038j-O1
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 03:27:52 +0000
Received: by yw-out-1718.google.com with SMTP id 5so25286ywm.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 20:27:51 -0700 (PDT)
Message-ID: <6934efce0808212027q412c4cbbp6ea8673a7d3bc1b9@mail.gmail.com>
Date: Thu, 21 Aug 2008 20:27:50 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Phillip Lougher" <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
In-Reply-To: <48AE0697.5040706@lougher.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00F0.5030403@gmail.com> <48AE0697.5040706@lougher.demon.co.uk>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
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

> I assume compressed blocks can be larger than PAGE_CACHE_SIZE?  This suffers
> from the rather obvious inefficiency that you decompress a big block >
> PAGE_CACHE_SIZE, but only copy one PAGE_CACHE_SIZE page out of it.  If
> multiple files are being read simultaneously (a common occurrence), then
> each is going to replace your one cached uncompressed block
> (sbi->current_cnode_index), leading to decompressing the same blocks over
> and over again on sequential file access.
>
> readpage file A, index 1 -> decompress block X
> readpage file B, index 1 -> decompress block Y (replaces X)
> readpage file A, index 2 -> repeated decompress of block X (replaces Y)
> readpage file B, index 2 -> repeated decompress of block Y (replaces X)
>
> and so on.

Yep.  Been thinking about optimizing it.  So far it hasn't been an
issue for my customers.  Most fs traffic being on the XIP pages.  Once
I get a good automated performance test up we'll probably look into
something to improve this.
