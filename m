Received: from main.gmane.org ([80.91.224.249])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BvdIz-0007lr-L4
	for linux-mtd@lists.infradead.org; Fri, 13 Aug 2004 10:45:21 -0400
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1BvdIw-0006xA-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Aug 2004 16:45:14 +0200
Received: from a2125958202.net-htp.de ([212.59.58.202])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Aug 2004 16:45:14 +0200
Received: from sst by a2125958202.net-htp.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Aug 2004 16:45:14 +0200
To: linux-mtd@lists.infradead.org
From: Stefan =?utf-8?b?U3TDvHJrZQ==?= <sst@pandatel.com>
Date: Fri, 13 Aug 2004 14:45:11 +0000 (UTC)
Message-ID: <loom.20040813T164242-792@post.gmane.org>
References: <loom.20040813T140134-351@post.gmane.org>
	<1092400305.10618.145.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
Subject: Re: mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2 <at> infradead.org> writes:

> 
> On Fri, 2004-08-13 at 12:02 +0000, Stefan Stürke wrote:
> > My problem is, that I cannot be sure which erasesize the
> > target flash will have. Because two flash types with different
> > sector sizes (64k and 128k) have to be supported.
> > 
> > Is it possible to create a jffs2 image that can run on both flashes,
> > or do I have to create two diffenent images?
> 
> You can use the smaller erasesize, as long as you don't include
> cleanmarkers. 
> 
> > My current command for creating the filesystem is:
> > 
> > mkfs.jffs2 -b -e $erasesize -p -r $source -o fs.jffs2
> 
> Use:
>  -b -e 64KiB -p -n -r $source -o fs.jffs2
> 

Ok, thank you, that looks much better.
When I load this filesystem to the flashdevice with the 128k sectors
I get now only one type of error messages:

jffs2_scan_empty(): Empty block at 0x0000fffc ends at 0x00010000 (with
0x1985e002)! Marking dirty

Is it save to ignore these errors?

Thanks again
Stefan
