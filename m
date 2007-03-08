Subject: Re: The NFS mounting jffs2 filesystem with errors, solution need
From: David Woodhouse <dwmw2@infradead.org>
To: zheng xin <zhx821223@hotmail.com>
In-Reply-To: <BAY129-F38DCF83FC0B3A84A14DF91AD7A0@phx.gbl>
References: <BAY129-F38DCF83FC0B3A84A14DF91AD7A0@phx.gbl>
Content-Type: text/plain
Date: Thu, 08 Mar 2007 15:08:11 +0000
Message-Id: <1173366491.3461.464.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Neil Brown <neilb@suse.de>, Gregory CLEMENT <gclement00@gmail.com>,
	linux-mtd@lists.infradead.org, hch@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-03-07 at 22:32 +0000, zheng xin wrote:
> I saw some discussions about this kind of problem on the following link:
> 
> http://www.infradead.org/pipermail/linux-mtd/2006-September/016496.html
> 
> Then I did the fixes given there:

Those are insufficient. We should also implement get_parent(). Which
means we need some way to _find_ the parent of a directory. We can abuse
ic->nlink for that -- there's a first attempt at
http://david.woodhou.se/jffs2-nfs-export.patch

> It DO mount successfully. BUT, when I try to access the mounted directory:
> >ls /mnt
> 
> It is just dead, no output, can not be killed.

Can you use SysRq-T (or echo t > /proc/sysrq-trigger) on the machine
from which you exported the file system? Does it look something like
this?

nfsd          D 0000000000000000 12064 15028      1         15029 15027 (L-TLB)
Call Trace:
[C00000000A5C30D0] [C00000000A5C3160] 0xc00000000a5c3160 (unreliable)
[C00000000A5C32A0] [C0000000000110AC] .__switch_to+0x12c/0x160
[C00000000A5C3330] [C0000000003EFC50] .schedule+0x8e0/0xa3c
[C00000000A5C3430] [C0000000003EF1BC] .__down+0x6c/0xf0
[C00000000A5C34F0] [D0000000009B99A8] .jffs2_lookup+0x88/0x218 [jffs2]
[C00000000A5C35A0] [C0000000001056F4] .__lookup_hash+0x18c/0x1d4
[C00000000A5C3640] [C000000000105E0C] .lookup_one_len+0x74/0x8c
[C00000000A5C36D0] [D000000000AD0B6C] .compose_entry_fh+0x12c/0x1bc [nfsd]
[C00000000A5C3780] [D000000000AD0EBC] .encode_entry+0x1dc/0x444 [nfsd]
[C00000000A5C3AA0] [D0000000009B9CF0] .jffs2_readdir+0x1b8/0x24c [jffs2]
[C00000000A5C3B60] [C00000000010AE10] .vfs_readdir+0xdc/0x13c
[C00000000A5C3C10] [D000000000AC5BEC] .nfsd_readdir+0x90/0x118 [nfsd]
[C00000000A5C3CC0] [D000000000ACFBA0] .nfsd3_proc_readdirplus+0x104/0x250 [nfsd]
[C00000000A5C3D70] [D000000000AC0380] .nfsd_dispatch+0x134/0x274 [nfsd]
[C00000000A5C3E10] [D000000000566E94] .svc_process+0x550/0x968 [sunrpc]
[C00000000A5C3EF0] [D000000000AC0C68] .nfsd+0x1e0/0x360 [nfsd]
[C00000000A5C3F90] [C000000000029110] .kernel_thread+0x4c/0x68

It seems to have deadlocked on the directory's f->sem semaphore, because
jffs2_lookup() is being called from _inside_ jffs2_readdir() for the
same directory. I wasn't aware that was possible.

-- 
dwmw2
