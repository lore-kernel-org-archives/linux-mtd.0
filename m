Received: from [65.200.123.6] (helo=mail.utstar.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 172yAy-0002Fd-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 May 2002 18:46:00 +0100
Received: from njtckasturi3 (njtc-kasturi-3.nj.us.utstar.com [172.16.133.70])
	by mail.utstar.com (8.11.3/8.11.3) with SMTP id g41HjdK26867
	for <linux-mtd@lists.infradead.org>; Wed, 1 May 2002 13:45:39 -0400 (EDT)
From: "Kasturi  Raghunath" <kasturi@utstar.com>
To: <linux-mtd@lists.infradead.org>
Subject: Running JFFS on ep8260 board
Date: Wed, 1 May 2002 13:45:59 -0400
Message-ID: <DJEELHNCJDICCAIMLCCCOEINCCAA.kasturi@utstar.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi
  I am new to Linux. I am trying to run JFFS2 on embedded planet 8260 board.
The board has 16M flash. There are 4 flash chips and size of each flash is
4M. According to the manual the flash chips are CFI  compliant. When I run
the linux with flash driver enabled I get the following error:

physmap flash device : 1000000 at ff000000
CFI: Found no Physically mapped flash device at location zero
