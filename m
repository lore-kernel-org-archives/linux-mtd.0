From: David Woodhouse <dwmw2@infradead.org>
To: Ralph Siemsen <ralphs@netwinder.org>
In-Reply-To: <4433E9A1.1030807@netwinder.org>
References: <4433E9A1.1030807@netwinder.org>
Content-Type: text/plain
Date: Wed, 05 Apr 2006 17:27:48 +0100
Message-Id: <1144254468.6227.84.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: FAQ entry for loopback mounting
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-04-05 at 12:00 -0400, Ralph Siemsen wrote:
> Here the "128ki" is the erase block size.  Only "ki" is accepted, due to 
> bugs in the parsing code.  The code understands "M" and "G" but will 
> barf on subsequent arguments.  You cannot add the logical-seeming "B", 
> for example, "128kiB" is not accepted.  If you use no letters, then the 
> value is interpreted in BYTES (unlike the mtdram which assumes kiB).

You probably wouldn't want 'M' or 'G' on their own, because those would
be multiples of ten, and unlikely to be useful in this context. Making
it accept (and ignore) 'B' would perhaps be useful -- patches welcome.

-- 
dwmw2
