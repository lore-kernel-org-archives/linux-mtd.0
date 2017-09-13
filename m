Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsFGc-0006yz-EY
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 21:32:20 +0000
Date: Wed, 13 Sep 2017 14:31:54 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Arun Nagendran <arunrasppi@gmail.com>
Cc: manonuevo@micron.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Enable the read ECC before program the page
Message-ID: <20170913213154.GF9288@kroah.com>
References: <59b983ce.82b8370a.04a2.b72a@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59b983ce.82b8370a.04a2.b72a@mx.google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 13, 2017 at 03:15:26PM -0400, Arun Nagendran wrote:
> Current program_page function did following operation:
> 
> 1. read page (with ECC OFF)
> 2. modify the page
> 3. write the page (with ECC ON)
> 
> For some case(buggy flash Chip), while read the page without ECC ON,
> we may read the page with bit flip error and modify that bad page without
> knowing the bit flip error on that page.
> also we re-calculate the hash for bad page and write it.
> This could bring potential in-consistency problem with Flash data.
> 
> Verify this logic with GIGA DEVICE Part(GD5F2GQ4RCFIG):
> we see this in-conststency problem wit Giga Device and fix on
> this patch resovle that issue.
> 
> Signed-off-by: Arun Nagendran <arunrasppi@gmail.com>

Please read Documentation/SubmittingPatches for how to properly version
your patches so we know what is going on and which one to accept/review.

Also your subject line needs some work, look at the other subjects for
patches that have been accepted for this driver/subsystem for examples
of what needs to be done.

thanks,

greg k-h
