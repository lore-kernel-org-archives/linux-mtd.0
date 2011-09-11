Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2ji3-0006dA-KI
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 13:04:32 +0000
Received: by yxi11 with SMTP id 11so2863169yxi.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 06:04:30 -0700 (PDT)
Subject: Re: [PATCH 00/10] nandwrite: cleanup, support ioctl(MEMWRITE)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 11 Sep 2011 16:06:56 +0300
In-Reply-To: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
References: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315746420.18731.50.camel@sauron>
Mime-Version: 1.0
Cc: b35362@freescale.com, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-31 at 13:00 -0700, Brian Norris wrote:
> This patch series cleans up old features in nandwrite and supports new
> features with ioctl(MEMWRITE).
> 
> Byproducts of this include:
> (1) kill --raw
> (2) re-implement --autoplace
> (3) support OOB writes for MLC NAND (only write once per page)

I do not have time to thoroughly review the patches, but they look good,
and you make a great job splitting making then easy to follow by
splitting nicely.

I am not very comfortable with "no warning" --raw removal, but we can
try it this way, I guess, it is unlikely someone will be hurt, but there
is some probability.

And last but not least, I think we should not push your changes to the
master branch of mtd-utils _befor_ the corresponding kernel-space
changes have reached Linuses tree (e.g., dwmw2 might dislike something).

So I pushed 2 patches which look independent to the master branch, and
the rest are in the 'brian' branch so far.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
