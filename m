From: vipin@embeddedlinuxworks.com (Vipin Malik)
Date: Sun, 16 Feb 2003 14:31:51 -0600
Subject: Oops fault in JFFS2 (?)
Message-ID: <5.1.0.14.0.20030216142448.0202b3f8@64.170.22.132>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi Folks,

I am running the JFFS2 code (and mtd code) from the 2.4.19 linux.org kernel 
src code.

Doing a "cat" on a file present on the JFFS2 partition (sometimes) produces 
the following Oops fault. I can't see that it's obviously coming from the 
JFFS2 fs layer, but the "cat" on the file on JFFS2 hung and no more 
operations were possible on the partition, including ls or further cats.

This happened on an AMD Elan SC520 (a 486) chip. Rebooting fixes the 
problem (i.e. it's not permanent).

Is this a known bug fixed in CVS or something new. Can someone please shed 
some light on this.

Thanks.

Vipin


****************************************************************************************************************************
ksymoops 2.4.8 on i686 2.4.7-10smp.  Options used
      -v vmlinux (specified)
      -k ksyms (specified)
      -l modules (specified)
      -o 
/home/vipin/markIIIbuild/all/src/misc/fs/firmware/etc/modules/slip.o -o 
/home/vipin/markIIIbuild/all/src/misc/fs/
firmware/etc/modules/cpufpga.o (specified)
      -m System.map (specified)

<1>Unable to handle kernel NULL pointer dereference at virtual address 00000004
<4>c012cb79
<1>*pde = 00000000
<4>Oops: 0000
<4>CPU:    0
<4>EIP:    0010:[<c012cb79>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
<4>EFLAGS: 00010246
<4>eax: 00000000   ebx: c0550000   ecx: 00000004   edx: 00000000
<4>esi: 00001000   edi: 0804af10   ebp: 00001000   esp: c0551f8c
<4>ds: 0018   es: 0018   ss: 0018
<4>Process cat (pid: 63, stackpage=c0551000)
<4>Stack: c012bf5c c0551fbc c0550000 c1f12c10 c1f12c10 c0550000 00000000 
c07c4000
<4>       c020fa00 c0550000 00001000 0804af10 bffffd94 c01083f3 00000004 
0804af10
<4>       00001000 00001000 0804af10 bffffd94 00000003 0000002b 0000002b 
00000003
<4>Call Trace:    [<c012bf5c>] [<c01083f3>]
<4>Code: 3b 48 04 73 06 8b 40 10 8b 14 88 85 d2 74 03 ff 42 14 89 d0


 >>EIP; c012cb79 <fget+11/28>   <=====

 >>ebx; c0550000 <_end+31de60/2e51eac>
 >>esp; c0551f8c <_end+31fdec/2e51eac>

Trace; c012bf5c <sys_read+14/ec>
Trace; c01083f3 <system_call+33/40>

Code;  c012cb79 <fget+11/28>
00000000 <_EIP>:
Code;  c012cb79 <fget+11/28>   <=====
    0:   3b 48 04                  cmp    0x4(%eax),%ecx   <=====
Code;  c012cb7c <fget+14/28>
    3:   73 06                     jae    b <_EIP+0xb> c012cb84 <fget+1c/28>
Code;  c012cb7e <fget+16/28>
    5:   8b 40 10                  mov    0x10(%eax),%eax
Code;  c012cb81 <fget+19/28>
    8:   8b 14 88                  mov    (%eax,%ecx,4),%edx
Code;  c012cb84 <fget+1c/28>
    b:   85 d2                     test   %edx,%edx
Code;  c012cb86 <fget+1e/28>
    d:   74 03                     je     12 <_EIP+0x12> c012cb8b <fget+23/28>
Code;  c012cb88 <fget+20/28>
    f:   ff 42 14                  incl   0x14(%edx)
Code;  c012cb8b <fget+23/28>
   12:   89 d0                     mov    %edx,%eax

<4> <1>Unable to handle kernel paging request at virtual address 44cb7a40
<4>c011862c
<1>*pde = 00000000
<4>Oops: 0000
<4>CPU:    0
<4>EIP:    0010:[<c011862c>]    Not tainted
<4>EFLAGS: 00010002
<4>eax: c0550568   ebx: c0550000   ecx: 00000000   edx: 44cb7a40
<4>esi: c020f900   edi: c0550000   ebp: 0000000b   esp: c0551e48
<4>ds: 0018   es: 0018   ss: 0018
<4>Process cat (pid: 63, stackpage=c0551000)
<4>Stack: c0550000 c01186a8 c0550568 c0550578 c0113f2e c0550000 c07c0000 
c01d1599
<4>       00000001 c0551f58 c01d4296 00000004 00000001 c01d0018 c01d0018 
ffffff00
<4>       c01089ec c0550010 00000000 c012cb79 c0651730 00000004 c010e2b7 
0000000b
<4>Call Trace:    [<c01186a8>] [<c0113f2e>] [<c01089ec>] [<c012cb79>] 
[<c010e2b7>]
<4>  [<c010df54>] [<c0108504>] [<c012cb79>] [<c012bf5c>] [<c01083f3>]
<4>Code: 8b 1a 52 ff 35 20 93 21 c0 e8 b6 c7 00 00 58 5a ff 0d 24 93


 >>EIP; c011862c <flush_sigqueue+24/44>   <=====

 >>eax; c0550568 <_end+31e3c8/2e51eac>
 >>ebx; c0550000 <_end+31de60/2e51eac>
 >>esi; c020f900 <irq_desc+0/100>
 >>edi; c0550000 <_end+31de60/2e51eac>
 >>esp; c0551e48 <_end+31fca8/2e51eac>

Trace; c01186a8 <exit_sighand+44/48>
Trace; c0113f2e <do_exit+19a/20c>
Trace; c01089ec <die+58/60>
Trace; c012cb79 <fget+11/28>
Trace; c010e2b7 <do_page_fault+363/493>
Trace; c010df54 <do_page_fault+0/493>
Trace; c0108504 <error_code+34/40>
Trace; c012cb79 <fget+11/28>
Trace; c012bf5c <sys_read+14/ec>
Trace; c01083f3 <system_call+33/40>

Code;  c011862c <flush_sigqueue+24/44>
00000000 <_EIP>:
Code;  c011862c <flush_sigqueue+24/44>   <=====
    0:   8b 1a                     mov    (%edx),%ebx   <=====
Code;  c011862e <flush_sigqueue+26/44>
    2:   52                        push   %edx
Code;  c011862f <flush_sigqueue+27/44>
    3:   ff 35 20 93 21 c0         pushl  0xc0219320
Code;  c0118635 <flush_sigqueue+2d/44>
    9:   e8 b6 c7 00 00            call   c7c4 <_EIP+0xc7c4> c0124df0 
<kmem_cache_free+0/a8>
Code;  c011863a <flush_sigqueue+32/44>
    e:   58                        pop    %eax
Code;  c011863b <flush_sigqueue+33/44>
    f:   5a                        pop    %edx
Code;  c011863c <flush_sigqueue+34/44>
   10:   ff 0d 24 93 00 00         decl   0x9324
