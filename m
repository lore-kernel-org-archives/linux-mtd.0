Received: from mailer.cse.iitd.ac.in ([202.141.68.3]
	helo=desh.cse.iitd.ernet.in)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6r4s-0001wY-7F
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 09:13:24 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by desh.cse.iitd.ernet.in (8.12.8/8.12.8) with ESMTP id j23ED3l5009731
	for <linux-mtd@lists.infradead.org>; Thu, 3 Mar 2005 19:43:03 +0530
Received: from desh.cse.iitd.ernet.in ([127.0.0.1])
	by localhost (desh.cse.iitd.ernet.in [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 09700-01-2 for <linux-mtd@lists.infradead.org>;
	Thu,  3 Mar 2005 19:43:02 +0530 (IST)
Received: from [10.20.50.26] (electron.kritikal.iitd.ernet.in [10.20.50.26])
	by desh.cse.iitd.ernet.in (8.12.8/8.12.8) with ESMTP id j23EClxT009708
	for <linux-mtd@lists.infradead.org>; Thu, 3 Mar 2005 19:42:48 +0530
Message-ID: <42271B5F.5080207@kritikalsolutions.com>
Date: Thu, 03 Mar 2005 19:42:47 +0530
From: Narinder Kumar <narinder@kritikalsolutions.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <E1D6oXI-0008Kp-SH@canuck.infradead.org>
In-Reply-To: <E1D6oXI-0008Kp-SH@canuck.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: CRC errors using jffs2 partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

       I have been able to mount a jffs2 partition on AT91RM9200DK using 
linux-2.4.27-vrs1 but still i am getting CRC errors and the problem is 
sometimes those CRC errors causes my application to terminate and 
sometimes they don't which makes things horrible for me. Can someone 
help me out in how to remove these CRC errors. and CRC errors comes only 
if i unmount the partition and mount it again and run my application, to 
me it seems to be some problem with JFFS2 write-buffer i,e either the 
patch i applied did some changes in it or i am using some unstable 
version of MTD. I am using the following patches and files

Kernel : linux-2.4.27.tar.gz 
Arm PATCH : 2.4.27vrs1-at91-06092004.patch 
VRS-1 patch : patch-2.4.27-vrs1
MTD/CVS : mtd-snapshot-20050217.tar

Here are the errors:
jffs2_get_inode_nodes(): Data CRC failed on node at 0x0040d70c: Read 
0x3ca4fc52, calculated 0x297fb7db              
jffs2_get_inode_nodes(): Data CRC failed on node at 0x004088e0: Read 
0x99dd4556, calculated 0x490abaea              
jffs2_get_inode_nodes(): CRC failed on node at 0x003ffc94: Read 
0xffffffff, calculated 0xd1438696                   
jffs2_get_inode_nodes(): Data CRC failed on node at 0x003fd4e4: Read 
0x009707a1, calculated 0x1f2a72be              
CRC failed for read_inode of inode 223 at physical location 
0x3fb974                                                
Returned error for crccheck of ino #223. Expect 
badness...                      
                                   
 Data CRC 2ee67841 != calculated CRC 6f249f09 for node at 00318b14
 etc..............

Here are the steps i followed:
1) Applied the vrs-1 patch on the kernel.
2) Applied the ARM patch on the kernel
3) Applied the MTD patches on the kernel
4) Used following link to get some help which shows how to compile this 
patched kernel
          
http://lists.infradead.org/pipermail/linux-mtd/2004-December/011039.html
5) Created 3 partitions in MTD of 1MB, 3 MB , 4 MB.
               while mounting the 4 MB partition it showed error of 
erasesize very small i,e 1KB. so i changed the erasesize to 2KB in 
at91_dataflash.c in device->erasesize=2*pagesize
and then it mounted succesfully and then i copied my application to this 
partition and tried to run it and it was running without any errors and 
when i unmounted the partition and remounted it and tried to run it , it 
was giving CRC errors. without killing the application. But after 2-3 
trials it started giving more errors and sometime it kills the 
application and after that generally it never succeds again.

Regards
Narinder
