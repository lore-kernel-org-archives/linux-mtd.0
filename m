Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cev8s-0000tn-OI
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 07:54:06 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e6.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id iBGCrt6q009526
	for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2004 07:53:55 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	iBGCrpqZ268890
	for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2004 07:53:55 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11/8.12.11) with ESMTP id iBGCrpR8002406
	for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2004 07:53:51 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
In-Reply-To: <1103158974.15929.37.camel@squizzey.bult.co.uk>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>
	<41C0D3AC.3050801@us.ibm.com>
	<1103158974.15929.37.camel@squizzey.bult.co.uk>
Content-Type: text/plain
Message-Id: <1103201631.25765.7.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Thu, 16 Dec 2004 06:53:51 -0600
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-12-15 at 19:02, Gareth Bult (Encryptec) wrote:
> Hi,

Quick FYI, don't top post.  The email gremlin will chase you down and
make you read http://david.woodhou.se/email.html if you break too many
rules ;)

> 
> Sure, the file I've been changing is blkmtd.c.

Ok, cool.

> 
> The device I'm aiming for and testing on is 256Mb with a 128k erase
> size.
> 
> Currently I'm using the code included in the 2.6.9 kernel source tree
> with tools from cvs as of about a week ago.

Ok, good.


> Is this likely to contain the latest speedups or should I be looking
> elsewhere?

That should have the speedups I was referring to.  Basically checking
the node CRCs is deferred until after mount time so the mount succeeds
much more quickly.

There is one more feature pending that I know of.  Ferenc Havasi has
some eraseblock summary changes that should help.  I believe the
intention was to commit that to JFFS3, but I haven't seen it go in yet.

josh
