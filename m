Received: from smtp10.mail.yahoo.co.jp ([211.14.15.31])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IsBb-0008IO-Kk
	for <linux-mtd@lists.infradead.org>; Thu, 22 May 2003 16:40:55 +0100
Message-ID: <001101c32078$7de79840$740486da@w0a3t0>
From: "matsunaga" <matsunaga_kazuhisa@yahoo.co.jp>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 23 May 2003 00:40:37 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Subject: vmalloc for zlib workspace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

In the jffs2_zlib_init() function of fs/jffs2/comr_zlib.c. 
workspace is aquired by vmalloc.

But it could be allocated by static variable, like;

static char dbuf[WORKSPACESIZE];

int __init jffs2_zlib_init(void)
{
        def_strm.workspace = dbuf;

Care should be taken as to the workspace size, but it is old refined library and it would hardly be changed.
It would reduce TLB load and improve performance (a little).

BR.

Matsunaga.

P.S.
GC thread BUG() (inode wrap around) seems to be fixed. Thanks.

P.S.2
fs/jffs2/gc.c
line 139
     struct jffs2_inode_cache *ic;
seems not necessary or the name should be changed.
__________________________________________________
Do You Yahoo!?
Yahoo! BB is Broadband by Yahoo!  http://bb.yahoo.co.jp/
