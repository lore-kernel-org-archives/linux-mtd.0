Received: from smtp-out2.libero.it ([212.52.84.42])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JgaJP-0003Kt-0M
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2008 06:49:39 +0000
Received: from mailrelay07.libero.it (192.168.32.94) by smtp-out2.libero.it
	(7.3.120) id 4688F31B1A903D4B for linux-mtd@lists.infradead.org;
	Tue, 1 Apr 2008 08:49:36 +0200
Received: from libero.it (192.168.17.15) by smtp-out1.libero.it (7.3.120)
	id 47C416BB00F0CE78 for linux-mtd@lists.infradead.org;
	Tue, 1 Apr 2008 08:49:35 +0200
Date: Tue,  1 Apr 2008 08:49:35 +0200
Message-Id: <JYMWAN$9D67EE134ECE6DB3CC6F192DDE5E3978@libero.it>
Subject: Problems mounting JFFS2 (linux 2.6.22.6)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
From: "ffileppo" <ffileppo@libero.it>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm running kernel 2.6.22.6 on a PXA270 based board (custom Mainstone).

I'm having some issue trying to mount JFFS2

This is the command I use to build my jffs2 filesystem (starting from a w=
orking ramdisk placed in /mnt/):

mkfs.jffs2 -n -l -e 0x20000 --pad=3D0x01000000 -s 0x8000 -d /mnt/ -o root=
fs.img

