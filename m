Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Qw8B-0006y7-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jan 2002 19:53:55 +0000
Message-ID: <3C45DC51.599F4E7B@comdev.cc>
Date: Wed, 16 Jan 2002 12:02:25 -0800
From: Adam Wozniak <adam.wozniak@comdev.cc>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: different crash (was Re: JFFS2 is crashing the kernel)
References: <20020116163239.99399.qmail@web13206.mail.yahoo.com> <8630.1011205354@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Got this crash yesterday.  gc.c is rev 1.58, nodelist.h is rev 1.59

This is on a PPC system.

Haven't been able to get it to repeat.  Any help is appreciated.

--Adam

--------

This one was also running the /work/awozniak/slo-15-jan-2002-B kernel:
Oops: kernel access of bad area, sig: 11
NIP: C0089FDC XER: 00000000 LR: C0089F88 SP: C3A21F10 REGS: c3a21e60
TRAP: 0300
   Not tainted
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
DAR: 00001360, DSISR: 20000000
TASK = c3a20000[11] 'jffs2_gcd_mtd1' Last syscall: -1 
last math c39ae000 last altivec 00000000
GPR00: 00001360 C3A21F10 C3A20000 0000002F 00001360 00000001 00000030
C0170000 
GPR08: 01A7B414 C0155B1C 00000000 C3A21E30 30018000 100278F4 00000000
00000000 
GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 
GPR24: 00000000 C02C32F8 C0180000 C02C3200 C02C32C4 C0179840 C3FCFED8
C3BFE9C0 
Call backtrace: 
C0089F88 C008CA94 C00064BC 
Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing



------- Additional Comments From XXXXX 2002-01-16 00:35 -------

Oh yeah, this was about 2 seconds after starting an FTP of [large file]



------- Additional Comments From Adam Wozniak 2002-01-16 10:27 -------

[awozniak@rangers linux]$ findmap C0089FDC C0089F88 C008CA94 C00064BC
closest to c0089fdc :: c0089da4 T jffs2_garbage_collect_pass     (plus
568 of
1500)
closest to c0089f88 :: c0089da4 T jffs2_garbage_collect_pass     (plus
484 of
1500)
closest to c008ca94 :: c008c864 t jffs2_garbage_collect_thread     (plus
560 of
564)
closest to c00064bc :: c0006490 T kernel_thread     (plus 44 of 56)



------- Additional Comments From Adam Wozniak 2002-01-16 11:24 -------

 316 0350 40820014      bc 4,2,.L1068
 317 0354 801A0000      lwz 0,irq_stat@l(26)
 318 0358 2C000000      cmpwi 0,0,0
 319 035c 41820008      bc 12,2,.L1068
 320 0360 48000001      bl do_softirq
 321                    .L1068:
 322 0364 7FE4FB78      mr 4,31
 323 0368 7F83E378      mr 3,28
 324 036c 48000001      bl jffs2_mark_node_obsolete
 325 0370 480002E0      b .L1080
 326                    .L1066:
 327 0374 7FE4FB78      mr 4,31
 328 0378 3B7CFF3C      addi 27,28,-196
 329                    .L1083:
 330 037c 80840000      lwz 4,0(4)
 331 0380 80040000      lwz 0,0(4)                // 0x148 + 568 ==
0x380
 332 0384 2C000000      cmpwi 0,0,0
 333 0388 4082FFF4      bc 4,2,.L1083
 334 038c 83A4000C      lwz 29,12(4)
 335 0390 3C600000      lis 3,.LC17@ha
 336 0394 386303B4      la 3,.LC17@l(3)
 337 0398 7FA4EB78      mr 4,29
 338 039c 48000001      bl printk



------- Additional Comments From Adam Wozniak 2002-01-16 11:26 -------

        if (!raw->next_in_ino) {
                /* Inode-less node. Clean marker, snapshot or something
like
tha                spin_unlock_bh(&c->erase_completion_lock);
                jffs2_mark_node_obsolete(c, raw);
                goto eraseit_lock;
        }
 
        inum = jffs2_raw_ref_to_inum(raw);                     // <--
HERE
        D1(printk(KERN_DEBUG "Inode number is #%u\n", inum));
 
        spin_unlock_bh(&c->erase_completion_lock);
 
        D1(printk(KERN_DEBUG "jffs2_garbage_collect_pass collecting from
block @ 
        inode = iget(OFNI_BS_2SFFJ(c), inum);



------- Additional Comments From Adam Wozniak 2002-01-16 11:33 -------

static inline int jffs2_raw_ref_to_inum(struct jffs2_raw_node_ref *raw)
{
        while(raw->next_in_ino) {           // <-- maybe HERE
                raw = raw->next_in_ino;     // <-- maybe HERE
        }
 
        return ((struct jffs2_inode_cache *)raw)->ino;
}



------- Additional Comments From Adam Wozniak 2002-01-16 11:54 -------

DSISR indicates this was a "load" operation, not a "store".
(obvious, consistant with crash as indicated).

Likely result of bad pointer dereference.


-- 
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      3450 Broad St. 107, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
