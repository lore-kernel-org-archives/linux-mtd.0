Received: from nabagan.bluegap.ch ([88.198.58.248])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jykza-0005Sl-Uq
	for linux-mtd@lists.infradead.org; Wed, 21 May 2008 09:52:19 +0000
Message-ID: <4833F0CE.5010506@bluegap.ch>
Date: Wed, 21 May 2008 11:52:14 +0200
From: Markus Schiltknecht <markus@bluegap.ch>
MIME-Version: 1.0
To: "=?UTF-8?B?SsO2cm4gRW5nZWw=?=" <joern@logfs.org>
Subject: Re: curious questions
References: <4833E87D.10209@bluegap.ch> <20080521093827.GB20358@logfs.org>
In-Reply-To: <20080521093827.GB20358@logfs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

thanks for your quick answer!

Jörn Engel wrote:
> You can erase no less than one erase-block.  For NAND, you cannot easily
> write less than one page.  Sometimes subpage writes work, sometimes they
> don't, they have strange limitations and are best ignored in the
> beginning.

So, with mtd, I can erase the erase-block spanning pages 0 to 63, and 
then, write to page 0, wait for more data and only then write page 1, right?

>> Can I repeatedly write to a NAND flash page, to set its bits to 1 
>> (without resetting any bit to 0) (or vice-versa for XOR)?
> 
> Erase sets bits to 1, writes sets them to 0.

Ah, that applies to NAND as well as NOR, good.

> With old NOR flashes, you can repeatedly write the same area to flip
> single bits.  Writes with all 1's are essentially noops, so to set a
> single bit write a word will all but one bit set to 1.  With ECC you'd
> have to flip bits on the ECC backwards, which doesn't work.  NAND has
> ECC, so ordinarily this trick won't work.

Yeah, ECC certainly wouldn't work for that. Good explanation, thanks.

Markus
