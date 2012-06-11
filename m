Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SdyJb-0004If-Lf
 for linux-mtd@lists.infradead.org; Mon, 11 Jun 2012 06:41:28 +0000
Received: by lbbgg6 with SMTP id gg6so2935059lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 10 Jun 2012 23:41:25 -0700 (PDT)
Date: Mon, 11 Jun 2012 09:41:17 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: ignore ecc errors during bbt reads
Message-ID: <20120611094117.73145dda@pixies.home.jungo.com>
In-Reply-To: <CAN8TOE_JVZYnVqAL=63ErnUHxdREjQw6EMZNNTm6h=jeyG9=6A@mail.gmail.com>
References: <1339093928-17545-1-git-send-email-mikedunn@newsguy.com>
 <20120610145004.702d24d7@pixies.home.jungo.com>
 <CAN8TOE_JVZYnVqAL=63ErnUHxdREjQw6EMZNNTm6h=jeyG9=6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Mike Dunn <mikedunn@newsguy.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Brian for your comments,

On Sun, 10 Jun 2012 22:45:50 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> Friendly comment: it would be helpful to include me on these types of
> threads, since I am responsible for much of the code in discussion
> here. (Try 'git blame').

Sure, will do.
I usually do a 'git blame', for some reason was careless this time...

> > Here, 'MTD_OPS_PLACE_OOB' is explicitly used - so *theoretically*
> > 'mtd_read_oob' might return EUCLEAN/EBADMSG, see 'nand_do_read_oob',
> > (although NO driver YET reports maxbitflips from its 'chip->ecc.read_oob'
> > method).
> 
> I think we discussed the "read_oob" case and max_bitflips previously,
> where I noted that my out-of-tree driver uses ECC that covers OOB and
> page data and sets ecc_stats.corrected and ecc_stats.failed according
> to the entire page+OOB when ecc.read_oob is called. So, this call to
> mtd_read_oob() may return EUCLEAN/EBADMSG when used my driver. This
> isn't a problem and should be left alone I think.

Bad phrasing on my side, should have said "although NO in-tree
driver".

> > Why not use 'MTD_OPS_RAW' in 'scan_block_fast()' as well (as done in
> > 'scan_block_full')?
> 
> Because when ECC is available on OOB, it is good to utilize it, so
> that bitflips don't cause good blocks to be marked bad. Less
> importantly, when bad block markers are written by Linux (with ECC),
> then these markers can be read back more reliably.

Ok (due to the second reason, as we're discussing the BBM read
implementation).

> So, I can send a patch that straightens out naming and brings
> scan_block_fast() and scan_block_full() into alignment on using
> MTD_OPS_PLACE_OOB. Then I think that we should continue using this
> code in both:
>                 /* Ignore ECC errors when checking for BBM */
>                 if (ret && !mtd_is_bitflip_or_eccerr(ret))

Sounds reasonable.

> And we can (as agreed previously?) avoid using/checking max_bitflips
> in mtd_read_oob(), although there is the datbuf+oob case that calls
> nand_do_read_ops...

This is a separate thing that needs to be addressed.
See my findings in [1].

Regards,
Shmulik

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-June/042194.html
