Date: Mon, 2 Jun 2014 13:52:19 +0000
From: "Joseph S. Myers" <joseph@codesourcery.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 00/32] making inode time stamps y2038 ready
In-Reply-To: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
Message-ID: <Pine.LNX.4.64.1406021350030.19591@digraph.polyomino.org.uk>
References: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
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

On Fri, 30 May 2014, Arnd Bergmann wrote:

> a) is this the right approach in general? The previous discussion
>    pointed this way, but there may be other opinions.

The syscall changes seem like the sort of thing I'd expect, although 
patches adding new syscalls or otherwise affecting the kernel/userspace 
interface (as opposed to those relating to an individual filesystem) 
should go to linux-api as well as other relevant lists.

-- 
Joseph S. Myers
joseph@codesourcery.com
