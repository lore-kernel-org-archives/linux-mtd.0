Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HqP5S-000764-2B
	for linux-mtd@lists.infradead.org; Tue, 22 May 2007 08:47:19 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HqP5M-0007N8-4D
	for linux-mtd@lists.infradead.org; Tue, 22 May 2007 09:47:12 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 May 2007 09:47:12 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 May 2007 09:47:12 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: leak in mtd/devices/phram.c
Date: Tue, 22 May 2007 07:46:27 +0000 (UTC)
Message-ID: <loom.20070522T094332-377@post.gmane.org>
References: <20070520200936.GB22049@alice>
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

Eric Sesterhenn / Snakebyte <snakebyte <at> gmx.de> writes:

> 
> hi,
> 
> coverity spotted this leak in mtd/devices/phram.c (bug id #1512),
> when register_device() fails, we dont kfree() name and leak it,
> attached patch should fix this.
> 
> Signed-off-by: Eric Sesterhenn <snakebyte <at> gmx.de>

It's good that the drivers are now getting audited for kmalloc/kfree
(see other recent kfree patch).
Keep it up !! How about a driver memory leak reg-test ?!

Regards,
MikeW
