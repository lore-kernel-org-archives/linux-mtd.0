Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfHdA-0005Cu-9p
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2004 07:54:49 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e6.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id iBHCsg6q029968
	for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2004 07:54:42 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	iBHCsbjn282258
	for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2004 07:54:42 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11/8.12.11) with ESMTP id iBHCsRZl024397
	for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2004 07:54:27 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
In-Reply-To: <1103233669.15929.81.camel@squizzey.bult.co.uk>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>
	<41C0D3AC.3050801@us.ibm.com>
	<1103158974.15929.37.camel@squizzey.bult.co.uk>
	<1103201631.25765.7.camel@weaponx.rchland.ibm.com>
	<1103232128.15927.70.camel@squizzey.bult.co.uk>
	<41C1FDFF.3020308@us.ibm.com>
	<1103233669.15929.81.camel@squizzey.bult.co.uk>
Content-Type: text/plain
Message-Id: <1103288058.3018.4.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Fri, 17 Dec 2004 06:54:18 -0600
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

On Thu, 2004-12-16 at 15:47, Gareth Bult (Encryptec) wrote:
> 
> blkmtd.c is pretty much a rewrite, less than half the size and uses the
> system buffer cache instead of reading / writing directly to the device.
> This boosts performance x 3 on read x lots on write. [I get x 100
> faster] (albeit you lose bad block detection on write)

Hm, ok.  An alternative to using the system buffer would be to make
JFFS[23] use a write buffer for those devices.  It's already done on
NAND which has some special handling.  The support for ECC'd NOR
probably matches more closely what you'd want to do.  Take a look at
wbuf.c.

> 
> If anyone's interested in the code, let me know and I'll clean it up and
> post it .. however it'll be a new file and not a patch.

Well, if it's better than the original we can always take yours and
replace what's there.  Send it on, performance gains are always
welcome.  I'm sure there are others interested in what you've done that
will review the code.

josh
