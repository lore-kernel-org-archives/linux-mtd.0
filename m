Received: from caramon.arm.linux.org.uk ([212.18.232.186])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Wisb-0002O0-Ir
	for <linux-mtd@lists.infradead.org>; Sun, 29 Jun 2003 21:34:33 +0100
Date: Sun, 29 Jun 2003 21:34:50 +0100
From: Russell King <rmk@arm.linux.org.uk>
To: David Woodhouse <dwmw2@redhat.com>
Message-ID: <20030629213450.B5653@flint.arm.linux.org.uk>
References: <20030623010031.E16537@flint.arm.linux.org.uk>
	<1056544988.24294.9.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1056544988.24294.9.camel@passion.cambridge.redhat.com>;
	from dwmw2@redhat.com on Wed, Jun 25, 2003 at 01:43:09PM +0100
Sender: Russell King <rmk@arm.linux.org.uk>
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
cc: Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix mtdblock / mtdpart / mtdconcat
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 25, 2003 at 01:43:09PM +0100, David Woodhouse wrote:
> On Mon, 2003-06-23 at 01:00, Russell King wrote:
> > Dirtily disable ECC support; it doesn't work when mtdpart is layered
> > on top of mtdconcat on top of CFI flash.
> > 
> > There is probably a better fix, but that's for someone else to find.
> 
> I had to run 'indent' on mtdconcat.c before I could stand to even look
> for it, so I haven't attached the patch here -- but could you try v1.6
> from CVS, which should refrain from pretending to have ecc/oob access
> functions of none of the subdevices have them, and hence fix the problem
> you observed.

While looking over the changes between 1.5 and 1.6, I spotted this.  You
may want to fix this change:

-                   concat->mtd.eccsize != subdev[i]->eccsize) {
+                   concat->mtd.eccsize != subdev[i]->eccsize ||
+                   !concat->mtd.read_ecc != !concat->mtd.read_ecc ||
+                   !concat->mtd.write_ecc != !concat->mtd.write_ecc ||
+                   !concat->mtd.read_oob != !concat->mtd.read_oob ||
+                   !concat->mtd.write_oob != !concat->mtd.write_oob) {

-- 
Russell King (rmk@arm.linux.org.uk)                The developer of ARM Linux
             http://www.arm.linux.org.uk/personal/aboutme.html
