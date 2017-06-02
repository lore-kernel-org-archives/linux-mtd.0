Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dGgwZ-0002mO-CI
 for linux-mtd@lists.infradead.org; Fri, 02 Jun 2017 07:24:24 +0000
Date: Fri, 2 Jun 2017 09:23:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Matthias Lange <matthias.lange@kernkonzept.com>
Cc: linux-mtd@lists.infradead.org, han.xu@nxp.com,
 computersforpeace@gmail.com, richard@nod.at, dwmw2@infradead.org
Subject: Re: [PATCH] Fix typo in comment.
Message-ID: <20170602092352.449c97be@bbrezillon>
In-Reply-To: <ed4d18bf-a18a-ea5c-5fc0-79a60fb3f2ee@kernkonzept.com>
References: <1496130091-2363-1-git-send-email-matthias.lange@kernkonzept.com>
 <20170531112255.1073ca9a@bbrezillon>
 <ed4d18bf-a18a-ea5c-5fc0-79a60fb3f2ee@kernkonzept.com>
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

On Wed, 31 May 2017 17:07:54 +0200
Matthias Lange <matthias.lange@kernkonzept.com> wrote:

> Hi Boris,
> 
> please consider the new version of the commit.

Can you send the patch you've put in attachment using git send-email
and Cc all relevant maintainers?

> 
> Best,
> Matthias.
> 
> 
> On 05/31/2017 11:22 AM, Boris Brezillon wrote:
> > Hi Mattias,
> > 
> > On Tue, 30 May 2017 09:41:31 +0200
> > Matthias Lange <matthias.lange@kernkonzept.com> wrote:
> > 
> > Commit title should be prefixed with "mtd: nand: gpmi: ".
> >   
> >> Signed-off-by: Matthias Lange <matthias.lange@kernkonzept.com>
> >> ---
> >>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> >> index 141bd70..41f53ae 100644
> >> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> >> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> >> @@ -932,7 +932,7 @@ static int enable_edo_mode(struct gpmi_nand_data *this, int mode)
> >>  
> >>  	nand->select_chip(mtd, 0);
> >>  
> >> -	/* [1] send SET FEATURE commond to NAND */
> >> +	/* [1] send SET FEATURE command to NAND */
> >>  	feature[0] = mode;
> >>  	ret = nand->onfi_set_features(mtd, nand,
> >>  				ONFI_FEATURE_ADDR_TIMING_MODE, feature);  
