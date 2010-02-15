Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NhAzW-0008IF-G0
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 00:08:42 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1NhAzS-0002rD-Rs
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 01:08:34 +0100
Received: from chipmunk.wormnet.eu ([195.195.131.226])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2010 01:08:34 +0100
Received: from alex by chipmunk.wormnet.eu with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2010 01:08:34 +0100
To: linux-mtd@lists.infradead.org
From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: Filesystem advice
Date: Mon, 15 Feb 2010 23:54:02 +0000
Message-ID: <qd3p47-jbg.ln1@chipmunk.wormnet.eu>
References: <fcf894b71002151308i1a091f76rc6703734a0ea2164@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Volker Aßmann <volker.assmann@googlemail.com> wrote:
> 
> Sorry if this post is a bit off-topic for this mailing list, but this
> seams to be the best place to ask. We are currently using an embedded
> linux system with a compact flash drive and ext3 as a filesystem. Due
> to frequent power failures, we are often experiencing filesystem
> corruption problems, and thus want to replace this setup with a better
> option. My options / questions:
> 
> 1. Replace ext3 with UBIFS or JFFS2 using the MTD-Blockdevice
> emulation layer. Would this setup improve the reliability of our
> system with respect to power failures, and if yes which is better
> suited? Of course this approach would not improve the wear leveling,
> but would it make it worse / probably confuse the integrated flash
> controller?
>
....I always found mounting with 'sync' plus 'ro' in places that I could 
(along with liberal use of tmpfs) made for a very reliable setup.  That 
was for ext3.
 
I would be inclined to look at nilfs2 as it sounds like the type of 
thing you would be looking for?

> 3. In case both solutions are not viable, could you give an educated
> guess on which traditional filesystem would be better suited for this
> use case than ext3?
> 
Alot of corruption can be due to braindead userland expectations.  
Generally this means the userland tools need to learn about fsync().

Cheers

-- 
Alexander Clouter
.sigmonster says: Walk softly and carry a megawatt laser.
