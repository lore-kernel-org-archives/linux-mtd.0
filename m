Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IuNw-0000QY-9J
	for <linux-mtd@lists.infradead.org>; Thu, 22 May 2003 19:01:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
In-Reply-To: <001101c32078$7de79840$740486da@w0a3t0>
References: <001101c32078$7de79840$740486da@w0a3t0>
Message-Id: <1053626518.21582.460.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 22 May 2003 19:01:59 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: vmalloc for zlib workspace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-05-22 at 16:40, matsunaga wrote:
> In the jffs2_zlib_init() function of fs/jffs2/comr_zlib.c. 
> workspace is aquired by vmalloc.
> But it could be allocated by static variable, like;
> 
> static char dbuf[WORKSPACESIZE];

Hmm. That's a useful idea. Care to benchmark it an show how _much_ it
improves performance in practice? Although I suppose there's no downside
to it so we might as well change it.

> P.S.2
> fs/jffs2/gc.c
> line 139
>      struct jffs2_inode_cache *ic;
> seems not necessary or the name should be changed.

Fixed; thanks.

-- 
dwmw2
