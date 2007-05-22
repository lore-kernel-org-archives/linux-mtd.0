Received: from smtp-vbr5.xs4all.nl ([194.109.24.25])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HqPKW-0006YS-Id
	for linux-mtd@lists.infradead.org; Tue, 22 May 2007 04:02:56 -0400
Received: from server01 (a80-126-23-145.adsl.xs4all.nl [80.126.23.145])
	by smtp-vbr5.xs4all.nl (8.13.8/8.13.8) with ESMTP id l4M82iuj075658
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 May 2007 10:02:45 +0200 (CEST) (envelope-from teun@adesys.nl)
Received: from 192.168.10.82 by server01 ([192.168.10.1] running VPOP3) with
	SMTP for <linux-mtd@lists.infradead.org>;
	Tue, 22 May 2007 10:02:44 +0200
From: "Teun Grinwis" <teun@adesys.nl>
To: "Mtd List" <linux-mtd@lists.infradead.org>
Subject: RE: jffs2/mtd on flash Spansion S29GL064AR4
Date: Tue, 22 May 2007 10:02:43 +0200
Message-ID: <LOEGJDCFIFDBMCDIAOKDMEANCIAA.teun@adesys.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <LOEGJDCFIFDBMCDIAOKDGENPCHAA.teun@adesys.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

After further investigation, the real problem is a NULL ptr function
call in kernel/sched.c, see below:

- in cfi_cmdset_0002.c, do_erase_oneblock
		put_chip( map, chip, adr ); is called.

- in cfi_cmdset_0002.c, put_chip
		wake_up( &chip->wq ); is called

- in kernel/sched.c, __wake_up
		__wake_up_common( q, mode, nr_exclusive, 0, key ) is called

- in kernel/sched.c, __wake_up_common, here ERROR, func == NULL

static void __wake_up_common(wait_queue_head_t *q, unsigned int mode,
			     int nr_exclusive, int sync, void *key)
{
	struct list_head *tmp, *next;

	list_for_each_safe(tmp, next, &q->task_list) {
		wait_queue_t *curr;;
		unsigned flags;
		curr = list_entry(tmp, wait_queue_t, task_list);
		flags = curr->flags;
		if (curr->func(curr, mode, sync, key) &&

                ^^^^^^^^^^  ERROR, curr->func = NULL

		    (flags & WQ_FLAG_EXCLUSIVE) &&
		    !--nr_exclusive)
			break;
	}
}
------------------------------------------------
Why is reason curr->func = NULL? I do not have knowledge about mtd.
------------------------------------------------

I tried a patch in kernel/sched.c, __wake_up_common:
...
        if( curr->func == NULL || (curr->func(curr, mode, sync, key) &&
                                   (flags & WQ_FLAG_EXCLUSIVE) &&
                                   !--nr_exclusive) ) {
            break;
        }
...

Now jffs2 can be initialized on our flash S29GL064AR4. Also a test file
remains
persistent after re-power our system.

Is this patch right? My feeling is that something should be done in mtd!

Thanks for your info,

Regards

Teun Grinwis
> -----Oorspronkelijk bericht-----
> Van: Teun Grinwis [mailto:teun@adesys.nl]
> Verzonden: maandag 14 mei 2007 9:03
> Aan: Mtd List
> Onderwerp: jffs2/mtd on flash Spansion S29GL064AR4
>
>
> Hello all,
>
> Can someone give hint where to start debug searching ??
>
> I use uCLinux distribution 20060511 2.16.16-uc0 on custom MCF 5208 board.
> With flash, Spansion S29GL064AR4. Debug for mtd, jffs2 set to noisy.
>
> When I mount a mtdblock on jffs2 I got the following error:
>
> See below.
> Command: mount -t jffs2 /dev/mtdblock3 /mnt
> Command:
> Command:
> Execution Finished, Exiting
> mtdblock: read on "Romfs" at 0x3d400, size 0x200
>
> MTD do_erase_oneblock(): ERASE 0x000a0000
> *** ILLEGAL INSTRUCTION ***   FORMAT=4
> Current process id is 9
> BAD KERNEL TRAP: 00000000
> PC: [<00000000>]
> SR: 2718  SP: 402cfcec  a2: 40281770
> d0: 00002710    d1: 00000001    d2: 00000000    d3: 400140f4
> ...........
>
> I can run my image successful on Intec 5208EVB
>
> My MTD partitions are as follows (btw i did not change flash name string):
>
> ------------------------
> Am29BDD160G 2.5v flash device (2MB): Found 1 x16 devices at 0x0
> in 16-bit bank
>  Amd/Fujitsu Extended Query Table at 0x0040
> cfi_send_gen_cmd():,40 cmd=98 addr=00000055 base=00000000 build
> addr=000000aa cm
> d_val=00000008
> cfi_send_gen_cmd():,41 cmd=f0 addr=00000000 base=00000000 build
> addr=00000000 cm
> d_val=00000040
> cfi_send_gen_cmd():,42 cmd=ff addr=00000000 base=00000000 build
> addr=00000000 cm
> d_val=00000040
> Using buffer write method
> number of CFI chips: 1
> cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
>
> Creating 3 MTD partitions on "Am29BDD160G 2.5v flash device (2MB)":
>
> 0x00000000-0x00040000 : "dBUG (256K)"
> mtd: Giving out device 2 to dBUG (256K)
>
> 0x00040000-0x000c0000 : "User FS (512K)"
> mtd: Giving out device 3 to User FS (512K)
>
> 0x000c0000-0x00200000 : "Kernel + RootFS (1280K)"
> mtd: Giving out device 4 to Kernel + RootFS (1280K)
> m520xevb ram probe(0x40150020,de000,4): de000 at 40150020
>
> m520xevb ram probe(0x40150020,de000,4): de000 at 40150020
> do_map_probe(): name=map_ram <5>Creating 1 MTD partitions on "RAM":
> 0x00000000-0x000de000 : "Romfs"
> mtd: Giving out device 5 to Romfs
> init_m520x: Root filesystem maj:31 mtdblock:5
> ----------------------------
>
> I mount jffs2 on "User FS", addresses 0x40000 - 0xc0000
>
> I can run my image successful on the EVB see attached file
> Log_uclinux_evb.
>
> I started all from a clean flash, erase flash, program dBUG, dn
> image.bin, exec image.
>
> When starting on EVB, jffs2 is initializing "User FS" by MTD
> do_erase_oneblock,
> MTD do_write_oneword(s) 0x..0 - 0x..a for all sectors in "User
> FS", startup successful.
>
> When starting on custom board *** ILLEGAL INSTRUCTION *** occurs
> after the first
> MTD do_erase_oneblock(), see attached file Log_uclinux_ads4010,
> startup unsuccessful.
>
> It seems that the error has something todo with (erase) timing ??
> since in call trace:
> ...
> BUG: pdflush/9, lock held at task exit time!
>  [403b6446] {alloc_super}
> .. held by:           pdflush:    9 [402b2330, 115]
> ... acquired at:
>
> After further investigation it seems that in
> cfi_cmdset_0002.c:do_erase_oneblock,
> the code execution does not reach: spin_unlock(chip->mutex).
>
> Any suggestions, to proceed ???
>
> Thanks in advance,
>
> Teun Grinwis
>
