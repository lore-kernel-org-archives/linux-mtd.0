Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgQUr-0000pR-34
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2004 11:34:58 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e3.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id iBKGYsV8020870
	for <linux-mtd@lists.infradead.org>; Mon, 20 Dec 2004 11:34:54 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	iBKGYs5X278596
	for <linux-mtd@lists.infradead.org>; Mon, 20 Dec 2004 11:34:54 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id iBKGYsDr002163
	for <linux-mtd@lists.infradead.org>; Mon, 20 Dec 2004 11:34:54 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20041218160255.GA1083@wohnheim.fh-wedel.de>
References: <1103232128.15927.70.camel@squizzey.bult.co.uk>
	<41C1FDFF.3020308@us.ibm.com>
	<1103233669.15929.81.camel@squizzey.bult.co.uk>
	<1103288058.3018.4.camel@weaponx.rchland.ibm.com>
	<1103297611.15917.184.camel@squizzey.bult.co.uk>
	<41C3030D.8040607@us.ibm.com>
	<1103302002.15927.198.camel@squizzey.bult.co.uk>
	<41C31307.70909@us.ibm.com>
	<1103304360.15914.210.camel@squizzey.bult.co.uk>
	<41C318C8.4030702@us.ibm.com>
	<20041218160255.GA1083@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=
Message-Id: <1103560493.25853.31.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 20 Dec 2004 10:34:54 -0600
Content-Transfer-Encoding: 8bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	"Gareth Bult \(Encryptec\)" <Gareth@Encryptec.net>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-12-18 at 10:02, Jörn Engel wrote:
> On Fri, 17 December 2004 11:35:04 -0600, Josh Boyer wrote:
> > 
> > Again, most controllers do all the wear leveling, erasing for you.  So 
> > you are left with compression, right?
> 
> If you have enough trust in your El Cheapo hardware supplier.  There
> is no standard that requires wear leveling and there are reports that
> basically tell you to do your own wear leveling on some devices.  With
> no good way to distinguish "some" devices from "others", you can read
> that as "all". ;)

Ok, that's why I said "most".  And if your El Cheapo hardware has built
in wear leveling, then doing wear leveling on top of that is always
questionable.  It might not make things worse, but it's probably not
very efficient.

Now if you have El Super Cheapo hardware that explicitly states you need
to do wear leveling, that's a different story ;).

> 
> USB keys and all the various other consumer-type flash devices are
> good enough to beat 3 1/2" floppies, that's about it.  But that's
> quite good enough for most people.  Floppies sold like crazy after
> all.

That's because it was the only removable media for PCs for a long time. 
At least to the non-geeks.  I can remember buying spare hard drives and
carrying those from machine to machine if I needed to do big transfers
;).

josh
