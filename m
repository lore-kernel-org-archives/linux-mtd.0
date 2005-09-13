Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EF8If-0004gg-IH
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2005 06:46:53 -0400
Date: Tue, 13 Sep 2005 12:46:08 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050913104608.GA12808@wohnheim.fh-wedel.de>
References: <BAY17-F5764D8A5D6C706B910F94E89C0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F5764D8A5D6C706B910F94E89C0@phx.gbl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Should we put jffs2_sum_marker into eraseblock_header?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 September 2005 18:39:33 +0800, zhao forrest wrote:
> 
> When writing the eraseblock_header patch, I found the current
> summary patch in MTD CVS place jffs2_sum_marker at the end of
> each erase block. Since jffs2_sum_marker is a per-eraseblock
> structure, should we put it into eraseblock_header when the
> eraseblock_header patch is ready in the future?

Only if we can integrate the crystal ball into JFFS2.  Without knowing
what data will be written into the erase block, it's pretty hard to
write the summary ahead of time. ;)

Jörn

-- 
Schrödinger's cat is <BLINK>not</BLINK> dead.
-- Illiad
