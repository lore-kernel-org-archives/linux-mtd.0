Received: from mailwasher.lanl.gov ([192.65.95.54] helo=mailwasher-b.lanl.gov)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D4NDR-0000Ac-5l
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2005 12:55:58 -0500
Received: from ccs-mail.lanl.gov (ccs-mail.lanl.gov [128.165.4.126])
	by mailwasher-b.lanl.gov (8.12.11/8.12.11/(ccn-5)) with ESMTP id
	j1OHtr3a013035
	for <linux-mtd@lists.infradead.org>; Thu, 24 Feb 2005 10:55:53 -0700
Received: from durango.c3.lanl.gov (durango.c3.lanl.gov [128.165.20.172])
	by ccs-mail.lanl.gov (8.12.11/8.12.11/(ccn-5)) with ESMTP id
	j1OHtquw022337
	for <linux-mtd@lists.infradead.org>; Thu, 24 Feb 2005 10:55:53 -0700
Received: from gjohnson by durango.c3.lanl.gov with local (Exim 3.36 #1
	(Debian)) id 1D4NDM-00027k-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Feb 2005 10:55:52 -0700
Date: Thu, 24 Feb 2005 10:55:52 -0700
To: linux-mtd@lists.infradead.org
Message-ID: <20050224175552.GR3347@durango.c3.lanl.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: Greg Johnson <gjohnson@lanl.gov>
Subject: MTD for Intel 28F320C3B BIOS flash?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I would like to be able to update the BIOS of a bunch of Intel SE7520JR2
motherboards from Linux.  According to the spec for this board, it has a
Intel 28F320C3B flash chip.  

What would be required to support this under Linux MTD?  Grepping the
source reveals references to Intel 28F320B3 chips.  Are these supported?
If so, how similar are they?  I'm happy to read the spec and write code,
but I need a little direction first.

It would be great to be able to do this from Linux, as I have a cluster
of 128 to update.

Thanks,

Greg
