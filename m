Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6o17-000224-Dy
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2015 23:19:26 +0000
Received: by pfu207 with SMTP id 207so37313025pfu.2
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 15:19:04 -0800 (PST)
Date: Wed, 9 Dec 2015 15:19:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Heiko Schocher <hs@denx.de>
Cc: Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Pekon Gupta <pekon@pek-sem.com>, Roger Quadros <rogerq@ti.com>,
 Nicholas Mc Guire <hofrat@osadl.org>, linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefano Babic <sbabic@denx.de>,
 "Stahl Martin (Helbling Technik)" <Martin.Stahl@helbling.ch>
Subject: Re: mtd, nand, omap2: parse cmdline partition fail
Message-ID: <20151209231901.GA64855@google.com>
References: <56613747.8040907@denx.de>
 <CAH6sp9M=vSQbVa7exRvHF+5o9dPz=wLrN3a1cL2O1kkcuDZGHg@mail.gmail.com>
 <566151DE.9070706@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <566151DE.9070706@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 04, 2015 at 09:42:06AM +0100, Heiko Schocher wrote:
> Am 04.12.2015 um 08:17 schrieb Frans Klaver:
> >On Fri, Dec 4, 2015 at 7:48 AM, Heiko Schocher <hs@denx.de> wrote:

> >>So the question is, is it intended to change the "mtd->name"?
> >
> >That's definitely not intended. The expectation with this patch is
> >that nothing really changes, except that a parent device link is
> >available in sysfs. For the name this patch depends on 807f16d4db956
> >("mtd: core: set some defaults when dev.parent is set") which does
> >something like:
> >
> >if (mtd->dev.parent) {
> >         if (!mtd->name)
> >                 mtd->name = dev_name(mtd->dev.parent);
> >}
> 
> commit 807f16d4db956 is in the tree... ok.
> 
> Hmm... I see in drivers/mtd/nand/omap2.c omap_nand_probe()
> info gets allocated with devm_kzalloc(), then info->mtd gets filled.
> 
> Without setting "mtd->name = dev_name(&pdev->dev);"
> mtd->name never gets filled ... or?
> 
> It seems to me add_mtd_device() gets only called for the mtd partitions
> parsed from the cmdline ...

That's true, when CONFIG_MTD_PARTITIONED_MASTER=n. (I'm really thinking
we should accelerate the adoption of PARTITIONED_MASTER... maybe set it
to default =y?)

But even with CONFIG_MTD_PARTITIONED_MASTER=y we still have a problem.

[...]

> >The fact that this produces different names for you is slightly
> >surprising to me, unless mtd->name is already set to something by the
> >time it reaches add_mtd_device(). Or I overlooked something, which is
> >entirely plausible as well.
> >
> >So effectively this should be the same as doing:
> >
> >   mtd->dev.parent = &pdev->dev;
> >   mtd->name = dev_name(mtd->dev.parent);

Yes, except for one thing (and this is the key): the mtd->name only gets
set *after* the partitions are parsed, using the method from commit
807f16d4db95 ("mtd: core: set some defaults when dev.parent is set"). So
the parsers (including cmdlinepart) get run with a blank (NULL) name,
and you can't detect any partitions, since the name match will never
work.

I have a hack of a patch below (untested) that would hopefully work
(based on current l2-mtd.git). I could port this to a base on 4.4-rc1 if
it works OK, so we can get the regression fixed in this cycle.

> >>But wondering, if there are two or more identical nand chips in the
> >>system, they will have the same mtd->name ... which seems buggy to me...
> >
> >Agree.
> 
> Good, so we must fix it ;-)

Yeah, that's a bad problem. Most people only plan for one chip and then
realize they need 2 later. nand_base should probably support something
to do this easily. Unfortunately, making a change like that could cause
some problems with cmdline naming across kernel versions, if we start
changing the convention for some drivers...(do we consider the MTD name
part of the ABI?)

Brian

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 89d811e7b04a..185dc36c687f 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -592,6 +592,15 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	struct mtd_partitions parsed;
 	int ret;
 
+	if (mtd->dev.parent) {
+		if (!mtd->owner && mtd->dev.parent->driver)
+			mtd->owner = mtd->dev.parent->driver->owner;
+		if (!mtd->name)
+			mtd->name = dev_name(mtd->dev.parent);
+	} else {
+		pr_debug("mtd device won't show a device symlink in sysfs\n");
+	}
+
 	memset(&parsed, 0, sizeof(parsed));
 
 	ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
