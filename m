Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IwBD-0000or-Cv
	for <linux-mtd@lists.infradead.org>; Thu, 22 May 2003 20:56:47 +0100
Date: Thu, 22 May 2003 21:57:08 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
Message-ID: <20030522195708.GB11240@wohnheim.fh-wedel.de>
References: <001101c32078$7de79840$740486da@w0a3t0>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001101c32078$7de79840$740486da@w0a3t0>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

On Fri, 23 May 2003 00:40:37 +0900, matsunaga wrote:
> 
> In the jffs2_zlib_init() function of fs/jffs2/comr_zlib.c. 
> workspace is aquired by vmalloc.
> 
> But it could be allocated by static variable, like;
> 
> static char dbuf[WORKSPACESIZE];
> 
> int __init jffs2_zlib_init(void)
> {
>         def_strm.workspace = dbuf;
> 
> Care should be taken as to the workspace size, but it is old refined library and it would hardly be changed.
> It would reduce TLB load and improve performance (a little).

Great idea!

How about:

static void deflate_workspace[WORKSPACESIZE];
static void inflate_workspace[WORKSPACESIZE];

int __init jffs2_zlib_init(void)
{
	if (WORKSPACESIZE < zlib_deflate_workspacesize())
		BUG();
	if (WORKSPACESIZE < zlib_inflate_workspacesize())
		BUG();
	return 0;
}

In a second patch, it would be possible to fold those two workspaces
into one and save a little memory as well.

Jörn

-- 
They laughed at Galileo.  They laughed at Copernicus.  They laughed at
Columbus. But remember, they also laughed at Bozo the Clown.
-- unknown
