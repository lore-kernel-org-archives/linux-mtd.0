Received: from alephnull.demon.nl ([83.160.184.112] helo=xi.wantstofly.org)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GIQys-0005nf-QL
	for linux-mtd@lists.infradead.org; Wed, 30 Aug 2006 15:23:51 +0100
Date: Wed, 30 Aug 2006 16:04:21 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
Subject: Re: PM for physmap.c ?
Message-ID: <20060830140421.GK19179@xi.wantstofly.org>
References: <44EC6F2F.7070508@imc-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44EC6F2F.7070508@imc-berlin.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 23, 2006 at 05:07:27PM +0200, Steven Scholz wrote:

> Hi all,

Hello,


> for quite some time physmap.c uses platform_{device,driver}.
> 
> I wonder why it does not contain any (generic) code for power management
> yet, i.e. .suspend/.resume functions.
> 
> Is it correct that all I would need to survive a suspend/resume cycle is
> something like
> 
> int physmap_flash_suspend(struct platform_device *dev, pm_message_t state)
> {
> 	struct sa_info *info = platform_get_drvdata(dev);
> 	int ret = 0;
> 	if (info)
> 		ret = info->mtd->suspend(info->mtd);
> 	return ret;
> }
> 
> int physmap_flash_resume(struct platform_device *dev)
> {
> 	struct sa_info *info = platform_get_drvdata(dev);
> 	if (info)
> 		info->mtd->resume(info->mtd);
> 	return 0;
> }
> 
> as stolen from sa1100-flash.c?

Looks OK to me, but that doesn't say much.


cheers,
Lennert
