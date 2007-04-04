Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HZ0FF-0001sz-7K
	for linux-mtd@lists.infradead.org; Wed, 04 Apr 2007 08:49:32 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HZ0F2-0002zz-Nm
	for linux-mtd@lists.infradead.org; Wed, 04 Apr 2007 09:49:16 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Apr 2007 09:49:16 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Apr 2007 09:49:16 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: MEMGETREGIONCOUNT ioctl
Date: Wed, 4 Apr 2007 07:49:05 +0000 (UTC)
Message-ID: <loom.20070404T094706-969@post.gmane.org>
References: <00b401c77683$d0be6340$fd09a8c0@jitendrajain>
	<004501c77688$88c0b930$74fbfea9@gavinlpc>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gavin Lambert <gavinl <at> compacsort.com> writes:

> 
> I'm a bit of an MTD newbie myself, so I could be wrong about some of
> this, but:
> 
> Quoth Jitendra Jain [jitendra.jain <at> einfochips.com]:
> > As per the driver, the MEMGETREGIONCOUNT returns the
> > parameter numeraseregions, which is meant to signify if the
> > flash erase size is same throughout or whether it has
> > variable sized sectors (which is found on NOR flash devices).
> > Why does the util denote that number as number of erase regions ??
> 
> Because that's sort of what it is.  If your driver doesn't support the
> ioctl at all then callers assume the erase size is constant as given in
> the erasesize field of MEMGETINFO.  If it does support the ioctl, then
> callers expect it to return the number of erase block size-change
> thresholds (since a region can cover multiple erase blocks, provided
> they're contiguous and of the same size).

Perhaps this suggests that the ioctl documentation could be made
clearer or more explicit in this area ...

Regards,
MikeW



=gmane-pad==gmane-pad==gmane-pad==gmane-pad==gmane-pad==gmane-pad=
