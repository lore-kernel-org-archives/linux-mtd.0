From: vdoukhan@cbnco.com (Vladimir Doukhanine)
Date: Thu, 13 Feb 2003 16:51:47 -0500
Subject: cfi_cmdset_0002.c do_write_oneword(...) problem
In-Reply-To: <NGBBKMBLKLBCENJIBEJJMEOCCEAA.todd.fischer@cadenux.com>
References: <NGBBKMBLKLBCENJIBEJJMEOCCEAA.todd.fischer@cadenux.com>
Message-ID: <oprkjy0lzg7bj7b7@cbnsitar.cbnco.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Todd,

The hack like yours didn???t make MTD write work.

But it works if I have
Something like:

printk(KERN_DEBUG);

or

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(0);

in the very beginning of the subroutine.

Please let me know if you find out what is the cause of the problem.

Thanks,
Vlad


On Wed, 12 Feb 2003 14:50:27 -0700, Todd Fischer <todd.fischer@cadenux.com> 
wrote:

> Vlad,
>
> I am also using the AMD L640DU chip (same internals as 641, just 
> different
> packaging).  The do_write_oneword() routine in cfi_cmdset_0002.c didn't 
> work
> for me.  I put in the following very ugly temporary patch to test where 
> in
> the code the problem was occurring.  This hack does allow JFFS2 / MTD to
> work fine for me.  However, this hack is architecture specific (I am 
> running
> on an ARM7), so you may need to make appropriate changes for your
> environment.  Also notice that I am not using the fast programming method
> supported by the chip.  The purpose of the hack was to narrow down where 
> in
> the code it was failing, it is not a fix to the problem.
>
> I have the added complexity that the ARM7 interrupt table is located in 
> the
> same flash part I am using for JFFS2, so I have to disable interrupts
> whenever I put the flash chip in a non "read array" mode.  The
> cfi_cmdset_0002.c code has many places where the flash chip is left if 
> CFI
> mode and erase-more-sectors mode, (thus hiding the interrupt vector 
> table)
> which I had to modify.  I hope there are no more silicon vendors dumb 
> enough
> to put interrupt vector tables in flash!
>
>
> #if 1
> 	    /* short cut that works */
> 	{
> 	    volatile unsigned short *addr1;
> 	    unsigned short *block_addr;
>
> 	    addr1 = (unsigned short *)chip->start;
> 	    addr1[0x555] = 0xAA;
> 	    addr1[0x2aa] = 0x55;
> 	    addr1[0x555] = 0xA0;
> 	    block_addr = (unsigned short *)adr;
> 	    *block_addr = datum;
> 	}
> #else
> 	    /* original code that looks like it should work, but doesn't */
>
> 	if (fast) { /* Unlock bypass */
> 		cfi_send_gen_cmd(0xA0, 0, chip->start, map, cfi, cfi->device_type, 
> NULL);
> 	}
> 	else {
> 	        cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> CFI_DEVICETYPE_X8, NULL);
> 	        cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> CFI_DEVICETYPE_X8, NULL);
> 	        cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi,
> CFI_DEVICETYPE_X8, NULL);
> 	}
>
> 	cfi_write(map, datum, adr);
>
> #endif
>
> You might try a similar change to see if your problem goes away.  If so, 
> I
> bet we are experiencing the same issue.
>
> When I get to the bottom of what is causing the problem, I will let you 
> know
> what I found.
>
> Todd Fischer
> Cadenux
> www.cadenux.com
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
