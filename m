Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q1fh-0002uE-VL
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 10:13:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: roger <rogerxxmaillist@san.rr.com>
In-Reply-To: <1055322085.31819.31.camel@localhost3.localdomain>
References: <1055118239.10424.49.camel@localhost3.localdomain>
	 <1055322085.31819.31.camel@localhost3.localdomain>
Message-Id: <1055322846.2097.18.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 11 Jun 2003 10:14:07 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with using doc2001 module
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-11 at 10:01, roger wrote:
> ok. just for kicks. i booted into DOS using M-SYS's tffs_5.1.4_DOS_TOOLS
> and dinfo and dformat refused to find the DiskonChip even after
> specifing it's address of 0xfff00000.
> 
> something isn't right here.  it's obviously something with the code.  I
> also get the same results on a duplicate 440BX motherboard.
> 
> arrrghh.

The Linux DiskOnChip code doesn't do anything special to enable write
accesses to that region in your chipset. The DOS tools certainly won't.

Did you look at drivers/mtd/maps/amd76xrom.c, as I suggested? Did you
make a DOS tool to perform the same configuration, and run it before
attempting to use DFORMAT under DOS?


-- 
dwmw2
