Received: from [2002:d556:63ea::1] (helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19rdhO-0008FA-Ec
	for <linux-mtd@lists.infradead.org>; Tue, 26 Aug 2003 14:17:26 +0100
Received: from apollo.nbase.co.il ([194.90.137.2])
	by phoenix.infradead.org with esmtp (Exim 4.22)
	id 19rdgz-0006jl-TO
	for linux-mtd@lists.infradead.org; Tue, 26 Aug 2003 14:17:02 +0100
Date: Tue, 26 Aug 2003 16:16:57 +0300
To: David Woodhouse <dwmw2@redhat.com>
Message-ID: <20030826131657.GD26520@nbase.co.il>
References: <20030826130146.GC26520@nbase.co.il>
	<1061903112.8465.24.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1061903112.8465.24.camel@hades.cambridge.redhat.com>
From: gleb@nbase.co.il (Gleb Natapov)
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Support for multiple physical mappings for MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 26, 2003 at 02:05:13PM +0100, David Woodhouse wrote:
> On Tue, 2003-08-26 at 16:01 +0300, Gleb Natapov wrote:
> > Hello,
> > 
> > I work with Motorola MPC8245 processor. It has one memory window for
> > extended ROM and another for boot ROM.
> > 
> > Currently physmap driver supports only one memory window for MTD device. 
> > Attached quick patch makes it more easy task to add more then one memory window.
> 
> It's already an easy task just to add your own map driver -- even easier
> in 2.6 (and I'll probably send that same code in for 2.4.23). I'd rather
> you did that than complicate the physmap driver, I think.
My own map driver will mostly be the cut and paste copy of physmap driver.
But if this is by design I can live with it.

--
			Gleb.
