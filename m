Received: from mail-ot0-x230.google.com ([2607:f8b0:4003:c0f::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ci7MI-000846-Hx
 for linux-mtd@lists.infradead.org; Sun, 26 Feb 2017 22:32:05 +0000
Received: by mail-ot0-x230.google.com with SMTP id k4so41815222otc.0
 for <linux-mtd@lists.infradead.org>; Sun, 26 Feb 2017 14:31:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1488091097-12328-4-git-send-email-logang@deltatee.com>
References: <1488091097-12328-1-git-send-email-logang@deltatee.com>
 <1488091097-12328-4-git-send-email-logang@deltatee.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sun, 26 Feb 2017 14:31:40 -0800
Message-ID: <CAPcyv4i6yucmRr9HaqLiA+QCH7AbB=RS28_Jcix292wq1OV4YA@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] device-dax: utilize new cdev_device_add helper
 function
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Johannes Thumshirn <jthumshirn@suse.de>, Jan Kara <jack@suse.cz>,
 Arnd Bergmann <arnd@arndb.de>, Sajjan Vikas C <vikas.cha.sajjan@hpe.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>,
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
 linux-pci@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
 rtc-linux@googlegroups.com, linux-mtd@lists.infradead.org,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 linux-iio@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org,
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

On Sat, Feb 25, 2017 at 10:38 PM, Logan Gunthorpe <logang@deltatee.com> wrote:
> Replace the open coded registration of the cdev and dev with the
> new device_add_cdev() helper. The helper replaces a common pattern by
> taking the proper reference against the parent device and adding both
> the cdev and the device.
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>

Thanks,

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
