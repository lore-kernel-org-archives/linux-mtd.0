Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xlwjy-00026f-3i
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 09:18:59 +0000
Received: by mail-pa0-f52.google.com with SMTP id fa1so422270pad.11
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 01:18:36 -0800 (PST)
Date: Wed, 5 Nov 2014 01:18:33 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Sojka <sojkam1@fel.cvut.cz>
Subject: Re: [PATCH] Update help of CONFIG_MTD_OF_PARTS
Message-ID: <20141105091833.GG22361@norris-Latitude-E6410>
References: <1412946377-18933-1-git-send-email-sojkam1@fel.cvut.cz>
 <20141022053453.GA16128@brian-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141022053453.GA16128@brian-ubuntu>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 21, 2014 at 10:34:53PM -0700, Brian Norris wrote:
> On Fri, Oct 10, 2014 at 03:06:17PM +0200, Michal Sojka wrote:
> > The help text of CONFIG_MTD_OF_PARTS refers to additional documentation
> > in booting-without-of.txt but this documentation was moved to another
> > file in commit efcc2da3fd148c9acb7d7cf1d9800e0649f950fc (Stefan Roese:
> > Factor MTD physmap bindings out of booting-without-of). This updates the
> > help text to point to the right place.
> > 
> > Signed-off-by: Michal Sojka <sojkam1@fel.cvut.cz>
> > ---
> >  drivers/mtd/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> > index 94b8210..fa8371a 100644
> > --- a/drivers/mtd/Kconfig
> > +++ b/drivers/mtd/Kconfig
> > @@ -133,7 +133,7 @@ config MTD_OF_PARTS
> >  	help
> >  	  This provides a partition parsing function which derives
> >  	  the partition map from the children of the flash node,
> > -	  as described in Documentation/devicetree/booting-without-of.txt.
> > +	  as described in Documentation/devicetree/bindings/mtd/mtd-physmap.txt.
> 
> Did you read this file before sending the patch? I'm pretty sure you're
> looking for this file instead:
> 
>   Documentation/devicetree/bindings/mtd/partition.txt

Fixed this up and pushed to l2-mtd.git.

Brian
