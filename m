Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6vQ1-0006et-3Q
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 07:13:37 +0000
Received: by qgeb1 with SMTP id b1so126309332qge.1
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 23:13:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151209231901.GA64855@google.com>
References: <56613747.8040907@denx.de>
 <CAH6sp9M=vSQbVa7exRvHF+5o9dPz=wLrN3a1cL2O1kkcuDZGHg@mail.gmail.com>
 <566151DE.9070706@denx.de> <20151209231901.GA64855@google.com>
Date: Thu, 10 Dec 2015 08:13:15 +0100
Message-ID: <CAH6sp9OqYt76FGbOWKxSovvbx8+TjGCKbAvy-V7t5N6FDuO3pQ@mail.gmail.com>
Subject: Re: mtd, nand, omap2: parse cmdline partition fail
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Heiko Schocher <hs@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Pekon Gupta <pekon@pek-sem.com>,
 Roger Quadros <rogerq@ti.com>, Nicholas Mc Guire <hofrat@osadl.org>,
 linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefano Babic <sbabic@denx.de>,
 "Stahl Martin (Helbling Technik)" <Martin.Stahl@helbling.ch>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 10, 2015 at 12:19 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Fri, Dec 04, 2015 at 09:42:06AM +0100, Heiko Schocher wrote:
>> It seems to me add_mtd_device() gets only called for the mtd partitions
>> parsed from the cmdline ...
>
> That's true, when CONFIG_MTD_PARTITIONED_MASTER=n. (I'm really thinking
> we should accelerate the adoption of PARTITIONED_MASTER... maybe set it
> to default =y?)
>
> But even with CONFIG_MTD_PARTITIONED_MASTER=y we still have a problem.
>
> [...]
>
>> >The fact that this produces different names for you is slightly
>> >surprising to me, unless mtd->name is already set to something by the
>> >time it reaches add_mtd_device(). Or I overlooked something, which is
>> >entirely plausible as well.
>> >
>> >So effectively this should be the same as doing:
>> >
>> >   mtd->dev.parent = &pdev->dev;
>> >   mtd->name = dev_name(mtd->dev.parent);
>
> Yes, except for one thing (and this is the key): the mtd->name only gets
> set *after* the partitions are parsed, using the method from commit
> 807f16d4db95 ("mtd: core: set some defaults when dev.parent is set"). So
> the parsers (including cmdlinepart) get run with a blank (NULL) name,
> and you can't detect any partitions, since the name match will never
> work.

Right, that was something we overlooked earlier.


> I have a hack of a patch below (untested) that would hopefully work
> (based on current l2-mtd.git). I could port this to a base on 4.4-rc1 if
> it works OK, so we can get the regression fixed in this cycle.

That would be nice.


>> >>But wondering, if there are two or more identical nand chips in the
>> >>system, they will have the same mtd->name ... which seems buggy to me...
>> >
>> >Agree.
>>
>> Good, so we must fix it ;-)
>
> Yeah, that's a bad problem. Most people only plan for one chip and then
> realize they need 2 later. nand_base should probably support something
> to do this easily. Unfortunately, making a change like that could cause
> some problems with cmdline naming across kernel versions, if we start
> changing the convention for some drivers...(do we consider the MTD name
> part of the ABI?)

I would expect a name to be just a name; something parsable by humans.
By definition that cannot be an ABI. On the other hand, maybe it has
grown to become part of the ABI.


> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 89d811e7b04a..185dc36c687f 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -592,6 +592,15 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>         struct mtd_partitions parsed;
>         int ret;
>
> +       if (mtd->dev.parent) {
> +               if (!mtd->owner && mtd->dev.parent->driver)
> +                       mtd->owner = mtd->dev.parent->driver->owner;
> +               if (!mtd->name)
> +                       mtd->name = dev_name(mtd->dev.parent);
> +       } else {
> +               pr_debug("mtd device won't show a device symlink in sysfs\n");
> +       }
> +
>         memset(&parsed, 0, sizeof(parsed));
>
>         ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);

This was the first thing I thought of when this issue was brought up.
If you do this, do you still need the chunk of code you copied from in
add_mtd_device()? Since we fill in these things on the master, I
wouldn't think we do.

Thanks,
Frans
