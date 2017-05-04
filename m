Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d6AXS-0003cx-9g
 for linux-mtd@lists.infradead.org; Thu, 04 May 2017 06:46:59 +0000
Date: Thu, 4 May 2017 09:45:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Huang Shijie <b32955@freescale.com>, Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Potential oops on error path in
 quad_enable()
Message-ID: <20170504064517.vemoe3k4z6e3rbwn@mwanda>
References: <20170428130614.w4cmbwvprgzv7sky@mwanda>
 <82655033-06b0-a310-07b4-1c8fa2591da2@wedev4u.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82655033-06b0-a310-07b4-1c8fa2591da2@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 03, 2017 at 11:40:09PM +0200, Cyrille Pitchen wrote:
> However, I think we could return the return code of
> spi_nor_wait_till_ready() instead, like already done in
> spansion_quad_enable().

Ah, yes, of course.  I will resend.

regards,
dan carpenter
