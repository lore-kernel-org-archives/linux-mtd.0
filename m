Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGYOj-0005pr-TO
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 21:12:24 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: y2038@lists.linaro.org
Cc: Deepa Dinamani <deepa.kernel@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Y2038] [PATCH v2 07/24] fs: ubifs: Replace CURRENT_TIME_SEC with
 current_time
Date: Fri, 24 Jun 2016 23:14:06 +0200
Message-ID: <12663159.PWXCHjMIS1@wuerfel>
In-Reply-To: <CABeXuvqieDuioh7xBEpVhMGGYhRpdgswdjWd7nBZdRagftUHkA@mail.gmail.com>
References: <1466382443-11063-1-git-send-email-deepa.kernel@gmail.com>
 <5694616.oYyysJP9uD@wuerfel>
 <CABeXuvqieDuioh7xBEpVhMGGYhRpdgswdjWd7nBZdRagftUHkA@mail.gmail.com>
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

On Friday, June 24, 2016 2:05:11 PM CEST Deepa Dinamani wrote:
> > This part of the patch seems independent of the rest, as you don't actually
> > use current_time() here, or assign the timespec to an inode.
> >
> > I'd suggest either leaving this part out of the patch series for now,
> > or making it a separate patch that uses timespec64 directly.
> 
> This is actually the root inode which is created and written to disk.
> We actually want to use current_time() here, but this is not cached.
> So we don't have a vfs inode.
> 
> struct ubifs_ino_node represents inode format on the disk.
> I thought it would be odd to fill this with timespec64 only here.
> My plan was to switch it over to timespec64 when all of ubifs changes
> to use timespec64.

It is a bit odd, but I can't think of why that would be a problem.
All the other instances have to wait until the inode timestamps
are converted but this one does not.

> This also was helping the current series as it let me delete
> CURRENT_TIME macros.
> I can add a comment to suggest this in code.
> 
> But, what you suggest should also work fine since the on disk
> representation is big enough to use timespec64 already.
> Let me know if you want me to drop this change for now as we delete
> CURRENT_TIME macros after rc1 now.

I'd leave it in.

	Arnd
