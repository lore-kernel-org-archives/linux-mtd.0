Received: from host-33-223.pace.co.uk ([136.170.33.223] helo=sbrodie.cam.pace.co.uk)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Wg0G-0004XJ-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Jul 2002 17:25:45 +0100
Date: Mon, 22 Jul 2002 17:25:02 +0100
From: Stewart Brodie <stewart.brodie@pace.co.uk>
To: linux-mtd@lists.infradead.org
Message-ID: <c5e41c5a4b.sbrodie@sbrodie.cam.pace.co.uk>
Subject: mkfs.jffs2 failing to use zlib to compress things
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

I have been having problems with mkfs.jffs2 (with the fs/jffs2 files from a
MIPS Linux 2.4.17 kernel) not compressing files as it constructs the
filesystem image.  I have no idea whether this will affect the run-time
behaviour or not - I've not got that far.  After inserting debugging into the
compression routines, it appears that Z_STREAM_ERROR streaming errors are
occurring when the data is being passed through zlib, and thus the simple
rtime compression is being used instead.

It looks like mkfs.jffs2 is driving zlib's compression routines in a bizarre
way (c.f. the decompression which uses a trivial loop) passing only small
blocks of data at a time.  Is that loop correct?  Why is Z_PARTIAL_FLUSH
being used?  The errors I get are all "final deflate returned -2".

Any ideas what might be causing this?


[originally posted to the MIPS Linux kernel mailing list by mistake]

-- 
Stewart Brodie, Senior Software Engineer
Pace Micro Technology PLC
645 Newmarket Road
Cambridge, CB5 8PB, United Kingdom         WWW: http://www.pacemicro.com/
