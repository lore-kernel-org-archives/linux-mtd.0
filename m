Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsWVs-0005nu-B7
 for linux-mtd@lists.infradead.org; Thu, 14 Sep 2017 15:57:14 +0000
Received: by mail-vk0-x244.google.com with SMTP id w23so349846vkw.3
 for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2017 08:56:52 -0700 (PDT)
Message-ID: <59baa6c2.52399f0a.2a6b6.e8b6@mx.google.com>
Date: Thu, 14 Sep 2017 11:56:49 -0400
From: Arun Nagendran <arunrasppi@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: manonuevo@micron.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Enable the read ECC before program the page
References: <59b983ce.82b8370a.04a2.b72a@mx.google.com>
 <20170913213154.GF9288@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170913213154.GF9288@kroah.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 13, 2017 at 02:31:54PM -0700, Greg KH wrote:
> On Wed, Sep 13, 2017 at 03:15:26PM -0400, Arun Nagendran wrote:
> > Current program_page function did following operation:
> > 
> > 1. read page (with ECC OFF)
> > 2. modify the page
> > 3. write the page (with ECC ON)
> > 
> > For some case(buggy flash Chip), while read the page without ECC ON,
> > we may read the page with bit flip error and modify that bad page without
> > knowing the bit flip error on that page.
> > also we re-calculate the hash for bad page and write it.
> > This could bring potential in-consistency problem with Flash data.
> > 
> > Verify this logic with GIGA DEVICE Part(GD5F2GQ4RCFIG):
> > we see this in-conststency problem wit Giga Device and fix on
> > this patch resovle that issue.
> > 
> > Signed-off-by: Arun Nagendran <arunrasppi@gmail.com>
> 
> Please read Documentation/SubmittingPatches for how to properly version
> your patches so we know what is going on and which one to accept/review.
> 
> Also your subject line needs some work, look at the other subjects for
> patches that have been accepted for this driver/subsystem for examples
> of what needs to be done.
> 
> thanks,
> 
> greg k-h

Thank you Greg on your review comments, I am working on 
your suggestion.

Thanks,
-Arun
