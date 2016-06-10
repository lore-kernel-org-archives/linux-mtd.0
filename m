From: Arnd Bergmann <arnd@arndb.de>
To: Deepa Dinamani <deepa.kernel@gmail.com>, Bob Copeland <me@bobcopeland.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>, y2038@lists.linaro.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Evgeniy Dushistov <dushistov@mail.ru>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Kara <jack@suse.com>,
 linux-ext4@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-afs@lists.infradead.org,
 "Tigran A. Aivazian" <tigran@aivazian.fsnet.co.uk>,
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jan Kara <jack@suse.cz>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
 linux-karma-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 01/21] fs: Replace CURRENT_TIME_SEC with current_fs_time()
Date: Sat, 11 Jun 2016 00:21:54 +0200
Message-ID: <3091973.UMxUogx2eG@wuerfel>
In-Reply-To: <1465448705-25055-2-git-send-email-deepa.kernel@gmail.com>
References: <1465448705-25055-1-git-send-email-deepa.kernel@gmail.com>
 <1465448705-25055-2-git-send-email-deepa.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, June 8, 2016 10:04:45 PM CEST Deepa Dinamani wrote:
> CURRENT_TIME_SEC is not y2038 safe. current_fs_time() will
> be transitioned to use 64 bit time along with vfs in a
> separate patch.
> There is no plan to transistion CURRENT_TIME_SEC to use
> y2038 safe time interfaces.
> 
> current_fs_time() will also be extended to use superblock
> range checking parameters when range checking is introduced.
> 
> This works because alloc_super() fills in the the s_time_gran
> in super block to NSEC_PER_SEC.
> 
> Also note that filesystem specific times like the birthtime,
> creation time that were using same interfaces to obtain time
> retain same logistics.
> 
> Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>

one question:

In an earlier version, you had a small optimization to
use ktime_get_real_seconds() instead of current_kernel_time()
when the granularity is seconds.

Do you still plan to send that one, or did you decide we don't
need it?

	Arnd
