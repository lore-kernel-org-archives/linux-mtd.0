Received: from mail.erinc.com ([216.158.10.5])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189SFy-0003DM-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2002 15:38:14 +0000
Message-ID: <F4608F665DF5D311B231009027B70F700131E269@MAIL>
From: Junping Zhang <JZhang@erinc.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: seeking help on JFFS2 
Date: Wed, 6 Nov 2002 11:09:09 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

David,

    I changed mtd.h to make unpoint take four params, it doesn't seem to
have any effect.

    So here is what I have:
         linux-2.4.19 + shared-zlib patch + mtd-20021022 snapshot, but I
used the original
    patchin.sh, so JFFS2 in 2.4.19 is used.
         It always crashed at the same point in kernel.

    Here is the oops, ksymoops result and the source lines.

    Thanks  a lot  -- Junping

This is the oops message
========================
Oops: kernel access of bad area, sig: 11
NIP: C00E0008 XER: 00000000 LR: C00DFFB4 SP: C3E0DCC0 REGS: c3e0dc10 TRAP:
0300    Not tainted
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
DAR: 00000005, DSISR: 20000000
TASK = c3e0c000[32] 'cp' Last syscall: 4
last math c3e0c000 last altivec 00000000
GPR00: C00E0004 C3E0DCC0 C3E0C000 80808080 C3F88560 C3F885E0 C3E0DCD4
00000010
GPR08: C3E0DDB0 00000000 00000000 00000010 00000000 10055EF0 00000000
C3ACFEC0
GPR16: C3E0DEBC C01CE670 C01CE670 00001000 C3E0DDB0 00000010 00000000
C3F885E0
GPR24: 0012E1D8 80808080 00005DDA 00000000 0012E1D8 C3F8861C C3F88560
00000010
Call backtrace:
C0013610 C00DDD38 C00E22B8 C00A62CC C00A6484 C00A2378 C002A024
C00375A4 C0005BBC FFFFFFFF 0FF2463C 0FF253A0 0FF1A1B0 1002FB8C
1002F874 1002F6A0 100056C4 1002F2C8 1002EF18 0FECEF70 00000000
Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing
 <0>Rebooting in 180 seconds..


This is the oops through ksymoops 
(on my mount nfs. MTD & JFFS2 are compiled in, so no modules)
=============================================================
# ./ksymoops -v ./vmlinux -m ./System.map oops.now 
ksymoops 2.4.1 on ppc 2.4.19.  Options used
     -v ./vmlinux (specified)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.19/ (default)
     -m ./System.map (specified)

/usr/bin/nm: not found
Error (pclose_local): read_nm_symbols pclose failed 0xff00
Warning (read_vmlinux): no kernel symbols in vmlinux, is ./vmlinux a valid
vmlinux file?
No modules in ksyms, skipping objects
Warning (read_lsmod): no symbols in lsmod, is /proc/modules a valid lsmod
file?
Warning (compare_maps): mismatch on symbol xchg_u32  , ksyms_base says
c000d300, System.map says c0008yOops: kernel access of bad area, sig: 11
NIP: C00E0008 XER: 00000000 LR: C00DFFB4 SP: C3E0DCC0 REGS: c3e0dc10 TRAP:
0300    Not tainted
Using defaults from ksymoops -t elf32-powerpc -a powerpc:common
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = c3e0c000[32] 'cp' Last syscall: 4 
last math c3e0c000 last altivec 00000000
GPR00: C00E0004 C3E0DCC0 C3E0C000 80808080 C3F88560 C3F885E0 C3E0DCD4
00000010 
GPR08: C3E0DDB0 00000000 00000000 00000010 00000000 10055EF0 00000000
C3ACFEC0 
GPR16: C3E0DEBC C01CE670 C01CE670 00001000 C3E0DDB0 00000010 00000000
C3F885E0 
GPR24: 0012E1D8 80808080 00005DDA 00000000 0012E1D8 C3F8861C C3F88560
00000010 
Call backtrace: 
C0013610 C00DDD38 C00E22B8 C00A62CC C00A6484 C00A2378 C002A024 
C00375A4 C0005BBC FFFFFFFF 0FF2463C 0FF253A0 0FF1A1B0 1002FB8C 
1002F874 1002F6A0 100056C4 1002F2C8 1002EF18 0FECEF70 00000000 
Kernel panic: Aiee, killing interrupt handler!
Warning (Oops_read): Code line not seen, dumping what data is available

