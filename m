Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qDGx-0001cl-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 13:15:27 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Unable to recover from CRC failiure 
Date: Wed, 27 Mar 2002 14:14:14 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLKELLFCAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <9186.1017232191@redhat.com>
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

> 
> joakim.tjernlund@lumentis.se said:
> >  I don't have perl on this system. It's an emmbedded system. Is there
> > another way? Why can I not just do a rm? 
> 
> rm (even rm -f) insists on doing a stat() on the inode it's trying to 
> unlink, and doesn't bother to do what you asked it to if that stat() fails.
> 
> A one-line C program which just does the unlink() should work.

I tried the one-line C program and it gave me this:
ksymoops 2.4.1 on i686 2.4.9-31.  Options used
     -V (default)
     -K (default)
     -L (default)
     -O (default)
     -m /usr/local/src/MV/commitkernel/linux-2.4.2_hhl20/System.map (specified)

Oops: kernel access of bad area, sig: 11
NIP: C007FBC8 XER: E000825B LR: C007FB0C SP: C7BF1DD0 REGS: c7bf1d20 TRAP: 0300
Using defaults from ksymoops -t elf32-little -a unknown
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11                                
TASK = c7bf0000[99] 'unlink' Last syscall: 10 
last math 00000000 last altivec 00000000      
GPR00: 00000000 C7BF1DD0 C7BF0000 00009032 00001032 0000000C C7BF1CF4 00000000 
GPR08: C7EC2000 C7D379C0 C7EBE000 00000000 03E40000 100187F8 00000000 100B38D0 
GPR16: 100C71D0 007FFE90 007FFF00 00000000 00009032 07BF1E80 00000000 C0002838 
GPR24: C0002560 00000000 C7F3D2A0 C7FF19E0 C7D377E0 C7D378F0 C7D37AD0 C7EBE7E0 
Call backtrace:                                                                
C007FB0C C007FC34 C0040FE8 C004113C C00025BC 10000544 0FED9DBC 
00000000                                                       
Warning (Oops_read): Code line not seen, dumping what data is available

>>???; c007fbc8 <jffs2_do_unlink+2e0/338>   <=====
Trace; c007fb0c <jffs2_do_unlink+224/338>
Trace; c007fc34 <jffs2_unlink+14/24>
Trace; c0040fe8 <vfs_unlink+17c/1e8>
Trace; c004113c <sys_unlink+e8/194>
Trace; c00025bc <ret_from_syscall_1+0/b4>
Trace; 10000544 Before first symbol
Trace; 0fed9dbc Before first symbol
Trace; 00000000 Before first symbol


1 warning issued.  Results may not be reliable.


But why can't JFFS2 resolve this itself? Should it not just "delete" the bad nodes?

 Jocke 
