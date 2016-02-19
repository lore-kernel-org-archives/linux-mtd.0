Received: from host.buserror.net ([209.198.135.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aWYbj-0002Cy-Ml
 for linux-mtd@lists.infradead.org; Fri, 19 Feb 2016 00:07:40 +0000
Message-ID: <1455840434.2463.97.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Leo Li <pku.leo@gmail.com>, Raghav Dogra <raghav.dogra@nxp.com>
Cc: linux-mtd@lists.infradead.org, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,  Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>, Brian Norris <computersforpeace@gmail.com>,
 Raghav Dogra <raghav@freescale.com>, Jaiprakash Singh <b44839@freescale.com>
Date: Thu, 18 Feb 2016 18:07:14 -0600
In-Reply-To: <CADRPPNS1i1XgtpyiT_=rDuDXBDn=ehNY32=RKTC9hdKXhWWq8A@mail.gmail.com>
References: <1455708258-3831-1-git-send-email-raghav.dogra@nxp.com>
 <CADRPPNS1i1XgtpyiT_=rDuDXBDn=ehNY32=RKTC9hdKXhWWq8A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH][v3] mtd/ifc: Add support for IFC controller version 2.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-02-18 at 15:18 -0600, Leo Li wrote:
> On Wed, Feb 17, 2016 at 5:24 AM, Raghav Dogra <raghav.dogra@nxp.com> wrote:
> > The new IFC controller version 2.0 has a different memory map page.
> > Upto IFC 1.4 PAGE size is 4 KB and from IFC2.0 PAGE size is 64KB.
> > This patch segregates the IFC global and runtime registers to appropriate
> > PAGE sizes.
> > 
> > Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> > Signed-off-by: Raghav Dogra <raghav@freescale.com>
> > Acked-by: Li Yang <leoyang.li@nxp.com>
> > Signed-off-by: Raghav Dogra <raghav.dogra@nxp.com>
> > ---
> > Changes for v3: not dependent on
> > "drivers/memory: Add deep sleep support for IFC" patch
> > 
> > Changes for v2: rebased to resolve conflicts
> > Applicable to git://git.infradead.org/l2-mtd.git
> > 
> > This patch is dependent on "drivers/memory: Add deep sleep support for
> > IFC"
> > https://patchwork.ozlabs.org/patch/582762/
> > which is also applicable to git://git.infradead.org/l2-mtd.git
> 
> This patch seems to be in good shape, but the dependency is still
> having quite some feedback to be addressed.  Depending on it will
> greatly delay the time that this critical patch for LS2 to be merged.
> Could you remove the dependency like Scott already suggested?

According to the changelog the dependency has been removed (it would have been
clearer to remove this comment as well...).

-Scott
