Received: from [211.144.194.212] (helo=yuhuatel.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAlAi-0004UZ-Ek
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2004 04:11:25 -0400
Message-ID: <4153D79C.8080606@hotmail.com>
Date: Fri, 24 Sep 2004 16:15:24 +0800
From: Wangfeng Ai <beatit@hotmail.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Data CRC failed
Reply-To: beatit@hotmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi, list

I have merged mtd-snapshot-20040919 with jffs2 into my kernel-2.4.20. I 
use jffs2 as root filesystem, mounted read-write. But when I create and 
remove some files(dirs), and then reboot, jffs2 complains something like 
the following:
jffs2_get_inode_nodes(): Data CRC failed on node at 0x01aa0b3c: Read 
0x14932849,
  calculated 0xae8acdd4 

jffs2_get_inode_nodes(): Data CRC failed on node at 0x004c2ac8: Read 
0x1c81ddb0,
  calculated 0x33f397d4 

jffs2_get_inode_nodes(): Data CRC failed on node at 0x004c1f60: Read 
0x1c81ddb0,
  calculated 0xcc623008

It seems that more files created and removed, more messages like that 
come out.

Is that minor? Or something is going wrong? Any comments please?


--
Wangfeng Ai
