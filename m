Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEP90-0005yX-Cl
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 22:55:15 +0000
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
To: Richard Weinberger <richard@nod.at>, dwmw2@infradead.org
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at> <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
 <5765A4F9.3050107@nod.at>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dedekind1@gmail.com,
 computersforpeace@gmail.com, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <8697ff77-218b-2bc6-5d36-bfb02360d223@hauke-m.de>
Date: Sun, 19 Jun 2016 00:54:19 +0200
MIME-Version: 1.0
In-Reply-To: <5765A4F9.3050107@nod.at>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/18/2016 09:46 PM, Richard Weinberger wrote:
> Am 18.06.2016 um 21:35 schrieb Hauke Mehrtens:
>> There are some devices on the market that are storing the root file
>> system in an ubi layer.
>> To make this work there are currently two options.
>> 1. patch the kernel to specify which partitions to open in the code.
>> 2. provide some kernel command line parameter which specifies what to open.
>>
>> I would like to specify this in device tree.
> 
> What is wrong with command line parameters? If there is some parameter
> the UBI module misses I'll happily add it.
> You can also put your kernel command line into device tree.

I would like to configure this in device tree. When I install a third
party firmware on a router normally the kernel command line is taken
from the boot loader and the device tree is appended to the kernel.

Hauke
