Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YH7xU-0002QD-B7
 for linux-mtd@lists.infradead.org; Fri, 30 Jan 2015 09:33:48 +0000
Message-ID: <1422610403.8637.275.camel@sauron.fi.intel.com>
Subject: Re: UBI on top of a smaller portion of a bigger MTD device
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Nam Nguyen <namnguyen@chromium.org>
Date: Fri, 30 Jan 2015 11:33:23 +0200
In-Reply-To: <CA+YNSmW28UAqJsfXrdDd=sHmaL5Gk_yuHRhxB-2ydnKEX5Gnww@mail.gmail.com>
References: <CA+YNSmW28UAqJsfXrdDd=sHmaL5Gk_yuHRhxB-2ydnKEX5Gnww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Mike Frysinger <vapier@chromium.org>, linux-mtd@lists.infradead.org,
 dehrenberg@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-01-29 at 16:58 -0800, Nam Nguyen wrote:
> In recovery mode, however, the firmware does not read anything from
> the (writable) NOR flash for fear of grabbing garbage values and
> bricking the device. Hence the kernel has no info about any MTD
> partition. Yet the recovery USB stick does have such information on
> its rootfs. So we were thinking maybe we could augment ubi-utils with
> where the partition starts, where it ends, to work with the raw NAND
> device.

Hi, I did not read the whole conversation, so I am sorry if my comment
is not 100% relevant.

But it sounds that what you actually want is repartitioning on demand.

IOW, you want an ioctl, which you will use to tell MTD what are the
partition boundaries.

In this case the SW from the USB stick will just do that. You'll get the
right MTD devices.

I do not think it would be a clean architecture to teach UBI tools to
work with offsets instead of /dev/mtdX partitions.

Artem.
