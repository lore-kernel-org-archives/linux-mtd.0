Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBCQj-0002x1-07
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 01:07:29 +0000
Date: Wed, 14 Jan 2015 09:04:59 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH RESEND] mtd: fsl-quadspi: Fix module unbound
Message-ID: <20150114010459.GB10784@hsj.sh.intel.com>
References: <1421187255-20618-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421187255-20618-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Frank.Li@freescale.com,
 linux-mtd@lists.infradead.org, han.xu@freescale.com,
 computersforpeace@gmail.com, shijie8@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 13, 2015 at 08:14:15PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> When removing the fsl-quadspi module and running 'cat /proc/mtd' afterwards,
> we see garbage data like:
> 
> $ rmmod  fsl-quadspi
> $ cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00000000 00000000 "(null)"
> mtd0: 00000000 00000000 "(null)"
> mtd0: 00000000 00000000 "(null)"
> ...
> mtd0: a22296c6c756e28 00000000 "(null)"
> mtd0: a22296c6c756e28 3064746d "(null)"
> 
> If we continue doing multiple module load/unload operations, then it will also 
> lead to a kernel crash.
> 
> The reason for this is due to the wrong mtd index used in
> mtd_device_unregister() in the remove function.
> 
> We need to keep the mtd unregister index aligned with the one used in the probe
> function, which means we need to take into account the 'has_second_chip'
> property. By doing so we can guarantee that the mtd index is the same in the
> registration and unregistration functions.
> 
> With this patch applied we can load/unload the fsl-quadspi driver several times
> and it will result in no crash.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
ok. Let this patch in.

Acked-by: Huang Shijie <shijie.huang@intel.com>
