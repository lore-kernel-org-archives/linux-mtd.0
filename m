Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CVWZH-0005yJ-45
	for linux-mtd@lists.infradead.org; Sat, 20 Nov 2004 09:50:28 -0500
Date: Sat, 20 Nov 2004 15:50:21 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20041120145020.GA15782@synertronixx3>
References: <20041118163528.GA9471@synertronixx3>
	<1100959034.8600.33.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1100959034.8600.33.camel@localhost.localdomain>
Subject: Re: jffs2 Oops on 2.6.10-rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2004-11-20 13:57 +0000 schrieb David Woodhouse:

> Is this with an SMP or preemptable kernel? If so, I think I see the

Its not SMP but preemtive. Is this even recommend on an embedded system?

> problem. Does it also fix it if you wrap the code you disabled with 
> 	spin_lock(&c->erase_completion_lock);
> 	<...>
> 	spin_unlock(&c->erase_completion_lock);

No, that does not help. I replaced my disabling #defines by the
lock<->unlcocp pair, no avail:

>>EIP; c00b1c74 <jffs2_build_remove_unlinked_inode+30/ec>   <=====

>>r3; c0177f24 <log_wait+0/8>

Trace; c00b1c44 <jffs2_build_remove_unlinked_inode+0/ec>
Trace; c00b1a9c <jffs2_build_filesystem+1e4/38c>
Trace; c00b18b8 <jffs2_build_filesystem+0/38c>
Trace; c00b1fd8 <jffs2_do_mount_fs+228/270>
Trace; c00b1db0 <jffs2_do_mount_fs+0/270>
Trace; c00b3f80 <jffs2_do_fill_super+130/238>
Trace; c00b3e50 <jffs2_do_fill_super+0/238>
Trace; c00b45b8 <jffs2_get_sb_mtd+98/f8>
Trace; c00b4520 <jffs2_get_sb_mtd+0/f8>
Trace; c00b4804 <jffs2_get_sb+194/1d0>

>>r8; c017bdf0 <jffs2_fs_type+0/20>

Trace; c00b4670 <jffs2_get_sb+0/1d0>
Trace; c00750c0 <do_kern_mount+5c/f4>
Trace; c0075064 <do_kern_mount+0/f4>
Trace; c008c558 <do_new_mount+84/b8>
Trace; c008c4d4 <do_new_mount+0/b8>
Trace; c008ccdc <do_mount+150/16c>
Trace; c008cb8c <do_mount+0/16c>
Trace; c008d128 <sys_mount+a8/f0>
Trace; c008d080 <sys_mount+0/f0>
Trace; c0008f18 <do_mount_root+30/bc>

>>r8; c018e3c8 <names_cachep+0/4>
>>r7; c01581c8 <__func__.1+458/f5f0>

Trace; c0008ee8 <do_mount_root+0/bc>
Trace; c0008ffc <mount_block_root+58/124>
Trace; c0008fa4 <mount_block_root+0/124>
Trace; c0009194 <prepare_namespace+60/a0>

>>r4; c0016648 <root_device_name+0/4>

Trace; c0009134 <prepare_namespace+0/a0>
Trace; c0017258 <init+54/f8>

>>r4; c0157fe0 <__func__.1+270/f5f0>

Trace; c0017204 <init+0/f8>
Trace; c00359cc <do_exit+0/500>

Code;  c00b1c64 <jffs2_build_remove_unlinked_inode+20/ec>
00000000 <_EIP>:
Code;  c00b1c64 <jffs2_build_remove_unlinked_inode+20/ec>
   0:   05 00 00 0a 04            add    $0x40a0000,%eax
Code;  c00b1c69 <jffs2_build_remove_unlinked_inode+25/ec>
   5:   10 a0 e1 07 00 a0         adc    %ah,0xa00007e1(%eax)
Code;  c00b1c6f <jffs2_build_remove_unlinked_inode+2b/ec>
   b:   e1 cd                     loope  ffffffda <_EIP+0xffffffda>
Code;  c00b1c71 <jffs2_build_remove_unlinked_inode+2d/ec>
   d:   e3 ff                     jecxz  e <_EIP+0xe>
Code;  c00b1c73 <jffs2_build_remove_unlinked_inode+2f/ec>   <=====
   f:   eb 00                     jmp    11 <_EIP+0x11>   <=====
Code;  c00b1c75 <jffs2_build_remove_unlinked_inode+31/ec>
  11:   40                        inc    %eax
Code;  c00b1c76 <jffs2_build_remove_unlinked_inode+32/ec>
  12:   94                        xchg   %eax,%esp
Code;  c00b1c77 <jffs2_build_remove_unlinked_inode+33/ec>
  13:   e5 00                     in     $0x0,%eax

 <0>Kernel panic - not syncing: Attempted to kill init!

1 error issued.  Results may not be reliable.


Even disabling preemtion generates the same Oops :(

Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
