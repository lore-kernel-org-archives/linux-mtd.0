Received: from a.ns.innominate.com ([212.21.76.70] helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16vfns-0008Jc-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2002 15:44:00 +0100
Received: from tkeitel by tino with local (Exim 3.34 #1 (Debian))
	id 16vfac-00081H-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2002 16:30:18 +0200
Date: Thu, 11 Apr 2002 16:30:18 +0200
To: linux-mtd@lists.infradead.org
Subject: mapping of boot loader offset
Message-ID: <20020411143018.GA30787@tino>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: Tino Keitel <tino.keitel@innominate.com>
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

Hi folks,

I wonder what to do if a processor looks for its BIOS/loader at a specified
address that is somewhere in the middle of a flash chip. The same chip will
contain one JFFS2. The boot loader area will have to be mapped out of the
file system. Is there already something that MTD can do for me?

Regards,
Tino

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   networking people
tel: +49.30.6392-3308                      http://www.innominate.com/
