Received: from mail.wantstofly.org ([2001:888:11ff:97::11])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O47zD-0000ch-24
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2010 07:35:13 +0000
Date: Tue, 20 Apr 2010 09:35:03 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: Can PYSMAP_COMPAT go?
Message-ID: <20100420073503.GL4586@mail.wantstofly.org>
References: <20100420063547.GH19957@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100420063547.GH19957@pengutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 20, 2010 at 08:35:47AM +0200, Wolfram Sang wrote:

> triggered by bug-report #15729 (thread at [1]), I wondered where default "0"
> for MTD_PHYSMAP_LEN came from and found
> 73566edf9b91dd085ddb12033d0ea7288979dd10. Its description says:
> 
>     Once all physmap users have been converted to instantiate their own
>     platform devices, the compat code can go.  (Or we decide that we can
>     change all the in-tree users at the same time, and never merge the
>     compat code.)
> 
> Grepping for current users:
> 
> ~/Kernel/linux-2.6/arch$ grep -r 'MAP_COMPAT' * | grep -v 'is not set'
> sh/configs/polaris_defconfig:CONFIG_MTD_PHYSMAP_COMPAT=y
> 
> This one could be fixed and then the compat code could be removed. I'd pick up
> the job, if I get a sign that this has a chance to go in. Or shall compat stay
> for a reason?

COMPAT needs to die.  There are at least two other ways of specifying
the same info (device tree or manual instantiation of a platform device
from your platform code), and we really shouldn't allow specifying this
in the .config as that will just give people other crazy ideas.
