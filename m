Received: from mx1.riseup.net ([204.13.164.18])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K2R9x-0006kk-NL
	for linux-mtd@lists.infradead.org; Sat, 31 May 2008 13:30:13 +0000
Resent-Message-ID: <20080531132956.GE3075@traven>
Message-Id: <20080531132808.644758754@kaehlcke.net>
Date: Sat, 31 May 2008 15:28:08 +0200
From: matthias@kaehlcke.net
To: dwmw2@infradead.org,
 linux-mtd@lists.infradead.org
Subject: [patch 0/2] MTD: use list_for_each_entry()
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD: Use list_for_each_entry() instead of list_for_each() in add_mtd_device() and del_mtd_device()

-- 
Matthias Kaehlcke
Embedded Linux Engineer
Barcelona

              We build too many walls and not enough bridges
                             (Isaac Newton)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
