Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKSEg-0000dX-GI
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 09:31:11 +0000
Received: by eyh6 with SMTP id 6so436716eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 02:31:08 -0700 (PDT)
Subject: Re: inappropriate ioctl when attaching
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Wagner <david.wagner@free-electrons.com>
In-Reply-To: <4DCAB697.90906@free-electrons.com>
References: <4DCAB697.90906@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 12:27:48 +0300
Message-ID: <1305192468.2713.66.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wed, 2011-05-11 at 18:17 +0200, David Wagner wrote:
> # ubiattach -p /dev/mtd2
> ubiattach: error!: cannot attach "/dev/mtd2"
>            error 25 (Inappropriate ioctl for device)
> 
> I've never seen this and google doesn't help much. I could flash a jffs2
> image w/o problem.
> 
> Does anybody have a pointer != NULL ?

This probably means you are using too kernel where UBI does not support
this ioctl. Dynamic attach / detach were not part of the initial UBI
which want into the kernel, AFAIR.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
