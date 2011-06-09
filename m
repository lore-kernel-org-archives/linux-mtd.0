Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUgpC-00006k-1v
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 15:07:11 +0000
Received: by fxm14 with SMTP id 14so1469809fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 08:07:06 -0700 (PDT)
Subject: Re: [PATCH 01/17] mtd: prepare to convert of_mtd_parse_partitions
	to partition parser
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <4DF0DA9A.2050301@gmail.com>
References: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
	<1307629388-24769-2-git-send-email-dbaryshkov@gmail.com>
	<1307629589.7374.103.camel@localhost>  <4DF0DA9A.2050301@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 18:02:47 +0300
Message-ID: <1307631767.7374.111.camel@localhost>
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

On Thu, 2011-06-09 at 18:37 +0400, Dmitry Eremin-Solenikov wrote:
> On 09.06.2011 18:26, Artem Bityutskiy wrote:
> > On Thu, 2011-06-09 at 18:22 +0400, Dmitry Eremin-Solenikov wrote:
> >> Prepare to convert of_mtd_parse_partitions() to usual partitions parser:
> >> 1) Register ofpart parser
> >> 2) Internally don't use passed device for error printing
> >> 3) Add device_node to mtd_info struct
> >> 4) Move of_mtd_parse_partitions from __devinit to common text section
> >> 5) add ofpart to the default list of partition parsers
> >>
> >> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
> >> ---
> >>   drivers/mtd/mtdcore.c          |   19 +++++++++++++++++++
> >>   drivers/mtd/mtdpart.c          |    8 ++++++--
> >>   drivers/mtd/ofpart.c           |   30 ++++++++++++++++++++++++++++--
> >>   include/linux/mtd/mtd.h        |    5 +++++
> >>   include/linux/mtd/partitions.h |    2 +-
> >>   5 files changed, 59 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> >> index 1326747..2d5b865 100644
> >> --- a/drivers/mtd/mtdcore.c
> >> +++ b/drivers/mtd/mtdcore.c
> >> @@ -36,6 +36,7 @@
> >>   #include<linux/idr.h>
> >>   #include<linux/backing-dev.h>
> >>   #include<linux/gfp.h>
> >> +#include<linux/of.h>
> >>
> >>   #include<linux/mtd/mtd.h>
> >>   #include<linux/mtd/partitions.h>
> >> @@ -446,6 +447,10 @@ int mtd_device_register(struct mtd_info *master,
> >>   			const struct mtd_partition *parts,
> >>   			int nr_parts)
> >>   {
> >> +#ifdef CONFIG_OF
> >> +	if (master->node)
> >> +		of_node_get(master->node);
> >> +#endif
> >
> > These ifdefs are not very nice, do you have ideas how to avoid them?
> > Ideally, mtdcore should not know or bother about OF things. All
> > OF-specific things should be done in ofpart.c...
> 
> I know they aren't nice. OTOH ofpart.c also seems a bit non-logical: one 
> can have of node in the MTD, but doesn't (strangely) want to compile in 
> ofpart.c. Of course I can add separate small of-handling functions (to 
> do OF handling) to mtdcore.c to be replaced by empty functions in the 
> absence of CONFIG_OF, but this also look like overhead for me.

How about turning the "origin" argument into "void *private" and
declaring that this is "parser-specific info". It then can become
"origin" for the RedBoot parser and the OF node pointer for the ofpart
parser?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
