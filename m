Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CU821-0001t2-Tn
	for linux-mtd@lists.infradead.org; Tue, 16 Nov 2004 13:26:23 -0500
From: David Woodhouse <dwmw2@redhat.com>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20041112135322.GB7707@stusta.de>
References: <20041112135322.GB7707@stusta.de>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Message-Id: <1100629567.8191.6993.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 16 Nov 2004 18:26:07 +0000
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [2.6 patch] MTD: some cleanups
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-11-12 at 14:53 +0100, Adrian Bunk wrote:
> The patch below makes the following cleanups for code under drivers/mtd/ :
> - make some needlessly global code static

OK.

> - remove the following unused code:
>   - function ftl_freepart in drivers/mtd/ftl.c

It's a bug that we never free these. We should call the function
occasionally instead of deleting it.

>   - functions nettel_eraseconfig and nettel_erasecallback,
>    struct nettel_erase in drivers/mtd/maps/nettel.c

The nettel_eraseconfig() function isn't static -- I assume it was called
from the nettel-specific platform code.

>   - function physmap_set_partitions in drivers/mtd/maps/physmap.c

Again that's called from elsewhere.

-- 
dwmw2
