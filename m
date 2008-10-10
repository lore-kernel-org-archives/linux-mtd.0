Received: from kroah.org ([198.145.64.141] helo=coco.kroah.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KoKkI-0006Vj-Ld
	for linux-mtd@lists.infradead.org; Fri, 10 Oct 2008 16:21:42 +0000
Date: Fri, 10 Oct 2008 09:11:58 -0700
From: Greg KH <greg@kroah.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] USB: remove info() macro from usb mtd drivers
Message-ID: <20081010161158.GA26633@kroah.com>
References: <20081010051321.GA32687@kroah.com>
	<1223620856.28324.101.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1223620856.28324.101.camel@macbook.infradead.org>
Cc: linux-usb@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 10, 2008 at 07:40:56AM +0100, David Woodhouse wrote:
> On Thu, 2008-10-09 at 22:13 -0700, Greg KH wrote:
> > From: Greg Kroah-Hartman <gregkh@suse.de>
> > 
> > USB should not be having it's own printk macros, so remove info() and
> > use the system-wide standard of dev_info() wherever possible.
> > 
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
> > ---
> > David, this has been in the USB tree for a few months now, sorry for not
> > sending it to you sooner.  I can easily keep it in my tree and send it
> > to Linus for this merge if you want me to, or you can take it in your
> > tree, which ever you want me to do.
> 
> Since you already seem to have it, you might as well keep it. Thanks.

Great, will do, thanks.

greg k-h
