Received: from e32.co.us.ibm.com ([32.97.110.130])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp7Fa-0005ju-Nv
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 10:51:09 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e32.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j0DFocul705762
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jan 2005 10:50:38 -0500
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0DFoc8x284872
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jan 2005 08:50:38 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	j0DFobRo031497
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jan 2005 08:50:38 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce05011214553465438@mail.gmail.com>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<Pine.LNX.4.58.0501121708100.10617@phoenix.infradead.org>
	<6934efce0501121430471e55a8@mail.gmail.com>
	<1105569824.3896.44.camel@weaponx.rchland.ibm.com>
	<6934efce05011214553465438@mail.gmail.com>
Content-Type: text/plain
Message-Id: <1105631437.15265.12.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Thu, 13 Jan 2005 09:50:37 -0600
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-12 at 16:55, Jared Hulbert wrote:
> 
> I respectfully disagree.  I don't think checksums are needed to
> protect you from NOR read errors *unless* the checksums are the only
> thing protecting the filesystem from bad things like crashes, power
> failures, and bugs.

Guess we'll have to agree to disagree then :).  All I know is that I
want to be damn sure that the data I'm returning isn't totally screwed. 
Call me paranoid.  A checksum is the only way I know of doing that.

David summed it up pretty good.  Crap happens in a multitude of ways. 
Even a bug in the write method of the filesystem could cause invalid
data to be written.  A checksum can at least help point stuff like that
out.

Poo is icky.  I'd rather try to go around it than jump in the middle of
it. :)
