Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zgv9-0005SD-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 01:00:56 +0100
Message-ID: <FA06AA2C99BCD511951200005A99441001E3ECC5@irvexch1.sextantifs.com>
From: "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
To: 'David Woodhouse' <dwmw2@infradead.org>, "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 30 Jul 2002 16:59:12 -0700
Subject: RE: jffs2_scan_eraseblock() - errors
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> the root inode, which is obviously a bug. In that case, we 
> just delete the 
> offending directory and all its children. I suppose we should really 
> re-link it to /lost+found instead :)

Yes, disappearing files could be annoying.

Has anyone characterized the performance of the JFFS* file-systems over
time? Our initial tests indicated that JFFS2 was faster than JFFS. After
using the JFFS2 file-system and maintaining a relatively consistent
utilization there was a 4X increase in the time required to complete a mount
operation. Is this expected? Is there a worse case? See below for some
measurements.

JFFS/JFFS2 Mount Performance (38% usage, fresh install):
JFFS	real	16.164
	user	 0.01
	sys	16.14
JFFS2	real	6.47
	user	0.01
	sys	6.45

After being used, usage = 41%:
JFFS2	real	1m3.583	(4X increase)
