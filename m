Received: from mail.kroah.org ([69.55.234.183] helo=perch.kroah.org)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GEyky-00075N-Ff
	for linux-mtd@lists.infradead.org; Mon, 21 Aug 2006 02:39:15 +0100
Date: Sun, 20 Aug 2006 18:35:45 -0700
From: Greg KH <greg@kroah.com>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: 2.6.18-rc4 jffs2 problems
Message-ID: <20060821013545.GA21012@kroah.com>
References: <1154976111.17725.8.camel@localhost.localdomain>
	<1155852587.5530.30.camel@localhost.localdomain>
	<625fc13d0608191834r19ce12e5raccbae011d67c25e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <625fc13d0608191834r19ce12e5raccbae011d67c25e@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 19, 2006 at 08:34:46PM -0500, Josh Boyer wrote:
> On 8/17/06, Richard Purdie <rpurdie@rpsys.net> wrote:
> >Read the return value before we release the nand device otherwise the
> >value can become corrupted by another user of chip->ops, ultimately
> >resulting in filesystem corruption.
> >
> 
> We have multiple confirmations that this patch fixes the issue
> reported.  I agree it should go in 2.6.18.
> 
> Greg, can you add this to your tree?

Add what to what tree?  I need things to be a bit more specific here :)

thanks,

greg k-h
