Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JykmJ-0004BY-Vr
	for linux-mtd@lists.infradead.org; Wed, 21 May 2008 09:38:36 +0000
Date: Wed, 21 May 2008 11:38:27 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Markus Schiltknecht <markus@bluegap.ch>
Subject: Re: curious questions
Message-ID: <20080521093827.GB20358@logfs.org>
References: <4833E87D.10209@bluegap.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4833E87D.10209@bluegap.ch>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 May 2008 11:16:45 +0200, Markus Schiltknecht wrote:
> 
> Am I understanding correctly, that I can't write to the a single page 
> with MTD (after having erased the according erase-block)? Even if I'm 
> writing the single pages in the block sequentially?

You can erase no less than one erase-block.  For NAND, you cannot easily
write less than one page.  Sometimes subpage writes work, sometimes they
don't, they have strange limitations and are best ignored in the
beginning.

> Can I repeatedly write to a NAND flash page, to set its bits to 1 
> (without resetting any bit to 0) (or vice-versa for XOR)?

Erase sets bits to 1, writes sets them to 0.

With old NOR flashes, you can repeatedly write the same area to flip
single bits.  Writes with all 1's are essentially noops, so to set a
single bit write a word will all but one bit set to 1.  With ECC you'd
have to flip bits on the ECC backwards, which doesn't work.  NAND has
ECC, so ordinarily this trick won't work.

Theoretically you could still use it, since ECC can be done in software
- using any algorithm you like including none.  But practically many
chips seem to misbehave if you violate the spec and repeatedly write to
the same area.  So don't.

Jörn

-- 
People will accept your ideas much more readily if you tell them
that Benjamin Franklin said it first.
-- unknown
