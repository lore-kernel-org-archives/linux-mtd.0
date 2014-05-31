Received: from gproxy5-pub.mail.unifiedlayer.com ([67.222.38.55])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WqkJr-0004KL-9C
 for linux-mtd@lists.infradead.org; Sat, 31 May 2014 14:31:35 +0000
Message-ID: <1401546649.2413.6.camel@slavad-CELSIUS-H720>
Subject: Re: [RFC 00/32] making inode time stamps y2038 ready
From: Vyacheslav Dubeyko <slava@dubeyko.com>
To: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 31 May 2014 18:30:49 +0400
In-Reply-To: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
References: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: hch@infradead.org, linux-mtd@lists.infradead.org, hpa@zytor.com,
 logfs@logfs.org, linux-afs@lists.infradead.org, joseph@codesourcery.com,
 linux-arch@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-scsi@vger.kernel.org, ceph-devel@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, coda@cs.cmu.edu,
 geert@linux-m68k.org, linux-ext4@vger.kernel.org,
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

Hi Arnd,

On Fri, 2014-05-30 at 22:01 +0200, Arnd Bergmann wrote:

[snip]
> 
> Arnd Bergmann (32):
>   fs: introduce new 'struct inode_time'
>   uapi: add struct __kernel_timespec{32,64}
>   fs: introduce sys_utimens64at
>   fs: introduce sys_newfstat64/sys_newfstatat64
>   arch: hook up new stat and utimes syscalls
>   isofs: fix timestamps beyond 2027
>   fs/nfs: convert to struct inode_time
>   fs/ceph: convert to 'struct inode_time'
>   fs/pstore: convert to struct inode_time
>   fs/coda: convert to struct inode_time
>   xfs: convert to struct inode_time
>   btrfs: convert to struct inode_time
>   ext3: convert to struct inode_time
>   ext4: convert to struct inode_time
>   cifs: convert to struct inode_time
>   ntfs: convert to struct inode_time
>   ubifs: convert to struct inode_time
>   ocfs2: convert to struct inode_time
>   fs/fat: convert to struct inode_time
>   afs: convert to struct inode_time
>   udf: convert to struct inode_time
>   fs: convert simple fs to inode_time
>   logfs: convert to struct inode_time
>   hfs, hfsplus: convert to struct inode_time
>   gfs2: convert to struct inode_time
>   reiserfs: convert to struct inode_time
>   jffs2: convert to struct inode_time
>   adfs: convert to struct inode_time
>   f2fs: convert to struct inode_time
>   fuse: convert to struct inode_time
>   scsi: fnic: use current_kernel_time() for timestamp
>   fs: use new inode_time definition unconditionally
> 

By the way, what about NILFS2? Is NILFS2 ready for suggested approach
without any changes?

Thanks,
Vyacheslav Dubeyko.
