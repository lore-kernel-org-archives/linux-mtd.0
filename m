Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TbVbZ-0007dI-8A
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 12:10:05 +0000
Date: Thu, 22 Nov 2012 15:09:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [patch] UBIFS: use kmalloc_array() in recomp_data_node()
Message-ID: <20121122120950.GL6186@mwanda>
References: <20121117151126.GA16900@elgon.mountain>
 <1353580297.2701.29.camel@sauron.fi.intel.com>
 <20121122111411.GJ6186@mwanda>
 <1353583603.2701.45.camel@sauron.fi.intel.com>
 <1353583773.2701.46.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1353583773.2701.46.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 22, 2012 at 01:29:33PM +0200, Artem Bityutskiy wrote:
> On Thu, 2012-11-22 at 13:26 +0200, Artem Bityutskiy wrote:
> > Did you consider kcalloc() ? Just like malloc() / calloc() libc
> > functions? 
> 
> Ah, there is kcaoloc already, so I guess then we could just put the
> overflow check there instead?

Yep.  That's there already.

regards,
dan carpenter
