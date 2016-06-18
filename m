Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEM2H-000684-Ki
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 19:36:06 +0000
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
To: Richard Weinberger <richard@nod.at>, dwmw2@infradead.org
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dedekind1@gmail.com,
 computersforpeace@gmail.com, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
Date: Sat, 18 Jun 2016 21:35:42 +0200
MIME-Version: 1.0
In-Reply-To: <5765A14F.6020201@nod.at>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/18/2016 09:30 PM, Richard Weinberger wrote:
> Am 18.06.2016 um 21:17 schrieb Hauke Mehrtens:
>> This makes it possible to open a ubi layer in device tree, this is
>> helpful when the rootfs is on a ubi layer. It loops though all mtd
>> partitions and mounts the partition which is compatible with
>> "ubi,volume". The same was only possible with kernel command line
>> arguments before.
>>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>> ---
>>  Documentation/devicetree/bindings/mtd/ubi.txt | 33 ++++++++++++++
>>  drivers/mtd/ubi/block.c                       | 63 +++++++++++++++++++++++++++
>>  2 files changed, 96 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/ubi.txt
> 
> Some time ago I thought about an UBI DT binding too, but
> I have been told that device tree is only for describing the hardware
> and nothing else.
> So I fear this will be rejected by DT folks.

There are some devices on the market that are storing the root file
system in an ubi layer.
To make this work there are currently two options.
1. patch the kernel to specify which partitions to open in the code.
2. provide some kernel command line parameter which specifies what to open.

I would like to specify this in device tree.

Hauke
