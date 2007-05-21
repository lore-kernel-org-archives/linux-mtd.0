Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hq5Gu-0000Qi-JJ
	for linux-mtd@lists.infradead.org; Mon, 21 May 2007 06:39:07 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Hq5Gj-0003SR-Pm
	for linux-mtd@lists.infradead.org; Mon, 21 May 2007 12:37:38 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 May 2007 12:37:37 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 May 2007 12:37:37 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: JFFS2 softlinks problem
Date: Mon, 21 May 2007 10:37:26 +0000 (UTC)
Message-ID: <loom.20070521T123214-444@post.gmane.org>
References: <20070519115535.A8761@hnilux.racom.cz>
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

Jakub Bednar <bednar <at> hnilux.racom.cz> writes:

> 
> If I fill the NAND JFFS2 partition with data several times, the links from
> rootfs to cramfs and some folders in tmpfs got broken and lot of things
> stop working. After reboot  the links are OK again.
> 
> How is it possible? Can something got wrong in RAM? Moving erase blocks
> can broke links?
> 

What do you mean by,
"I fill the NAND JFFS2 partition with data several times ..." ?

I presume the links you refer to are symbolic links (ln -s ...)

You should describe the procedure you use (including setting up the links,
and "filling the partition with data several times") and the problems you
observe, What exactly "stops working" - apart from access to files on the
affected partition(s) ?

Regards,
MikeW
