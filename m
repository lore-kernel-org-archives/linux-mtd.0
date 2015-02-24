Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQB3J-0006RI-Pe
 for linux-mtd@lists.infradead.org; Tue, 24 Feb 2015 08:41:14 +0000
Received: by pdjy10 with SMTP id y10so31792628pdj.13
 for <linux-mtd@lists.infradead.org>; Tue, 24 Feb 2015 00:40:52 -0800 (PST)
Date: Tue, 24 Feb 2015 00:40:49 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Felix Fietkau <nbd@openwrt.org>
Subject: Re: [PATCH v3 3/3] mtd: block2mtd: Removes PAGE_MASK as a index to
 partition size
Message-ID: <20150224084049.GH24441@norris-Latitude-E6410>
References: <1807144344.40128259.1410985683342.JavaMail.zimbra@redhat.com>
 <20141105202303.GN23619@ld-irv-0074>
 <2086372266.7454667.1415535533979.JavaMail.zimbra@redhat.com>
 <1874445287.7454806.1415535792984.JavaMail.zimbra@redhat.com>
 <20141126072147.GO3212@norris-Latitude-E6410>
 <1417070032.4547583.1417007972343.JavaMail.zimbra@redhat.com>
 <20150224080752.GF24441@norris-Latitude-E6410>
 <54EC344F.3050709@openwrt.org>
 <20150224082725.GG24441@norris-Latitude-E6410>
 <54EC369D.7090108@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54EC369D.7090108@openwrt.org>
Cc: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
 Herton Krzesinski <hkrzesin@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Rodrigo Freire <rfreire@redhat.com>,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 24, 2015 at 09:30:21PM +1300, Felix Fietkau wrote:
> On 2015-02-24 21:27, Brian Norris wrote:
> > On Tue, Feb 24, 2015 at 09:20:31PM +1300, Felix Fietkau wrote:
> >> On 2015-02-24 21:07, Brian Norris wrote:
> >> > OK let's drop this patch from the series. At best, we could just do
> >> > something like this instead:
> >> > 
> >> > -	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
> >> > +	dev->mtd.size = dev->blkdev->bd_inode->i_size;
> >> > 
> >> > But that's really just an unnecessary change.
> >> If I remember correctly, it was problematic to have a dev->mtd.size
> >> value which is not a multiple of the erase size. I think that was the
> >> reason for patch 3.
> > 
> > The what's this for?
> > 
> > 	if ((long)dev->blkdev->bd_inode->i_size % erase_size) {
> > 		pr_err("erasesize must be a divisor of device size\n");
> > 		goto err_free_block2mtd;
> > 	}
> I think we should just trim the mtd size to a multiple of erase size and
> remove this check. It is a bit impractical for many cases.

Well that's not the subject of anything in this series, and this patch
does not stand alone well, so I'm not taking it. Feel free to send a
different patch if you have good reason to.

Brian
