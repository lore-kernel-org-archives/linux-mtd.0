Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7Yin-0002aa-Sb
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 10:26:22 -0400
Received: from joern by wohnheim.fh-wedel.de with local (Exim 3.36 #1 (Debian))
	id 1G7Yil-0001hI-00
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jul 2006 16:26:15 +0200
Date: Mon, 31 Jul 2006 16:26:15 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: BUG: missing get_mtd_device when running cat /dev/mtdblock*
Message-ID: <20060731142615.GB16710@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While debugging on a 2.6.5 kernel (with fairly recent mtd) I noticed
that mtdblock appears to be bypassing get_mtd_device().

Can anyone verify this on current mtd by adding a simple printk() to
get_mtd_device() and running cat /dev/mtdblock0 > /dev/null or so?

I am assuming this is not desired behaviour and should get fixed.

Jörn

-- 
Mundie uses a textbook tactic of manipulation: start with some
reasonable talk, and lead the audience to an unreasonable conclusion.
-- Bruce Perens
