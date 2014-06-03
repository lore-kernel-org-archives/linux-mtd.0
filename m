From: Arnd Bergmann <arnd@arndb.de>
To: Vyacheslav Dubeyko <slava@dubeyko.com>
Subject: Re: [RFC 00/32] making inode time stamps y2038 ready
Date: Tue, 03 Jun 2014 14:21:29 +0200
Message-ID: <7080340.W1OdttOEiZ@wuerfel>
In-Reply-To: <1401546649.2413.6.camel@slavad-CELSIUS-H720>
References: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
 <1401546649.2413.6.camel@slavad-CELSIUS-H720>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Saturday 31 May 2014 18:30:49 Vyacheslav Dubeyko wrote:
> By the way, what about NILFS2? Is NILFS2 ready for suggested approach
> without any changes?

nilfs2 and a lot of other file systems don't need any changes for
this, because they don't assign the inode time stamp fields to
a 'struct timespec'.

FWIW, nilfs2 uses a 64-bit seconds value, which is always safe and
can represent the full range of user space timespec on all machines.

	Arnd
