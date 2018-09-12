Received: from mail-qt0-f196.google.com ([209.85.216.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g07t1-000093-Oq
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2018 16:21:36 +0000
Received: by mail-qt0-f196.google.com with SMTP id t5-v6so2444848qtn.3
 for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2018 09:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20180912150142.157913-1-arnd@arndb.de>
 <20180912150142.157913-2-arnd@arndb.de>
 <20180912153300.GE5633@ziepe.ca>
In-Reply-To: <20180912153300.GE5633@ziepe.ca>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 12 Sep 2018 18:20:34 +0200
Message-ID: <CAK8P3a1RoYo0VHrDfxdmJt9ns0ErTeuctH9CPG5_mg7JTwZtEQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/17] compat_ioctl: move drivers to
 generic_compat_ioctl_ptrarg
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 gregkh <gregkh@linuxfoundation.org>, Peter Huewe <peterhuewe@gmx.de>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 "Winkler, Tomas" <tomas.winkler@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Miller <davem@davemloft.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-integrity@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, USB list <linux-usb@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Networking <netdev@vger.kernel.org>, driverdevel <devel@driverdev.osuosl.org>,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 12, 2018 at 5:33 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Sep 12, 2018 at 05:01:03PM +0200, Arnd Bergmann wrote:
> > Each of these drivers has a copy of the same trivial helper function to
> > convert the pointer argument and then call the native ioctl handler.
> >
> > We now have a generic implementation of that, so use it.
> >
>
> For vtpm:
>
> Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
>
> Arnd, would you consider including a patch as part of/after this
> series to make compat_ioctl in drivers/infiniband/core/uverbs_main.c
> use this as well?  Looks like a bug too?

That should be included in patch 5 in this series. I may have skipped
some Cc there since it had too many recipients (sent only to the
mailing lists instead).

        Arnd
