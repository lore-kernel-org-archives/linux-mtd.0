Received: from krynn.se.axis.com ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AXi9y-0003Nc-Bb
	for linux-mtd@lists.infradead.org; Sat, 20 Dec 2003 14:32:50 +0000
Received: from vin (vin.se.axis.com [10.13.8.51])hBKEUdX3004573
	for <linux-mtd@lists.infradead.org>; Sat, 20 Dec 2003 15:30:39 +0100
Date: Sat, 20 Dec 2003 15:34:04 +0100
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20031220143403.GA23544@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Subject: Determining if writing to a jffs2 partition will fail
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is there any reliable way to determine if a regular file can be 
written to a jffs2 partition without getting ENOSPC? I don't want to 
write the file to jffs2 and then find out that the fs was full, 
because other processes might fail to write to the fs during that 
test (if the fs gets full).

The best I have come up with is:

1. gzip the file (on tmpfs)
2. do statfs on jffs2 the get available space
3. test if the gzipped file would fit in jffs2 without making 
   available space go below one eraseblock (64KiB on my NOR flash).

If it succeeds I would be almost shure the gunzipped file could be 
written to jffs2 without getting ENOSPC, but gzip will of course not 
compress the file to exacly the same size as jffs2 will. And 
statfs won't always tell the truth. I could of course send SIGHUP 
to the gc-thread, wait some and try again.

This doesn't feel like a good solution though, does anyone know of any 
better way?

/Jonas
