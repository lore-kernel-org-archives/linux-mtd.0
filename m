Received: from buserror-extern.convergence.de ([212.84.236.66] helo=jupiter)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 182Uh0-0005Fn-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2002 11:49:22 +0100
Received: from neuber by jupiter with local (Exim 3.35 #1 (Debian))
	id 182Ugo-000358-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2002 12:49:10 +0200
Date: Fri, 18 Oct 2002 12:49:10 +0200
From: Frank Neuber <neuber@convergence.de>
To: linux-mtd@lists.infradead.org
Subject: parse_cmdline_partitions equivalent for map_info
Message-ID: <20021018104910.GA11807@jupiter>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi again,
I'm happy with the parse_cmdline_partitions function to pass the
partitioning informations to the kernel.
Now I'm looking for the same feature to pass the physically informations
to the kernel (struct map_info).
I could add this simply to the cmdline.c file based on the
parse_cmdline_partitions function.
But before I do this I would ask the MTD people if this is done now? 

Regards,
 Frank
-- 
Dipl.-Ing. Elektrotechnik           convergence / HW
Frank Neuber                        Rosenthalerstr.51 / 10178 Berlin
Email:  neuber@convergence.de           Phone:  +49(0)30-72 62 06 76
WWW:    www.convergence.de              Fax:    +49(0)30-72 62 06 55
