Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qtah1-0007KV-H0
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 07:37:40 +0000
Received: by yic13 with SMTP id 13so602208yic.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Aug 2011 00:37:36 -0700 (PDT)
Subject: Re: [PATCH] mtd-utils: fix corrupt cleanmarker with flash_erase -j
	command
From: Artem Bityutskiy <dedekind1@gmail.com>
To: LiuShuo <b35362@freescale.com>
Date: Wed, 17 Aug 2011 10:39:17 +0300
In-Reply-To: <4E4B6F46.2050209@freescale.com>
References: <1312350638-25566-1-git-send-email-b35362@freescale.com>
	<1313507201.2679.2.camel@sauron> <4E4B6F46.2050209@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313566762.19563.3.camel@sauron>
Mime-Version: 1.0
Cc: linuxppc-dev@linux.freescale.net, Li Yang <leoli@freescale.com>,
	dwmw2@infradead.org, linux-mtd@lists.infradead.org, linuxppc-dev@ozlabs.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-17 at 15:35 +0800, LiuShuo wrote:
> I think We can add a new ioctl MEMSETOOBMODE for selecting a mode to 
> access the OOB area.
> 
> Add new member into struct mtd_info:
> 
> struct mtd_info {
>      ......
> 
>      enum {
>           MTD_OOB_PLACE,
>           MTD_OOB_AUTO,
>           MTD_OOB_RAW,
>      } oob_mode;
> }
> 
> In function mtd_do_writeoob() (in drivers/mtd/mtdchar.c) :
>      -  ops.mode = MTD_OOB_PLACE;
>      + ops.mode = mtd->oob_mode;
> 
> 
> 
> Could we do it like this ?

I think the OOB mode should not be a global MTD device state. Each
ioctl invocation should just specify the mode.

Brian's idea of having a completely new ioctl or a set of new ioctls for
OOB which would copletely deprecate the old ones is a good idea. Let's
wait for his patch.

May be we should even start physically removing depricated ioctls by
first adding a printk with a warning and then removing completely. But
first mtdutils should be updated to not use them.

-- 
Best Regards,
Artem Bityutskiy
