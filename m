Received: from mail-de.keymile.com ([195.8.104.250])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfpYP-0006ql-02
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 11:53:30 +0000
Message-ID: <53623597.8040909@keymile.com>
Date: Thu, 01 May 2014 13:52:55 +0200
From: Valentin Longchamp <valentin.longchamp@keymile.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Possible race condition when accessing SPI NOR Flash ?
Content-Type: multipart/mixed; boundary="------------080602020803080000050203"
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Holger Brunck <holger.brunck@keymile.com>,
 Stefan Bigler <stefan.bigler@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------080602020803080000050203
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

I am currently seeing a very strange behavior on one our PowerPC based systems
(P2041 from Freescale). We have u-boot as a bootloader, currently using the
2013.10 release. The u-boot environment variables are stored in a SPI NOR Flash
(from which the CPU also boots u-boot), in two dedicated partitions in a
Spansion s25fl256s1 NOR Flash:

> 	spi@110000 {
> 			flash@0 {
> 				#address-cells = <1>;
> 				#size-cells = <1>;
> 				compatible = "spansion,s25fl256s1";
> 				reg = <0>;
> 				spi-max-frequency = <20000000>; /* input clock */
> 				partition@u-boot {
> 					label = "u-boot";
> 					reg = <0x00000000 0x00100000>;
> 					read-only;
> 				};
> 				partition@env {
> 					label = "env";
> 					reg = <0x00100000 0x00010000>;
> 				};
> 				partition@envred {
> 					label = "envred";
> 					reg = <0x00110000 0x00010000>;
> 				};
> 				partition@fman {
> 					label = "fman-ucode";
> 					reg = <0x00120000 0x00010000>;
> 				};
> 			};
> 

I have never noticed a problem when accessing the environment variables from
u-boot itself, nor the CPU not booting from the NOR Flash, so I assume the
hardware is OK (and I am able to reproduce it on Freescale's dev board).

Now when fw_setenv ([1], [2]) updates the environment variables, it sometimes
(approximately 1 out of 100 runs) triggers such kernel errors:

> 
> Unable to handle kernel paging request for data at address 0x54cc2178
> Faulting instruction address: 0xc01187e8
> Oops: Kernel access of bad area, sig: 11 [#2]
> SMP NR_CPUS=8 Keymile kmp204x
> Modules linked in:
> CPU: 2 PID: 1628 Comm: loop_setenv Tainted: G    B D      3.10.36-7.0.9-00435-g228e7e3 #21
> task: db720cb0 ti: db92e000 task.ti: db92e000
> NIP: c01187e8 LR: c011866c CTR: 00000000
> REGS: db92fd80 TRAP: 0300   Tainted: G    B D       (3.10.36-7.0.9-00435-g228e7e3)
> MSR: 00021002 <CE,ME>  CR: 24002424  XER: 20000000
> DEAR: 54cc2178, ESR: 00800000
> 
> GPR00: c011978c db92fe30 db720cb0 db8400c0 000000d0 00000000 db66f5bc 7f7f7f7f 
> GPR08: db0b4e90 db008a44 54cc2174 00000fec 24002422 1001c6ec 00000000 c0890000 
> GPR16: db008a54 db008a4c c0890000 00100100 00200200 00000001 db008a44 db008a40 
> GPR24: c0893444 00000000 000000d0 db92e000 db003dc0 db0b4e00 0000001b db840000 
> NIP [c01187e8] cache_alloc_refill+0x208/0x710
> LR [c011866c] cache_alloc_refill+0x8c/0x710
> Call Trace:
> [db92fe30] [c000ede8] handle_page_fault+0xc/0x80 (unreliable)
> [db92fe80] [c011978c] kmem_cache_alloc+0xec/0x180
> [db92fea0] [c00580a4] prepare_creds+0x24/0x1c0
> [db92feb0] [c0058964] prepare_exec_creds+0x14/0x50
> [db92fec0] [c012635c] prepare_bprm_creds+0x2c/0x70
> [db92fed0] [c01264bc] do_execve+0xbc/0x520
> [db92ff20] [c0126b6c] SyS_execve+0x3c/0x70
> [db92ff40] [c000e944] ret_from_syscall+0x0/0x3c
> --- Exception: c01 at 0xfed2d24
>     LR = 0xfe6aef8
> Instruction dump:
> 39090004 39290001 5508103a 7d1d4214 90680004 913d0000 813f0010 815c0018 
> 7f095040 41f8ff94 813f0004 815f0000 <912a0004> 91490000 927f0000 929f0004 
> ---[ end trace 85ac86b7cd18b604 ]---

OR:

> Unable to handle kernel paging request for data at address 0x54cc2178
> Faulting instruction address: 0xc0117c5c
> Oops: Kernel access of bad area, sig: 11 [#1]
> SMP NR_CPUS=8 Keymile kmp204x
> Modules linked in:
> CPU: 2 PID: 29 Comm: kworker/2:1 Not tainted 3.10.36-7.0.9-00435-g228e7e3 #21
> Workqueue: events cache_reap
> task: db2c12f0 ti: db2c6000 task.ti: db2c6000
> NIP: c0117c5c LR: c011816c CTR: 00000000
> REGS: db2c7d50 TRAP: 0300   Not tainted  (3.10.36-7.0.9-00435-g228e7e3)
> MSR: 00021002 <CE,ME>  CR: 24002424  XER: 20000000
> DEAR: 54cc2178, ESR: 00800000
> 
> GPR00: c011816c db2c7e00 db2c12f0 db003cc0 db800000 00000000 00000080 54cc2174 
> GPR08: 00005000 db008980 db800040 00021002 24000422 00000000 c0050300 db0d3de8 
> GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 c1167740 
> GPR24: 00000000 c0893260 00100100 00200200 00000002 db003cc0 db0afdd4 00000000 
> NIP [c0117c5c] free_block+0xbc/0x180
> LR [c011816c] drain_array+0xfc/0x150
> Call Trace:
> [db2c7e30] [c011816c] drain_array+0xfc/0x150
> [db2c7e60] [c01183cc] cache_reap+0xac/0x170
> [db2c7e90] [c0046ce0] process_one_work+0x150/0x3d0
> [db2c7ec0] [c00473ac] worker_thread+0x12c/0x390
> [db2c7ef0] [c00503a8] kthread+0xa8/0xb0
> [db2c7f40] [c000ea7c] ret_from_kernel_thread+0x5c/0x64
> Instruction dump:
> 3d0a4000 5508c9f4 81390000 7cc9402e 7ce94214 70c58000 40c200c4 80870014 
> 813d0050 80e40000 81040004 7d29c02e <91070004> 90e80000 38c90004 93440000 
> ---[ end trace 721e12de4b707566 ]---

Notice that this does not necessarily happen in fw_setenv itself, but rather in
the next "task" that tries to allocate/free some virtual memory.

I see the same behavior with both the 2013.10 and the 2014.04 releases of
u-boot/fw_env. The kernel we are using is 3.10.36.

I suspect that the problem is related to SPI NOR/m25p80 driver: on the system we
have a NAND Flash device with UBI volumes. If I create 2 ubi volumes on the NAND
Flash and configure fw_setenv (/etc/fw_env.config) to use them instead of the
the mtd devices targetting the s25fl256s1, I am not able to reproduce the
problem, even over more than 10'000 runs.

I suspect that it is a race condition because it happens ~1 out of 100 times
and if I disable SMP in the kernel I am never able to reproduce the problem.

Finally, after having analyzed the fw_env behavior, I have tried to write a very
silly program that mimics the fw_env mtd accesses in my use case (attached with
this email) and I am able to reproduce the problem with it.

One other possible culprit that I see is the fsl_espi.c driver for the
underlying hardware connection from the CPU to the NOR Flash, but I wanted to
ask here if someone had an idea about what's going wrong.

Valentin

[1] http://elinux.org/U-boot_environment_variables_in_linux
[2]
http://git.denx.de/?p=u-boot.git;a=tree;f=tools/env;h=99706ce668db90bd4a476a12e6c07fe2e4b85fbb;hb=master


--------------080602020803080000050203
Content-Type: text/plain; charset=UTF-8;
 name="loop_mtd.c"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="loop_mtd.c"

I2luY2x1ZGUgPHN5cy90eXBlcy5oPgojaW5jbHVkZSA8c3lzL2lvY3RsLmg+CiNpbmNsdWRl
IDxzdGRpby5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2lu
Y2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxmY250bC5oPgoKI2luY2x1ZGUgPG10ZC9tdGQt
dXNlci5oPgoKaW50IG10ZF9vcGVuKGNvbnN0IGNoYXIgKmZpbGUsIG1vZGVfdCBtb2RlKSB7
CglpbnQgZmQgPSBvcGVuKGZpbGUsIG1vZGUpOwoJaWYgKGZkID09IC0xKSB7CgkJcHJpbnRm
KCJFcnJvciBvcGVuaW5nIGZpbGUgJXM6ICVzXG4iLCBmaWxlLCBzdHJlcnJvcihlcnJubykp
OwoJCXJldHVybiAtMTsKCX0KCglyZXR1cm4gZmQ7Cn0KCmludCBtdGRfcmVhZChpbnQgZmQs
IHZvaWQgKmJ1Ziwgc2l6ZV90IGNvdW50KSB7CglpbnQgc3ogPSByZWFkKGZkLCBidWYsIGNv
dW50KTsKCWlmIChzeiA9PSAtMSkgewoJCXByaW50ZigiRXJyb3IgcmVhZGluZyBmZCAlZDog
JXNcbiIsIGZkLCBzdHJlcnJvcihlcnJubykpOwoJfQoKCXJldHVybiBzejsKfQoKaW50IG10
ZF93cml0ZShpbnQgZmQsIHZvaWQgKmJ1Ziwgc2l6ZV90IGNvdW50KSB7CglpbnQgc3ogPSB3
cml0ZShmZCwgYnVmLCBjb3VudCk7CglpZiAoc3ogPT0gLTEpIHsKCQlwcmludGYoIkVycm9y
IHJlYWRpbmcgZmQgJWQ6ICVzXG4iLCBmZCwgc3RyZXJyb3IoZXJybm8pKTsKCX0KCglyZXR1
cm4gc3o7Cn0KCmludCBtdGRfc2VlayhpbnQgZmQsIG9mZl90IG9mZnNldCkgewoJaW50IHJl
dCA9IGxzZWVrKGZkLCBvZmZzZXQsIFNFRUtfU0VUKTsKCWlmIChyZXQgPT0gLTEpIHsKCQlw
cmludGYoIkVycm9yIGNsb3NpbmcgZmQgJWQ6ICVzXG4iLCBmZCwgc3RyZXJyb3IoZXJybm8p
KTsKCX0KCglyZXR1cm4gcmV0Owp9CgppbnQgbXRkX2VyYXNlKGludCBmZCwgb2ZmX3Qgb2Zm
c2V0KSB7CglpbnQgcmV0ID0gaW9jdGwoZmQsIE1FTUVSQVNFLCAmb2Zmc2V0KTsKCWlmIChy
ZXQgPT0gLTEpIHsKCQlwcmludGYoIkVycm9yIGVyYXNpbmcgZmQgJWQ6ICVzXG4iLCBmZCwg
c3RyZXJyb3IoZXJybm8pKTsKCX0KCglyZXR1cm4gcmV0Owp9CgppbnQgbXRkX2Nsb3NlKGlu
dCBmZCkgewoJaW50IHJldCA9IGNsb3NlKGZkKTsKCWlmIChyZXQpIHsKCQlwcmludGYoIkVy
cm9yIGNsb3NpbmcgZmQgJWQ6ICVzXG4iLCBmZCwgc3RyZXJyb3IoZXJybm8pKTsKCX0KCgly
ZXR1cm4gcmV0Owp9CgppbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQp7CglpbnQJ
cmV0VmFsdWU7CglpbnQJaTsKCWludAlyZWFkU3oxID0gMHg0MDAwOwoJaW50CXJlYWRTejIg
PSAweDEwMDAwOwoJY2hhcglidWZmZXIxW3JlYWRTejFdOwoJY2hhcglidWZmZXIyW3JlYWRT
ejJdOwoJY2hhciAqCWZpbGUxID0gIi9kZXYvbXRkNiI7CgljaGFyICoJZmlsZTIgPSAiL2Rl
di9tdGQ3IjsKCglmb3IgKGk9MDsgaSA8IDEwMDA7IGkrKykgewoJCWludCByZXQsIHN6MSwg
c3oyLCBmZDEsIGZkMjsKCgkJZmQxID0gbXRkX29wZW4oZmlsZTEsIE9fUkRPTkxZKTsKCQly
ZXQgPSBtdGRfc2VlayhmZDEsIDApOwoJCXN6MSA9IG10ZF9yZWFkKGZkMSwgYnVmZmVyMSwg
cmVhZFN6MSk7CgkJcmV0ID0gbXRkX2Nsb3NlKGZkMSk7CgkJZmQyID0gbXRkX29wZW4oZmls
ZTIsIE9fUkRPTkxZKTsKCQlyZXQgPSBtdGRfc2VlayhmZDIsIDApOwoJCXN6MiA9IG10ZF9y
ZWFkKGZkMiwgYnVmZmVyMiwgcmVhZFN6MSk7CgkJcmV0ID0gbXRkX2Nsb3NlKGZkMik7CgoJ
CWZkMSA9IG10ZF9vcGVuKGZpbGUxLCBPX1JEV1IpOwoJCWZkMiA9IG10ZF9vcGVuKGZpbGUy
LCBPX1JEV1IpOwoJCXN6MSA9IG10ZF9yZWFkKGZkMiwgYnVmZmVyMiwgcmVhZFN6Mik7CgkJ
cmV0ID0gbXRkX3NlZWsoZmQyLCAwKTsKCQlyZXQgPSBtdGRfZXJhc2UoZmQyLCAwKTsKCQlz
ejEgPSBtdGRfd3JpdGUoZmQyLCBidWZmZXIyLCByZWFkU3oyKTsKCQlyZXQgPSBtdGRfc2Vl
ayhmZDEsIDQpOwoJCXN6MiA9IG10ZF93cml0ZShmZDEsICJcMCIsIDEpOwoJCXJldCA9IG10
ZF9jbG9zZShmZDEpOwoJCXJldCA9IG10ZF9jbG9zZShmZDIpOwoKCQlpZiAoIShpJTUwKSkK
CQkJcHJpbnRmKCJtdGQsIGxvb3AgaT0lZCBcbiIsIGkpOwoJfQoKCXJldHVybiAwOwp9Cgo=
--------------080602020803080000050203--
