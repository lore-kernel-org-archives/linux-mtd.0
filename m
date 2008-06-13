Received: from mycroft.westnet.com ([216.187.52.7])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K7F76-0003Md-Kl
	for linux-mtd@lists.infradead.org; Fri, 13 Jun 2008 19:39:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <18514.52439.909824.925873@stoffel.org>
Date: Fri, 13 Jun 2008 15:39:03 -0400
From: "John Stoffel" <john@stoffel.org>
To: Jean Delvare <khali@linux-fr.org>
Subject: Re: 2.6.26-rc5: CFI: Found no ck804xrom @ffc00000 device at
	location zero
In-Reply-To: <20080612222523.7ae0e8eb@hyperion.delvare>
References: <20080612182308.GA1091@ldl.fc.hp.com>
	<18513.27708.452410.527696@stoffel.org>
	<20080612222523.7ae0e8eb@hyperion.delvare>
Cc: David Woodhouse <dwmw2@infradead.org>, John Stoffel <john@stoffel.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Jean" == Jean Delvare <khali@linux-fr.org> writes:

This patch fixed my issue with excessive warnings on loading various
mtd drivers.  

Tested-by: John stoffel <john@stoffel.org>

Jean> Signed-off-by: Jean Delvare <khali@linux-fr.org>
Jean> ---
Jean>  drivers/mtd/chips/gen_probe.c |    4 ++--
Jean>  1 file changed, 2 insertions(+), 2 deletions(-)

Jean> --- linux-2.6.26-rc5.orig/drivers/mtd/chips/gen_probe.c	2008-04-17 04:49:44.000000000 +0200
Jean> +++ linux-2.6.26-rc5/drivers/mtd/chips/gen_probe.c	2008-06-12 22:20:12.000000000 +0200
Jean> @@ -71,8 +71,8 @@ static struct cfi_private *genprobe_iden
Jean>  	   interleave and device type, etc. */
Jean>  	if (!genprobe_new_chip(map, cp, &cfi)) {
Jean>  		/* The probe didn't like it */
Jean> -		printk(KERN_DEBUG "%s: Found no %s device at location zero\n",
Jean> -		       cp->name, map->name);
Jean> +		pr_debug("%s: Found no %s device at location zero\n",
Jean> +			 cp->name, map->name);
Jean>  		return NULL;
Jean>  	}
 


Jean> -- 
Jean> Jean Delvare
