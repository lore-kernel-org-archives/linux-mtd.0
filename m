Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O5BQe-0007O4-7O
	for linux-mtd@lists.infradead.org; Fri, 23 Apr 2010 05:27:53 +0000
Message-ID: <4BD12FCC.2070307@free.fr>
Date: Fri, 23 Apr 2010 07:27:40 +0200
From: Chris Moore <moore@free.fr>
MIME-Version: 1.0
To: Guillaume LECERF <glecerf@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v3 5/8] mtd: cfi_cmdset_0002: do not fail on no extended
	query	table as they are both optional
References: <20100422083545.17166.17822.stgit@shiryu.yomgui.biz>
	<20100422083606.17166.52192.stgit@shiryu.yomgui.biz>
In-Reply-To: <20100422083606.17166.52192.stgit@shiryu.yomgui.biz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Wolfram Sang <w.sang@pengutronix.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Le 22/04/2010 10:36, Guillaume LECERF a écrit :

[snip]


>
> -		bootloc = extp->TopBottom;
> -		if ((bootloc != 2)&&  (bootloc != 3)) {
> -			printk(KERN_WARNING "%s: CFI does not contain boot "
> -			       "bank location. Assuming top.\n", map->name);
> -			bootloc = 2;
> -		}
> +			bootloc = extp->TopBottom;
> +			if ((bootloc != 2)&&  (bootloc != 3)) {
> +				printk(KERN_WARNING "%s: CFI does not contain boot "
> +				       "bank location. Assuming top.\n", map->name);
> +				bootloc = 2;
> +			}
>
>    

[snip]

It is not your fault, Guillaume, but this whole "Assuming top" stuff is 
completely bogus :(
(The most obvious, but not the only, bug is that it actually sets 
bootloc to 2 which is bottom :( )

Uwe Kleine-Koenig submitted a patch for this ages ago which I tried to 
ping. See these threads :
http://thread.gmane.org/gmane.linux.drivers.mtd/22176
http://thread.gmane.org/gmane.linux.drivers.mtd/22266

*Please*, David, could we get this cleaned up?

Cheers,
Chris
