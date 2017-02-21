Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgK3u-0004tM-B8
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 23:41:39 +0000
To: Dan Williams <dan.j.williams@intel.com>
References: <1487653253-11497-1-git-send-email-logang@deltatee.com>
 <1487653253-11497-2-git-send-email-logang@deltatee.com>
 <20170221053522.GA1466@dtor-ws>
 <17f32963-1d0e-5d17-64c9-742b05415722@deltatee.com>
 <CAPcyv4jOWDxjQoBdZ8GQ+yhcAcL2gOBoEEHE-02beopXKFmGQA@mail.gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Johannes Thumshirn <jthumshirn@suse.de>, Jan Kara <jack@suse.cz>,
 Arnd Bergmann <arnd@arndb.de>, Sajjan Vikas C <vikas.cha.sajjan@hpe.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, Peter Huewe <peterhuewe@gmx.de>,
 Marcel Selhorst <tpmdd@selhorst.net>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Olof Johansson <olof@lixom.net>, Doug Ledford <dledford@redhat.com>,
 Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock
 <hal.rosenstock@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
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
 Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>,
 Lorenzo Stoakes <lstoakes@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Boaz Harrosh <ooo@electrozaur.com>, Benny Halevy <bhalevy@primarydata.com>,
 "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Stephen Bates <stephen.bates@microsemi.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 osd-dev@open-osd.org, linux-scsi <linux-scsi@vger.kernel.org>,
 rtc-linux@googlegroups.com, linux-mtd@lists.infradead.org,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org,
 tpmdd-devel@lists.sourceforge.net, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <0f24273d-028c-9fa3-3fe7-975d2b0540f8@deltatee.com>
Date: Tue, 21 Feb 2017 16:41:01 -0700
MIME-Version: 1.0
In-Reply-To: <CAPcyv4jOWDxjQoBdZ8GQ+yhcAcL2gOBoEEHE-02beopXKFmGQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 01/14] chardev: add helper function to register char devs
 with a struct device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey,

Ok, I'll do a v2 later this week with some of the feedback and tags?

Logan

On 21/02/17 11:18 AM, Dan Williams wrote:
> On Mon, Feb 20, 2017 at 10:35 PM, Logan Gunthorpe <logang@deltatee.com> wrote:
>>
>>
>> On 20/02/17 10:35 PM, Dmitry Torokhov wrote:
>>> My only objection is to this statement. There is absolutely nothing that
>>> prevents from calling device_unregister() first and cdev_del() later.
>>> Refcounting will sort it all out.
>>
>> Yeah, I was really trying to warn people against calling cdev_del within
>> the release function of the device. If you do that, then the cdev
>> reference will block the device from ever getting released.
>>
>> Certainly, you could call device_unregister followed by cdev_del. I
>> could reword this if you feel it necessary.
> 
> I agree with Dmitry, just delete the statement in parenthesis and the
> rest is fine. If you're modifying this patch it might be good to take
> the opportunity to add a WARN_ON(!parent->kobj.state_initialized) to
> catch attempts to call device_add_cdev() with an uninitialized device.
> 
> You can also add:
> 
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> 
