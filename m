Received: from mail-pb0-x235.google.com ([2607:f8b0:400e:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VD5ro-0004DC-Oo
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2013 04:54:29 +0000
Received: by mail-pb0-f53.google.com with SMTP id up15so1413681pbc.40
 for <linux-mtd@lists.infradead.org>; Fri, 23 Aug 2013 21:54:06 -0700 (PDT)
Date: Fri, 23 Aug 2013 21:54:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtd cs553x_nand: use kzalloc() instead of memset
Message-ID: <20130824045403.GB19575@brian-ubuntu>
References: <20130823095145.GQ31293@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130823095145.GQ31293@elgon.mountain>
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Nathan Williams <nathan@traverse.com.au>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 23, 2013 at 12:51:45PM +0300, Dan Carpenter wrote:
> It's cleaner to use kzalloc() instead of zeroing out in a separate call
> to memset().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to l2-mtd.git. Thanks!

Brian
