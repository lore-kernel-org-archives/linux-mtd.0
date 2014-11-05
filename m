Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm9Ty-0007f4-Az
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 22:55:18 +0000
Received: by mail-pa0-f48.google.com with SMTP id ey11so1709277pad.21
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 14:54:55 -0800 (PST)
Date: Wed, 5 Nov 2014 14:54:51 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH v3] fsl_ifc: Support all 8 IFC chip selects
Message-ID: <20141105225451.GZ23619@ld-irv-0074>
References: <1560704347.463292.1409093361997.JavaMail.zimbra@xes-inc.com>
 <264587069.465984.1409095113566.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <264587069.465984.1409095113566.JavaMail.zimbra@xes-inc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 26, 2014 at 06:18:33PM -0500, Aaron Sierra wrote:
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

Pushed to l2-mtd.git.

Brian
