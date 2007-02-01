Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HCc8a-0007p3-LX
	for linux-mtd@lists.infradead.org; Thu, 01 Feb 2007 08:38:10 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e3.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l11DZrP0021914
	for <linux-mtd@lists.infradead.org>; Thu, 1 Feb 2007 08:35:53 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l11DZrhK271882
	for <linux-mtd@lists.infradead.org>; Thu, 1 Feb 2007 08:35:53 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l11DZrSF006572
	for <linux-mtd@lists.infradead.org>; Thu, 1 Feb 2007 08:35:53 -0500
Subject: Re: [RFC] [PATCH 1/1] [MTD] UBI: implement per-volume update
From: Frank Haverkamp <haver@vnet.ibm.com>
To: tglx@linutronix.de
In-Reply-To: <1170335439.29240.277.camel@localhost.localdomain>
References: <20070201102105.15629.61206.sendpatchset@localhost.localdomain>
	<20070201102111.15629.24289.sendpatchset@localhost.localdomain>
	<1170335439.29240.277.camel@localhost.localdomain>
Content-Type: text/plain
Date: Thu, 01 Feb 2007 14:35:45 +0100
Message-Id: <1170336945.15083.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alexander Schmidt <alexs@linux.vnet.ibm.com>, linux-mtd@lists.infradead.org
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

On Thu, 2007-02-01 at 14:10 +0100, Thomas Gleixner wrote:
> On Thu, 2007-02-01 at 12:21 +0200, Artem Bityutskiy wrote:
> > This patch removes the global update marker support and everything
> > related to it. Now we have per-volume update marker bit in the
> > volume table. This makes us incompatible with older UBI images but
> > this is not a big deal - UBI is not used so widely so far and we
> > can afford dropping legacy stuff now.
> 
> Uuurgh. Incompatible in what way ? Does this mean you cannot boot from
> an existing image anymore ?

No if that would be the case, I would have objected to the patch.
What it should do is to remove the need to have the update marker
block. Instead of the update marker block Alexander is using a flag in
the volume info table per volume to indicate that an update is going on.

> 
> 	tglx

The compatibility issue is that if you want to update a system with 
a not yet cleaned up "old style update marker" the new kernel does
not know what to do with the now unknown ubi-update-volume. The
compatibility flag we decided for the update-volume is "reject", which
will cause ubi not to accept the mtd.

Frank
