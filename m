Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DvCmy-0006y5-Cx
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2005 07:31:11 -0400
Date: Wed, 20 Jul 2005 13:30:49 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: ?? ???? <zhao_fusheng@hotmail.com>
Message-ID: <20050720113049.GD3890@wohnheim.fh-wedel.de>
References: <BAY17-F167D2FBC2A9CD84727C551E8D70@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F167D2FBC2A9CD84727C551E8D70@phx.gbl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: A problem in JFFS2 code about ECC'd NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 20 July 2005 16:28:09 +0800, ?? ???? wrote:
> 
> For ECC'd NOR flash, the clean marker is written by
> jffs2_flash_direct_writev() in jffs2_mark_erased_block().
> Then the first 16 bytes of first page is filled with
> clean marker. But wbuf know nothing about this 16 bytes.
> So subsequent jffs2_flash_writev() will have problem. In
> particular jffs2_flash_writev() will write the first page
> for the second time.
> Am I right? Or can this be confirmed by the JFFS2 developer?

This has been answered in irc already, but for the record...

ECC NOR requires writes in aligned multiples of 8 bytes.  The wbuf
size is 8 bytes only.  16 bytes, if written through the wbuf, would be
written directly to flash and leave the wbuf empty.  Writing them
directly, without wbuf, yields the same result, so current code is
safe.

Jörn

-- 
Audacity augments courage; hesitation, fear.
-- Publilius Syrus 
