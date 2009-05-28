Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9hWd-00038g-BZ
	for linux-mtd@lists.infradead.org; Thu, 28 May 2009 15:28:18 +0000
Subject: Re: [PATCH 1/3] mtd/maps: uclinux: allow systems to override map
	addr/size
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1243380798-10089-1-git-send-email-vapier@gentoo.org>
References: <20090526231902.GA6295@linux-sh.org>
	<1243380798-10089-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 28 May 2009 18:26:27 +0300
Message-Id: <1243524387.11172.64.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: uclinux-dev@uclinux.org, linux-kernel@vger.kernel.org,
	Paul Mundt <lethal@linux-sh.org>, linux-mtd@lists.infradead.org,
	Greg Ungerer <gerg@uclinux.org>, uclinux-dist-devel@blackfin.uclinux.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-05-26 at 19:33 -0400, Mike Frysinger wrote:
> Due to a processor anomaly (05000263 to be exact), most Blackfin parts
> cannot keep the embedded filesystem image directly after the kernel in
> RAM.  Instead, the filesystem needs to be relocated to the end of memory.
> As such, we need to tweak the map addr/size during boot for Blackfin
> systems.  This can be done in any early arch/board init code.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> CC: Paul Mundt <lethal@linux-sh.org>
> CC: Greg Ungerer <gerg@uclinux.org>
> CC: uclinux-dev@uclinux.org
> CC: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/maps/uclinux.c |   10 ++++++----
>  1 files changed, 6 insertions(+), 4 deletions(-)

I've added your patches to my tree.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
