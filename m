Received: from mail-bl2lp0209.outbound.protection.outlook.com
 ([207.46.163.209] helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMQ3Z-0007Ly-Oa
 for linux-mtd@lists.infradead.org; Tue, 26 Aug 2014 23:21:42 +0000
Message-ID: <1409095262.6510.104.camel@snotra.buserror.net>
Subject: Re: [PATCH v3] fsl_ifc: Support all 8 IFC chip selects
From: Scott Wood <scottwood@freescale.com>
To: Aaron Sierra <asierra@xes-inc.com>
Date: Tue, 26 Aug 2014 18:21:02 -0500
In-Reply-To: <264587069.465984.1409095113566.JavaMail.zimbra@xes-inc.com>
References: <264587069.465984.1409095113566.JavaMail.zimbra@xes-inc.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-08-26 at 18:18 -0500, Aaron Sierra wrote:
> Freescale's QorIQ T Series processors support 8 IFC chip selects
> within a memory map backward compatible with previous P Series
> processors which supported only 4 chip selects.
> 
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> ---
>  Note: v1 and v2 patches were submitted to Linux PPC mailing list
> 
>  v3: * IFC version register read only once
>      * fsl_ifc_version and fsl_ifc_bank_count inline functions replaced
>        by version and banks members of struct fsl_ifc_ctrl
>      * IFC version print moved from fsl_ifc_nand.c to fsl_ifc.c
> 
>  drivers/memory/fsl_ifc.c        | 13 +++++++++++--
>  drivers/mtd/nand/fsl_ifc_nand.c | 10 ++++------
>  include/linux/fsl_ifc.h         | 21 ++++++++++++++++-----
>  3 files changed, 31 insertions(+), 13 deletions(-)

Acked-by: Scott Wood <scottwood@freescale.com>

-Scott
