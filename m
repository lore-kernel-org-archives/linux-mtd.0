Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Wrps-0003Mo-BQ
	for <linux-mtd@lists.infradead.org>; Mon, 30 Jun 2003 07:08:20 +0100
From: David Woodhouse <dwmw2@redhat.com>
To: Russell King <rmk@arm.linux.org.uk>
In-Reply-To: <20030629213450.B5653@flint.arm.linux.org.uk>
References: <20030623010031.E16537@flint.arm.linux.org.uk>
	 <1056544988.24294.9.camel@passion.cambridge.redhat.com>
	 <20030629213450.B5653@flint.arm.linux.org.uk>
Message-Id: <1056953317.26374.22.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 30 Jun 2003 07:08:38 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Sun, 2003-06-29 at 21:34, Russell King wrote:
> > could you try v1.6 from CVS, which should refrain from pretending to have
> > ecc/oob access functions of none of the subdevices have them, and hence 
> > fix the problem you observed.
> 
> While looking over the changes between 1.5 and 1.6, I spotted this.  You
> may want to fix this change:
> 
> -                   concat->mtd.eccsize != subdev[i]->eccsize) {
> +                   concat->mtd.eccsize != subdev[i]->eccsize ||
> +                   !concat->mtd.read_ecc != !concat->mtd.read_ecc ||
> +                   !concat->mtd.write_ecc != !concat->mtd.write_ecc ||
> +                   !concat->mtd.read_oob != !concat->mtd.read_oob ||
> +                   !concat->mtd.write_oob != !concat->mtd.write_oob) {

Hmmm. That'll optimise well :) 

But it shouldn't bite you -- aside from that does it actually fix the
problem you'd observed?

-- 
dwmw2
