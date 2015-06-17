Received: from smtprelay0155.hostedemail.com ([216.40.44.155]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z55Bt-000683-U5
 for linux-mtd@lists.infradead.org; Wed, 17 Jun 2015 04:43:10 +0000
Message-ID: <1434516161.2689.67.camel@perches.com>
Subject: Re: [PATCH 2/6] mtd: nandsim: Fix kasprintf() usage
From: Joe Perches <joe@perches.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 16 Jun 2015 21:42:41 -0700
In-Reply-To: <20150617020707.GD4917@ld-irv-0074>
References: <1433193054-26865-1-git-send-email-richard@nod.at>
 <1433193054-26865-3-git-send-email-richard@nod.at>
 <20150617020707.GD4917@ld-irv-0074>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, dwmw2@infradead.org,
 maximlevitsky@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-06-16 at 19:07 -0700, Brian Norris wrote:
> On Mon, Jun 01, 2015 at 11:10:50PM +0200, Richard Weinberger wrote:
> > kasprintf() used in get_partition_name() does a dynamic
> > memory allocation and can fail. We have to handle that case.
[]
> > diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
[]
> > @@ -743,6 +743,11 @@ static int init_nandsim(struct mtd_info *mtd)
> >  			goto error;
> >  		}
> >  		ns->partitions[i].name   = get_partition_name(i);
> > +		if (!ns->partitions[i].name) {
> > +			NS_ERR("unable to allocate memory.\n");
> 
> Probably don't really need the allocation failure messages. But this
> matches the current style, so we can just rip the messages out at
> another time.

Maybe that other time can use the more typical
pr_<level> mechanisms instead of NS_<LEVEL> too.

As far as I can tell, the only thing that the
NS_<LEVEL> macros do is prefix "error: " and
"warning: " to the output.

"[nandsim] " could be added via pr_fmt and it
could be changed to "nandsim: " for commonality
with the majority of the kernel logging.
