Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q1JS-0002Ay-W6
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 09:50:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Pantelis Antoniou <panto@intracom.gr>
In-Reply-To: <3EE6EBA0.3080508@intracom.gr>
References: <3EE6EBA0.3080508@intracom.gr>
Message-Id: <1055321465.2097.9.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 11 Jun 2003 09:51:06 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Cram FS on NAND - How to do this?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-11 at 09:43, Pantelis Antoniou wrote:
> Hi
> 
> As it currently stands the only filesystems supporting
> raw NAND flash are:
> 
> JFFS2: Read/write, compressed, best support, slow startup.
> YAFFS: Read/write, not compressed, newcomer, fast startup.
> 
> I have a requirement to have a compressed read only
> root filesystem in my board and I've come to the
> conclussion that the best fit would be CRAMFS if only
> had any concept of bad blocks.

I think it would probably be better to implement this as a block device
driver, or perhaps as an extension to the existing mtdblock/mtdblock_ro
drivers.

-- 
dwmw2
