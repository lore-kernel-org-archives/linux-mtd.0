Received: from mail-io0-x232.google.com ([2607:f8b0:4001:c06::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cnoNW-00081j-S8
 for linux-mtd@lists.infradead.org; Tue, 14 Mar 2017 15:28:53 +0000
Received: by mail-io0-x232.google.com with SMTP id l7so1625544ioe.3
 for <linux-mtd@lists.infradead.org>; Tue, 14 Mar 2017 08:28:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1488783873-2614-6-git-send-email-logang@deltatee.com>
References: <1488783873-2614-1-git-send-email-logang@deltatee.com>
 <1488783873-2614-6-git-send-email-logang@deltatee.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Mar 2017 16:28:28 +0100
Message-ID: <CACRpkdaNW+kexYNOZiVTRywHpwndKLbXmP1NXDjOifKY3JUURQ@mail.gmail.com>
Subject: Re: [rtc-linux] [PATCH v3 05/16] gpiolib: utilize new cdev_device_add
 helper function
To: "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Johannes Thumshirn <jthumshirn@suse.de>, Jan Kara <jack@suse.cz>,
 Arnd Bergmann <arnd@arndb.de>, Sajjan Vikas C <vikas.cha.sajjan@hpe.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alexandre Courbot <gnurou@gmail.com>,
 Peter Huewe <peterhuewe@gmx.de>, Marcel Selhorst <tpmdd@selhorst.net>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Olof Johansson <olof@lixom.net>,
 Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>,
 Hal Rosenstock <hal.rosenstock@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Haggai Eran <haggaie@mellanox.com>, Parav Pandit <pandit.parav@gmail.com>,
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
 Vladimir Zapolskiy <vz@mleia.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Boaz Harrosh <ooo@electrozaur.com>,
 "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Stephen Bates <stephen.bates@microsemi.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci <linux-pci@vger.kernel.org>, linux-scsi@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 linux-rdma@vger.kernel.org,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Linux Input <linux-input@vger.kernel.org>,
 linux-nvdimm@lists.01.org, linux-fsdevel@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 6, 2017 at 8:04 AM, Logan Gunthorpe <logang@deltatee.com> wrote:

> Replace the open coded registration of the cdev and dev with the
> new device_add_cdev() helper. The helper replaces a common pattern by
> taking the proper reference against the parent device and adding both
> the cdev and the device.
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please inform me if you plan to merge this into the device core
tree or similar, or whether I should apply it for like v4.13 after merging
the core patch or so.

Yours,
Linus Walleij
