Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coQzy-0005Id-AU
 for linux-mtd@lists.infradead.org; Thu, 16 Mar 2017 08:43:08 +0000
Date: Thu, 16 Mar 2017 17:42:31 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Johannes Thumshirn <jthumshirn@suse.de>, Jan Kara <jack@suse.cz>,
 Arnd Bergmann <arnd@arndb.de>, Sajjan Vikas C <vikas.cha.sajjan@hpe.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, Peter Huewe <peterhuewe@gmx.de>,
 Marcel Selhorst <tpmdd@selhorst.net>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
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
 linux-scsi@vger.kernel.org, rtc-linux@googlegroups.com,
 linux-mtd@lists.infradead.org, linux-media@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 16/16] switchtec: utilize new device_add_cdev helper
 function
Message-ID: <20170316084231.GA5476@kroah.com>
References: <1488783873-2614-1-git-send-email-logang@deltatee.com>
 <1488783873-2614-17-git-send-email-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1488783873-2614-17-git-send-email-logang@deltatee.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 06, 2017 at 12:04:32AM -0700, Logan Gunthorpe wrote:
> Very straightforward conversion to device_add_cdev. Drop cdev_add and
> device_add and use cdev_device_add.
> 
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>  drivers/pci/switch/switchtec.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

As this file isn't in 4.11-rc1, I can't take this patch, but I took all
of the others.  You should resend this to Bjorn after 4.12-rc1 is out.

thanks,

greg k-h
