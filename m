Date: Sat, 31 May 2014 20:22:37 +0200
From: Richard Cochran <richardcochran@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 00/32] making inode time stamps y2038 ready
Message-ID: <20140531182237.GA5382@localhost.localdomain>
References: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
 <20140531145114.GA3721@localhost.localdomain>
 <6347520.8jMPlVsFjM@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6347520.8jMPlVsFjM@wuerfel>
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

On Sat, May 31, 2014 at 05:23:02PM +0200, Arnd Bergmann wrote:
> 
> It's an approximation:

(Approximately never ;)

> with 64-bit timestamps, you can represent close to 300 billion
> years, which is way past the time that our planet can sustain
> life of any form[1].

Did you mean mean 64 bits worth of seconds?

  2^64 / (3600*24*365) = 584,942,417,355

That is more than 300 billion years, and still, it is not quite the
same as "never".

In any case, that term is not too helpful in the comparison table,
IMHO. One could think that some sort of clever running count relative
to the last mount time was implied.

Thanks,
Richard

[1] You are forgetting the immortal robotic overlords.
