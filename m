Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S600J-0007wP-KZ
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 13:37:08 +0000
Message-ID: <1331300366.29445.31.camel@sauron.fi.intel.com>
Subject: Re: UBI/ubifs problem
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Fri, 09 Mar 2012 15:39:26 +0200
In-Reply-To: <Pine.LNX.4.64.1203080606110.24516@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202161543340.13194@lnxricardw.se.axis.com>
 <Pine.LNX.4.64.1202171107440.13194@lnxricardw.se.axis.com>
 <1331131250.32316.8.camel@sauron.fi.intel.com>
 <Pine.LNX.4.64.1203071723410.21132@lnxricardw.se.axis.com>
 <1331138261.3463.19.camel@sauron.fi.intel.com>
 <Pine.LNX.4.64.1203080606110.24516@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-03-08 at 06:09 +0100, Ricard Wanderlof wrote:
> On Wed, 7 Mar 2012, Artem Bityutskiy wrote:
> 
> > On Wed, 2012-03-07 at 17:26 +0100, Ricard Wanderlof wrote:
> >> Is it possible to get mkfs.ubifs to create an image without specifying the
> >> max-leb-count ? I.e. just to create an image that is as big as it has to
> >> be.
> >
> > Has to be? :-) Not sure how to find this out. Basically the idea was
> > that you know how big is has to be and translate that to
> > --max-leb-count.
> 
> I think what I'm thinking about is that in the specialized case of ubifs 
> used for a read-only file system, such as a root file system (without 
> /etc, /var, and so on), it would be possible for mkfs.ubifs to create a 
> file system, and use as many LEBs as it needs for the actual data. On a 
> read-only file system there doesn't even have to be a journal, although I 
> don't know if that is possible.

Well, I'd accept a patch which added a --optimize-for-ro option which
would prepare a file-system with the smallest journal size.

-- 
Best Regards,
Artem Bityutskiy
