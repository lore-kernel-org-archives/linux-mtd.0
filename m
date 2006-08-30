Received: from mailout2.samsung.com ([203.254.224.25])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GIDYH-0004Yn-Ve
	for linux-mtd@lists.infradead.org; Wed, 30 Aug 2006 01:03:33 +0100
Received: from ep_mmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0J4S00B8QASNIX@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 30 Aug 2006 09:02:47 +0900 (KST)
Received: from sharmaami ([12.52.146.61])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPSA id <0J4S0002EASMVC@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 30 Aug 2006 09:02:47 +0900 (KST)
Date: Wed, 30 Aug 2006 09:03:06 +0900
From: Amit Kumar Sharma <sharma.amit@samsung.com>
Subject: JFFS2 message after fsstress test
To: linux-mtd@lists.infradead.org
Message-id: <003401c6cbc7$ac095120$3d92340c@dsn.sec.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi 

I am using JFFS2 on oneNand mtd ,After mount I run fsstress test 
./fsstress -d mount point -n 50 -c 

After test complete I restart my target and remount my partition during boot
time ,I got following message from JFFS2 ,Can some one tell me why JFFs2
giving these messages.



Mounting local filesystems...
Eep. Child "f8" (ino #16572) of dir ino #16571 doesn't exist!
Eep. Child "fb" (ino #16594) of dir ino #16592 doesn't exist!
Inode #16645 was a directory with children - removing those too...
Inode #16646 was a directory with children - removing those too...
Inode #16574 was a directory with children - removing those too...
Inode #16576 was a directory with children - removing those too...
/dev/mtdblock5 on /tmp type jffs2 (rw)
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Disable TCP/IP Explicit Congestion Notification: done.
Configuring network interfaces: done.
Starting portmap daemon: portmap.
Cleaning: /tmp jffs2_do_read_inode() on nonexistent ino 16594
find: ./p0/d4/fb: Input/output error
jffs2_do_read_inode() on nonexistent ino 16572
find: ./p0/d7/f8: Input/output error
JFFS2 compression type 0x06 not available.
Error: jffs2_decompress returned -5
JFFS2 compression type 0x06 not available.
Error: jffs2_decompress returned -5
/var/lock /var/run.


Rgs
Amit
