Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJYEI-00087D-Fo
	for linux-mtd@lists.infradead.org; Sun, 25 Sep 2005 11:15:53 -0400
Date: Sun, 25 Sep 2005 17:15:50 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Peter Menzebach <pm-mtd@mw-itcon.de>
Message-ID: <20050925151550.GE28978@wohnheim.fh-wedel.de>
References: <4333D014.8000809@mw-itcon.de> <4333D37A.1020900@yandex.ru>
	<4333E759.8000804@mw-itcon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4333E759.8000804@mw-itcon.de>
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Minimum/optimal sector_size for jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 September 2005 13:30:33 +0200, Peter Menzebach wrote:
>
> I was not precise in terms. When I talked about erasesize, I mean 
> mtd_info.erasesize.
> 
> As far as I see in the code, for jffs2 the erase vloack size (used by 
> jeb) is jffs2_sb_info.sector_size.

Hmm.  "sector_size" is a confusing name.  It reminds people of a disk
sector, which is semantically similar to the writesize (or pagesize,
if NAND people prefer).  But JFFS2 uses sector_size as erasesize.

Oh well, just another one.

Jörn

-- 
Don't patch bad code, rewrite it.
-- Kernigham and Pike, according to Rusty
