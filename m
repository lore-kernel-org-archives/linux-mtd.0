Received: from dsl093-192-209.stl1.dsl.speakeasy.net ([66.93.192.209]
	helo=newman.jbmsoft.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IUwS-00040z-EC
	for <linux-mtd@lists.infradead.org>; Wed, 21 May 2003 15:51:44 +0100
Received: from brianpc (BriansPC.jbmsoft.com [192.10.10.21])
	by newman.jbmsoft.com (Postfix) with SMTP id 1416D90306
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 May 2003 09:11:20 -0500 (CDT)
Message-ID: <006001c31fa8$8a42b460$150a0ac0@jbmsoft.com>
From: "Brian T." <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
References: <01a601c31ee5$d5d8b8c0$150a0ac0@jbmsoft.com>
	<1053445502.20074.1516.camel@passion.cambridge.redhat.com>
Date: Wed, 21 May 2003 09:52:02 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: jffs2_gcd_mtd1 errors after reboot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Not unless you feed it through ksymoops so we can see where the errors
> actually happened. Without that it's just random numbers.
>
> -- 
> dwmw2
>

Thanks for the help. For what it's worth,  here is the output from ksymoops:

-Brian


--snip--
[root@JBMgateway-v50 tmp]# ksymoops < /root/file.oops
ksymoops 2.4.1 on i486 2.4.20.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.20/ (default)
     -m /boot/System.map-2.4.20 (default)

Warning: You did not tell me where to find symbol information.  I will
assume that the log matches the kernel and modules that are running
right now and I'll use the default options above for symbol resolution.
If the current kernel and/or modules do not match the log, you can get
more accurate output by telling me the kernel version and where to find
map, modules, ksyms etc.  ksymoops -h explains the options.

Warning (compare_ksyms_lsmod): module 8139too is in lsmod but not in ksyms,
probably no symbols exported
Warning (compare_maps): ksyms_base symbol
GPLONLY_ip_conntrack_expect_find_get not found in System.map.  Ignoring
ksyms_base entry
Warning (compare_maps): ksyms_base symbol GPLONLY_ip_conntrack_expect_put
not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol GPLONLY_ip_conntrack_find_get not
found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol GPLONLY_ip_conntrack_put not found
in System.map.  Ignoring ksyms_base entry
Unable to handle kernel paging request at virtual address c5ccfc24
c0127f36
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c0127f36>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010006
eax: 00ffff03   ebx: 0ffff030   ecx: c1cd0000   edx: 000005a8
esi: c105b7c0   edi: 00000246   ebp: 000001f0   esp: c1e97d98
ds: 0018   es: 0018   ss: 0018
Process jffs2_gcd_mtd1 (pid: 13, stackpage=c1e97000)
Stack: c11db420 c1cb3000 c1080ccc 00000000 c0169c78 c105b7c0 000001f0
c016955c
       c11978e0 c11978e0 00000000 00000000 00000561 c1e97e98 00000044
00100000
       00000000 ffffffff c021e58c c11ff794 c1e96000 000003b6 c11ff740
00000000
Call Trace:    [<c0169c78>] [<c016955c>] [<c016b4c1>] [<c016b470>]
[<c016991b>]
  [<c016ddc4>] [<c016ddad>] [<c011b0ea>] [<c01706ae>] [<c0108736>]
[<c017054c>]
  [<c0107092>] [<c010709b>]
Code: 8b 44 81 18 03 59 0c 89 41 14 83 f8 ff 75 23 8b 11 8b 41 04

>>EIP; c0127f36 <kmem_cache_alloc+7a/d0>   <=====
Trace; c0169c78 <jffs2_alloc_full_dnode+10/14>
Trace; c016955c <jffs2_get_inode_nodes+808/ba4>
Trace; c016b4c1 <jffs2_do_read_inode_internal+39/418>
Trace; c016b470 <jffs2_do_crccheck_inode+60/78>
Trace; c016991b <jffs2_set_inocache_state+23/24>
Trace; c016ddc4 <jffs2_garbage_collect_pass+140/384>
Trace; c016ddad <jffs2_garbage_collect_pass+129/384>
Trace; c011b0ea <dequeue_signal+6e/a8>
Trace; c01706ae <jffs2_garbage_collect_thread+162/16c>
Trace; c0108736 <ret_from_fork+6/20>
Trace; c017054c <jffs2_garbage_collect_thread+0/16c>
Trace; c0107092 <kernel_thread+1a/30>
Trace; c010709b <kernel_thread+23/30>
Code;  c0127f36 <kmem_cache_alloc+7a/d0>
00000000 <_EIP>:
Code;  c0127f36 <kmem_cache_alloc+7a/d0>   <=====
   0:   8b 44 81 18               mov    0x18(%ecx,%eax,4),%eax   <=====
Code;  c0127f3a <kmem_cache_alloc+7e/d0>
   4:   03 59 0c                  add    0xc(%ecx),%ebx
Code;  c0127f3d <kmem_cache_alloc+81/d0>
   7:   89 41 14                  mov    %eax,0x14(%ecx)
Code;  c0127f40 <kmem_cache_alloc+84/d0>
   a:   83 f8 ff                  cmp    $0xffffffff,%eax
Code;  c0127f43 <kmem_cache_alloc+87/d0>
   d:   75 23                     jne    32 <_EIP+0x32> c0127f68
<kmem_cache_alloc+ac/d0>
Code;  c0127f45 <kmem_cache_alloc+89/d0>
   f:   8b 11                     mov    (%ecx),%edx
Code;  c0127f47 <kmem_cache_alloc+8b/d0>
  11:   8b 41 04                  mov    0x4(%ecx),%eax

 <1>Unable to handle kernel paging request at virtual address c5ccfc24
c0127f36
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c0127f36>]    Not tainted
EFLAGS: 00010006
eax: 00ffff03   ebx: 0ffff030   ecx: c1cd0000   edx: c11ace60
esi: c105b7c0   edi: 00000246   ebp: 000001f0   esp: c1e49cc4
ds: 0018   es: 0018   ss: 0018
Process sh (pid: 46, stackpage=c1e49000)
Stack: c11db4d4 c118d400 0024ed4a 00000000 c0169c78 c105b7c0 000001f0
c016955c
       00000000 c1d00200 00000000 00000000 000002ba c1e49d04 000000e5
