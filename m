Received: from mail-vc0-x22c.google.com ([2607:f8b0:400c:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WgBqE-0000il-52
 for linux-mtd@lists.infradead.org; Fri, 02 May 2014 11:41:23 +0000
Received: by mail-vc0-f172.google.com with SMTP id id10so5234346vcb.17
 for <linux-mtd@lists.infradead.org>; Fri, 02 May 2014 04:40:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53623597.8040909@keymile.com>
References: <53623597.8040909@keymile.com>
Date: Fri, 2 May 2014 13:40:55 +0200
Message-ID: <CAD4b4WJCqeg5=Yi6=gd8k5N_OoqGtcZiPOhWn_tK7Jevnxhjfw@mail.gmail.com>
Subject: Re: Possible race condition when accessing SPI NOR Flash ?
From: Mark Marshall <markmarshall14@gmail.com>
To: Valentin Longchamp <valentin.longchamp@keymile.com>
Content-Type: text/plain; charset=UTF-8
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Holger Brunck <holger.brunck@keymile.com>, linux-mtd@lists.infradead.org,
 Stefan Bigler <stefan.bigler@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

I now fell a bit guilty.  I had this same problem a while ago, and I
haven't ever really pushed the fix.  In fact, I ended up rewriting
most of drivers/spi/spi-fsl-espi.c, and that's really the problem - I
can only test about two boards from over 20, so I know that nobody
will take my complete re-write seriously, and I sort of lost interest.

But, the bug you are hitting is actually much simpler to fix than
that.  If you look in drivers/spi/spi-fsl-espi.c, there is a function
called fsl_espi_cmd_trans.  There are two important things to note
about this function; 1) It does a 64K kmalloc for every transfer
(thanks).  2) It overwrites the buffer if the transfer size is large.

It packs the TX command into the start of the 64K block and sets up a
TX pointer to the start of that block.  It then points the RX pointer
to be after the TX command.  This is completely wrong.  The RX pointer
should also be set to point to the start of the block.

In the failing case, you are probably doing a 64K read from the Flash.
 We will have a 5 or 6 byte command followed by 65531 bytes of TX data
(the value of the TX data does not matter).  The driver will then TX
the command followed by the data and simultaneously it will RX the
"command" and the data that we want (the value of stuff RX'd when we
are TX'ing the command is ignored / irrelevant).  The point is that
the last few bytes of data the we receive go after the end of the 64K
block that we have allocated.

I found that I got similar kernel panics to you.  Basically we are
overwriting 5 random bytes of kernel memory at the start of a page.

        espi_trans->tx_buf = local_buf;
-       espi_trans->rx_buf = local_buf + espi_trans->n_tx;
+       espi_trans->rx_buf = local_buf;
        fsl_espi_do_trans(m, espi_trans);

So, something like this would be a fix.  This is untested.

I hope this helps, and I'm sorry that I've not pushed this before.  If
people want I'll try to produce a proper fix, but I currently using an
oldish kernel (3.2.10), and don't really want to try to build a newer
one.  I've only got limited freescale test hardware (P1010RDB &
P2020RDB).

Regards,

Mark.

PS.
My re-write does nice things like use the half-duplex and simplex
modes of the hardware (when suitable), and runs much much faster, and
uses much less CPU, and has many fewer interrupts (and therefore works
much better with the RT patches).  But it probably breaks badly on any
hardware that isn't like the P1010 or P2020.

