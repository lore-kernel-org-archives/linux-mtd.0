Received: from host.buserror.net ([209.198.135.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQMxI-0003Hf-TE
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 22:28:21 +0000
Message-ID: <1454365678.2486.19.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Brian Norris <computersforpeace@gmail.com>, Raghav Dogra
 <raghav@freescale.com>
Cc: linux-mtd@lists.infradead.org, prabhakar@freescale.com, Jaiprakash Singh
 <b44839@freescale.com>
Date: Mon, 01 Feb 2016 16:27:58 -0600
In-Reply-To: <20160201184145.GH19540@google.com>
References: <1450262529-5216-1-git-send-email-raghav@freescale.com>
 <20160201184145.GH19540@google.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/3] mtd/ifc: Segregate IFC fcm and runtime registers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2016-02-01 at 10:41 -0800, Brian Norris wrote:
> Hi Raghav,
> 
> On Wed, Dec 16, 2015 at 04:12:09PM +0530, Raghav Dogra wrote:
> > IFC has two set of registers viz FCM (Flash control machine)
> > aka global and run time registers. These set are defined in two
> > memory map PAGES. Upto IFC 1.4 PAGE size is 4 KB and from IFC2.0
> > PAGE size is 64KB
> 
> So...this patch is adding new hardware support? It's not immediately
> clear from the patch description. Perhaps that could use some work?
> 
> > Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> > Signed-off-by: Raghav Dogra <raghav@freescale.com>
> > ---
> >  drivers/memory/fsl_ifc.c        | 37 ++++++++++-----------
> >  drivers/mtd/nand/fsl_ifc_nand.c | 72 ++++++++++++++++++++++--------------
> > -----
> >  include/linux/fsl_ifc.h         | 45 +++++++++++++++++---------
> 
> Who merges changes for the drivers/memory/ portions anyway? Is there a
> maintainer?

Whoever makes sense for the particular patch.

>  Or should I be taking these, since it touches drivers/mtd/
> enough? If so, can I get an ack from a Freescale maintainer?

Acked-by: Scott Wood <oss@buserror.net>

...assuming the sparse warning and the struct name (see my other mail) are
fixed.

-Scott
