Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MLxLq-00024g-6f
	for linux-mtd@lists.infradead.org; Wed, 01 Jul 2009 10:47:49 +0000
Subject: Re: UBIFS Crash with ubifs-v2.6.21-HEAD.tar
From: Artem Bityutskiy <dedekind@infradead.org>
To: naveen yadav <yad.naveen@gmail.com>
In-Reply-To: <9bde694e0906302031x7c0df0bbvcfe6c4e0063f9f3@mail.gmail.com>
References: <9bde694e0906302031x7c0df0bbvcfe6c4e0063f9f3@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jul 2009 13:47:07 +0300
Message-Id: <1246445227.20721.17.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-01 at 09:01 +0530, naveen yadav wrote:
> Hi all,
> 
>  I am using kernel 2.6.18. and i have backported from 2.6.21 to
> 2.6.18. when i add kernel command line parameter as ubi.mtd=exe
> ubi.mtd=2 .
> 
> i got crash in core.c file in function int device_add(struct device
> *dev). The reason for this i found is parent =
> get_device(dev->parent); is null.
> 
> can any body suggest where dev->parent value gets assigned.

Not sure, this is ancient kernel and I doubt anyone is interested
digging it. You may try luck at lkml though, but I fear you'll
have to dig this yourself.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
