Received: from sa5.bezeqint.net ([192.115.104.19])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J1dKj-000219-3d
	for linux-mtd@lists.infradead.org; Mon, 10 Dec 2007 07:45:51 +0000
Message-ID: <475CEE2D.2030509@compulab.co.il>
Date: Mon, 10 Dec 2007 09:43:41 +0200
From: Mike Rapoport <mike@compulab.co.il>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Request for testing: AMD/Fujitsu flash chips
References: <1196443609.13978.53.camel@pmac.infradead.org>
In-Reply-To: <1196443609.13978.53.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



David Woodhouse wrote:
> For a long time, there's been confusion about the "unlock addresses" for
> AMD-compatible NOR flash -- the chip definition in our table have an
> _array_ giving the addresses at which we should do the magic unlock
> write cycles, according to the different modes (16-bit, 8-bit) that the
> chip could be used in.
> 
> For a while now, we've been deliberately ignoring all but the first
> entry in that array, on the basis that it shouldn't actually vary -- the
> chip needs the same levels on the same address lines, whatever mode it's
> in. The data sheets can be very confusing... for example:
> 
> 	5. The system should generate the following address patterns:
> 	    Word Mode: 555H or 2AAH to addresses A0 to A10
> 	    Byte Mode: AAAH or 555H to addresses A-1 to A10
> 
> I've just got rid of the array of unlock addresses, and _attempted_ to
> make the code cope and work again. I would very much appreciate some
> testing, before I put that in the MTD git tree:
> 
> 	git://git.infradead.org/~dwmw2/jedec-unlock.git
> 	http://git.infradead.org/?p=users/dwmw2/jedec-unlock.git

I've tested with Eon EN29SL800 (not in the main tree). Works Ok.


-- 
Sincerely yours,
Mike.