On 1 May 2014 13:52, Valentin Longchamp <valentin.longchamp@keymile.com> wrote:
> Hello,
>
> I am currently seeing a very strange behavior on one our PowerPC based systems
> (P2041 from Freescale). We have u-boot as a bootloader, currently using the
> 2013.10 release. The u-boot environment variables are stored in a SPI NOR Flash
> (from which the CPU also boots u-boot), in two dedicated partitions in a
> Spansion s25fl256s1 NOR Flash:
>
>>       spi@110000 {
>>                       flash@0 {
>>                               #address-cells = <1>;
>>                               #size-cells = <1>;
>>                               compatible = "spansion,s25fl256s1";
>>                               reg = <0>;
>>                               spi-max-frequency = <20000000>; /* input clock */
>>                               partition@u-boot {
>>                                       label = "u-boot";
>>                                       reg = <0x00000000 0x00100000>;
>>                                       read-only;
>>                               };
>>                               partition@env {
>>                                       label = "env";
>>                                       reg = <0x00100000 0x00010000>;
>>                               };
>>                               partition@envred {
>>                                       label = "envred";
>>                                       reg = <0x00110000 0x00010000>;
>>                               };
>>                               partition@fman {
>>                                       label = "fman-ucode";
>>                                       reg = <0x00120000 0x00010000>;
>>                               };
>>                       };
>>
>
> I have never noticed a problem when accessing the environment variables from
> u-boot itself, nor the CPU not booting from the NOR Flash, so I assume the
> hardware is OK (and I am able to reproduce it on Freescale's dev board).
>
> Now when fw_setenv ([1], [2]) updates the environment variables, it sometimes
> (approximately 1 out of 100 runs) triggers such kernel errors:
>
>>
>> Unable to handle kernel paging request for data at address 0x54cc2178
>> Faulting instruction address: 0xc01187e8
>> Oops: Kernel access of bad area, sig: 11 [#2]
>> SMP NR_CPUS=8 Keymile kmp204x
>> Modules linked in:
>> CPU: 2 PID: 1628 Comm: loop_setenv Tainted: G    B D      3.10.36-7.0.9-00435-g228e7e3 #21
>> task: db720cb0 ti: db92e000 task.ti: db92e000
>> NIP: c01187e8 LR: c011866c CTR: 00000000
>> REGS: db92fd80 TRAP: 0300   Tainted: G    B D       (3.10.36-7.0.9-00435-g228e7e3)
>> MSR: 00021002 <CE,ME>  CR: 24002424  XER: 20000000
>> DEAR: 54cc2178, ESR: 00800000
>>
>> GPR00: c011978c db92fe30 db720cb0 db8400c0 000000d0 00000000 db66f5bc 7f7f7f7f
>> GPR08: db0b4e90 db008a44 54cc2174 00000fec 24002422 1001c6ec 00000000 c0890000
>> GPR16: db008a54 db008a4c c0890000 00100100 00200200 00000001 db008a44 db008a40
>> GPR24: c0893444 00000000 000000d0 db92e000 db003dc0 db0b4e00 0000001b db840000
>> NIP [c01187e8] cache_alloc_refill+0x208/0x710
>> LR [c011866c] cache_alloc_refill+0x8c/0x710
>> Call Trace:
>> [db92fe30] [c000ede8] handle_page_fault+0xc/0x80 (unreliable)
>> [db92fe80] [c011978c] kmem_cache_alloc+0xec/0x180
>> [db92fea0] [c00580a4] prepare_creds+0x24/0x1c0
>> [db92feb0] [c0058964] prepare_exec_creds+0x14/0x50
>> [db92fec0] [c012635c] prepare_bprm_creds+0x2c/0x70
>> [db92fed0] [c01264bc] do_execve+0xbc/0x520
>> [db92ff20] [c0126b6c] SyS_execve+0x3c/0x70
>> [db92ff40] [c000e944] ret_from_syscall+0x0/0x3c
>> --- Exception: c01 at 0xfed2d24
>>     LR = 0xfe6aef8
>> Instruction dump:
>> 39090004 39290001 5508103a 7d1d4214 90680004 913d0000 813f0010 815c0018
>> 7f095040 41f8ff94 813f0004 815f0000 <912a0004> 91490000 927f0000 929f0004
>> ---[ end trace 85ac86b7cd18b604 ]---
>
> OR:
>
>> Unable to handle kernel paging request for data at address 0x54cc2178
>> Faulting instruction address: 0xc0117c5c
>> Oops: Kernel access of bad area, sig: 11 [#1]
>> SMP NR_CPUS=8 Keymile kmp204x
>> Modules linked in:
>> CPU: 2 PID: 29 Comm: kworker/2:1 Not tainted 3.10.36-7.0.9-00435-g228e7e3 #21
>> Workqueue: events cache_reap
>> task: db2c12f0 ti: db2c6000 task.ti: db2c6000
>> NIP: c0117c5c LR: c011816c CTR: 00000000
>> REGS: db2c7d50 TRAP: 0300   Not tainted  (3.10.36-7.0.9-00435-g228e7e3)
>> MSR: 00021002 <CE,ME>  CR: 24002424  XER: 20000000
>> DEAR: 54cc2178, ESR: 00800000
>>
>> GPR00: c011816c db2c7e00 db2c12f0 db003cc0 db800000 00000000 00000080 54cc2174
>> GPR08: 00005000 db008980 db800040 00021002 24000422 00000000 c0050300 db0d3de8
>> GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 c1167740
>> GPR24: 00000000 c0893260 00100100 00200200 00000002 db003cc0 db0afdd4 00000000
>> NIP [c0117c5c] free_block+0xbc/0x180
>> LR [c011816c] drain_array+0xfc/0x150
>> Call Trace:
>> [db2c7e30] [c011816c] drain_array+0xfc/0x150
>> [db2c7e60] [c01183cc] cache_reap+0xac/0x170
>> [db2c7e90] [c0046ce0] process_one_work+0x150/0x3d0
>> [db2c7ec0] [c00473ac] worker_thread+0x12c/0x390
>> [db2c7ef0] [c00503a8] kthread+0xa8/0xb0
>> [db2c7f40] [c000ea7c] ret_from_kernel_thread+0x5c/0x64
>> Instruction dump:
>> 3d0a4000 5508c9f4 81390000 7cc9402e 7ce94214 70c58000 40c200c4 80870014
>> 813d0050 80e40000 81040004 7d29c02e <91070004> 90e80000 38c90004 93440000
>> ---[ end trace 721e12de4b707566 ]---
>
> Notice that this does not necessarily happen in fw_setenv itself, but rather in
> the next "task" that tries to allocate/free some virtual memory.
>
> I see the same behavior with both the 2013.10 and the 2014.04 releases of
> u-boot/fw_env. The kernel we are using is 3.10.36.
>
> I suspect that the problem is related to SPI NOR/m25p80 driver: on the system we
> have a NAND Flash device with UBI volumes. If I create 2 ubi volumes on the NAND
> Flash and configure fw_setenv (/etc/fw_env.config) to use them instead of the
> the mtd devices targetting the s25fl256s1, I am not able to reproduce the
> problem, even over more than 10'000 runs.
>
> I suspect that it is a race condition because it happens ~1 out of 100 times
> and if I disable SMP in the kernel I am never able to reproduce the problem.
>
> Finally, after having analyzed the fw_env behavior, I have tried to write a very
> silly program that mimics the fw_env mtd accesses in my use case (attached with
> this email) and I am able to reproduce the problem with it.
>
> One other possible culprit that I see is the fsl_espi.c driver for the
> underlying hardware connection from the CPU to the NOR Flash, but I wanted to
> ask here if someone had an idea about what's going wrong.
>
> Valentin
>
> [1] http://elinux.org/U-boot_environment_variables_in_linux
> [2]
> http://git.denx.de/?p=u-boot.git;a=tree;f=tools/env;h=99706ce668db90bd4a476a12e6c07fe2e4b85fbb;hb=master
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
