Received: from mail.imc-berlin.de ([217.110.46.186]
	helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192nOD-0000Jw-RQ
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 08:19:29 +0100
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de
	[10.0.0.13])h387JNLT022448
	for <linux-mtd@lists.infradead.org>; Tue, 8 Apr 2003 09:19:23 +0200
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id JAA21204
	for <linux-mtd@lists.infradead.org>;
	Tue, 8 Apr 2003 09:19:31 +0200 (CEST)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <3E927803.9060205@imc-berlin.de>
Date: Tue, 08 Apr 2003 09:19:31 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Inode corrupted after CVS update
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

I pulled the CVS yesterday, patched my linuxppc-2.4.20, build and 
flashed my image.

I am using JFFS2 as root fs. While booting I get loads of

...
VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 56k init
jffs2_get_inode_nodes(): Inode corrupted at 0x000ff370, totlen 70, 
#ino  130, version 1, isize 0, csize 2, dsize 2
jffs2_do_read_inode(): No data nodes found for ino #130
Warning: unable to open an initial console.
jffs2_get_inode_nodes(): Inode corrupted at 0x000ff458, totlen 70, 
#ino  132, version 1, isize 0, csize 2, dsize 2
jffs2_do_read_inode(): No data nodes found for ino #132
Returned error for crccheck of ino #132. Expect badness...
jffs2_get_inode_nodes(): Inode corrupted at 0x000ff6e0, totlen 70, 
#ino  137, version 1, isize 0, csize 2, dsize 2
jffs2_do_read_inode(): No data nodes found for ino #137
Returned error for crccheck of ino #137. Expect badness...
jffs2_get_inode_nodes(): Inode corrupted at 0x000ff758, totlen 70, 
#ino  138, version 1, isize 0, csize 2, dsize 2
jffs2_do_read_inode(): No data nodes found for ino #138
...

Any idea?

Thanks,

Steven
