Received: from gateway.innominate.fta-berlin.de ([141.16.74.40]
	helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BIn5K-0001eO-GM
	for linux-mtd@lists.infradead.org; Wed, 28 Apr 2004 12:18:38 +0100
Received: from tkeitel by tkeitel001.bln.innominate.local with local (Exim
	3.35 #1 (Debian))	id 1BIn5I-0003Oa-00
	for <linux-mtd@lists.infradead.org>; Wed, 28 Apr 2004 13:18:36 +0200
Date: Wed, 28 Apr 2004 13:18:35 +0200
From: Tino Keitel <tino.keitel@innominate.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20040428111835.GK2171@tkeitel001.bln.innominate.local>
References: <20040427141926.GA23637@dose.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20040427141926.GA23637@dose.home.local>
Sender: Tino Keitel <tino.keitel@innominate.com>
Subject: Re: jffs2 error with gcc 3.3.2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 27, 2004 at 16:19:26 +0200, Tino Keitel wrote:
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

Problem solved. You always should make mrproper before switching to a
new gcc with other build options.

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   enabling security
tel: +49.30.6392-3308                      http://www.innominate.com/
