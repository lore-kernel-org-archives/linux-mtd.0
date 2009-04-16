Received: from mail.wantstofly.org ([2001:888:11ff:97::11])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LuT9G-0002wy-Ps
	for linux-mtd@lists.infradead.org; Thu, 16 Apr 2009 15:05:10 +0000
Date: Thu, 16 Apr 2009 17:06:30 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: Bug in physmap driver?
Message-ID: <20090416150630.GR1760@mail.wantstofly.org>
References: <5680.1239894019@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5680.1239894019@redhat.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 16, 2009 at 04:00:19PM +0100, David Howells wrote:

> In physmap_flash_probe(), isn't the '+ 1' in:
> 
> 		info->map[i].size = dev->resource[i].end - dev->resource[i].start + 1;
> 
> incorrect?  It results in an artificially inflated size:
> 
> (gdb) p info->map[0]
> $7 = {name = 0xc08aa520 "physmap-flash.0", size = 0x200001,

That would suggest that dev->resource[i].end is off-by-one?
