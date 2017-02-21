Received: from mail-ot0-x22a.google.com ([2607:f8b0:4003:c0f::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgG5P-0007RW-8g
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 19:26:57 +0000
Received: by mail-ot0-x22a.google.com with SMTP id j38so4193521otb.3
 for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2017 11:26:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170221113704.ibwkk2vuc5imkmae@piout.net>
References: <1487653253-11497-1-git-send-email-logang@deltatee.com>
 <1487653253-11497-3-git-send-email-logang@deltatee.com>
 <20170221113704.ibwkk2vuc5imkmae@piout.net>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 21 Feb 2017 11:26:33 -0800
Message-ID: <CAPcyv4huQGQPSwvX9=iAVtzr1ga8RbN+e_q7DNaUMWGbWt_5mA@mail.gmail.com>
Subject: Re: [PATCH 02/14] device-dax: utilize new device_add_cdev helper
 function
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Logan Gunthorpe <logang@deltatee.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Johannes Thumshirn <jthumshirn@suse.de>, Jan Kara <jack@suse.cz>,
 Arnd Bergmann <arnd@arndb.de>, Sajjan Vikas C <vikas.cha.sajjan@hpe.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, Peter Huewe <peterhuewe@gmx.de>,
 Marcel Selhorst <tpmdd@selhorst.net>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Olof Johansson <olof@lixom.net>,
 Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>,
 Hal Rosenstock <hal.rosenstock@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Haggai Eran <haggaie@mellanox.com>, Parav Pandit <pandit.parav@gmail.com>,
 Leon Romanovsky <leon@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 Alexandre Bounine <alexandre.bounine@idt.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Joe Perches <joe@perches.com>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Boaz Harrosh <ooo@electrozaur.com>,
 Benny Halevy <bhalevy@primarydata.com>,
 "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Stephen Bates <stephen.bates@microsemi.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 osd-dev@open-osd.org,
 linux-scsi <linux-scsi@vger.kernel.org>, rtc-linux@googlegroups.com,
 linux-mtd@lists.infradead.org,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 linux-iio@vger.kernel.org,
 linux-rdma@vger.kernel.org, tpmdd-devel@lists.sourceforge.net,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
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

On Tue, Feb 21, 2017 at 3:37 AM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> Hi,
>
> A small comment, you must always have a commit message. Even if it is
> small.

Yes, something like: "Replace the open coded initialization of the
cdev with the new device_add_cdev() helper. The helper takes the
proper reference against the parent device while the cdev object is
alive."

With that you can also add:

Acked-by: Dan Williams <dan.j.williams@intel.com>
