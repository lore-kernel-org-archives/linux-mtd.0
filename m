MIME-Version: 1.0
In-Reply-To: <3091973.UMxUogx2eG@wuerfel>
References: <1465448705-25055-1-git-send-email-deepa.kernel@gmail.com>
 <1465448705-25055-2-git-send-email-deepa.kernel@gmail.com>
 <3091973.UMxUogx2eG@wuerfel>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Fri, 10 Jun 2016 22:03:14 -0700
Message-ID: <CABeXuvp9MV720nFVHfEOdL0q11xadKezThpsh+5wd1O5KYk6Yg@mail.gmail.com>
Subject: Re: [PATCH 01/21] fs: Replace CURRENT_TIME_SEC with current_fs_time()
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bob Copeland <me@bobcopeland.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 y2038@lists.linaro.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Evgeniy Dushistov <dushistov@mail.ru>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Jan Kara <jack@suse.com>, linux-ext4@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org,
 "Tigran A. Aivazian" <tigran@aivazian.fsnet.co.uk>,
 "Theodore Ts'o" <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.cz>,
 Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
 linux-karma-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 10, 2016 at 3:21 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday, June 8, 2016 10:04:45 PM CEST Deepa Dinamani wrote:
>> CURRENT_TIME_SEC is not y2038 safe. current_fs_time() will
>> be transitioned to use 64 bit time along with vfs in a
>> separate patch.
>> There is no plan to transistion CURRENT_TIME_SEC to use
>> y2038 safe time interfaces.
>>
>> current_fs_time() will also be extended to use superblock
>> range checking parameters when range checking is introduced.
>>
>> This works because alloc_super() fills in the the s_time_gran
>> in super block to NSEC_PER_SEC.
>>
>> Also note that filesystem specific times like the birthtime,
>> creation time that were using same interfaces to obtain time
>> retain same logistics.
>>
>> Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
>
> one question:
>
> In an earlier version, you had a small optimization to
> use ktime_get_real_seconds() instead of current_kernel_time()
> when the granularity is seconds.
>
> Do you still plan to send that one, or did you decide we don't
> need it?

I was actually planning to use get_seconds() instead of current_kernel_time().
And, transition both along with vfs to y2038 safe apis.
Difference between ktime_get_real_seconds() and current_kernel_time64()
is not much because they both require sequence counter.

It didn't make sense to me to optimize current_fs_time() for seconds
only, and not optimize for 1ns granularity also.
I plan to make changes to the function depending on how we end up
using timespec_trunc()
after the addition of range checking.

Thanks for the guidance on inclusion of reviewers. I'll follow this
approach when I post v2 of the series.

-Deepa
