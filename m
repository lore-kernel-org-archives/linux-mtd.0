Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aBs0i-0003eP-TM
 for linux-mtd@lists.infradead.org; Wed, 23 Dec 2015 22:35:57 +0000
Received: by mail-oi0-x22c.google.com with SMTP id y66so130714813oig.0
 for <linux-mtd@lists.infradead.org>; Wed, 23 Dec 2015 14:35:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <567A7922.8030405@nod.at>
References: <567A7922.8030405@nod.at>
Date: Wed, 23 Dec 2015 23:35:35 +0100
Message-ID: <CAFLxGvx6HcnOVn6=_abtZPaSTwuLEOoh0G4L=0ZJpGocDcJYPg@mail.gmail.com>
Subject: Re: [GIT PULL] UBI fixes for 4.4-rc
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 23, 2015 at 11:36 AM, Richard Weinberger <richard@nod.at> wrote:
> Linus,
>
> the following changes since commit 9f9499ae8e6415cefc4fe0a96ad0e27864353c89:
>
>   Linux 4.4-rc5 (2015-12-13 17:42:58 -0800)
>
> are available in the git repository at:
>
>   git://git.infradead.org/linux-ubifs.git tags/upstream-4.4-rc7
>
> for you to fetch changes up to 6b238de189f69dc77d660d4cce62eed15547f4c3:
>
>   mtd: ubi: don't leak e if schedule_erase() fails (2015-12-16 22:59:03 +0100)
>
> ----------------------------------------------------------------
> This pull request contains four bug fixes for UBI.
>
> ----------------------------------------------------------------
> Brian Norris (1):
>       UBI: fix use of "VID" vs. "EC" in header self-check
>
> Sebastian Siewior (2):
>       mtd: ubi: fixup error correction in do_sync_erase()
>       mtd: ubi: don't leak e if schedule_erase() fails
>
> Sudip Mukherjee (1):
>       UBI: fix return error code
>
>  drivers/mtd/ubi/debug.c |  2 +-
>  drivers/mtd/ubi/io.c    |  2 +-
>  drivers/mtd/ubi/wl.c    | 53 +++++++++++++++++++++++++++----------------------
>  3 files changed, 31 insertions(+), 26 deletions(-)

Linus,

I saw that you've pulled other requests from the same time spawn but
not this one.
Is something wrong with it?
Just making sure that this one was not caught by the Google mail spam
filter... :-)

-- 
Thanks,
//richard
