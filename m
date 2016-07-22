Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bQW5t-0006b1-8x
 for linux-mtd@lists.infradead.org; Fri, 22 Jul 2016 08:46:05 +0000
Message-ID: <1469177141.2405.137.camel@gmail.com>
Subject: Re: [PATCH] mtd: ubi: Fix race condition between ubi device
 creation and udev
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Iosif Harutyunov <iharutyunov@SonicWALL.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 22 Jul 2016 11:45:41 +0300
In-Reply-To: <1AA17CE09ACFBD499BB5F503A7513F5B43ADFB03@us0exc08.us.sonicwall.com>
References: <1AA17CE09ACFBD499BB5F503A7513F5B43ADFB03@us0exc08.us.sonicwall.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-07-21 at 02:07 +0000, Iosif Harutyunov wrote:
> While implementing udev rules for UBI device I ran into the problem
> when udev would
> ignore UBI rules I created to process attachment of volume.
> Interestingly, when I trigger
> udev ubi subsystem "change" event manually after the attachment,
> rules would work just fine.
> 
> I traced problem down to UBI sysfs processing, which turned out to be
> racing condition.
> See patch below to address the problem.
> 
> Thanks.
> Iosif,_
> 
> Signed-off-by: Iosif Harutyunov <iharutyunov@sonicwall.com>
> ---
> Once ubi is attached, make sure ubi_devices[] is initialized early
> before being
> used in the dev_attribute_show().
> 
> This is to prevent race condition between udev ubi rules processing
> and ubi device
> creation, which manifests itself ignoring udev ATTR rules.

Good catch!

Quick feedback: this patch will probably work fine, we could apply the
following logic and select a better place for that line of code. Here
it is:

1. Initialize the device, make it usable. Do not make it available to
anyone before that. This is the code before the 'uif_init()'
invocation. BTW, "uif" means "user interfaces" in this case.

2. Make the device "available" (or "visible") by adding it to the
'ubi_devices' array.

3. Initialize user interfaces, done by 'uif_init()'.

IOW, it put that line just before 'uif_init()'.
