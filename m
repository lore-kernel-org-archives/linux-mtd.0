Message-ID: <538FB570.8000502@zytor.com>
Date: Wed, 04 Jun 2014 17:10:24 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [RFC 00/32] making inode time stamps y2038 ready
References: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
 <201406041703.47592.arnd@arndb.de>
 <alpine.LFD.2.11.1406041308300.17310@knanqh.ubzr>
 <8770583.6XeZxCxOY8@wuerfel>
In-Reply-To: <8770583.6XeZxCxOY8@wuerfel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: hch@infradead.org, Dave Chinner <david@fromorbit.com>,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, "Joseph S. Myers" <joseph@codesourcery.com>,
 linux-arch@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, coda@cs.cmu.edu, geert@linux-m68k.org,
 linux-ext4@vger.kernel.org, codalist@telemann.coda.cs.cmu.edu,
 fuse-devel@lists.sourceforge.net, reiserfs-devel@vger.kernel.org,
 xfs@oss.sgi.com, john.stultz@linaro.org, tglx@linutronix.de,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, logfs@logfs.org,
 linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, lftan@altera.com,
 ocfs2-devel@oss.oracle.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/04/2014 12:24 PM, Arnd Bergmann wrote:
> 
> For other timekeeping stuff in the kernel, I agree that using some
> 64-bit representation (nanoseconds, 32/32 unsigned seconds/nanoseconds,
> ...) has advantages, that's exactly the point I was making earlier
> against simply extending the internal time_t/timespec to 64-bit
> seconds for everything.
> 

How much of a performance issue is it to make time_t 64 bits, and for
the bits there are, how hard are they to fix?

	-hpa
