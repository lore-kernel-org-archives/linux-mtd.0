Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ibPj-0003IA-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 13:25:03 +0000
Subject: Re: MTD concat layer
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: Robert Kaiser <rob@sysgo.de>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: 
	<Pine.LNX.4.21.0202261145590.27658-202000@dagobert.svc.sysgo.de>
References: <Pine.LNX.4.21.0202261145590.27658-202000@dagobert.svc.sysgo.de>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 06 Mar 2002 14:37:07 +0100
Message-Id: <1015421827.11575.15.camel@pcjonashg>
Mime-Version: 1.0
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

On Tue, 2002-02-26 at 12:32, Robert Kaiser wrote:
> Hi,
> 
> here is my second attempt of an MTD concat layer. The issues that
> David found with the first one have (hopefully) been fixed. I have also
> made some benchmarks comparing MTD performance on the platforms I have
> at my disposal (DIL/NetPC and SC520CDP) with vs. without concat layer.

I get an OOPS when erasing (jffs gc). I'm not 100% sure that it's
something wrong with mtdconcat.c but the same thing works if I use the
amd_flash driver instead of cfi_cmdset_0002 + mtdconcat. It looks lika a
busfault in concat_erase. I have disassembled vmlinux and it is
"subdev->size" on line 663 in mtdconcat.c that gives the busfault, maybe
because the variable i has been assigned a bad value before entering the
for loop?

(The ksymoops warning is because my target system is a cris and I run
ksymoops on an i686))

/Jonas


ksymoops 2.4.1 on i686 2.4.9-13.  Options used
     -v os/linux/vmlinux (specified)
     -K (specified)
     -L (specified)
     -O (specified)
     -m os/linux/System.map (specified)

Reading Oops report from the terminal
Oops: 0000
IRP: c006996c SRP: c00697ec DCCR: 000004a0 USP: affff884 MOF: 00000000
 r0: c0f3b008  r1: 00000002   r2: c0f3b004  r3: 00050000
 r4: 00000000  r5: c0f3b000   r6: c01d82a0  r7: c0f3a5c0
 r8: 000f0000  r9: 00200000  r10: ffffffff r11: c0f89ec0
r12: 001b0000 r13: c0f89ecc oR10: ffffffff
R_MMU_CAUSE: 00001001
Process jffs_gcd (pid: 17, stackpage=c0f88000)

Stack from affff884:
       0c0b8fae 3aabf7c8 3aabf92a affff920 3aabf7d8 3aad1d51 00000000
00000000
       3aab8c3a affff884 affffa84 3aab5348 00000000 affff8a4 00000001
affffaa0
       affff9d0 00000000 3aabf7d8 00000000 00000000 3aad30b1 3aac96b4
3aabf7d8
Call Trace:
Stack from c0f89d80:
       c0006ac0 c0f89ec0 c0053226 c005338a c0f89ec0 00000000 00000000
00000000
       c00c4b6c 00000000 c0f89e7c c005344e c0f89e7c c018a000 c0006ac0
c00554f8
       000f0000 c0f3a5c0 c01d82a0 c0f3b000 00000000 00050000 c0f89e7c
c018a000
Call Trace: [<c0006ac0>] [<c0053226>] [<c005338a>] [<c005344e>]
[<c0006ac0>] [<c00554f8>] [<c00b2c48>]
       [<c0069746>] [<c0066706>] [<c00552f4>] [<c0053046>] [<c00697ec>]
[<c006996c>] [<da6d0012>] [<c006a26e>]
       [<c004dde6>] [<c005002a>] [<c00502b8>] [<c0052ee4>] [<c005015e>]
[<c005043e>] [<c0053186>] [<c0053190>]
Code: 69 aa 62 ca 6c 96 23 96 05 a1 6d da (ed) 96 06 80 ac d6 04 e0 e0
db e0 3b Oops: 0000
 r0: c0f3b008  r1: 00000002   r2: c0f3b004  r3: 00050000
 r4: 00000000  r5: c0f3b000   r6: c01d82a0  r7: c0f3a5c0
 r8: 000f0000  r9: 00200000  r10: ffffffff r11: c0f89ec0
r12: 001b0000 r13: c0f89ecc oR10: ffffffff
Warning (Oops_set_i370_regs): garbage 'oR10: ffffffff' at end of i370
register line ignored
Process jffs_gcd (pid: 17, stackpage=c0f88000)
Stack from affff884:
       0c0b8fae 3aabf7c8 3aabf92a affff920 3aabf7d8 3aad1d51 00000000
00000000
       3aab8c3a affff884 affffa84 3aab5348 00000000 affff8a4 00000001
