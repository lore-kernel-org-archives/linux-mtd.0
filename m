Received: from userp1040.oracle.com ([156.151.31.81])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bOLTP-00023G-TN
 for linux-mtd@lists.infradead.org; Sat, 16 Jul 2016 09:01:24 +0000
Date: Sat, 16 Jul 2016 12:00:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Frans Klaver <fransklaver@gmail.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [patch] mtd: maps: sa1100-flash: potential NULL dereference
Message-ID: <20160716090041.GC32247@mwanda>
References: <20160715110629.GB9258@mwanda> <20160716003209.GC76613@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160716003209.GC76613@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I like the Fixes tag because it was my invention.  :)  It's a separate
thing from -stable.

It's nice for reviewing so you can see the original intent of the patch
you're fixing.  Also it forces you to find the original authors and CC
them so hopefully they Ack the patch.  The other thing is it lets you
collect data about which patches introduce bugs and how quickly they
get fixed.  So for example, lwn.net recently had an article about bug
that are backported into the -stable tree.

regards,
dan carpenter
