Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MPZxY-0007JI-IB
	for linux-mtd@lists.infradead.org; Sat, 11 Jul 2009 10:37:42 +0000
Subject: Re: [PATCH / RESENT #3] mtd: let include/linux/mtd/partitions.h
	stand on its own
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <alpine.LFD.2.00.0907101448360.3138@xanadu.home>
References: <alpine.LFD.2.00.0907101448360.3138@xanadu.home>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 11 Jul 2009 13:37:09 +0300
Message-Id: <1247308629.20721.371.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-07-10 at 14:51 -0400, Nicolas Pitre wrote:
> When declaring static MTD partitions in board specific code, only
> including include/linux/mtd/partitions.h should suffice without
> gcc nagging us with:
> 
> In file included from arch/arm/mach-kirkwood/sheevaplug-setup.c:14:
> include/linux/mtd/partitions.h:50: warning: 'struct mtd_info' declared inside parameter list
> include/linux/mtd/partitions.h:50: warning: its scope is only this definition or declaration, which is probably not what you want
> include/linux/mtd/partitions.h:51: warning: 'struct mtd_info' declared inside parameter list
> include/linux/mtd/partitions.h:61: warning: 'struct mtd_info' declared inside parameter list
> include/linux/mtd/partitions.h:67: warning: 'struct mtd_info' declared inside parameter list
> 
> Signed-off-by: Nicolas Pitre <nico@marvell.com>

I've put your patch to l2-mtd-2.6.git some time ago:
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git?a=commit;h=6d2bca50119cb620f61809ddfcf2d7d416264400

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
