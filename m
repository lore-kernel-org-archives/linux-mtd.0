Subject: Re: [BLOCK2MTD] WARNING: at kernel/lockdep.c:2331 lockdep_init_map()
From: Peter Zijlstra <a.p.zijlstra@chello.nl>
To: Erez Zadok <ezk@cs.sunysb.edu>
In-Reply-To: <200710191753.l9JHreeS012064@agora.fsl.cs.sunysb.edu>
References: <200710191753.l9JHreeS012064@agora.fsl.cs.sunysb.edu>
Content-Type: text/plain
Date: Fri, 19 Oct 2007 20:31:29 +0200
Message-Id: <1192818689.9471.14.camel@lappy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2007-10-19 at 13:53 -0400, Erez Zadok wrote:
> I've been having this problem for some time with mtd, which I use to mount
> jffs2 images (for unionfs testing).  I've seen it in several recent major
> kernels, including 2.6.24.  Here's the sequence of ops I perform:
> 
> # cp jffs2-empty.img /tmp/foo
> # losetup /dev/loop0 /tmp/foo
> # modprobe mtdblock
> # modprobe block2mtd block2mtd=/dev/loop0,128ki
> # mount -t jffs2 /dev/mtdblock0 /n/lower/b0
> 
> The jffs2-empty.img is a small jffs2 image, of an empty directory, created
> w/ the jffs2 utils.  At the point I modprobe block2mtd, I get the following
> lockdep warning and a "BUG" message:
> 
> BUG: key f88e1340 not in .data!
> WARNING: at kernel/lockdep.c:2331 lockdep_init_map()
>  [<c0102bc2>] show_trace_log_lvl+0x1a/0x2f
>  [<c0103692>] show_trace+0x12/0x14
>  [<c01037b2>] dump_stack+0x15/0x17
>  [<c0125432>] lockdep_init_map+0x94/0x3e4
>  [<c0125001>] debug_mutex_init+0x2c/0x3c
>  [<c01210d4>] __mutex_init+0x38/0x40
>  [<f88e01d3>] 0xf88e01d3
>  [<c011dda7>] parse_args+0x123/0x200
>  [<c012b725>] sys_init_module+0xdd0/0x122c
>  [<c0102586>] sysenter_past_esp+0x5f/0x91
>  =======================
> block2mtd: mtd0: [d: /dev/loop0] erase_size = 128KiB [131072]
> block2mtd: version $Revision: 1.30 $
> 
> However, everything seems to work afterwards: jffs2 mounts, and all my
> unionfs+jffs2 tests succeed.
> 
> So, what is this "key xxx not in .data" message and should I worry?  Is the
> lockdep warning a problem?  (It might be a problem if lockdep warnings are
> turned off afterwards, so lockdep won't complain about future warnings.)
> Heck, am I using mtd/jffs correctly?

Someone stuck a key object in non static storage. That breaks lockdep,
don't do that :-)

Is the mutex_init() done from a function tagged with __init?