c11f6e60
       fffffff8 ffffffff c1080ccc c1cd06c0 c1e5d000 c016a312 c1e49ddc
c021e574
Call Trace:    [<c0169c78>] [<c016955c>] [<c016a312>] [<c016b4c1>]
[<c0129e0f>]
  [<c016b400>] [<c013602d>] [<c017080e>] [<c012a027>] [<c0136317>]
[<c01410bb>]
  [<c0141156>] [<c014138a>] [<c0166beb>] [<c01373db>] [<c0137b19>]
[<c0137db6>]
  [<c0137f23>] [<c0138142>] [<c0135175>] [<c0108783>]
Code: 8b 44 81 18 03 59 0c 89 41 14 83 f8 ff 75 23 8b 11 8b 41 04

>>EIP; c0127f36 <kmem_cache_alloc+7a/d0>   <=====
Trace; c0169c78 <jffs2_alloc_full_dnode+10/14>
Trace; c016955c <jffs2_get_inode_nodes+808/ba4>
Trace; c016a312 <jffs2_read_inode_range+18e/1a8>
Trace; c016b4c1 <jffs2_do_read_inode_internal+39/418>
Trace; c0129e0f <__alloc_pages+3b/158>
Trace; c016b400 <jffs2_do_read_inode+198/1a8>
Trace; c013602d <search_binary_handler+65/17c>
Trace; c017080e <jffs2_read_inode+76/2c4>
Trace; c012a027 <__free_pages+1b/1c>
Trace; c0136317 <do_execve+1d3/1e8>
Trace; c01410bb <get_new_inode+3f/174>
Trace; c0141156 <get_new_inode+da/174>
Trace; c014138a <iget4+ce/dc>
Trace; c0166beb <jffs2_lookup+eb/13c>
Trace; c01373db <real_lookup+53/c4>
Trace; c0137b19 <link_path_walk+5e1/864>
Trace; c0137db6 <path_walk+1a/1c>
Trace; c0137f23 <path_lookup+1b/24>
Trace; c0138142 <__user_walk+26/40>
Trace; c0135175 <sys_stat64+19/74>
Trace; c0108783 <system_call+33/40>
Code;  c0127f36 <kmem_cache_alloc+7a/d0>
00000000 <_EIP>:
Code;  c0127f36 <kmem_cache_alloc+7a/d0>   <=====
   0:   8b 44 81 18               mov    0x18(%ecx,%eax,4),%eax   <=====
Code;  c0127f3a <kmem_cache_alloc+7e/d0>
   4:   03 59 0c                  add    0xc(%ecx),%ebx
Code;  c0127f3d <kmem_cache_alloc+81/d0>
   7:   89 41 14                  mov    %eax,0x14(%ecx)
