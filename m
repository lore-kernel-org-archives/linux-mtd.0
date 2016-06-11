From: Arnd Bergmann <arnd@arndb.de>
To: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: Bob Copeland <me@bobcopeland.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>, y2038@lists.linaro.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Evgeniy Dushistov <dushistov@mail.ru>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Kara <jack@suse.com>,
 linux-ext4@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-afs@lists.infradead.org,
 "Tigran A. Aivazian" <tigran@aivazian.fsnet.co.uk>,
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jan Kara <jack@suse.cz>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
 linux-karma-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 01/21] fs: Replace CURRENT_TIME_SEC with current_fs_time()
Date: Sat, 11 Jun 2016 22:55:52 +0200
Message-ID: <6859475.Y26Py76amW@wuerfel>
In-Reply-To: <CABeXuvp9MV720nFVHfEOdL0q11xadKezThpsh+5wd1O5KYk6Yg@mail.gmail.com>
References: <1465448705-25055-1-git-send-email-deepa.kernel@gmail.com>
 <3091973.UMxUogx2eG@wuerfel>
 <CABeXuvp9MV720nFVHfEOdL0q11xadKezThpsh+5wd1O5KYk6Yg@mail.gmail.com>
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

On Friday, June 10, 2016 10:03:14 PM CEST Deepa Dinamani wrote:
> On Fri, Jun 10, 2016 at 3:21 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> >
> > In an earlier version, you had a small optimization to
> > use ktime_get_real_seconds() instead of current_kernel_time()
> > when the granularity is seconds.
> >
> > Do you still plan to send that one, or did you decide we don't
> > need it?
> 
> I was actually planning to use get_seconds() instead of current_kernel_time().
> And, transition both along with vfs to y2038 safe apis.
> Difference between ktime_get_real_seconds() and current_kernel_time64()
> is not much because they both require sequence counter.
> 
> It didn't make sense to me to optimize current_fs_time() for seconds
> only, and not optimize for 1ns granularity also.

Ah, you are right: adding another check for second granularity would
probably cost more than it would save, since we already don't calculate
the exact nanoseconds but just use the timestamp of the last timer
tick.

> I plan to make changes to the function depending on how we end up
> using timespec_trunc() after the addition of range checking.

Makes sense. I guess we can skip the range checking for
current_fs_time() if we end up not allowing writable mounts on
file systems that cannot represent the current time, but we
do want the range checking for the other users of
timespec_trunc().

	Arnd
