Received: from rdu162-229-047.nc.rr.com ([24.162.229.47] helo=gateway.house)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160VJ9-00053k-00
	for <linux-mtd@lists.infradead.org>; Sun, 04 Nov 2001 21:59:59 +0000
Subject: Re: JFFS2, CF, PCMCIA adapter, ATA
From: Michael Rothwell <rothwell@holly-springs.nc.us>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.33.0111042135220.28157-100000@imladris.demon.co.uk>
References: <Pine.LNX.4.33.0111042135220.28157-100000@imladris.demon.co.uk>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 04 Nov 2001 17:09:46 -0500
Message-Id: <1004911786.4240.56.camel@gromit.house>
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

Sorry it took so long; I had to copy the oops output from the console
screen... here it is, by way of ksymoops:

invalid operand: 0000
CPU:    0
EIP:    0010:[<c015d8af>]  Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010296
eax: 0000003e   ebx: c32f8078     ecx: c5374000       edx: 00000001
esi: 00000003   edi: c31a9ecc     ebp: c0d763d0       esp: c1d43eb4
ds: 0018        es: 0018       ss: 0018
Process cp (pid: 1335, stackpage=c1d43000)
Stack:  c02166a0 00020908 000208dc 00000000 00007fb9 00000000 c1d46100
c2ca8658
               00000202 c3226884 c3226a18 c3226af8 c3226ae0 c015c782
c31a9ecc c0d763d0
               0003b0c1 c3226ae0 c24b37b0 c2d5f190 c1d46100 c015b192
c31a9ecc c3226ae0
Call Trace: [<c015c782>] [<c015b192>] [<c0139b77>] [<c0139c26>]
[<c0106de3>]
Code: 0f 0b 83 c4 0c 3b 5f 78 74 2a 3b 5f 7c 74 25 8b 45 0c 39 43

>>EIP; c015d8af <jffs2_mark_node_obsolete+143/290>   <=====
Trace; c015c782 <jffs2_add_fd_to_list+5e/ac>
Trace; c015b192 <jffs2_symlink+3ba/3e0>
Trace; c0139b77 <vfs_symlink+63/94>
Trace; c0139c26 <sys_symlink+7e/cc>
Trace; c0106de3 <system_call+33/38>
Code;  c015d8af <jffs2_mark_node_obsolete+143/290>
00000000 <_EIP>:
Code;  c015d8af <jffs2_mark_node_obsolete+143/290>   <=====
   0:   0f 0b                     ud2a      <=====
Code;  c015d8b1 <jffs2_mark_node_obsolete+145/290>
   2:   83 c4 0c                  add    $0xc,%esp
Code;  c015d8b4 <jffs2_mark_node_obsolete+148/290>
   5:   3b 5f 78                  cmp    0x78(%edi),%ebx
Code;  c015d8b7 <jffs2_mark_node_obsolete+14b/290>
   8:   74 2a                     je     34 <_EIP+0x34> c015d8e3
<jffs2_mark_node_obsolete+177/290>
Code;  c015d8b9 <jffs2_mark_node_obsolete+14d/290>
   a:   3b 5f 7c                  cmp    0x7c(%edi),%ebx
Code;  c015d8bc <jffs2_mark_node_obsolete+150/290>
   d:   74 25                     je     34 <_EIP+0x34> c015d8e3
<jffs2_mark_node_obsolete+177/290>
Code;  c015d8be <jffs2_mark_node_obsolete+152/290>
   f:   8b 45 0c                  mov    0xc(%ebp),%eax
Code;  c015d8c1 <jffs2_mark_node_obsolete+155/290>
  12:   39 43 00                  cmp    %eax,0x0(%ebx)

 <0>Kernel Panic: Aiee, killing interrupt handler!



On Sun, 2001-11-04 at 16:40, David Woodhouse wrote:
> On 4 Nov 2001, Michael Rothwell wrote:
> 
> > On Sun, 2001-11-04 at 16:16, David Woodhouse wrote:
> > > # dd if=jffs2-image of=/dev/hda (or hda1, hda2, etc.) 
> > > # insmod blkmtd device=/dev/hda
> > > # mount -t jffs2 /dev/mtdblock0 /mnt/jffs2
> > 
> > ... followed by a litany of "argh, block not erased" type messages in
> > the syslog. Mount then returns. 
> 
> That bit's expected.
> 
> > Then, I try to copy some files into the mounted jffs2 filesystem ... 
> >  "cp" causes an oops and the interrupt handler gets killed.
> 
> That bit isn't. Backtrace etc. please.
> 
> > > You may want partitioning if you want to boot from this too, not just use 
> > > it as filesystem.
> > 
> > Am I correct in assuming that I can make partitions with fdisk, then 
> > 
> >  # dd if=flash.jffs2 of=/dev/hde1
> >  # modprobe blkmtd device=/dev/hde1
> >  # mount -t jffs2 /dev/mtdblock0 /mnt/flash
> 
> > What would this look like in lilo and /etc/fstab on the device that will
> > hopefully be booting from the jffs2 image?
> 
> LILO isn't going to boot a kernel on a JFFS2 file system. You'll need to 
> make a separate partition to hold your kernel.
> 
> The above mount command translates to /etc/fstab just as you'd expect. 
> You have to load the module first though. I think the new version of 
> blkmtd allows you to specify the device to use on the kernel command line.
> 
> > Maybe the updates won't oops... :)
> 
> Maybe :)
> 
> > Do you use mtdram to create jffs2 filesystems? Or some other method?
> 
> No, I use mkfs.jffs2. It produces a more compact image. 
> 
> -- 
> dwmw2
> 
