Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ASPDu-0001sw-Tj
	for <linux-mtd@lists.infradead.org>; Fri, 05 Dec 2003 23:19:00 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <Pine.LNX.4.53.0312052158410.3295@pink.linuxgrrls.org>
References: 
	 <77FE4A1FA59FF947845A42194AD667620A0F4E@uswaumsx07medge.med.ge.com>
	 <Pine.LNX.4.53.0312052158410.3295@pink.linuxgrrls.org>
Message-Id: <1070666214.8421.4.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 05 Dec 2003 23:16:54 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
cc: "Howard, Michael \(MED\)" <Michael.Howard@med.ge.com>
Subject: Re: Why restrict to page aligned writes in nand_write_ecc() ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-12-05 at 22:00 -0100, Jasmine Strong wrote:
> On Fri, 5 Dec 2003, Howard, Michael (MED) wrote:
> 
> > My nand flash has a 2k page size.  This restriction causes all JFFS2 writes
> > to fail.  Cleanmarkers can't be written (12 bytes) and inodes that come in
> > at 68 bytes are also rejected.  In order to get JFFS2 working, is it better
> > to remove this restriction at the driver level or must all nodes be padded
> > out to 2048 bytes in JFFS2?
> 
> For jffs2 to work properly it's pretty much essential to support partial
> page writing.  You also need to support subsequent writes to the same
> partially-written page.

No. The current JFFS2 code handles batching writes up into page-sized
chunks just fine.

-- 
dwmw2
