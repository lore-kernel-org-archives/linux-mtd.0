Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBo7g-0002yC-0J
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 13:04:12 +0000
Received: by ewy3 with SMTP id 3so1541055ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 06:04:10 -0700 (PDT)
Subject: RE: UBI partitioning in embedded device?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1104181449160.30071@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1104180839510.30071@lnxricardw.se.axis.com>
	<0A40042D85E7C84DB443060EC44B3FD32A6941578B@dekaexchange07.deka.local>
	<Pine.LNX.4.64.1104181449160.30071@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Apr 2011 16:01:15 +0300
Message-ID: <1303131675.8589.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
	Atlant Schmidt <aschmidt@dekaresearch.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-18 at 14:53 +0200, Ricard Wanderlof wrote:
> On Mon, 18 Apr 2011, Atlant Schmidt wrote:
> 
> > Ricard:
> >
> > One advantage of moving critical data (such as calibration
> > data) into its own partition is that because each partition
> > would absolutely positively *NOT* share its PEBs (Physical
> > Erase Blocks) with any other partition, data stored in
> > those partitions would then be better-insulated from
> > "disturb" effects (such as "program disturb" and "read
> > disturb") caused by the reading and writing of other data.
> >
> > Generally, the "disturb" effects only take place within Flash pages and 
> > from one Flash page to another.
> 
> But is it even possible to have an UBI volume less than one eraseblock in 
> size? Normally a UBI volume would be several eraseblocks, so there's no 
> chance of any eraseblocks being shared at any one time between different 
> UBI volumes.
> 
> I've always thought that because UBI volumes are measured in 
> number-of-LEBs, that each volume in practice gets its own PEBs, even 
> though of course UBI can move them around in the flash if it wants to.

That's right, minimum size is one LEB. Probably Atlant meant that UBI
will move data around, so the same PEBs will be "shared", meaning that
today your critical calibration data is in PEB 1, tomorrow PEB 1
contains some random non-critical stuff.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
