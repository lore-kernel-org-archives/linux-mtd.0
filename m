Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 156wq4-0003H5-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Jun 2001 17:04:20 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010604175814.A16342@crystal.2d3d.co.za> 
References: <20010604175814.A16342@crystal.2d3d.co.za> 
To: Abraham vd Merwe <abraham@2d3d.co.za>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: read/write functions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 04 Jun 2001 17:00:26 +0100
Message-ID: <16748.991670426@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

abraham@2d3d.co.za said:
>  Do you need to implement all read/write/copy functions in the map
> driver even if your chip driver only uses some of those functions?

> For example, let's say I only use map->read32() and map->write32(), do
> I still need map->read16(), etc in my map driver or can I just leave
> them uninitialized (NULL)? 

You can leave them NULL. If any chip driver calls them it's buggy, so it'll 
oops.

--
dwmw2
