Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TO14a-0004Yl-IR
 for linux-mtd@lists.infradead.org; Tue, 16 Oct 2012 06:56:17 +0000
Date: Tue, 16 Oct 2012 08:56:11 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/2 RFC v2] mtd/uclinux: support ROM and allow passing
 the base address
Message-ID: <20121016065611.GP639@pengutronix.de>
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1350027693-19528-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <507B8DBF.2030104@snapgear.com>
 <20121015065855.GG639@pengutronix.de>
 <507CB4A1.4080609@snapgear.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <507CB4A1.4080609@snapgear.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>,
 kernel@pengutronix.de, Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Greg,

On Tue, Oct 16, 2012 at 11:13:05AM +1000, Greg Ungerer wrote:
> On 15/10/12 16:58, Uwe Kleine-König wrote:
> >On Mon, Oct 15, 2012 at 02:14:55PM +1000, Greg Ungerer wrote:
> >>>  	mapp->virt = ioremap_nocache(mapp->phys, mapp->size);
> >>>@@ -76,9 +83,18 @@ static int __init uclinux_mtd_init(void)
> >>>
> >>>  	simple_map_init(mapp);
> >>>
> >>>-	mtd = do_map_probe("map_ram", mapp);
> >>>+	mapp->name = "ROM";
> >>>+	mtd = do_map_probe("map_rom", mapp);
> >>>+	if (!mtd) {
> >>>+		/* fall back to ram probing for compatibility reasons */
> >>>+		mapp->name = "RAM";
> >>>+		mtd = do_map_probe("map_ram", mapp);
> >>>+		if (mtd && IS_ENABLED(CONFIG_MTD_ROM))
> >>>+			pr_err("Failed to map rom, but ram succeeded. Please report this issue!\n");
> >>
> >>Do we really want this message?
> >>My predominate usage of this code is in RAM mappings. Network
> >>loading kernel+filesystem images on bare boards. Anyone who wants
> >>to know and is looking in the kernel boot messages will see
> >>something like:
> >>
> >>     Creating 1 MTD partitions on "RAM":
> >>     0x000000000000-0x0000000d8000 : "ROMfs"
> >>
> >>So they will know what type of mapping it was loaded from.
> >I want it because if nobody reports it it might well be possible to drop
> >map_ram support.
> 
> I am not sure I follow. The message is only printed if both ROM and
> RAM mappings are enabled. Many of the configs I use only have RAM
> mappings enabled.
Yeah, in this case it doesn't help. I also thought about adding a
warning for !IS_ENABLED(CONFIG_MTD_ROM). But this seemed too harsh, so I
dropped the idea.

Still, the theory is that MTD_ROM should be enough for the uclinux map.
If it's not it's at least not silently fixed up and we might get a
report about what was wrong with my assumption.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
