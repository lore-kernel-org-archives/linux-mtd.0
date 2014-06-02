Date: Mon, 2 Jun 2014 21:02:15 +0000
From: "Joseph S. Myers" <joseph@codesourcery.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 00/32] making inode time stamps y2038 ready
In-Reply-To: <4233989.Saca0ocOUr@wuerfel>
Message-ID: <Pine.LNX.4.64.1406022044090.27099@digraph.polyomino.org.uk>
References: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
 <Pine.LNX.4.64.1406021350030.19591@digraph.polyomino.org.uk>
 <4233989.Saca0ocOUr@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Sender: Joseph Myers <joseph@codesourcery.com>
Cc: hch@infradead.org, linux-mtd@lists.infradead.org, hpa@zytor.com,
 logfs@logfs.org, linux-afs@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, cluster-devel@redhat.com,
 coda@cs.cmu.edu, geert@linux-m68k.org, linux-ext4@vger.kernel.org,
 fuse-devel@lists.sourceforge.net, reiserfs-devel@vger.kernel.org,
 xfs@oss.sgi.com, john.stultz@linaro.org, tglx@linutronix.de,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, lftan@altera.com, linux-btrfs@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2 Jun 2014, Arnd Bergmann wrote:

> Ok. Sorry about missing linux-api, I confused it with linux-arch, which
> may not be as relevant here, except for the one question whether we
> actually want to have the new ABI on all 32-bit architectures or only
> as an opt-in for those that expect to stay around for another 24 years.

For glibc I think it will make the most sense to add the support for 
64-bit time_t across all architectures that currently have 32-bit time_t 
(with the new interfaces having fallback support to implementation in 
terms of the 32-bit kernel interfaces, if the 64-bit syscalls are 
unavailable either at runtime or in the kernel headers against which glibc 
is compiled - this fallback code will of course need to check for overflow 
when passing a time value to the kernel, hopefully with error handling 
consistent with whatever the kernel ends up doing when a filesystem can't 
support a timestamp).  If some architectures don't provide the new 
interfaces in the kernel then that will mean the fallback code in glibc 
can't be removed until glibc support for those architectures is removed 
(as opposed to removing it when glibc no longer supports kernels predating 
the kernel support).

> Two more questions for you:
> 
> - are you (and others) happy with adding this type of stat syscall
>   (fstatat64/fstat64) as opposed to the more generic xstat that has
>   been discussed in the past and that never made it through the bike-
>   shedding discussion?

I am.

> - once we have enough buy-in from reviewers to merge this initial
>   series, should we proceed to define rest of the syscall ABI
>   (minus driver ioctls) so glibc and kernel can do the conversion
>   on top of that, or should we better try to do things one syscall
>   family at a time and actually get the kernel to handle them
>   correctly internally?

I don't have any comments on that ordering question.

-- 
Joseph S. Myers
joseph@codesourcery.com
