Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CyEvd-0007Rb-9Z
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2005 14:52:14 -0500
Date: Mon, 7 Feb 2005 20:52:09 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Matthew Cole <mcole@ati.com>
Message-ID: <20050207195209.GC25504@wohnheim.fh-wedel.de>
References: <54CC136E5398384485619BC34B3A0F0B055D0DB0@ma00exh02.atitech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54CC136E5398384485619BC34B3A0F0B055D0DB0@ma00exh02.atitech.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Follow-up to wearing / caching question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 7 February 2005 13:51:22 -0500, Matthew Cole wrote:
> 
> The question posed by Martin Neilsen leads me to write in search of an
> answer that I've been pondering for a few days.  I've been tasked with
> approximating the lifespan of the flash (JFFS2) filesystem embedded in our
> products.  Is there a best method for calculating the space required for a
> fixed-size file over a given lifespan?  If we want our flash filesystem to
> be available for an approximate lifespan of 20 years, given the
> wear-leveling duty-cycle of JFFS2, and an average block endurance of 100k
> write/erase cycles, would I need 150% of the file's size? 200%? 1000%?  The
> worst-case answer should be acceptable, but obviously, the most-realistic
> case is what we're aiming for.  The actual read/write duty cycle of the
> application is quite variable, so that adds some complexity to the problem,
> but a good guess for now would be that it writes the entire file out to
> flash once a minute.  But as that is an independent variable, maybe someone
> could help me solve for that over a span of duty cycles?

Assuming non-compressable data and zero jffs2 overhead simplifies the
calculation.

In your scenario, you write the file every minute, over 20 years,
which is about 60x24x365x20 or 10M times.  You can only write any
individual address 100k times, so the flash would have to be 100x
bigger than your imaginary file.

Another way to look at it is an imaginary 1MiB flash.  You can write
it 100k times, for a total of 100GiB written to it.  With 600M seconds
in your expected 20 years, that gives you ~160 Bytes/s average write
speed.  Not very much.

Is that the calculation you were looking for?

Jörn

-- 
Homo Sapiens is a goal, not a description.
-- unknown
