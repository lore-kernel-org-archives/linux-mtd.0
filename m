MIME-Version: 1.0
In-Reply-To: <CA+55aFzomEx82xuREb23K12g7XqDAZgrwYHWhOpgQVp1hk3oQw@mail.gmail.com>
References: <1465448705-25055-1-git-send-email-deepa.kernel@gmail.com>
 <1465448705-25055-2-git-send-email-deepa.kernel@gmail.com>
 <20160609073507.GA2790@quack2.suse.cz>
 <CA+55aFzomEx82xuREb23K12g7XqDAZgrwYHWhOpgQVp1hk3oQw@mail.gmail.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Thu, 9 Jun 2016 13:41:10 -0700
Message-ID: <CABeXuvqO6NsZdabHHiVWRYDNc0qB+jNRAiytR=ZyBV0DUSTEZw@mail.gmail.com>
Subject: Re: [PATCH 01/21] fs: Replace CURRENT_TIME_SEC with current_fs_time()
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jan Kara <jack@suse.cz>, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Thomas Gleixner <tglx@linutronix.de>, Al Viro <viro@zeniv.linux.org.uk>,
 y2038@lists.linaro.org,
 Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Evgeniy Dushistov <dushistov@mail.ru>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Kara <jack@suse.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org,
 "Tigran A. Aivazian" <tigran@aivazian.fsnet.co.uk>,
 "Theodore Ts'o" <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Harkes <jaharkes@cs.cmu.edu>,
 coda@cs.cmu.edu,
 codalist@coda.cs.cmu.edu, Bob Copeland <me@bobcopeland.com>,
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

On Thu, Jun 9, 2016 at 12:15 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Jun 9, 2016 at 12:35 AM, Jan Kara <jack@suse.cz> wrote:
>>
>> You create line longer than 80 characters for affs and reiserfs. Please
>> wrap those lines properly.
>
> No, please do *NOT* do things like that.
>
> These kind of mechanical patches should
>
>  (a) be as mechanical as possible (and see elsewhere about why I think
> 'sb' should be 'inode' and the patch should have been 95% automated
> with a trivial script thanks to that change)
>
>  (b) be made as easy to verify visually as possible.
>
> That (b) means that a conversion should *not* add whitespace fixups or
> add other non-mechanical cleanups, because it's a *lot* easier to see
> that a conversion like
>
> -       inode->i_mtime = inode->i_ctime = CURRENT_TIME_SEC;
> +       inode->i_mtime = inode->i_ctime = current_fs_time(inode);
>
> makes no other changes, but if you start doing line-splitting or other
> transformations (add new variables etc to get at 'sb'), suddenly you
> have to verify the patch at a completely different level.
>
> In other words, it's actually really important to make these kinds of
> bulk changes be very very obvious. Including to the point of making
> them visually easier to scan as a patch by not making any other
> changes.

Thanks for the guidelines.
Only patches 1 and 4 are mechanical.
All others need some kind of inspection/ verification.
I will keep these in mind for updating 1 and 4.

-Deepa
