Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEvLQ-0006eS-Jh
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 18:47:00 +0000
Date: Wed, 29 Oct 2003 10:45:46 -0800
From: Jun Sun <jsun@mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20031029104546.K30683@mvista.com>
References: <20031022182558.U19834@mvista.com>
	<20031027101741.C1678@mvista.com>
	<1067338214.15551.405.camel@hades.cambridge.redhat.com>
	<20031028182828.D30683@mvista.com>
	<1067426006.15551.1546.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1067426006.15551.1546.camel@hades.cambridge.redhat.com>;
	from dwmw2@infradead.org on Wed, Oct 29, 2003 at 11:13:26AM +0000
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] extend physmap.c to support run-time adding partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 29, 2003 at 11:13:26AM +0000, David Woodhouse wrote:
> On Tue, 2003-10-28 at 18:28 -0800, Jun Sun wrote:
> +#if defined(CONFIG_MTD)
> +       /* we use generic physmap mapping driver */
> +       physmap_set_map(0x400000, 4, 0x1e000000);
> +
> +       physmap_add_partition("YAMON", 0x100000, 0x0, MTD_WRITEABLE);
> +       physmap_add_partition("User FS", 0x300000, 0x100000, 0);
> +#endif
> 
> That's nicer. Why multiple physmap_add_partition() calls rather than
> just a single array passed to physmap_set_map() though?
> 

Hmm, currently partition only matters when CONFIG_MTD_PARTITIONS
is enabled.  I assume this mean sometimes people want to use
physmap without partitions.  True?

The board code here really takes advantage of the board-specific
knowledge, where it knows it has support for partitions.  (Maybe
I should add #ifdef CONFIG_MTD_PARTITIONS to surround adding partition
part)

> 	mtd = physmap_set_map(adr, len, width, set_vpp, partitions);
> 
> 	physmap_unset_map(mtd);
> 

phsmap currently only supports mapping for one physical flash unit.
I assume physmap_unset_map() is pretty much null op here?  

And the "physmap_set_map" really means something like "physmap_configure_map". 
So I am not sure if something "unconfigure" is necessary.

Jun
