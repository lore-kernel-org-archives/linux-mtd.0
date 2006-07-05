Received: from herkules.vianova.fi ([194.100.28.129] helo=mail.vianova.fi)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fy4I7-0005wx-HI
	for linux-mtd@lists.infradead.org; Wed, 05 Jul 2006 06:07:37 -0400
Date: Wed, 5 Jul 2006 13:07:27 +0300
From: Ville Herva <vherva@vianova.fi>
To: Norbert Federa <nfedera@thinstuff.com>
Subject: Re: block2mtd: Overrun end of disk in cache readahead
Message-ID: <20060705100727.GC15078@vianova.fi>
References: <20060705072614.GQ6240@vianova.fi> <44AB6EFA.9000604@thinstuff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44AB6EFA.9000604@thinstuff.com>
Cc: linux-mtd@lists.infradead.org
Reply-To: vherva@vianova.fi
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 05, 2006 at 09:49:14AM +0200, you [Norbert Federa] wrote:
> Ville,
> Try changing the PAGE_READAHEAD define in
> /drivers/mtd/devices/block2mtd.c from 64 to 0:
> 
> -#define PAGE_READAHEAD 64
> +#define PAGE_READAHEAD 0

Thanks.

Looking at the source, it almost looks like the error message is just a
spurious warning, not a dangerous error. Doesn't this happen when the
underlying device does not end at 64k boundary? And the readahead code just
stops reading ahead after that warning?



-- v -- 

v@iki.fi
