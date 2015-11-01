Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsgFU-0007OY-Sv
 for linux-mtd@lists.infradead.org; Sun, 01 Nov 2015 00:11:53 +0000
Received: by pacfv9 with SMTP id fv9so114032272pac.3
 for <linux-mtd@lists.infradead.org>; Sat, 31 Oct 2015 17:11:31 -0700 (PDT)
Date: Sat, 31 Oct 2015 17:11:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Scott Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>
Subject: Re: [PATCH v2 09/11] mtd: drop unnecessary partition parser data
Message-ID: <20151101001116.GA15888@brian-ubuntu>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
 <1446262410-45754-10-git-send-email-computersforpeace@gmail.com>
 <201510311626.32863.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201510311626.32863.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 31, 2015 at 04:26:32PM +0100, Marek Vasut wrote:
> On Saturday, October 31, 2015 at 04:33:28 AM, Brian Norris wrote:
> > -	mtd_device_parse_register(info->cmtd, part_probe_types, &ppdata,
> > +	mtd_device_parse_register(info->cmtd, part_probe_types, NULL,
> 
> Did you miss this one ?

What about it? I removed the parser data (the third argument), but I
can't yet drop the 2nd argument, since those parser types are
different than the defaults. So I can't drop any more arguments, nor can
I convert this to mtd_device_register().

(Now, I'd like to improve the device tree handling of parser types, so
we don't need any more specialized handling in drivers like this.)

> >  			NULL, 0);
> >  	of_free_probes(part_probe_types);
> > 
> 
> 
> This is really good, I like to see the ppdata nonsense finally going away.
> 
> Reviewed-by: Marek Vasut <marex@denx.de>

Thanks for the review! I'm happy to kill off much of this nonsense too.
And I think this will help in the long run on some other things too,
since now we have a canonical place to put common MTD bindings.

Brian
