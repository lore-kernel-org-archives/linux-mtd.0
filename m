Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaKfc-0004Bk-CL
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 07:54:12 +0000
Received: by mail-pd0-f180.google.com with SMTP id v10so10518665pde.11
 for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2014 00:53:51 -0700 (PDT)
Date: Wed, 16 Apr 2014 00:53:48 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: gpmi: add gpmi_devdata{} to simplify the code
Message-ID: <20140416075348.GE5512@norris-Latitude-E6410>
References: <1395397179-17449-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395397179-17449-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 21, 2014 at 06:19:39PM +0800, Huang Shijie wrote:
> More and more chips use the GPMI controller, but these chips may use different
> version of the IPs for GPMI and BCH. Different IPs have
>  different features, such as the BCH's maximum ECC strength:
> 
>      imx23/imx28 -- the BCH's maximum ECC strength is 20
>      imx6q       -- the BCH's maximum ECC strength is 40
>      imx6sx      -- the BCH's maximum ECC strength is 62
> 
> This patch does the following things:
> 
>   [1] add a new data structure, gpmi_devdata{}, to store the information for
>       each IP. Besides the IP version, we store the following information:
>          <1> BCH's maximum ECC strength.
>          <2> the maximum chain delay in ns used by the EDO mode.
> 
>       but we may add more information in future.
> 
>   [2] add the gpmi_devdata_imx{23|28|6q} to replace the gpmi_ids.
> 
>   [3] simplify the code by using the ECC strength from gpmi_devdata, such as
>       gpmi_check_ecc() and legacy_set_geometry();
> 
>   [4] use the maximum chain delay to initialize the EDO mode,
>       see gpmi_compute_edo_timing().
> 
>   [5] rewrite the macros, such GPMI_IS_MX{23|28|6Q}.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git. Thanks!

Brian
