Received: from smtp13.mail.yahoo.co.jp ([211.14.15.236])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19JFvv-0000fK-AN
	for <linux-mtd@lists.infradead.org>; Fri, 23 May 2003 18:02:19 +0100
Message-ID: <004101c3214d$223c9560$740486da@w0a3t0>
From: "matsunaga" <matsunaga_kazuhisa@yahoo.co.jp>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <001101c32078$7de79840$740486da@w0a3t0>
	<20030522195708.GB11240@wohnheim.fh-wedel.de>
Date: Sat, 24 May 2003 02:02:46 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

----- Original Message ----- 
From: "Jörn Engel" <joern@wohnheim.fh-wedel.de>
To: "matsunaga" <matsunaga_kazuhisa@yahoo.co.jp>
Cc: <linux-mtd@lists.infradead.org>
Sent: Friday, May 23, 2003 4:57 AM
Subject: Re: vmalloc for zlib workspace

> Great idea!
>
> How about:
>
> static void deflate_workspace[WORKSPACESIZE];
> static void inflate_workspace[WORKSPACESIZE];
>
> int __init jffs2_zlib_init(void)
> {
> if (WORKSPACESIZE < zlib_deflate_workspacesize())
> BUG();
> if (WORKSPACESIZE < zlib_inflate_workspacesize())
> BUG();
> return 0;
> }

That's great idea too ;-)
We only have to check the size in init routine.

> In a second patch, it would be possible to fold those two workspaces
> into one and save a little memory as well.

I think it is better.

Matsunaga

__________________________________________________
Do You Yahoo!?
Yahoo! BB is Broadband by Yahoo!  http://bb.yahoo.co.jp/
