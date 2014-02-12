Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDUrF-0000V7-N6
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 08:07:50 +0000
Received: by mail-pa0-f43.google.com with SMTP id rd3so8848720pab.16
 for <linux-mtd@lists.infradead.org>; Wed, 12 Feb 2014 00:07:28 -0800 (PST)
Date: Wed, 12 Feb 2014 00:07:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Aw: Re: Linux MTD: Per Partition ECC
Message-ID: <20140212080724.GD3500@norris-Latitude-E6410>
References: <trinity-5aec7168-325d-4995-9e70-e4d2ce4b4816-1392119925322@3capp-gmx-bs63>
 <52FA1B39.2070904@corscience.de>
 <trinity-39536070-43ab-4f9e-9b92-9852f5fd000b-1392133387225@3capp-gmx-bs63>
 <52FA4E64.8020200@gmail.com>
 <20140212073328.GA3500@norris-Latitude-E6410>
 <alpine.DEB.2.00.1402120845000.5908@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1402120845000.5908@lnxricardw.se.axis.com>
Cc: "star@gmx.li" <star@gmx.li>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Peter Barada <peter.barada@logicpd.com>, Peter Barada <peter.barada@gmail.com>,
 Andreas =?iso-8859-1?Q?Bie=DFmann?= <andreas.biessmann@corscience.de>,
 "biessmann@corscience.de" <biessmann@corscience.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 12, 2014 at 08:48:18AM +0100, Ricard Wanderlof wrote:
> On Wed, 12 Feb 2014, Brian Norris wrote:
> >>In the process of using flashtool to burn NAND, it uses write() to burn
> >>the data portion, and ioctl(MEMWRITEOOB) to burn the OOB area, but this
> >>causes two writes to the same page, which violates Np for my NAND (i.e.
> >>only one write per page).  I'm looking at creating a new ioctl entry
> >>(MEMWRITEDATAOOB?) that takes both the data and oob buffers from
> >>userspace and then burns them in one operation.
> >
> >Please do not create a new one. ioctl(MEMWRITE) already exists for this
> >purpose. It can do page-at-a-time programming of data+OOB, and it even
> >has a 'mode' field for choosing ECC vs. raw (no-ECC) programming. This
> >is useful for any flash that doesn't support partial page programming.
> >The nandwrite utility from mtd-utils supports this in Linux.
> 
> I don't know if it has changed lately, but I was just looking at how
> nandwrite handles writes in RAW mode, and it appears that it does
> two separate writes in this case, one for the OOB and one for the
> main area.

It has changed.

http://git.infradead.org/mtd-utils.git/commitdiff/6a8889fbc0ea7a198628c9e3901fd88038e12d09

Brian
