Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EAQ7f-0002FS-0U
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2005 06:47:21 -0400
Received: from wohnheim.fh-wedel.de ([213.39.233.138]:60968)
	by moskovskaya.fh-wedel.de with esmtp (Exim 4.34) id 1EAPmV-000622-7x
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2005 12:25:23 +0200
Received: from joern by wohnheim.fh-wedel.de with local (Exim 3.35 #1 (Debian))
	id 1EAPmZ-0005L4-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Aug 2005 12:25:27 +0200
Date: Wed, 31 Aug 2005 12:25:27 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050831102527.GC19207@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: BIG FAT WARNING: CVS UPDATE MAY CAUSE DATA LOSS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry about the capital letters, but I guess a problem of this caliber
deserves some attention.

Ferenc will commit a patch today, that may cause data loss, if you
upgrade to it without looking over both your shoulders twice.  Please
read the whole thread named:
[PATCH] remove support for virtual blocks

After you understand the problem, please decide for yourself.  If you
are absolutely sure that you never used virtual block aggregation for
any of your JFFS2 filesystems, then you can safely upgrade.  This
should be true for the vast majority, but you should check it anyway.

If you are not sure, please make a backup of all your data using the
old code.  Then create a new filesystem using the new code and restore
your data.

I will send another mail once the patch is integrated in cvs.

Jörn

-- 
All art is but imitation of nature.
-- Lucius Annaeus Seneca
