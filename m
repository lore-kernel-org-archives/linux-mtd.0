Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DxQ6t-0008CH-TZ
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 10:09:48 -0400
Date: Tue, 26 Jul 2005 16:08:47 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: havasi@infradead.org
Message-ID: <20050726140847.GD30656@wohnheim.fh-wedel.de>
References: <E1DxPLP-0004rN-Ld@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1DxPLP-0004rN-Ld@phoenix.infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/include/linux jffs2.h,1.35,1.36
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 26 July 2005 14:19:39 +0100, havasi@infradead.org wrote:
> 
> Update of /home/cvs/mtd/include/linux
> In directory phoenix.infradead.org:/tmp/cvs-serv18673
> 
> Modified Files:
> 	jffs2.h 
> Log Message:
> [jffs2] removing compressor lzo and lzari
> 
> Index: jffs2.h
> ===================================================================
> RCS file: /home/cvs/mtd/include/linux/jffs2.h,v
> retrieving revision 1.35
> retrieving revision 1.36
> diff -u -r1.35 -r1.36
> --- jffs2.h	24 Jul 2005 15:15:51 -0000	1.35
> +++ jffs2.h	26 Jul 2005 13:19:36 -0000	1.36
> @@ -43,8 +43,6 @@
>  #define JFFS2_COMPR_COPY	0x04
>  #define JFFS2_COMPR_DYNRUBIN	0x05
>  #define JFFS2_COMPR_ZLIB	0x06
> -#define JFFS2_COMPR_LZO         0x07
> -#define JFFS2_COMPR_LZARI       0x08
>  /* Compatibility flags. */
>  #define JFFS2_COMPAT_MASK 0xc000      /* What do to if an unknown nodetype is found */
>  #define JFFS2_NODE_ACCURATE 0x2000

This patch could cause problems.  We have to make sure 0x07 and 0x08
are never handed out for new compressors, one way or another.

Ferenc, can you add a comment that those numbers are reserved or
obsoleted?

Jörn

-- 
Optimizations always bust things, because all optimizations are, in
the long haul, a form of cheating, and cheaters eventually get caught.
-- Larry Wall 