Code;  c0127f40 <kmem_cache_alloc+84/d0>
   a:   83 f8 ff                  cmp    $0xffffffff,%eax
Code;  c0127f43 <kmem_cache_alloc+87/d0>
   d:   75 23                     jne    32 <_EIP+0x32> c0127f68
<kmem_cache_alloc+ac/d0>
Code;  c0127f45 <kmem_cache_alloc+89/d0>
   f:   8b 11                     mov    (%ecx),%edx
Code;  c0127f47 <kmem_cache_alloc+8b/d0>
  11:   8b 41 04                  mov    0x4(%ecx),%eax

<1>Unable to handle kernel paging request at virtual address c5ccfc24
c0127f36
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c0127f36>]    Not tainted
EFLAGS: 00010006
eax: 00ffff03   ebx: 0ffff030   ecx: c1cd0000   edx: c11a55d0
esi: c105b7c0   edi: 00000246   ebp: 000001f0   esp: c1ce5c8c
ds: 0018   es: 0018   ss: 0018
Process getty (pid: 45, stackpage=c1ce5000)
Stack: c11db4e0 c11f6e60 00308cf6 00000000 c0169c78 c105b7c0 000001f0
c016955c
       00000000 c1d21520 00000000 00000000 000000c9 00000008 c2867740
00000004
       c118cd09 ffffffff 00000009 00000006 c2863a40 c2864c80 00000009
00000005
Call Trace:    [<c0169c78>] [<c016955c>] [<c016b4c1>] [<c016b400>]
[<c016a2df>]
  [<c016a312>] [<c017080e>] [<c01410bb>] [<c0141156>] [<c014138a>]
[<c0166beb>]
  [<c01373db>] [<c0137b19>] [<c0137db6>] [<c0137f23>] [<c0138269>]
[<c012e1c0>]
  [<c012e50a>] [<c0108783>]
Code: 8b 44 81 18 03 59 0c 89 41 14 83 f8 ff 75 23 8b 11 8b 41 04

>>EIP; c0127f36 <kmem_cache_alloc+7a/d0>   <=====
Trace; c0169c78 <jffs2_alloc_full_dnode+10/14>
Trace; c016955c <jffs2_get_inode_nodes+808/ba4>
Trace; c016b4c1 <jffs2_do_read_inode_internal+39/418>
Trace; c016b400 <jffs2_do_read_inode+198/1a8>
Trace; c016a2df <jffs2_read_inode_range+15b/1a8>
Trace; c016a312 <jffs2_read_inode_range+18e/1a8>
Trace; c017080e <jffs2_read_inode+76/2c4>
Trace; c01410bb <get_new_inode+3f/174>
Trace; c0141156 <get_new_inode+da/174>
Trace; c014138a <iget4+ce/dc>
Trace; c0166beb <jffs2_lookup+eb/13c>
Trace; c01373db <real_lookup+53/c4>
Trace; c0137b19 <link_path_walk+5e1/864>
Trace; c0137db6 <path_walk+1a/1c>
Trace; c0137f23 <path_lookup+1b/24>
Trace; c0138269 <open_namei+65/544>
Trace; c012e1c0 <filp_open+30/50>
Trace; c012e50a <sys_open+36/84>
Trace; c0108783 <system_call+33/40>
Code;  c0127f36 <kmem_cache_alloc+7a/d0>
00000000 <_EIP>:
Code;  c0127f36 <kmem_cache_alloc+7a/d0>   <=====
   0:   8b 44 81 18               mov    0x18(%ecx,%eax,4),%eax   <=====
Code;  c0127f3a <kmem_cache_alloc+7e/d0>
   4:   03 59 0c                  add    0xc(%ecx),%ebx
Code;  c0127f3d <kmem_cache_alloc+81/d0>
   7:   89 41 14                  mov    %eax,0x14(%ecx)
Code;  c0127f40 <kmem_cache_alloc+84/d0>
   a:   83 f8 ff                  cmp    $0xffffffff,%eax
Code;  c0127f43 <kmem_cache_alloc+87/d0>
   d:   75 23                     jne    32 <_EIP+0x32> c0127f68
<kmem_cache_alloc+ac/d0>
Code;  c0127f45 <kmem_cache_alloc+89/d0>
   f:   8b 11                     mov    (%ecx),%edx
Code;  c0127f47 <kmem_cache_alloc+8b/d0>
  11:   8b 41 04                  mov    0x4(%ecx),%eax


6 warnings issued.  Results may not be reliable.
[root@JBMgateway-v50 tmp]#
--snip--
