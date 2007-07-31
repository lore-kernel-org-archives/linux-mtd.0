Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IFuWE-0005Fs-O1
	for linux-mtd@lists.infradead.org; Tue, 31 Jul 2007 12:25:48 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1IFuW2-00071r-OF
	for linux-mtd@lists.infradead.org; Tue, 31 Jul 2007 18:24:11 +0200
Received: from 57.66.65.38 ([57.66.65.38])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2007 18:24:10 +0200
Received: from mw_phil by 57.66.65.38 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2007 18:24:10 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: Unlocking with Intel J3 series flash
Date: Tue, 31 Jul 2007 16:23:58 +0000 (UTC)
Message-ID: <loom.20070731T181922-722@post.gmane.org>
References: <20070731153547.GA24705@marvin.netwinder.org>
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

Ralph Siemsen <ralphs <at> netwinder.org> writes:

> 
> Greetings,
> 
> When using Intel J3 flash, unlocking operations are horribly slow.
> The reason for this is that the J3 has "Flexible Block-locking" feature
> (to quote that data sheet) which "allows blocks to be individually
> locked and simultaneously unlocked".
> ...snip...
> 
> I am looking for ideas on how to deal with this.  One idea would be
> to introduce a cousin to the existing MTD_STUPID_LOCK, perhaps one
> called MTD_STUPID_UNLOCK, which would then be used to ensure that
> unlocking does not iterate over all flash blocks.
> 
> -R
> 
> ____________________________

It would be nice to keep pejorative and uninformative naming
out of the codebase - may I suggest MTD_POWERON_LOCK and MTD_CHIP_UNLOCK.

But you get the idea - STUPID tells you nothing except the lack of
patience of the originator ;)

MikeW