(I'm using latest release of mkfs.jffs2)

After flashing the image, I try to mount jffs2 filesystem on my embedded =
system:

mount -t jffs2 /dev/mtdblock2 /mnt

and I get:

kernel BUG at arch/arm/mm/consistent.c:488!                              =
            
Unable to handle kernel NULL pointer dereference at virtual address 00000=
000                                                                      =
     
pgd =3D c0004000             
[00000000] *pgd=3D00000000                       
Internal error: Oops: 817 [#1]                             
Modules linked in:                 
CPU: 0    Not tainted  (2.6.22.6 #54)                                    =

PC is at __bug+0x20/0x2c                       
LR is at 0x60000013                  
pc : [<c0025288>]    lr : [<60000013>]    psr: 60000013                  =
                                    
sp : c77d7d20  ip : c0216bf8  fp : c77d7d2c                              =
            
r10: 00000080  r9 : c77fcfb8  r8 : 000fa000                              =
            
r7 : c0222020  r6 : 00000001  r5 : 00000002  r4 : 00000002               =
                                          
r3 : 00000000  r2 : 00000001  r1 : 00000001  r0 : 0000002f               =
                                          
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel               =
                                          
Control: 0000397f  Table: a3dcc000  DAC: 00000017                        =
                        
Process pdflush (pid: 48, stack limit =3D 0xc77d6268)                    =
                              
Stack: (0xc77d7d20 to 0xc77d8000)                                
7d20: c77d7d3c c77d7d30 c0026f4c c0025274 c77d7d4c c77d7d40 c013cfec c002=
6f24                                                                     =
       
7d40: c77d7dac c77d7d50 c0137a40 c013cfd8 00820000 00820000 00820000 c77f=
cf80                                                                     =
       
7d60: 00000004 00000001 c76a5a00 00000000 c03e6d20 c0034604 00000000 0000=
0000                                                                     =
       
7d80: c00a3200 00000002 00000001 c0222020 00000002 00820000 c77fcf80 c77f=
cfb8                                                                     =
       
7da0: c77d7dfc c77d7db0 c013bcc8 c013794c 00020000 000fa000 c77d7e1c 0002=
0000                                                                     =
       
7dc0: c76a5a00 00000003 c77d7e4c 00004008 00000000 00820000 00000000 c013=
ba70                                                                     =
       
7de0: 00000000 c7679520 00020000 00020000 c77d7e5c c77d7e00 c01373f0 c013=
ba7c                                                                     =
       
7e00: 00000000 c00a53b0 00000400 00820000 c77fcfb8 00000010 c013ba70 c77f=
cf80                                                                     =
       
7e20: c0222020 00000000 00000001 c7679530 c77d7e7c c41f9540 c41f9540 c7b9=
2200                                                                     =
       
7e40: c7b922c0 c024b0ec 00000000 c024b0f0 c77d7                          =
                   
7e60: 00020000 00000000 c7691b00 c41f9540 c77d7e94 c77d7e80 c0132620 c013=
b5cc                                                                     =
       
7e80: c41f9540 c76b8924 c77d7f04 c77d7e98 c00d49dc c01325d4 00000000 c76b=
12a0                                                                     =
       
7ea0: c77d7ec4 c77d7eb0 c7b922b8 c7b922c0 00000000 c7b922f4 c77d7edc c77d=
7ec8                                                                     =
       
7ec0: c00946cc c00f3758 00000000 c43d7a30 c77d7f14 c77d7ee0 c009ee18 c7b9=
2200                                                                     =
       
7ee0: 00000000 c021ad2c c0217830 c024b0ec 00000000 c024b0f0 c77d7f1c c77d=
7f08                                                                     =
       
7f00: c00d5300 c00d485c c7b92000 c7b92040 c77d7f3c c77d7f20 c0082968 c00d=
52d4                                                                     =
       
7f20: c0044fc4 c021a8b8 c77d6000 c77d7fac c77d7                          =
                   
7f40: 00000000 00000000 c77d7f74 00000000 00000000 00000000 00000000 0000=
0000                                                                     =
       
7f60: 00000000 00000000 00000025 00000000 c77d7f94 c021a8b8 c77d6000 c021=
a8b8                                                                     =
       
7f80: c77d6000 c77d7fac c0217830 c024b0ec c77d7fdc c77d7fa0 c00650a8 c006=
4900                                                                     =
       
7fa0: c03e6d20 c00648f4 00000000 c77d7fac c77d7fac ffffa197 fffffffc c006=
4f8c                                                                     =
       
7fc0: 00000000 00000000 00000000 00000000 c77d7ff4 c77d7fe0 c004c06c c006=
4f98                                                                     =
       
7fe0: 00000000 00000000 00000000 c77d7ff8 c003ac9c c004c028 201b85dd 125b=
5b27                                                                     =
       
Backtrace:         
[<c0025268>] (__bug+0x0/0x2c) from [<c0026f4c>] (consistent_sync+0x34/0x8=
c)                                                                       =
   
[<c0026f18>] (consistent_sync+0x0/0x8c) from [<c013cfec>] (mainstone_map_=
inval_c                                                                  =
           

ache+0x20/0x24)              
[<c013cfcc>] (mainstone_map_inval_cache+0x0/0x24) from [<c0137a40>] (inva=
l_cache                                                                  =
           

_and_wait_for_operation+0x100/0x33c)                                   
[<c0137940>] (inval_cache_and_wait_for_operation+0x0/0x33c) from [<c013bc=
c8>] (d                                                                  =
           

o_erase_oneblock+0x258/0x838)                            
[<c013ba70>] (do_erase_oneblock+0x0/0x838) from [<c01373f0>] (cfi_varsize=
_frob+0                                                                  =
           

x274/0x2e4)          
[<c013717c>] (cfi_varsize_frob+0x0/0x2e4) from [<c013b5f0>] (cfi_intelext=
_erase_                                                                  =
           

varsize+0x30/0x58)                 
[<c013b5c0>] (cfi_intelext_erase_varsize+0x0/0x58) from [<c0132620>] (par=
t_erase                                                                  =
           

+0x58/0x88)          
 r5:c41f9540 r4:c7691b00                       
[<c01325c8>] (part_erase+0x0/0x88) from [<c00d49dc>] (jffs2_erase_pending=
_blocks                                                                  =
           

+0x18c/0x650)            
 r5:c76b8924 r4:c41f9540                       
[<c00d4850>] (jffs2_erase_pending_blocks+0x0/0x650) from [<c00d5300>] (jf=
fs2_wri                                                                  =
           

te_super+0x38/0x48)                  
[<c00d52c8>] (jffs2_write_super+0x0/0x48) from [<c0082968>] (sync_supers+=
0x9c/                                                                    =
        
c8)  
 r5:c7b92040 r4:c7b92000                       
[<c00828cc>] (sync_supers+0x0/0xc8) from [<c0064968>] (wb_kupdate+0x74/0x=
168)                                                                     =
       
 r6:c77d7fac r5:c77d6000 r4:c021a8b8                                   
[<c00648f4>] (wb_kupdate+0x0/0x168) from [<c00650a8>] (pdflush+0x11c/0x1f=
8)                                                                       =
   
 r8:c024b0ec r7:c0217830 r6:c77d7fac r5:c77d6000 r4:c021a8b8             =
                                              
[<c0064f8c>] (pdflush+0x0/0x1f8) from [<c004c06c>] (kthread+0x50/0x7c)   =
                                                                  
[<c004c01c>] (kthread+0x0/0x7c) from [<c003ac9c>] (do_exit+0x0/0x888)    =
                                                                
 r5:00000000 r4:00000000                       
Code: e1a01000 e59f000c eb004cb7 e3a03000 (e5833000)                     =
                              
WARNING: at kernel/exit.c:869 do_exit()                                  =
    
[<c0025848>] (dump_stack+0x0/0x14) from [<c003b364>] (do_exit+0x6c8/0x888=
)                                                                        =
 
[<c003ac9c>] (do_exit+0x0/0x888) from [<c00256fc>] (die+0x29c/0x2e4)     =
                                                              
[<c0025460>] (die+0x0/0x2e4) from [<c0027940>] (__do_kernel_fault+0x70/0x=
80)                                                                      =
     
[<c00278d0>] (__do_kernel_fault+0x0/0x80) from [<c0027a80>] (do_page_faul=
t+0x130                                                                  =
           

/0x244)      
 r7:c03e6d20 r6:c0214c30 r5:00000817 r4:00000000                         =
                      
[<c0027950>] (do_page_fault+0x0/0x244) from [<c0020214>] (do_DataAbort+0x=
3c/0xa0                                                                  =
           

)
[<c00201d8>] (do_DataAbort+0x0/0xa0) from [<c0020a4c>] (__dabt_svc+0x4c/0=
x60)                                                                     =
       
Exception stack(0xc77d7cd8 to 0xc77d7d20)                                =
        
7cc0:                                                       0000002f 0000=
0001                                                                     =
       
7ce0: 00000001 00000000 00000002 00000002 00000001 c0222020 000fa000 c77f=
cfb8                                                                     =
       
7d00: 00000080 c77d7d2c c0216bf8 c77d7d20 60000013 c0025288 60000013 ffff=
ffff                                                                     =
       
 r8:000fa000 r7:c0222020 r6:00000001 r5:c77d7d0c r4:ffffffff             =
                                              
[<c0025268>] (__bug+0x0/0x2c) from [<c0026f4c>] (consistent_sync+0x34/0x8=
c)                                                                       =
   
[<c0026f18>] (consistent_sync+0x0/0x8c) from [<c013cfec>] (mainstone_map_=
inval_c                                                                  =
           

ache+0x20/0x24)              
[<c013cfcc>] (mainstone_map_inval_cache+0x0/0x24) from [<c0137a40>] (inva=
l_cache                                                                  =
           

_and_wait_for_operation+0x100/0x33c)                                   
[<c0137940>] (inval_cache_and_wait_for_operation+0x0/0x33c) from [<c013bc=
c8>] (d
o_erase_oneblock+0x258/0x838)
[<c013ba70>] (do_erase_oneblock+0x0/0x838) from [<c01373f0>] (cfi_varsize=
_frob+0
x274/0x2e4)
[<c013717c>] (cfi_varsize_frob+0x0/0x2e4) from [<c013b5f0>] (cfi_intelext=
_erase_
varsize+0x30/0x58)
[<c013b5c0>] (cfi_intelext_erase_varsize+0x0/0x58) from [<c0132620>] (par=
t_erase
+0x58/0x88)
 r5:c41f9540 r4:c7691b00
[<c01325c8>] (part_erase+0x0/0x88) from [<c00d49dc>] (jffs2_erase_pending=
_blocks
+0x18c/0x650)
 r5:c76b8924 r4:c41f9540
[<c00d4850>] (jffs2_erase_pending_blocks+0x0/0x650) from [<c00d5300>] (jf=
fs2_wri
te_super+0x38/0x48)
[<c00d52c8>] (jffs2_write_super+0x0/0x48) from [<c0082968>] (sync_supers+=
0x9c/0x
c8)
 r5:c7b92040 r4:c7b92000
[<c00828cc>] (sync_supers+0x0/0xc8) from [<c0064968>] (wb_kupdate+0x74/0x=
168)
 r6:c77d7fac r5:c77d6000 r4:c021a8b8
[<c00648f4>] (wb_kupdate+0x0/0x168) from [<c00650a8>] (pdflush+0x11c/0x1f=
8)
 r8:c024b0ec r7:c0217830 r6:c77d7fac r5:c77d6000 r4:c021a8b8
[<c0064f8c>] (pdflush+0x0/0x1f8) from [<c004c06c>] (kthread+0x50/0x7c)
[<c004c01c>] (kthread+0x0/0x7c) from [<c003ac9c>] (do_exit+0x0/0x888)
 r5:00000000 r4:00000000

Then if I check in /mnt I can see that only some files have been mounted

I'm sure about erase block (-e): it's 0x20000 (128K), but I don't know ab=
out page size (-s)
I've tried different sizes but still not working

I've also tried to enable jffs2 debugging but I cant get any usefull info=


Any idea or suggestions?
I'll post more logs if needed.

Thank you

Francesco
