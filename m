Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCHBS-0005z3-Dw
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 02:33:15 +0000
Received: by mail-pg0-x241.google.com with SMTP id p66so3035133pga.2
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2016 18:32:54 -0800 (PST)
Date: Wed, 30 Nov 2016 18:32:50 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Luis Henriques <henrix@camandro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: maps: add missing iounmap() in error path
Message-ID: <20161201023250.GL77253@google.com>
References: <20161122192124.GF77253@google.com>
 <20161123234036.9985-1-henrix@camandro.org>
 <f933f0ff-2ba6-ac7b-e5b8-d7a4d04c0aa9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f933f0ff-2ba6-ac7b-e5b8-d7a4d04c0aa9@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 25, 2016 at 03:18:09PM +0100, Marek Vasut wrote:
> On 11/24/2016 12:40 AM, Luis Henriques wrote:
> > This patch was triggered by the following Coccinelle error:
> > 
> > ./drivers/mtd/maps/sc520cdp.c:246:3-9: \
> > 	ERROR: missing iounmap; ioremap on line 242 \
> > 	and execution via conditional on line 244
> > 
> > Since do_map_probe() is also invoked in this loop, it is also necessary to
> > map_destroy() any initialised struct mtd_info.
> > 
> > Signed-off-by: Luis Henriques <henrix@camandro.org>
> > ---
> > Changes since v1:
> > * Changes according to Brian Norris review:
> >   - Ensure sc520cdp_map[0].virt is unmaped when needed
> >   - Use a for loop instead of an 'if (i)'
> >   - Prevent double-iounmap
> > * Added map_destroy() in the cleanup
> > 
> > drivers/mtd/maps/sc520cdp.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)

...

> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

Applied to l2-mtd.git
