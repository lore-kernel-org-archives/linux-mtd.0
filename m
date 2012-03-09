Received: from mga01.intel.com ([192.55.52.88])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5uTX-0005pg-54
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 07:42:56 +0000
Message-ID: <1331279109.22872.22.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] UBI: allocate verification buffer on demand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Fri, 09 Mar 2012 09:45:09 +0200
In-Reply-To: <20120308180826.53123148@halley>
References: <1331216091-6560-1-git-send-email-dedekind1@gmail.com>
 <20120308180826.53123148@halley>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-03-08 at 18:08 +0200, Shmulik Ladkani wrote:
> On Thu,  8 Mar 2012 16:14:50 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > From: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
> > 
> > Remove the pre-allocated 'peb_buf2' buffer because we do not really need it.
> > The only reason UBI has it is to check that the data were written correctly.
> > But we do not have to have 2 buffers for this and waste RAM - we can just
> > compare CRC checksums instead.
> > 
> > Artem bityutskiy: massaged the patch and commit message
> > 
> > Signed-off-by: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
> > Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Josselin's original title "allocate verification buffer on demand" does
> no longer describe this patch.
> Should be "Remove the pre-allocated 'peb_buf2'" or alike.

Fixed as well and pushed out, thanks! Waiting for Josselin's reply
anyway.

commit 43b043e78b876ce27034f167897b57fd2556ad29
Author: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
Date:   Wed Feb 22 16:37:05 2012 +0100

    UBI: reduce memory consumption
    
    Remove the pre-allocated 'peb_buf2' buffer because we do not really need it.
    The only reason UBI has it is to check that the data were written correctly.
    But we do not have to have 2 buffers for this and waste RAM - we can just
    compare CRC checksums instead. This reduces UBI memory consumption.
    
    Artem bityutskiy: massaged the patch and commit message
    
    Signed-off-by: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>


-- 
Best Regards,
Artem Bityutskiy
