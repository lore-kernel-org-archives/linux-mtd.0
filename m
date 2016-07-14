Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNUa3-0001m2-Eh
 for linux-mtd@lists.infradead.org; Thu, 14 Jul 2016 00:32:43 +0000
Received: by mail-pa0-x243.google.com with SMTP id q2so3767079pap.0
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jul 2016 17:32:22 -0700 (PDT)
Date: Wed, 13 Jul 2016 17:32:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <oss@buserror.net>
Cc: Raghav Dogra <raghav.dogra@nxp.com>, linux-mtd@lists.infradead.org,
 boris.brezillon@free-electrons.com, leoyang.li@nxp.com,
 prabhakar.kushwaha@nxp.com
Subject: Re: [PATCH][v2] driver/memory: Update dependency of IFC for Layerscape
Message-ID: <20160714003218.GB54628@google.com>
References: <1467388950-4895-1-git-send-email-raghav.dogra@nxp.com>
 <1468026245.32358.75.camel@buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1468026245.32358.75.camel@buserror.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 08, 2016 at 08:04:05PM -0500, Scott Wood wrote:
> On Fri, 2016-07-01 at 21:32 +0530, Raghav Dogra wrote:
> > This patch enables IFC NAND support on ARM layerscape platform.
> > It fixes the dependency to enable NAND. The include files are being modified
> > to ensure complilation for both PowerPC and ARM architectures.
> > 
> > Signed-off-by: Raghav Dogra <raghav.dogra@nxp.com>
> > ---
> > Applicable to git://git.infradead.org/l2-mtd.git
> > 
> > Changes for v2: updated commit description
> > 
> >  drivers/memory/Kconfig   | 2 +-
> >  drivers/memory/fsl_ifc.c | 4 +++-
> >  drivers/mtd/nand/Kconfig | 2 +-
> >  3 files changed, 5 insertions(+), 3 deletions(-)
> 
> Acked-by: Scott Wood <oss@buserror.net>

Applied to l2-mtd.git.
