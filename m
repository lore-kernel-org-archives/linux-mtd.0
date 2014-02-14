Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEEvj-0002kK-IU
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 09:19:32 +0000
Message-ID: <1392369532.12215.61.camel@sauron.fi.intel.com>
Subject: Re: [PATCH resend] ubi: attach: do not return -EINVAL if the
 mtd->numeraseregions is 1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Fri, 14 Feb 2014 11:18:52 +0200
In-Reply-To: <1392365295-19299-1-git-send-email-b32955@freescale.com>
References: <1392365295-19299-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-02-14 at 16:08 +0800, Huang Shijie wrote:
> If the master mtd does not have any slave mtd partitions,
> and its numeraseregions is one(only has one erease block), and
> we attach the master mtd with : ubiattach -m 0 -d 0
> 
> We will meet the error with (Micron M29W256GL7AN6):
> -------------------------------------------------------
> root@freescale ~$ ubiattach /dev/ubi_ctrl -m 0 -d 0
> UBI: attaching mtd0 to ubi0
> UBI error: io_init: multiple regions, not implemented
> ubiattach: error!: cannot attach mtd0
>            error 22 (Invalid argument)
> -------------------------------------------------------
> 
> In fact, if there is only one "erase block", we should not
> prevent the attach.
> 
> This patch fixes it.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Did you investigate the entire MTD subsystem an figure out what exactly
'numeraseregions=0' and 'numeraseregions=1' mean? What is the difference
between these 2. Is there consistency?

E.g., if 'numeraseregions=1' should there be non-NULL
'mtd->eraseregions'? What UBI should do with that then?

I am fine to apply your patch, but I would like to understand the whole
'erase regions' thing - what is this, what exactly are the semantics,
how UBI should use them, etc.

So far, for me 'numeraseregions=0' means there is no erase regions, and
this is what all drivers UBI has been working so far have.

I have no idea what are 'numeraseregions=1' beats, and how to deal with
them.

Ideally, I'd love to see a repsons to this e-mail like this:


From: Huang Shijie <b32955@freescale.com>, 
Subject: mtd-www: document erase regions

This patch is against the mtd-www project and it adds a piece of
documentation about MTD erase regions.


:-)

Thanks!

-- 
Best Regards,
Artem Bityutskiy
