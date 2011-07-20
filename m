Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjPjy-0005eL-Ny
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 05:54:39 +0000
Received: by iyn15 with SMTP id 15so5360004iyn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2011 22:54:36 -0700 (PDT)
Subject: Re: [PATCH 00/11] mtd: change printks to pr_*
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 20 Jul 2011 08:50:38 +0300
In-Reply-To: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
References: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1311141042.20738.158.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-07-19 at 10:06 -0700, Brian Norris wrote:
> We've had quite some discussion about whether to use printk, pr_*, or
> dev_* functions for printing info, error, and debugging messages.
> Unfortunately, MTD doesn't quite have a nice device model, so we can't
> always use dev_* to print nice device information. This patch series
> mostly transitions the NAND subsystem to use pr_* functions, which are
> a little more brief and slightly more flexible than printk.
> 
> Along the way, we've dumped a lot of old DEBUG() code that was written
> specifically for MTD in favor of dynamic debugging. I tried killing the
> corresponding Kconfig options as well. Not sure if patches 9 and 10 are
> necessary.
> 
> These patches apply on top of l2-mtd-2.6.git
> 
> Brian
> 
> Brian Norris (11):
>   mtd: nand: change KERN_DEBUG to KERN_INFO
>   mtd: nand: convert printk() to pr_*()
>   mtd: nand: style fixups in pr_* messages
>   mtd: replace DEBUG() with pr_debug()
>   mtd: cleanup style on pr_debug messages
>   mtd: pcmciamtd: remove custom DEBUG() function
>   mtd: remove CONFIG_MTD_DEBUG
>   mtd: cleanup last uses of MTD_DEBUG config macros
>   arch: remove references to CONFIG_MTD_DEBUG and
>     CONFIG_MTD_DEBUG_VERBOSE
>   arch: remove references to CONFIG_MTD_PARTITIONS
>   mtd: Kbuild: remove reference to MTD_PARTITIONS

Pushed the series to the l2-mtd-2.6.git tree, except of the 2 "arch:
blah" patches. I think for defconfigs the practice is that the owners
update them themselves. People who use the defconfigs will not have
problems anyway because a non-existing Kconfig options like
CONFIG_MTD_PARTITIONS will be ignored.

Besides, there was a big hassle around defconfigs recently. In short -
Linus did not like that ARM defconfigs are constanly changing and add a
lot of noise.

Thanks!



-- 
Best Regards,
Artem Bityutskiy
