Received: from orion.he.net ([216.218.179.2])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Sb5O-0000h4-Lt
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2003 12:26:42 +0100
Message-ID: <004a01c3358c$8e522eb0$1207a8c0@kenlap>
From: "Ken Gordon" <kengordon@magneticscrolls.com>
To: "David Woodhouse" <dwmw2@infradead.org>
References: <004101c33586$cb802a90$1207a8c0@kenlap>
	<1055933659.2233.98.camel@passion.cambridge.redhat.com>
Date: Wed, 18 Jun 2003 12:27:08 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Getting a mtd_info with a valid map.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>From cfi_cmdset_0001.c

static int cfi_intelext_read_user_prot_reg (struct mtd_info *mtd, loff_t
from, size_t len, size_t *r
etlen, u_char *buf)
{
    struct map_info *map = mtd->priv;
    struct cfi_private *cfi = map->fldrv_priv;        EXPODE HERE is map ==
NULL
    struct cfi_pri_intelext *extp=cfi->cmdset_priv;
    int base_offst,reg_sz;

    /* Check that we actually have some protection registers */
    if(!(extp->FeatureSupport&64)){
        printk(KERN_WARNING "%s: This flash device has no protection data to
read!\n",map->name);
        return 0;
    }

    base_offst=(1<<extp->FactProtRegSize);
    reg_sz=(1<<extp->UserProtRegSize);

    return cfi_intelext_read_prot_reg(mtd, from, len, retlen, buf,
base_offst, reg_sz);
}
----- Original Message ----- 
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Ken Gordon" <kengordon@magneticscrolls.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Wednesday, June 18, 2003 11:54 AM
Subject: Re: Getting a mtd_info with a valid map.


> On Wed, 2003-06-18 at 11:45, Ken Gordon wrote:
> > I'm trying to read the serial number from my Intel Strataflash (J3)
suing
> > mtd->read_user_prot_reg and mtd->read_fact_prot_reg. This code below
looks
> > to me like it should do the job but explodes because the mtd_info
returned
> > by get_mtd_device has a NULL priv field.
>
> I don't understand. When the 'map' is NULL you still call
> mtd->read_user_prot_reg() anyway... doesn't it work?
>
> What do you think that 'priv' is an abbreviation for, by the way? Under
> what circumstances do you think a programmer would name a variable like
> that? :)
>
> -- 
> dwmw2
>
