Received: from anchor-post-32.mail.demon.net ([194.217.242.90])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CUSOf-0007BH-Pn
	for linux-mtd@lists.infradead.org; Wed, 17 Nov 2004 11:11:15 -0500
Received: from [80.176.67.250] (helo=baydel.demon.co.uk)
	by anchor-post-32.mail.demon.net with esmtp (Exim 4.42)
	id 1CUSOa-0005tW-9E
	for linux-mtd@lists.infradead.org; Wed, 17 Nov 2004 16:11:01 +0000
Content-Type: text/plain;
  charset="iso-8859-15"
From: Simon Haynes <simon@baydel.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 17 Nov 2004 15:56:40 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <6BEF91EC1C3A@baydel.com>
Subject: oops line 231 of latest readinode.c
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I have been running some systems here for some time error free using a root 
filesystem which is jffs2 on nand. One of them produced an oops today which 
seemed to kill off kupdated. I had a look at the oops and it seems there is a 
possible bug in jffs2_add_frag_to_fragtree.  

In my case all arguments appear to be valid kernel addresses. The call to 
jffs2_lookup_node_frag returns a 0.  So the 'if (this)' takes the else route 
and lastend is set to 0. We then execute the code in if (lastend <= 
newfrag->ofs)' and then in the next if as newfrag->ofs contains -1. The oops 
is produced by the line 'if(this->node)' because this is 0. I have checked 
this against the latest CVS code and it would seem that this could still 
happen.

I don't really know the flow of the code here but could I just put 
'if(this)' in front of 'if(this->node)' or is there some other more serious 
problem here.

Here is the some of the ksymoops output

Oops: kernel access of bad area, sig: 11
NIP: 8007D104 XER: 00000000 LR: 8007D0C8 SP: 802BFD80 REGS: 802bfcd0 TRAP: 
0800    Not tainted
Using defaults from ksymoops -t elf32-powerpc -a powerpc:common
MSR: 00029030 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = 802be000[6] 'kupdated' Last syscall: -1
last math 00000000 last altivec 00000000
GPR00: 000FFFFF 802BFD80 802BE000 00000000 FFFFFFFF 82C8FFB0 00400000 00000000
GPR08: 82C8F000 000FFFFF 00000D90 00000000 82004228 1001F23C 00000000 00000000
GPR16: 00000000 FFF8345A 00000000 00000000 00009032 80FFFF40 00000000 00000000
GPR24: 00000000 80140000 00000000 828EAD14 00000000 82C8FFB0 00000000 83F48CC4
Call backtrace:
83F48CC4 8007CFEC 8007D8D8 8007D6A8 80086B80 8004F4DC 8004F95C
800874F0 800823A4 800886EC 80086FB4 8003CBF0 8003BD44 8003C0EC
800061B0
Warning (Oops_read): Code line not seen, dumping what data is available


>>NIP; 8007d104 <jffs2_add_frag_to_fragtree+68/3b0>   <=====

>>GPR1; 802bfd80 <_end+edcd8/4eaff58>
>>GPR2; 802be000 <_end+ebf58/4eaff58>
>>GPR5; 82c8ffb0 <_end+2abdf08/4eaff58>
>>GPR8; 82c8f000 <_end+2abcf58/4eaff58>
>>GPR12; 82004228 <_end+1e32180/4eaff58>
>>GPR21; 80ffff40 <_end+e2de98/4eaff58>
>>GPR25; 80140000 <crc32_table+3cc/1238>
>>GPR27; 828ead14 <_end+2718c6c/4eaff58>
>>GPR29; 82c8ffb0 <_end+2abdf08/4eaff58>
>>GPR31; 83f48cc4 <_end+3d76c1c/4eaff58>

Trace; 83f48cc4 <_end+3d76c1c/4eaff58>
Trace; 8007cfec <jffs2_add_full_dnode_to_inode+74/124>
Trace; 8007d8d8 <jffs2_do_read_inode_internal+140/698>
Trace; 8007d6a8 <jffs2_do_read_inode+198/1c4>
Trace; 80086b80 <jffs2_read_inode+60/300>
Trace; 8004f4dc <get_new_inode+d4/1bc>
Trace; 8004f95c <iget4+130/144>
Trace; 800874f0 <jffs2_gc_fetch_inode+b0/108>
Trace; 800823a4 <jffs2_garbage_collect_pass+49c/564>
Trace; 800886ec <jffs2_flush_wbuf_gc+cc/178>
Trace; 80086
