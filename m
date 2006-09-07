Received: from disk.mail2.aus.datafoundry.com ([209.99.125.184])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GLRK3-0004LC-6F
	for linux-mtd@lists.infradead.org; Thu, 07 Sep 2006 22:22:08 +0100
Received: from ram.mail2.aus.datafoundry.com (ram.mail2.aus.datafoundry.com
	[209.99.125.168])
	by backuprelay.datafoundry.com (Postfix) with ESMTP id 6D5252CDF9
	for <linux-mtd@lists.infradead.org>;
	Thu,  7 Sep 2006 16:06:06 -0500 (CDT)
Received: from localhost (mw-mail.datafoundry.com [209.99.127.23])
	by mail2.aus.datafoundry.com (Postfix) with ESMTP id 4C21C21DB129
	for <linux-mtd@lists.infradead.org>;
	Thu,  7 Sep 2006 16:05:29 -0500 (CDT)
Message-ID: <1157663128.45008998bded1@webmail.texas.net>
Date: Thu,  7 Sep 2006 16:05:28 -0500
From: catboat@texas.net
To: linux-mtd@lists.infradead.org
Subject: testcase for JFFS2
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Hi, 

I'm doing white-box testing on jffs2.  It's not the very latest code, but
anyway ...

This tests the disk-full condition.  On my system, this test causes bad
values in c->free_size and c->dirty_size.  c->free_size gets decremented
too far, so I get values such as 0xfff838a8.  c->dirty_size gets
incremented too far, and I've seen it bigger than c->flash_size.  It also
causes problem for the GC thread.  I have seen the GC thread trap, BUG, or
go into an infinite loop.

Steps in this testcase.

[] Mount a clean jffs2 at /mnt.  Mine is 16MB.  I write all 0xFF there
before mounting.

[] Create a file of random data that is 75% the size of the device.  I use
random data because it is harder to compress, making the partition fill up
faster.  Maybe you can use a file that is compressed already, as long as
the file is about 3/4 the size of the partition.  Call it file75 for naming
sake.

[] Start filling it up by copying first file.

                        cp file75 /mnt/file1

This results in no error.

[] The next copy should exceed the partition size and cause a "no space"
error.  Resulting file is foreshortened.

                        cp file75 /mnt/file2

[] Next, remove the first file copied, which makes free space.

                        rm /mnt/file1

[] Copy over existing file2.  There should be room for it.

                        cp file75 /mnt/file2

At this point I have seen unusual values in c->free_size and c->dirty_size.

[] The next copy should again fill up the partition.

                        cp file75 /mnt/file1

At this point, I have seen the GC thread print "Argh.  No free space left
for GC." and "Aborting GC thread." I have also seen the GC thread quietly
go into an infinite loop.

Can anyone reproduce this bug? Thanks. 

Monte Copeland
