Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a51uo-0001AV-Vv
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2015 01:45:35 +0000
Received: by pacej9 with SMTP id ej9so95108597pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 17:45:14 -0800 (PST)
Date: Fri, 4 Dec 2015 17:45:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Simon Arlott <simon@fire.lp0.eu>
Subject: Re: [PATCH v2 5/6] mtd: partitions: pass around 'mtd_partitions'
 wrapper struct
Message-ID: <20151205014511.GK120110@google.com>
References: <1449271518-118900-1-git-send-email-computersforpeace@gmail.com>
 <1449271518-118900-6-git-send-email-computersforpeace@gmail.com>
 <20151205013049.0c66d38b@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151205013049.0c66d38b@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Sat, Dec 05, 2015 at 01:30:49AM +0100, Boris Brezillon wrote:
> On Fri,  4 Dec 2015 15:25:17 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:


> How about defining a new function to encourage mtd drivers to pass an
> mtd_partitions structure instead of the parts + nr_parts arguments.

Hmm, I'm not sure about having drivers use 'mtd_partitions' yet. It's a
little awkward for them to have access to a 'parser' field there, since
they might think of it as an input argument. But I do like the wrapper
function, as it simplifies the core function a bit. I'll try that, and
if we decide it's good to have drivers also start using something more
like the non-wrapped version, then maybe we can export it later?

I'm also slightly hesitant, because I think there may be more things
we'd want to refactor on how drivers pass partition info to the MTD core
in the future. Ideally, they'd have to pass less, but for the bits we
can't kill, it might be good to stick all into a single struct. (For
one, why should the mtd_part_parser_data be separate too?) So in the
end, we might want a different struct for MTD drivers' use, and I'd like
not to touch all that right now, if that's OK with you.

(BTW, I have some RFC of_match_table stuff that I'm preparing to send. I
might just tack that onto the end of this series' v3.)

> Note that I don't ask to update all call sites, but only to add a new
> function and transform mtd_device_parse_register() into a wrapper.
> 
> int mtd_device_parse_and_register_parts(struct mtd_info *mtd,
> 					const char *const *types,
> 					const struct mtd_partitions *parts)

You've missed parser_data in the prototype?

> {
> 	struct mtd_partitions parsed = { };
> 	int ret;
> 
> 	ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
> 	if (!ret)
> 		parts = &parsed;
> 
> 	if (!parts || !parts->nr_parts) {
> 		/* Didn't come up with parsed OR fallback partitions */
>   		pr_info("mtd: failed to find partitions; one or more parsers reports errors (%d)\n",
>   			ret);
>   		/* Don't abort on errors; we can still use unpartitioned MTD */
> 	}
> 
> 	ret = mtd_add_device_partitions(mtd, &parsed);

s/&parsed/parts/

right?

Anyway, enough nitpicks, I can fixup the implementation for a real patch :)

>   	if (ret)
>   		goto out;
> 
> [...]
> out:
>   	/* Cleanup any parsed partitions */
> 	if (parts->parser)
> 		kfree(parts->parts);
>  	return ret;
> }
> EXPORT_SYMBOL_GPL(mtd_device_parse_and_register_parts);
> 
> int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>   			      const struct mtd_partition *parts,
>   			      int nr_parts)
> {
> 	struct mtd_partitions predef = {
> 		.parts = parts,
> 		.nr_parts = nr_parts,
> 	};
> 
> 	return mtd_device_parse_and_register_parts(mtd, type, &predef);
> }
> EXPORT_SYMBOL_GPL(mtd_device_parse_and_register_parts);
> 

> > diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> > index 86691a5c68b9..c5108e0efe88 100644
> > --- a/drivers/mtd/mtdpart.c
> > +++ b/drivers/mtd/mtdpart.c

> > @@ -775,14 +774,16 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
> >  			 parser ? parser->name : NULL);
> >  		if (!parser)
> >  			continue;
> > -		ret = (*parser->parse_fn)(master, pparts, data);
> > +		ret = (*parser->parse_fn)(master, &pparts->parts, data);
> 
> Hm, you updated the ->parse_fn() prototype to take a const mtd_partition **
> in patch 2, and it seemed pretty easy.
> How about updating it again to take an mtd_partitions pointer here?

I can do that, I guess. Same issue about the 'parser' field; as long as
parser drivers don't think think they need to fill this out, I guess
that's OK.

Brian
