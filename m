Received: from mail-vn0-x235.google.com ([2607:f8b0:400c:c0f::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtlBl-0006F0-RK
 for linux-mtd@lists.infradead.org; Sat, 16 May 2015 23:08:14 +0000
Received: by vnbg129 with SMTP id g129so1101451vnb.11
 for <linux-mtd@lists.infradead.org>; Sat, 16 May 2015 16:07:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55547564.60107@nod.at>
References: <55547564.60107@nod.at>
Date: Sun, 17 May 2015 01:07:51 +0200
Message-ID: <CAFLxGvyLFdOyMeupkbgix4B7VfjnX2JGudh0aZv8PT4YT+m0KA@mail.gmail.com>
Subject: Re: [GIT PULL] UBI/UBIFS updates for 4.1-rc4
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 14, 2015 at 12:13 PM, Richard Weinberger <richard@nod.at> wrote:
> Linus,
>
> the following changes since commit 5ebe6afaf0057ac3eaeb98defd5456894b446d22:
>
>   Linux 4.1-rc2 (2015-05-03 19:22:23 -0700)
>
> are available in the git repository at:
>
>   git://git.infradead.org/linux-ubifs.git tags/upstream-4.1-rc4
>
> for you to fetch changes up to 98fb1ffd8154890d7051750e61ff5548c3ee2ab2:
>
>   UBI: block: Add missing cache flushes (2015-05-06 22:52:22 +0200)
>
> ----------------------------------------------------------------
> This pull request contains a single bug fix for the UBI block driver.
>
> ----------------------------------------------------------------
> Kevin Cernekee (1):
>       UBI: block: Add missing cache flushes
>
>  drivers/mtd/ubi/block.c | 2 ++
>  1 file changed, 2 insertions(+)

Linus,

just noticed that you did not pull this (and also not my UML fixes).
Is something wrong with my pull requests?

-- 
Thanks,
//richard
