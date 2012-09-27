Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1THMPe-0006Dm-Hq
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2012 22:18:37 +0000
Received: by bkwj4 with SMTP id j4so2462139bkw.36
 for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2012 15:18:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1348674710-102885-1-git-send-email-richard@nod.at>
References: <1348674710-102885-1-git-send-email-richard@nod.at>
Date: Fri, 28 Sep 2012 00:18:26 +0200
Message-ID: <CAFLxGvw+As5-d-kVOFztZG-n9gLEn9_Aouvmk+VUtsnmmbA3UA@mail.gmail.com>
Subject: Re: UBI: Fastmap request for inclusion (v19)
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=ISO-8859-1
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 26, 2012 at 5:51 PM, Richard Weinberger <richard@nod.at> wrote:
>  MAINTAINERS                 |    6 +
>  drivers/mtd/ubi/Kconfig     |   20 ++
>  drivers/mtd/ubi/Makefile    |    1 +
>  drivers/mtd/ubi/attach.c    |  386 +++++++++++++++++++---------
>  drivers/mtd/ubi/build.c     |   70 +++++-
>  drivers/mtd/ubi/eba.c       |  126 +++++++++-
>  drivers/mtd/ubi/ubi-media.h |  137 ++++++++++
>  drivers/mtd/ubi/ubi.h       |  118 +++++++++-
>  drivers/mtd/ubi/wl.c        |  599 ++++++++++++++++++++++++++++++++++++++-----
>  9 files changed, 1252 insertions(+), 211 deletions(-)

For what ever reason the diff stat misses fastmap.c
Here the correct one:

 MAINTAINERS                 |    6 +
 drivers/mtd/ubi/Kconfig     |   20 +
 drivers/mtd/ubi/Makefile    |    1 +
 drivers/mtd/ubi/attach.c    |  386 +++++++----
 drivers/mtd/ubi/build.c     |   70 ++-
 drivers/mtd/ubi/eba.c       |  126 ++++-
 drivers/mtd/ubi/fastmap.c   | 1560 +++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/ubi-media.h |  137 ++++
 drivers/mtd/ubi/ubi.h       |  118 ++++-
 drivers/mtd/ubi/wl.c        |  599 +++++++++++++++--
 10 files changed, 2812 insertions(+), 211 deletions(-)

> [PATCH 01/10] UBI: Add fastmap on-flash data structures
> [PATCH 02/10] UBI: Add fastmap stuff to ubi.h
> [PATCH 03/10] UBI: Export next_sqnum()
> [PATCH 04/10] UBI: Add self_check_eba()
> [PATCH 05/10] UBI: Add fastmap bits to build.c
> [PATCH 06/10] UBI: Wire-up ->fm_sem
> [PATCH 07/10] UBI: Add fastmap stuff to attach.c
> [PATCH 08/10] UBI: Add fastmap support to the WL sub-system
> [PATCH 09/10] UBI: Add fastmap core
> [PATCH 10/10] UBI: Wire-up fastmap

-- 
Thanks,
//richard
