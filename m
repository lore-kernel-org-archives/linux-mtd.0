Received: from mail-vc0-x22d.google.com ([2607:f8b0:400c:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UvBQg-0003ro-W6
 for linux-mtd@lists.infradead.org; Fri, 05 Jul 2013 19:12:27 +0000
Received: by mail-vc0-f173.google.com with SMTP id ht10so1880972vcb.18
 for <linux-mtd@lists.infradead.org>; Fri, 05 Jul 2013 12:12:03 -0700 (PDT)
MIME-Version: 1.0
Sender: linus971@gmail.com
In-Reply-To: <1373036223.2711.62.camel@sauron.fi.intel.com>
References: <1373036223.2711.62.camel@sauron.fi.intel.com>
Date: Fri, 5 Jul 2013 12:12:03 -0700
Message-ID: <CA+55aFxv2A+4mfhuBUVJnPhDzvLw3ttg6BV3=FPDwRqGTfc2Xg@mail.gmail.com>
Subject: Re: [GIT PULL] UBI changes for 3.11-rc1
From: Linus Torvalds <torvalds@linux-foundation.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 5, 2013 at 7:57 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
>  drivers/mtd/ubi/build.c     | 59 ++++++++++++++++++++++++++++++++++++++++-------------------
>  drivers/mtd/ubi/fastmap.c   |  4 +++-
>  include/uapi/mtd/ubi-user.h |  5 ++++-

That's a very strange script you're using. It has somehow cut off the
last line of the diffstat - the one that actually is the primary one
to check the overally statistics:

 3 files changed, 47 insertions(+), 21 deletions(-)

Please double-check your pull script.

Anyway, pulled, so you don't need to re-send, but please fix this for
future pulls.

                Linus
