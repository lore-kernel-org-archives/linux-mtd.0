Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 168hgr-0004at-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2001 12:50:21 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Fwd: Cache mappings and invalidate 
Date: Tue, 27 Nov 2001 13:58:42 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLEECDFAAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <16674.1006859268@redhat.com>
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

> Joakim.Tjernlund@lumentis.se said:
> >  It is almost like burst reads are disabled, but if I mess with the
> > burst HW init sequence,  I get a lot of errors, so I take it that
> > burst reads are enabled. 
> 
> What flash chip are you using, and have you actually put the flash chip in
> to synchronous read mode?

I am using Intel Strata flash(E28F128J3A150) and they are in async page-mode(burst) by default.
There is an appnote(AP-694 and AP-715) on www.intel.com that I used as a template. 

My first thougth was that burst was not enabled, but if I changed the timing for the burst
read in the UPM(User Programmable Machine) to something invalid, I get lots of error form JFFS2 so 
I think it is enabled correctly.
 
Can it be the MV kernel?

I am trying to get 2.4.16-pre1 from ppclinux running but I get a lot of oops messages( see below).
Its very easy to generate this opps, just mount JFFS2 and copy a file a few times.
But I also get Oopses if I start a heavy compile on my board on a NFS mounted FS, but it's much harder
to trigger it. I have tried on and off since 2.4.8 to make it run on my custom MPC860 board, but it has
always Oopsed with a sig: 11 sooner or later. Maybe later kernels are broken wrt MPC860?

  Jocke

ksymoops 2.4.1 on i686 2.4.3-12.  Options used
     -v vmlinux (specified)
     -K (default)
     -L (default)
     -O (default)
     -M (specified)
     -e
     -t elf32-powerpc -a powerpc:MPC8XX

Oops: kernel access of bad area, sig: 11
NIP: C00B12E8 XER: 00000000 LR: C00AD078 SP: C3B8BCD0 REGS: c3b8bc20 TRAP: 0300 
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = c3b8a000[82] 'cp' Last syscall: 5 
last math 00000000 last altivec 00000000 
GPR00: 00000000 C3B8BCD0 C3B8A000 C013F90C 00E800E8 02E25280 C3B8BCE4 C0150000 
GPR08: 00000004 C5000000 00000002 02000000 03E40000 10021824 00000000 00000044 
GPR16: 00E252A8 00000000 00000018 02E252A8 00800080 C0150000 C0157880 000019E1 
GPR24: C02EA160 C3A75100 C02EA1C8 00000000 02E25280 02000000 02C652A8 C013F90C 
Call backtrace:                                                                
00800080 C00B1A90 C0082B90 C0082E3C C007F168 C0048048 C002DE7C 
C003C614 C002F078 C002F4D4 C000275C 10019A2C 100028B4 10003DE8 
10004570 10001EA0 100024F0 0FED9DBC 00000000                   
Kernel panic: Aiee, killing interrupt handler!
Warning (Oops_read): Code line not seen, dumping what data is available

>>NIP; c00b12e8 <lumentis_write32+4/10>   <=====
Trace; 00800080 Before first symbol
Trace; c00b1a90 <part_write+ac/c0>
Trace; c0082b90 <mtd_fake_writev+68/cc>
Trace; c0082e3c <jffs2_write_dnode+120/21c>
Trace; c007f168 <jffs2_setattr+400/598>
Trace; c0048048 <notify_change+90/13c>
Trace; c002de7c <do_truncate+70/ac>
Trace; c003c614 <open_namei+504/63c>
Trace; c002f078 <filp_open+58/84>
Trace; c002f4d4 <sys_open+4c/fc>
Trace; c000275c <ret_from_syscall_1+0/b4>
Trace; 10019a2c Before first symbol
Trace; 100028b4 Before first symbol
Trace; 10003de8 Before first symbol
Trace; 10004570 Before first symbol
Trace; 10001ea0 Before first symbol
Trace; 100024f0 Before first symbol
Trace; 0fed9dbc Before first symbol
Trace; 00000000 Before first symbol


1 warning issued.  Results may not be reliable.


> 
> --
> dwmw2
> 
> 
