Received: from e35.co.us.ibm.com ([32.97.110.133])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CYpI7-0001LN-Tp
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2004 12:26:25 -0500
Received: from westrelay03.boulder.ibm.com (westrelay03.boulder.ibm.com
	[9.17.195.12])
	by e35.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id iATHQJQf037880
	for <linux-mtd@lists.infradead.org>; Mon, 29 Nov 2004 12:26:19 -0500
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by westrelay03.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	iATHQIOG169268
	for <linux-mtd@lists.infradead.org>; Mon, 29 Nov 2004 10:26:19 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	iATHQIJN025436
	for <linux-mtd@lists.infradead.org>; Mon, 29 Nov 2004 10:26:18 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: Rainer Weikusat <rainer.weikusat@sncag.com>
In-Reply-To: <87hdn8fwk4.fsf@farside.sncag.com>
References: <200411291024906.SM01112@ACarlisle>
	<1101742712.23997.2.camel@weaponx.rchland.ibm.com>
	<87hdn8fwk4.fsf@farside.sncag.com>
Content-Type: text/plain
Message-Id: <1101749178.23997.22.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 29 Nov 2004 11:26:18 -0600
Content-Transfer-Encoding: 7bit
Cc: Andrew Carlisle <ACarlisle@acmepacket.com>, linux-mtd@lists.infradead.org
Subject: Re: Multiple banks of flash?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-11-29 at 10:29, Rainer Weikusat wrote:
> Josh Boyer <jdub@us.ibm.com> writes:
> > On Mon, 2004-11-29 at 09:15, Andrew Carlisle wrote:
> >> I have two banks of flash that are physically located at different
> >> locations.  I have successfully mapped one bank.  I can also map the other
> >> bank, but the problem is that I can't map both the banks simultaneously.
> >> 
> >> I went into physmap.c and modified init_physmap() so that it basically does
> >> the same thing twice, two probes, two partition searches, but it doesn't
> >> seem to work mapping two banks which are located at different address mapped
> >> in at the same time.
> >> 
> >> I am using the Monta Vista 2.6 version of the kernel.
> >
> > Joern Engel wrote a mphysmap driver some time ago.  It works fairly
> > well.  You might be able to find it if you google for it.  Not sure why
> > it wasn't included in MTD CVS.
> 
> Various people have written something like this at different times
> :->.

Indeed.  Joern's just happened to be the one I am most familiar with. 
But since lots of different implementations have been written, it makes
one wonder why none are in CVS...

josh