affffaa0
       affff9d0 00000000 3aabf7d8 00000000 00000000 3aad30b1 3aac96b4
3aabf7d8
Stack from c0f89d80:
       c0006ac0 c0f89ec0 c0053226 c005338a c0f89ec0 00000000 00000000
00000000
       c00c4b6c 00000000 c0f89e7c c005344e c0f89e7c c018a000 c0006ac0
c00554f8
       000f0000 c0f3a5c0 c01d82a0 c0f3b000 00000000 00050000 c0f89e7c
c018a000
Call Trace: [<c0006ac0>] [<c0053226>] [<c005338a>] [<c005344e>]
[<c0006ac0>] [<c00554f8>] [<c00b2c48>]
       [<c0069746>] [<c0066706>] [<c00552f4>] [<c0053046>] [<c00697ec>]
[<c006996c>] [<da6d0012>] [<c006a26e>]
       [<c004dde6>] [<c005002a>] [<c00502b8>] [<c0052ee4>] [<c005015e>]
[<c005043e>] [<c0053186>] [<c0053190>]
Code: 69 aa 62 ca 6c 96 23 96 05 a1 6d da (ed) 96 06 80 ac d6 04 e0 e0
db e0 3b Using defaults from ksymoops -t elf32-i386 -a i386

>>r0 ; c0f3b008 <_end+e126c8/ed76c0>
>>r2 ; c0f3b004 <_end+e126c4/ed76c0>
>>r3 ; 00050000 Before first symbol
>>r5 ; c0f3b000 <_end+e126c0/ed76c0>
>>r6 ; c01d82a0 <_end+af960/ed76c0>
>>r7 ; c0f3a5c0 <_end+e11c80/ed76c0>
>>r8 ; 000f0000 Before first symbol
>>r9 ; 00200000 Before first symbol
>>r10; ffffffff <END_OF_CODE+3effffff/????>
>>r11; c0f89ec0 <_end+e61580/ed76c0>
>>r12; 001b0000 Before first symbol
>>r13; c0f89ecc <_end+e6158c/ed76c0>
Trace; c0006ac0 <printk+0/14c>
Trace; c0053226 <show_stack+0/90>
Trace; c005338a <show_registers+d4/146>
Trace; c005344e <die_if_kernel+34/46>
Trace; c0006ac0 <printk+0/14c>
Trace; c00554f8 <do_page_fault+200/2a8>
Trace; c00b2c48 <__Umod+0/147c>
Trace; c0069746 <concat_erase_callback+12/14>
Trace; c0066706 <cfi_amdstd_erase_varsize+c02/c0c>
Trace; c00552f4 <handle_mmu_bus_fault+b4/b8>
Trace; c0053046 <mmu_bus_fault+28/30>
Trace; c00697ec <concat_dev_erase+a4/bc>
Trace; c006996c <concat_erase+168/1d0>
Trace; da6d0012 <END_OF_CODE+196d0012/????>
Trace; c006a26e <part_erase+36/38>
Trace; c004dde6 <flash_erase_region+9e/ee>
Trace; c005002a <jffs_try_to_erase+66/90>
Trace; c00502b8 <jffs_garbage_collect_thread+15a/1d2>
Trace; c0052ee4 <_reschedule+8/c>
Trace; c005015e <jffs_garbage_collect_thread+0/1d2>
Trace; c005043e <jffs_read_super+10e/142>
Trace; c0053186 <kernel_thread+12/28>
Trace; c0053190 <kernel_thread+1c/28>
Code;  fffffff4 <END_OF_CODE+3efffff4/????>
00000000 <_EIP>:
Code;  fffffff4 <END_OF_CODE+3efffff4/????>
   0:   69 aa 62 ca 6c 96 23      imul  
$0xa1059623,0x966cca62(%edx),%ebp
Code;  fffffffb <END_OF_CODE+3efffffb/????>
   7:   96 05 a1
Code;  fffffffe <END_OF_CODE+3efffffe/????>
   a:   6d                        insl   (%dx),%es:(%edi)
Code;  ffffffff <END_OF_CODE+3effffff/????>
   b:   da ed                     (bad)
Code;  00000001 Before first symbol
   d:   96                        xchg   %eax,%esi
Code;  00000002 Before first symbol
   e:   06                        push   %es
Code;  00000003 Before first symbol
   f:   80 ac d6 04 e0 e0 db      subb   $0xe0,0xdbe0e004(%esi,%edx,8)
Code;  0000000a Before first symbol
  16:   e0
Code;  0000000b Before first symbol
  17:   3b 00                     cmp    (%eax),%eax


1 warning issued.  Results may not be reliable.
