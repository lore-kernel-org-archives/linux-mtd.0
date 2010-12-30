Received: from www.wytron.com.tw ([211.75.82.101])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PYCy1-0006LU-DC
	for linux-mtd@lists.infradead.org; Thu, 30 Dec 2010 07:30:34 +0000
Received: from [192.168.1.15] (helo=darkstar.wytron.com.tw)
	by www.wytron.com.tw with esmtp (Exim 4.69)
	(envelope-from <thomas@wytron.com.tw>) id 1PYCxu-00075f-TN
	for linux-mtd@lists.infradead.org; Thu, 30 Dec 2010 15:30:26 +0800
Message-ID: <4D1C3565.1030800@wytron.com.tw>
Date: Thu, 30 Dec 2010 15:31:49 +0800
From: Thomas Chou <thomas@wytron.com.tw>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mkfs.jffs2 failed to create repeated dev nodes from device_table.txt
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi experts,

I found an issue with the latest git head. The mkfs.jffs2 failed to 
create repeated dev nodes from the device_table.txt in the git tree, 
such as hda1-15, tty0-5.

It happened with this pattern,

/dev/tty	c	666	0	0	5	0	0	0	-
/dev/tty	c	666	0	0	4	0	0	1	6

# IDE Devices
/dev/hda	b	640	0	0	3	0	0	0	-
/dev/hda	b	640	0	0	3	1	1	1	15
/dev/hdb	b	640	0	0	3	64	0	0	-
/dev/hdb	b	640	0	0	3	65	1	1	15


Using jffs2dump -c, I could see only hda,

          Dirent     node at 0x004d3970, totlen 0x0000002b, #pino    14, 
version   274, #ino       276, nsize        3, name hda
          Inode      node at 0x004d399c, totlen 0x00000046, #ino    276, 
version     1, isize        0, csize        2, dsize        2, offset 
      0

Best regards,
Thomas
