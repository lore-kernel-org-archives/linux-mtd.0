Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OMi69-0001YN-4m
	for linux-mtd@lists.infradead.org; Thu, 10 Jun 2010 13:47:09 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1OMi66-00059C-Rc
	for linux-mtd@lists.infradead.org; Thu, 10 Jun 2010 15:47:06 +0200
Received: from amg-holding.md ([89.28.62.63])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jun 2010 15:47:06 +0200
Received: from egorkat by amg-holding.md with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jun 2010 15:47:06 +0200
To: linux-mtd@lists.infradead.org
From: Egorkat <egorkat@gmail.com>
Subject: Re: MTD support for old DoC chips MD2201-D72
Date: Thu, 10 Jun 2010 13:46:56 +0000 (UTC)
Message-ID: <loom.20100610T154548-504@post.gmane.org>
References: <loom.20100610T134317-652@post.gmane.org>
	<1276174914.9474.0.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2 <at> infradead.org> writes:

> 
> On Thu, 2010-06-10 at 12:43 +0000, Egorkat wrote:
> > 
> > Is it possible to add support for that chip in mtd? May be I can
> > supply more
> > information? 
> 
> What are the device and manufacturer IDs? Do you have
> CONFIG_MTD_NAND_MUSEUM_IDS set?
> 

I don't know device ids. Is there a way to find it out without recompiling the
kernel with that parameter?
