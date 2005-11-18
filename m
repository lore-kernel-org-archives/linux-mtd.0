Received: from [222.66.49.139] (helo=smailsh.E28.COM)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ed9SR-0007EI-BP
	for linux-mtd@lists.infradead.org; Fri, 18 Nov 2005 11:51:34 -0500
From: kevinwu <kevinwu@e28.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Sat, 19 Nov 2005 00:44:26 +0800
Message-Id: <1132332266.4201.101.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: bugs in jffs2_scan_eraseblock function?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, all
I get the mtd snapshort of mtd-snapshot-20051118.tar.bz2
I find some issues at line 449, function jffs2_scan_eraseblock, file
mtd/fs/jffs2/scan.c
the original code is:

		if (buf_ofs + buf_len < ofs + sizeof(*node)) {
			buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size -
ofs);
			D1(printk(KERN_DEBUG "Fewer than %zd bytes (node header) left to end
of buf. Reading 0x%x at 0x%08x\n",
				  sizeof(struct jffs2_unknown_node), buf_len, ofs));
			err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
			if (err)
				return err;
			buf_ofs = ofs;
		}



This line confuse me.
err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);


I enabled EBS support. My flash is NAND (erase block size is 16K bytes).
I use sumtool to generate my jffs2 image(about 0xf8000 bytes). But
failed to mount it. The sumtool generate my jffs2 image with no error
message. I found that the last erase block of my image has no summary
marker and summary. I debuged the sumtool. It does the right thing.  So
I debug the the jffs2 code. I found that when the last erase block
reading is not correct. I finally found that jffs2_flash_read_safe 's
parameter is not right. The second parameter should be ofs, not buf_ofs.
buf_ofs points to the wrong offset as we wished. buf_ofs points to the
previous ofs, not the current offset.  
So I changed my code to:
err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
This time, the jffs2 partition is mounted correctly.
I checked Montavista linux-2.4.20's code. It used the same parameters as
I do. Please see the debug information:

D1(printk(KERN_DEBUG "Fewer than %zd bytes (node header) left to end of
buf. Reading 0x%x at 0x%08x\n",
				  sizeof(struct jffs2_unknown_node), buf_len, ofs));

The author hopes to read flash from ofs, but in fact read from buf_ofs.
I did not test my code for many times.
There are some other codes like this in this function. 

-- 
Best Regards

Kevin Wu

System Software Engineer, E28.com


Office: 86-21-32224888-207
