Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm80H-00031i-A3
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 21:20:33 +0000
Received: by mail-pa0-f44.google.com with SMTP id bj1so1589914pad.3
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 13:20:12 -0800 (PST)
Date: Wed, 5 Nov 2014 13:20:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtd: off by one in INFTL_dumpVUchains()
Message-ID: <20141105212008.GW23619@ld-irv-0074>
References: <20141021080637.GA28426@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141021080637.GA28426@mwanda>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 21, 2014 at 11:08:35AM +0300, Dan Carpenter wrote:
> The ->PUtable[] array has "->nb_blocks" number of elemetns so this
> comparison should be ">=" instead of ">".  Otherwise it could result in
> a minor read beyond the end of an array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd.git.

Brian
