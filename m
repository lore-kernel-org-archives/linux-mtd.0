Received: from postman4.arcor-online.net ([151.189.20.158]
	helo=postman.arcor.de)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BITQo-0006d3-E0
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2004 15:19:40 +0100
Received: from dsl-082-082-143-115.arcor-ip.net
	(dsl-082-083-129-178.arcor-ip.net [82.83.129.178])
	(authenticated bits=0)i3REJRYL023679
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Apr 2004 16:19:27 +0200 (MEST)
Received: from scorpion by dsl-082-082-143-115.arcor-ip.net with local (Exim
	3.36 #1 (Debian))	id 1BITQk-00069X-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Apr 2004 16:19:26 +0200
Date: Tue, 27 Apr 2004 16:19:26 +0200
From: Tino Keitel <tino.keitel@innominate.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20040427141926.GA23637@dose.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Tino Keitel <tino.keitel@web.de>
Subject: jffs2 error with gcc 3.3.2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,                                            
                                                     
I build a kernel 2.4.25 for ARM XScale using the MTD CVS version from
last week with a plain gcc 3.3.2 and binutils 2.14. When the kernel
mounts the root-FS, I get this message:
   
VFS: Mounted root (jffs2 filesystem).                     
Mounted devfs on /dev                
Freeing init memory: 68K  
jffs2_get_inode_nodes(): CRC failed on node at 0x00d063a8: Read
0x648da27a, calculated 0xaad091fe                    
jffs2_do_read_inode(): No data nodes found for ino #513                       
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00d7aea4: Read   
0xc9706472, calculated 0xfb804e0f                    
jffs2_do_read_inode(): No data nodes found for ino #451                       
Kernel panic: No init found.  Try passing init= option to kernel.
                                                                 
After a reboot, the filesystem is completly trashed:

VFS: Mounted root (jffs2 filesystem).
Mounted devfs on /dev                                            
Freeing init memory: 68K                                         
jffs2_do_read_inode() on nonexistent ino 513
jffs2_do_read_inode() on nonexistent ino 451                     
Kernel panic: No init found.  Try passing init= option to kernel.

The filesystem worked before this with a kernel wich was built with gcc
2.95.3. Are there any known issues regarding jffs2 and gcc 3.x?

Regards,
Tino
   
-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   enabling security
tel: +49.30.6392-3308                      http://www.innominate.com/
