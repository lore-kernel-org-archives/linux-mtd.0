Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciaNr-0006Xx-Py
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 05:31:37 +0000
Date: Tue, 28 Feb 2017 06:31:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Logan Gunthorpe <logang@deltatee.com>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Johannes Thumshirn <jthumshirn@suse.de>, Jan Kara <jack@suse.cz>,
 Arnd Bergmann <arnd@arndb.de>, Sajjan Vikas C <vikas.cha.sajjan@hpe.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, Peter Huewe <peterhuewe@gmx.de>,
 Marcel Selhorst <tpmdd@selhorst.net>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Olof Johansson <olof@lixom.net>, Doug Ledford <dledford@redhat.com>,
 Sean Hefty <sean.hefty@intel.com>,
 Hal Rosenstock <hal.rosenstock@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Haggai Eran <haggaie@mellanox.com>,
 Parav Pandit <pandit.parav@gmail.com>,
 Leon Romanovsky <leon@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 Alexandre Bounine <alexandre.bounine@idt.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Joe Perches <joe@perches.com>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Boaz Harrosh <ooo@electrozaur.com>,
 "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Stephen Bates <stephen.bates@microsemi.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-scsi <linux-scsi@vger.kernel.org>, rtc-linux@googlegroups.com,
 linux-mtd@lists.infradead.org,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@ml01.01.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 01/16] chardev: add helper function to register char
 devs with a struct device
Message-ID: <20170228053102.GA14688@kroah.com>
References: <1488091097-12328-1-git-send-email-logang@deltatee.com>
 <1488091097-12328-2-git-send-email-logang@deltatee.com>
 <CAPcyv4i91_esBtBxbnDH3ZDd8Mnz4HoJEW2yeEvQ4QikFBjapA@mail.gmail.com>
 <20170227165618.GE5891@obsidianresearch.com>
 <7df6e57b-531c-1b23-05bf-c368df2d20f3@deltatee.com>
 <CAPcyv4jiPE1jK9ubbsAm_ZNMt=S106NCpXD4KPUWpcK9_GEDJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4jiPE1jK9ubbsAm_ZNMt=S106NCpXD4KPUWpcK9_GEDJA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 27, 2017 at 07:36:09PM -0800, Dan Williams wrote:
> On Mon, Feb 27, 2017 at 7:27 PM, Logan Gunthorpe <logang@deltatee.com> wrote:
> >
> >
> > On 27/02/17 09:56 AM, Jason Gunthorpe wrote:
> >> Yes please, that is way too subtle. Suggest:
> >>
> >> NOTE: Callers must assume that userspace was able to open the cdev and
> >> can call cdev fops callbacks at any time, even if this function fails.
> >>
> >> I would also add a note to cdev_device_del:
> >>
> >> NOTE: This guarantees that associated sysfs callbacks are not running
> >> or runnable, however any open cdevs will remain and their fops remain
> >> callable even after this returns.
> >>
> >> Since I have seen a lot of confusion on that point as well..
> >
> > Sure, I'll add that verbiage to a v3 sometime after rc1.
> 
> It would also be great to patch1 into a stable non-rebasing git tree
> so it can be used as a baseline for other 4.12 targeted development.
> The device-dax patches in particular collide with some pending
> development.

I'll do that once -rc1 is out, I can't take any new patches right now :)

thanks,

greg k-h
