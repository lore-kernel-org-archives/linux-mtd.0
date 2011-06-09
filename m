Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUh3S-0000Nt-Un
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 15:21:55 +0000
Received: by wwi18 with SMTP id 18so4438178wwi.0
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 08:21:53 -0700 (PDT)
Subject: Re: [PATCH 01/17] mtd: prepare to convert of_mtd_parse_partitions
	to partition parser
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <4DF0E1E8.9010307@gmail.com>
References: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
	<1307629388-24769-2-git-send-email-dbaryshkov@gmail.com>
	<1307629589.7374.103.camel@localhost>  <4DF0DA9A.2050301@gmail.com>
	<1307631767.7374.111.camel@localhost>  <4DF0E1E8.9010307@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 18:17:34 +0300
Message-ID: <1307632654.7374.121.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-09 at 19:08 +0400, Dmitry Eremin-Solenikov wrote:
> >>>> +#ifdef CONFIG_OF
> >>>> +	if (master->node)
> >>>> +		of_node_get(master->node);
> >>>> +#endif
> >>>
> >>> These ifdefs are not very nice, do you have ideas how to avoid them?
> >>> Ideally, mtdcore should not know or bother about OF things. All
> >>> OF-specific things should be done in ofpart.c...
> >>
> >> I know they aren't nice. OTOH ofpart.c also seems a bit non-logical: one
> >> can have of node in the MTD, but doesn't (strangely) want to compile in
> >> ofpart.c. Of course I can add separate small of-handling functions (to
> >> do OF handling) to mtdcore.c to be replaced by empty functions in the
> >> absence of CONFIG_OF, but this also look like overhead for me.
> >
> > How about turning the "origin" argument into "void *private" and
> > declaring that this is "parser-specific info". It then can become
> > "origin" for the RedBoot parser and the OF node pointer for the ofpart
> > parser?
> 
> And what will happen when ixp4xx (the only user of redboot "exception") 
> will get OF support?

Hmm, may be introducing something like:

/**
 * struct mtd_part_parser_data - used to pass data to MTD partition parsers.
 * @origin: blah blah, RedBoot-specific
 * @of_node: points to the OF node describing the partitions, ofpart-specific
 */
struct mtd_part_parser_data {
	unsigned long origin;
	struct device_node *of_node;
};

And change the current "origin" argument with a
"struct mtd_part_parser_data *data" pointer?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
