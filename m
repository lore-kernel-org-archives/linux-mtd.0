Received: from a80-127-156-242.adsl.xs4all.nl ([80.127.156.242]
	helo=linserv001.aimsys.nl)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BIUTT-00076f-Bq
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2004 16:26:19 +0100
From: Jaap-Jan Boor <jjboor@aimsys.nl>
To: Tino Keitel <tino.keitel@innominate.com>
In-Reply-To: <20040427141926.GA23637@dose.home.local>
References: <20040427141926.GA23637@dose.home.local>
Content-Type: text/plain
Message-Id: <1083079565.3620.174.camel@linpc003.aimsys.nl>
Mime-Version: 1.0
Date: Tue, 27 Apr 2004 17:26:06 +0200
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 error with gcc 3.3.2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I used once jffs2 over blkmtd on compact flash (ide)  
on a powerpc system, all built with gcc 3.3.2 (and linux 2.4.25) 
and had no problems beside that mounting was very slow.

regards,

Jaap-Jan

On Tue, 2004-04-27 at 16:19, Tino Keitel wrote:
> Hi folks,                                            
>                                                      
> I build a kernel 2.4.25 for ARM XScale using the MTD CVS version from
> last week with a plain gcc 3.3.2 and binutils 2.14. When the kernel
> mounts the root-FS, I get this message:
>    
> VFS: Mounted root (jffs2 filesystem).                     
> Mounted devfs on /dev                
> Freeing init memory: 68K  
> jffs2_get_inode_nodes(): CRC failed on node at 0x00d063a8: Read
> 0x648da27a, calculated 0xaad091fe                    
> jffs2_do_read_inode(): No data nodes found for ino #513                       
> jffs2_get_inode_nodes(): Data CRC failed on node at 0x00d7aea4: Read   
> 0xc9706472, calculated 0xfb804e0f                    
> jffs2_do_read_inode(): No data nodes found for ino #451                       
> Kernel panic: No init found.  Try passing init= option to kernel.
>                                                                  
> After a reboot, the filesystem is completly trashed:
> 
> VFS: Mounted root (jffs2 filesystem).
> Mounted devfs on /dev                                            
> Freeing init memory: 68K                                         
> jffs2_do_read_inode() on nonexistent ino 513
> jffs2_do_read_inode() on nonexistent ino 451                     
> Kernel panic: No init found.  Try passing init= option to kernel.
> 
> The filesystem worked before this with a kernel wich was built with gcc
> 2.95.3. Are there any known issues regarding jffs2 and gcc 3.x?
> 
> Regards,
> Tino
>    
-- 
J.G.J. Boor                       Anton Philipsweg 1
Software Engineer                 1223 KZ Hilversum
AimSys bv                         tel. +31 35 689 1941
Postbus 2194, 1200 CD Hilversum   mailto:jjboor@aimsys.nl
