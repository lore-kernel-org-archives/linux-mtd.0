Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGVqz-0004Zk-Cd
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 18:29:22 +0000
Received: by mail-wm0-x22c.google.com with SMTP id a66so35981940wme.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jun 2016 11:29:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at> <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 24 Jun 2016 15:28:58 -0300
Message-ID: <CAAEAJfC8mYnohRxKg0b-onbGadk0vPDty=7Bh8emP92mazB=aA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18 June 2016 at 16:35, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> On 06/18/2016 09:30 PM, Richard Weinberger wrote:
>> Am 18.06.2016 um 21:17 schrieb Hauke Mehrtens:
>>> This makes it possible to open a ubi layer in device tree, this is
>>> helpful when the rootfs is on a ubi layer. It loops though all mtd
>>> partitions and mounts the partition which is compatible with
>>> "ubi,volume". The same was only possible with kernel command line
>>> arguments before.
>>>
>>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>>> ---
>>>  Documentation/devicetree/bindings/mtd/ubi.txt | 33 ++++++++++++++
>>>  drivers/mtd/ubi/block.c                       | 63 +++++++++++++++++++=
++++++++
>>>  2 files changed, 96 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/mtd/ubi.txt
>>
>> Some time ago I thought about an UBI DT binding too, but
>> I have been told that device tree is only for describing the hardware
>> and nothing else.
>> So I fear this will be rejected by DT folks.
>
> There are some devices on the market that are storing the root file
> system in an ubi layer.
> To make this work there are currently two options.
> 1. patch the kernel to specify which partitions to open in the code.

I wouldn't go as far as to claim this an option.

> 2. provide some kernel command line parameter which specifies what to ope=
n.
>

There's another option: use an initramfs, where you can do whatever you wan=
t
to find your UBI and mount it.

Frankly, I don't see a real need for this in the devicetree, other than sol=
ving
someone's particular workflow/use case.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
