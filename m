Received: from e31.co.us.ibm.com ([32.97.110.129])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CpAYT-0002hV-Kj
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 14:22:51 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e31.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j0DJMkm4250110
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jan 2005 14:22:46 -0500
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0DJMj8x268346
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jan 2005 12:22:45 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	j0DJMjG3012928
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jan 2005 12:22:45 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1105641413.26551.230.camel@hades.cambridge.redhat.com>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<Pine.LNX.4.58.0501121708100.10617@phoenix.infradead.org>
	<6934efce0501121430471e55a8@mail.gmail.com>
	<1105569824.3896.44.camel@weaponx.rchland.ibm.com>
	<6934efce05011214553465438@mail.gmail.com>
	<1105631437.15265.12.camel@weaponx.rchland.ibm.com>
	<6934efce050113103077c06b4d@mail.gmail.com>
	<1105641413.26551.230.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Message-Id: <1105644164.15265.18.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Thu, 13 Jan 2005 13:22:44 -0600
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-01-13 at 12:36, David Woodhouse wrote:
> On Thu, 2005-01-13 at 10:30 -0800, Jared Hulbert wrote:
> > I think it says it's worth adding a no-checksum option to serve this
> > potential userbase that just doesn't need the checksums but does need
> > the speed.
> 
> You may be right. That doesn't make me relish the thought of providing
> support to people who do that though :)
> 
> Perhaps we could make it a mount option, and that way it's easy enough
> for people to turn it on if they have problems, before we'll talk to
> them about it.

Sure, and option would be fine with me.  Just as long as there is the
choice for those of us in the tin-foil hats :).

josh
