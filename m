Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Ctqcz-00011N-U1
	for linux-mtd@lists.infradead.org; Wed, 26 Jan 2005 12:06:53 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e6.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j0QH6j8S027729
	for <linux-mtd@lists.infradead.org>; Wed, 26 Jan 2005 12:06:45 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0QH6ihu285680
	for <linux-mtd@lists.infradead.org>; Wed, 26 Jan 2005 12:06:44 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j0QH6iSw002483
	for <linux-mtd@lists.infradead.org>; Wed, 26 Jan 2005 12:06:44 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501261534050.3222@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106730647.6480.190.camel@localhost.localdomain>
	<Pine.LNX.4.58.0501261534050.3222@phoenix.infradead.org>
Content-Type: text/plain
Message-Id: <1106759204.6955.43.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Wed, 26 Jan 2005 11:06:44 -0600
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 memory consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-26 at 09:57, Artem B. Bityuckiy wrote:
> On Wed, 26 Jan 2005, David Woodhouse wrote:
> 
> > On Wed, 2005-01-26 at 08:44 +0000, Artem B. Bityuckiy wrote:
> > > K1 is decreased by the Ferenc Havasi's "summary" patch well. Would be
> > > nice to decrease K2 either. Any Ideas how to do so?
> > 
> > For a start, we can increase the maximum node size. Limiting it to
> > PAGE_SIZE means we have a larger number of nodes than we'd otherwise
> > have. If we quadruple that, we'll probably end up with about a third as
> > many nodes. 
> I thought about to have several 4K chunks within one node. Thus we will 
> keep reading fast but will have few nodes number. Didi you mean this?

If you use larger "chunks" you'll get better overall compression.  E.g. 
a 64KiB node should compress better than a 4KiB node.  This is partially
how squashfs achieves better compression that cramfs.

So the end result is better compression and fewer nodes.

josh
