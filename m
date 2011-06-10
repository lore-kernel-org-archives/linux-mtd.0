Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUprX-0007xK-8n
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2011 00:46:11 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QUprV-0005sE-0s
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2011 02:46:09 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jun 2011 02:46:09 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jun 2011 02:46:09 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubiattach] "vtbl_check: too large reserved_pebs"
Date: Fri, 10 Jun 2011 02:45:55 +0200
Message-ID: <2tp2v6ld5qijnuc8gshkq63d4hr1d474nr@4ax.com>
References: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>
	<ics1v6h6c3h777js8uh4j8bve2i1q7m5d0@4ax.com>
	<66k2v6hfdbhcd6onjr6binvhpujidimja0@4ax.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 10 Jun 2011 01:05:56 +0200, Gilles <gilles.ganault@free.fr>
wrote:
>Even after correcting the mistake above ("ubi.mtd2" should be
>"ubi=mtd2"), uClinux still can't access Ubifs on mtd2 and crashes.

Wrong again (blush)

Here's the correct bootargs:
===========
bootargs=... rootfstype=ubifs ubi.mtd=2 root=ubi0:rootfs rw
===========

Don't forget the trailing "rw", or it will be read-only and cause a
few errors.

I'm now successfully running with the root filesystem on the NAND with
Ubifs.

Thanks everyone for the great help.
