Received: from xes-mad.com ([216.165.139.218])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8dvs-0000ks-Lv
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 21:44:01 +0000
Date: Thu, 21 Feb 2013 15:43:54 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: ofpart: support partitions of 4 GB and larger
Message-ID: <692cc06d-8592-4944-8ef2-5c3b160dbf62@zimbra>
In-Reply-To: <51242E9A.3080901@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Joe Schaack <jschaack@xes-inc.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Previously, partitions were limited to less than 4 GB in size
> > because
> > the address and size were read as 32-bit values. Add support for
> > 64-bit
> > values to support devices of 4 GB and larger.
> >
> > Signed-off-by: Joe Schaack<jschaack@xes-inc.com>
> > Signed-off-by: Nate Case<ncase@xes-inc.com>
> > Signed-off-by: Aaron Sierra<asierra@xes-inc.com>
> > ---
> >   drivers/mtd/ofpart.c |    7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)

> I think it's better to update the
> Documentation/devicetree/bindings/mtd/partition.txt too. for example,
> add a example for the partition larger then 4G.
> 
> thanks
> Huang Shijie
> 

Good idea Huang, I'm on it.

-Aaron S.
