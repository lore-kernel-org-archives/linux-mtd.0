Received: from msr16.hinet.net ([168.95.4.116] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18YfKv-0002e7-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 Jan 2003 04:39:33 +0000
Received: from ms11.hinet.net (61-219-230-90.HINET-IP.hinet.net [61.219.230.90])
	by msr.hinet.net (8.9.3/8.9.3) with ESMTP id NAA03941
	for <linux-mtd@lists.infradead.org>; Wed, 15 Jan 2003 13:10:23 +0800 (CST)
Message-ID: <3E24ED3F.8090009@ms11.hinet.net>
Date: Wed, 15 Jan 2003 13:10:23 +0800
From: Steve Tsai <startec@ms11.hinet.net>
MIME-Version: 1.0
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: test last cvs code
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

I copy the last CVS code to uClinux source tree a few hours ago and I 
did not get "unchecked space..." now, but I got the following message 
after I copied and removed some files.  Does anyone have the problem? Do 
I need to attach debug log file? Thanks.

Steve Tsai

# mount -t jffs2 /dev/mtdblock2 /mnt
Empty flash at 0x0010f4f8 ends at 0x0010f600
Empty flash at 0x0010fb10 ends at 0x0010fc00
Empty flash at 0x00121b10 ends at 0x00121c00
Empty flash at 0x0019c4f0 ends at 0x0019c600
Empty flash at 0x0019ce6c ends at 0x0019d000
Empty flash at 0x0023eaf8 ends at 0x0023ec00
# jffs2_get_inode_nodes(): Data CRC failed on node at 0x0023ec00: Read 
0xb123156
jffs2_get_inode_nodes(): Data CRC failed on node at 0x0023e600: Read 
0xb123153b6
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00121600: Read 
0xe7cdb2dce
jffs2_get_inode_nodes(): Data CRC failed on node at 0x0010f600: Read 
0xe7cdb2dce
jffs2_get_inode_nodes(): Data CRC failed on node at 0x0010f000: Read 
0xb123153b6
jffs2_get_inode_nodes(): Data CRC failed on node at 0x0019c600: Read 
0xc6ff283e7
jffs2_get_inode_nodes(): Data CRC failed on node at 0x0019c000: Read 
0xc3fb54186
