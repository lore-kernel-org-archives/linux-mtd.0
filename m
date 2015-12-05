Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a58CN-0004vz-2s
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2015 08:28:07 +0000
Date: Sat, 5 Dec 2015 09:27:44 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Simon Arlott <simon@fire.lp0.eu>
Subject: Re: [PATCH v2 5/6] mtd: partitions: pass around 'mtd_partitions'
 wrapper struct
Message-ID: <20151205092744.02f0d5ea@bbrezillon>
In-Reply-To: <20151205014511.GK120110@google.com>
References: <1449271518-118900-1-git-send-email-computersforpeace@gmail.com>
 <1449271518-118900-6-git-send-email-computersforpeace@gmail.com>
 <20151205013049.0c66d38b@bbrezillon>
 <20151205014511.GK120110@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Fri, 4 Dec 2015 17:45:11 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi Boris,
> 
> On Sat, Dec 05, 2015 at 01:30:49AM +0100, Boris Brezillon wrote:
> > On Fri,  4 Dec 2015 15:25:17 -0800
> > Brian Norris <computersforpeace@gmail.com> wrote:
> 
> 
> > How about defining a new function to encourage mtd drivers to pass an
> > mtd_partitions structure instead of the parts + nr_parts arguments.
> 
> Hmm, I'm not sure about having drivers use 'mtd_partitions' yet. It's a
> little awkward for them to have access to a 'parser' field there, since
> they might think of it as an input argument. But I do like the wrapper
> function, as it simplifies the core function a bit. I'll try that, and
> if we decide it's good to have drivers also start using something more
> like the non-wrapped version, then maybe we can export it later?
> 
> I'm also slightly hesitant, because I think there may be more things
> we'd want to refactor on how drivers pass partition info to the MTD core
> in the future. Ideally, they'd have to pass less, but for the bits we
> can't kill, it might be good to stick all into a single struct. (For
> one, why should the mtd_part_parser_data be separate too?) So in the
> end, we might want a different struct for MTD drivers' use, and I'd like
> not to touch all that right now, if that's OK with you.

Fair enough. 

> 
> (BTW, I have some RFC of_match_table stuff that I'm preparing to send. I
> might just tack that onto the end of this series' v3.)
> 
> > Note that I don't ask to update all call sites, but only to add a new
> > function and transform mtd_device_parse_register() into a wrapper.
> > 
> > int mtd_device_parse_and_register_parts(struct mtd_info *mtd,
> > 					const char *const *types,
> > 					const struct mtd_partitions *parts)
> 
> You've missed parser_data in the prototype?
> 
> > {
> > 	struct mtd_partitions parsed = { };
> > 	int ret;
> > 
> > 	ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
> > 	if (!ret)
> > 		parts = &parsed;
> > 
> > 	if (!parts || !parts->nr_parts) {
> > 		/* Didn't come up with parsed OR fallback partitions */
> >   		pr_info("mtd: failed to find partitions; one or more parsers reports errors (%d)\n",
> >   			ret);
> >   		/* Don't abort on errors; we can still use unpartitioned MTD */
> > 	}
> > 
> > 	ret = mtd_add_device_partitions(mtd, &parsed);
> 
> s/&parsed/parts/
> 
> right?

Right, but you know how much I like to propose code that does not even
compile ;-).

Best Regards,

Bori

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
