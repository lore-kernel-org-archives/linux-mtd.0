Received: from [211.172.225.159] (helo=hartford.siteprotect.co.kr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15h3pX-00005A-00
	for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2001 07:49:03 +0100
Received: (from kernelhacker@localhost)
	by hartford.siteprotect.co.kr (8.9.3/8.9.3) id PAA30081
	for linux-mtd@lists.infradead.org; Wed, 12 Sep 2001 15:55:04 +0900
Date: Wed, 12 Sep 2001 15:55:04 +0900
From: Kim Jong-chan <kernelhacker@hartford.siteprotect.co.kr>
To: linux-mtd@lists.infradead.org
Subject: NAND flash driver x86 port problem
Message-ID: <20010912155503.A26299@hartford.siteprotect.co.kr>
Reply-To: zeppelin@kernelhacker.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Recent days, I have ported MTD NAND flash driver to x86, using GeodeGX board.
Module loading is ok. But, when I try to access NAND device, The Kernel says 
what follows and go away...
Using ksymoops, I found that kernel dies in __wake_up.
But I don't know actually which variable causes Null pointer dereferencing.
If I remove all wake_up in nand.c intentionally, all works file. But, I think
that's not a solution.  
Tested kernel includes 
2.4.9(vanilla) 
2.4.2(redhat) + mtd snapshot(20010906)
2.4.2_hhl20(hard hat linux)
all above kernel shows the same phenomenon. 

Here goes oops message

Unable to handle kernel NULL pointer dereference at virtual address 00000000    
 printing eip:                                                                  
c010eeb3                                                                        
*pde = 00000000                                                                 
Oops: 0000                                                                      
CPU:    0                                                                       
EIP:    0010:[<c010eeb3>]                                                       
EFLAGS: 00010013                                                                
eax: c12eddf4   ebx: 00000000   ecx: 00000001   edx: c12eddf8                   
esi: 00000001   edi: fffffff8   ebp: c6c6fefc   esp: c6c6fee0                   
ds: 0018   es: 0018   ss: 0018                                                  
Process mke2fs (pid: 570, stackpage=c6c6f000)                                   
Stack: c12eddf8 00000001 00000282 00000003 00000001 00000001 c12edddc c028d7c8  
       c881282d 00000000 c6c6e000 00000000 00000000 00000000 c6c6e000 00000000  
       00000000 c76c5628 c76c5620 00000000 fffffff4 c01a9dba c12edd60 c6d37bc0  
Call Trace: [<c881282d>] [<c01a9dba>] [<c0134c52>] [<c012e4a9>] [<c012d4e5>]    
   [<c012d533>] [<c0106d23>]                                                    
                                                                                
Code: 8b 1b 8b 4f 04 8b 01 85 45 f0 74 54 31 c0 9c 5e fa c7 01 00               
Kernel panic: Aiee, killing interrupt handler!                                  
In interrupt handler - not syncing                 
