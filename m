Date: Sat, 31 May 2014 16:51:15 +0200
From: Richard Cochran <richardcochran@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 00/32] making inode time stamps y2038 ready
Message-ID: <20140531145114.GA3721@localhost.localdomain>
References: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
Cc: hch@infradead.org, linux-mtd@lists.infradead.org, hpa@zytor.com,
 linux-f2fs-devel@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 joseph@codesourcery.com, linux-arch@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, coda@cs.cmu.edu,
 geert@linux-m68k.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, fuse-devel@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, xfs@oss.sgi.com, john.stultz@linaro.org,
 tglx@linutronix.de, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, logfs@logfs.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, lftan@altera.com, ocfs2-devel@oss.oracle.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 30, 2014 at 10:01:24PM +0200, Arnd Bergmann wrote:
> 
> I picked this because it is a fairly isolated problem, as the
> inode time stamps are rarely assigned to any other time values.
> As a byproduct of this work, I documented for each of the file
> systems we support how long the on-disk format can work[1].

Why are some of the time stamp expiration dates marked as "never"?

Thanks,
Richard
