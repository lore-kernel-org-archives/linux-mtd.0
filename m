Received: from relay-2m.club-internet.fr ([194.158.104.41])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177A7V-0006wR-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 May 2002 08:19:45 +0100
Received: from netbricks.com (lns05v-11-103.w.club-internet.fr [212.194.94.103])
	by relay-2m.club-internet.fr (Postfix) with ESMTP id 129791710
	for <linux-mtd@lists.infradead.org>; Mon, 13 May 2002 09:19:43 +0200 (CEST)
Message-ID: <3CDF6922.9A0A870F@netbricks.com>
Date: Mon, 13 May 2002 09:20:02 +0200
From: "franck.fleter" <franck.fleter@netbricks.com>
Reply-To: franck.fleter@netbricks.com
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Boot from NAND flash ???
Content-Type: text/plain; charset=us-ascii
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

Hi,

I read in mails archive that Linux kernel can't boot from NAND flash. It

can  boot from NOR flash.
Does Linux  kernel not able to boot  from NAND flash because :
    1) a NAND flash is connected to an I/O controller and not to a BUS.
    2)  access to a NAND flash would be only handled  by JFFS with the
handling of bad blocks.
    3)  it doesn't exist bootloader for NAND flash.
    4) other reasons.

If someone could help me to understand  why Linux can't boot from
NAND flash, I would appreciate.


Thanks,

Franck FLETER
Software Engineer
NETBRICK - France.
email : franck.fleter@netbricks.com
