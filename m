Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cNGVt-0006RW-DC
 for linux-mtd@lists.infradead.org; Sat, 31 Dec 2016 10:03:46 +0000
Subject: Re: [PATCH RFC 2/2] ubi: add support for UBI_EC_FLAG_ERASE_FROM_HERE
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <20161230171151.13448-1-zajec5@gmail.com>
 <20161230171151.13448-2-zajec5@gmail.com>
 <9b0bfe28-8d77-e59e-977a-5837002356b1@nod.at>
 <CACna6ryjVENPpT-oQeKVVULXUGKNzht9SEnBXS+FXy00G30czg@mail.gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <415ea536-5c38-1dae-bc6e-ed8d453dc196@nod.at>
Date: Sat, 31 Dec 2016 11:03:18 +0100
MIME-Version: 1.0
In-Reply-To: <CACna6ryjVENPpT-oQeKVVULXUGKNzht9SEnBXS+FXy00G30czg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rafał,

On 30.12.2016 22:44, Rafał Miłecki wrote:
> Some of them do, but that requires serial access to the device. Most
> users use button-triggered tftp server/client or just minimal
> bootloader web interface for flashing an image. In these cases you
> don't have any control over what bootloader does.

So the use case is the initial installation of OpenWRT.
What about using an installer?
i.e. create Kernel with an in-kernel initramfs. This "installer kernel"
will get flashed using that button-triggered mechanism.
All the pre-installed bootloader has to do is flashing and booting the kernel.
This kernel will then boot and provide a fancy webinterface to the user
where she can install the OpenWRT rootfs. That way you can use all the Linux
tools for partitioning, flashing, verification(!), etc.
The installer kernel will be used only once can be get removed after the
installation on OpenWRT.

Thanks,
//richard