>>NIP; c00e0008 <do_read_onechip+b8/4ec>   <=====
Trace; c0013610 <call_console_drivers+a0/168>
Trace; c00ddd38 <cfi_intelext_read+b4/100>
Trace; c00e22b8 <part_read+68/a0>
Trace; c00a62cc <writecheck+34/12c>
Trace; c00a6484 <jffs2_write_dnode+c0/2b4>
Trace; c00a2378 <jffs2_commit_write+364/614>
Trace; c002a024 <generic_file_write+49c/7ac>
Trace; c00375a4 <sys_write+bc/150>
Trace; c0005bbc <ret_from_syscall_1+0/b4>
Trace; ffffffff <END_OF_CODE+3fe0f237/????>
Trace; 0ff2463c Before first symbol
Trace; 0ff253a0 Before first symbol
Trace; 0ff1a1b0 Before first symbol
Trace; 1002fb8c Before first symbol
Trace; 1002f874 Before first symbol
Trace; 1002f6a0 Before first symbol
Trace; 100056c4 Before first symbol
Trace; 1002f2c8 Before first symbol
Trace; 1002ef18 Before first symbol
Trace; 0fecef70 Before first symbol
Trace; 00000000 Before first symbol


4 warnings and 1 error issued.  Results may not be reliable.

This is the source positions for the oops (for the last four)
=============================================================
I don't know how call_console_drivers got in the trace ...
(gdb) l *0xc00e0008
0xc00e0008 is in do_read_onechip (cfi_cmdset_0001.c:473).
468     /* Check that the chip's ready to talk to us.
469      * If it's in FL_ERASING state, suspend it and make it talk now.
470      */
471     switch (chip->state) {
472     case FL_ERASING:
473         if (!(((struct cfi_pri_intelext
*)cfi->cmdset_priv)->FeatureSupport & 2))
474             goto sleep; /* We don't support erase suspend */
475         
476         cfi_write (map, CMD(0xb0), cmd_addr);
477         /* If the flash has finished erasing, then 'erase suspend'
(gdb) l *0xc0013610
0xc0013610 is in call_console_drivers (printk.c:379).
374                 start_print = cur_index;
375                 break;
376             }
377         }
378     }
379     _call_console_drivers(start_print, end, msg_level);
380 }
381 
382 static void emit_log_char(char c)
383 {
(gdb) l *0xc00ddd38         
0xc00ddd38 is in cfi_intelext_read (cfi_cmdset_0001.c:607).
602         if ((len + ofs -1) >> cfi->chipshift)
603             thislen = (1<<cfi->chipshift) - ofs;
604         else
605             thislen = len;
606 
607         ret = do_read_onechip(map, &cfi->chips[chipnum], ofs, thislen,
buf);
608         if (ret)
609             break;
610 
611         *retlen += thislen;
(gdb) l *0xc00e22b8
0xc00e22b8 is in part_read (mtdpart.c:57).
52      struct mtd_part *part = PART(mtd);
53      if (from >= mtd->size)
54          len = 0;
55      else if (from + len > mtd->size)
56          len = mtd->size - from;
57      return part->master->read (part->master, from + part->offset, 
58                      len, retlen, buf);
59  }
60  
61  static int part_point (struct mtd_info *mtd, loff_t from, size_t len, 
(gdb)


> -----Original Message-----
> From:	David Woodhouse [SMTP:dwmw2@infradead.org]
> Sent:	Tuesday, November 05, 2002 4:37 PM
> To:	Junping Zhang
> Subject:	Re: seeking help on JFFS2 
> 
> 
> JZhang@erinc.com said:
> >   Here is the oops message through ksymoops: 
> 
> Can you show the whole oops, preferably also using gdb to identify the 
> precise line of code.
> 
> --
> dwmw2
> 
