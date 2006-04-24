Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FY2fE-0004LV-LL
	for linux-mtd@lists.infradead.org; Mon, 24 Apr 2006 11:08:39 -0400
Date: Mon, 24 Apr 2006 17:07:41 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Nicolas Pitre <nico@cam.org>
Message-ID: <20060424150741.GB12370@wohnheim.fh-wedel.de>
References: <625fc13d0604240550x2bdcf5e0p179a25ae25483551@mail.gmail.com>
	<Pine.LNX.4.64.0604240932340.18520@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0604240932340.18520@localhost.localdomain>
Cc: Josh Boyer <jwboyer@gmail.com>,
	MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Sibley and wbuf fixups
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 24 April 2006 09:43:05 -0400, Nicolas Pitre wrote:
> 
> Sibley has two write modes.  "object" and "control" modes if I remember 
> the names correctly.  The mode that behaves like traditional NOR may 
> only use half the flash size since 16 out of 32 flash words are then 
> unusable (16 writable words are followed by 16 unusable words and so 
> on).
> 
> The other mode can use the full flash size but it must write a full 1KB 
> block at once and it can be written only once.  To be able to write 
> again you must erase the whole flash sector.
> 
> Therefore JFFS2 on Sibley currently uses the 1KB block write mode with 
> the help of CONFIG_JFFS2_FS_WRITEBUFFER.  This also means, 
> unfortunately, that the JFFS2 clean marker must waste a whole 1KB block 
> per erase sector.

Very interesting.  Thank you for the explanation.

Jörn

-- 
Happiness isn't having what you want, it's wanting what you have.
-- unknown
