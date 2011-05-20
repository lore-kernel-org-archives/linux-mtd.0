Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNIfj-0003vv-PL
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 05:54:52 +0000
Received: by ewy3 with SMTP id 3so1284728ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2011 22:54:50 -0700 (PDT)
Subject: Re: [RFC PATCH 0/7] Removing CONFIG_MTD_PARTITIONS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <20110519054405.GB32183@pulham.picochip.com>
References: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
	<1305551060.2630.2.camel@localhost>
	<20110516143710.GA5123@pulham.picochip.com>
	<20110519054405.GB32183@pulham.picochip.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 08:50:59 +0300
Message-ID: <1305870659.2630.97.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-19 at 06:44 +0100, Jamie Iles wrote:
> On Mon, May 16, 2011 at 03:37:10PM +0100, Jamie Iles wrote:
> > On Mon, May 16, 2011 at 04:04:20PM +0300, Artem Bityutskiy wrote:
> > > On Thu, 2011-05-12 at 14:26 +0100, Jamie Iles wrote:
> > > > This patch series is an RFC for the removal of CONFIG_MTD_PARTITIONS.
> > > > Partitioning is still supported, but is always compiled in if CONFIG_MTD is
> > > > selected.  To transition, two new symbols are introduced -
> > > > mtd_device_{,un}register() that replace add_mtd_device(), add_mtd_partitions()
> > > > and their counterparts.  The series converts a number of drivers over to use
> > > > these new interfaces and the final patch removes the old symbols.
> > > > 
> > > > Note that this patch does not transition all of the drivers so is incomplete
> > > > (and not signed off!).  If this approach is suitable then I'll convert all of
> > > > the other drivers over.
> > > 
> > > Jamie, looks very good at the first glance, thanks a lot!
> > 
> > Great!  I'm travelling at the moment so can't complete the series, but 
> > I'll aim to do the full series over the next few weeks and repost.  
> > Thanks for taking the time to look at it.
> 
> Artem, with regards to submitting a series for this, how would you 
> prefer it?  I imagined a few patches for the core MTD stuff then one per 
> driver to remove the CONFIG_MTD_PARTITIONS preprocessor and convert to 
> mtd_device_register().

Yes.

> There are other drivers that don't use CONFIG_MTD_PARTITIONS but use 
> add_mtd_device()/add_mtd_partitions() etc so these just need a 
> substitution for mtd_device_register().  Are these last ones OK as one 
> patch or one per driver?

If the patch is about mechanical substitution I think one patch for all
is better.

Sorry for long response, I suggest you to just send patches as you
think, if people do not like something - you'll get a response. I takes
too much time to wait for my response. We still have chances to get into
2.6.40 with these changes if you are fast.

Please, base your patches on top of my l2 tree:
git://git.infradead.org/users/dedekind/l2-mtd-2.6.git

Also, try to take a look at linux-next - at least Russel's arm tree
should have changes which will conflict with yours. 

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
