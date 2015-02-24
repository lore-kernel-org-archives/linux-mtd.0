Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQAXR-0004dm-5S
 for linux-mtd@lists.infradead.org; Tue, 24 Feb 2015 08:08:18 +0000
Received: by padfb1 with SMTP id fb1so34243597pad.8
 for <linux-mtd@lists.infradead.org>; Tue, 24 Feb 2015 00:07:56 -0800 (PST)
Date: Tue, 24 Feb 2015 00:07:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Rodrigo Freire <rfreire@redhat.com>
Subject: Re: [PATCH v3 3/3] mtd: block2mtd: Removes PAGE_MASK as a index to
 partition size
Message-ID: <20150224080752.GF24441@norris-Latitude-E6410>
References: <371358190.34795877.1410204429882.JavaMail.zimbra@redhat.com>
 <1444809468.34812041.1410206680931.JavaMail.zimbra@redhat.com>
 <20140909170231.GA14429@logfs.org>
 <1807144344.40128259.1410985683342.JavaMail.zimbra@redhat.com>
 <20141105202303.GN23619@ld-irv-0074>
 <2086372266.7454667.1415535533979.JavaMail.zimbra@redhat.com>
 <1874445287.7454806.1415535792984.JavaMail.zimbra@redhat.com>
 <20141126072147.GO3212@norris-Latitude-E6410>
 <1417070032.4547583.1417007972343.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1417070032.4547583.1417007972343.JavaMail.zimbra@redhat.com>
Cc: Felix Fietkau <nbd@openwrt.org>,
 =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
 Herton Krzesinski <hkrzesin@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 26, 2014 at 08:19:32AM -0500, Rodrigo Freire wrote:
> From: "Brian Norris" <computersforpeace@gmail.com>
> Sent: Wednesday, November 26, 2014 5:21:47 AM
> Subject: Re: [PATCH v3 3/3] mtd: block2mtd: Removes PAGE_MASK as a index to
> partition size
> 
> > On Sun, Nov 09, 2014 at 07:23:12AM -0500, Rodrigo Freire wrote:
> > > PAGE_MASK is no longer needed with the new term.
> 
> > This isn't too descriptive. What you probably mean is that we assume the
> > erase size is always larger than PAGE_SIZE.
> 
> > > This patch keeps the device size aligned with the erase_size.
> > >
> > > Signed-off-by: Felix Fietkau <nbd@openwrt.org>
> > > Signed-off-by: Rodrigo Freire <rfreire@redhat.com>
> > > Signed-off-by: Herton Krzesinski <herton@redhat.com>
> > > ---
> > > V3: Separated on a single patch
> > > --- a/drivers/mtd/devices/block2mtd.c 2014-11-07 17:40:58.688747820 -0200
> > > +++ b/drivers/mtd/devices/block2mtd.c 2014-11-07 17:41:28.054750893 -0200
> > > @@ -291,8 +291,7 @@ static struct block2mtd_dev *add_device(
> > > goto err_destroy_mutex;
> > >
> > > dev->mtd.name = name;
> > > -
> > > - dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
> > > + dev->mtd.size = dev->blkdev->bd_inode->i_size & ~(erase_size - 1);
> 
> > You never guaranteed that erase_size is a power of two, so this doesn't
> > necessarily mask the way you'd like...
> 
> > But also, why is this even necessary? I see that we should already have
> > errored out if this was actually significant, since we have above:
> 
> > if ((long)dev->blkdev->bd_inode->i_size % erase_size) {
> > pr_err("erasesize must be a divisor of device size\n");
> > goto err_free_block2mtd;
> > }
> 
> Hello Brian, and thanks for the review.
> 
> Honestly, I'd leave that untouched, but Jörn pointed that it could be a issue at https://lkml.org/lkml/2014/9/9/680
> 
> I'd happily let it go without this patch 3, unless Jörg wants to state otherwise.

OK let's drop this patch from the series. At best, we could just do
something like this instead:

-	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
+	dev->mtd.size = dev->blkdev->bd_inode->i_size;

But that's really just an unnecessary change.

Brian
