Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGuHT-0007Fw-A7
 for linux-mtd@lists.infradead.org; Sat, 25 Jun 2016 20:34:20 +0000
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
To: Hauke Mehrtens <hauke@hauke-m.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at> <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
 <CAAEAJfC8mYnohRxKg0b-onbGadk0vPDty=7Bh8emP92mazB=aA@mail.gmail.com>
 <aedd029f-858b-97f8-7fc7-f224999ed24c@hauke-m.de>
Cc: David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <576EEAAF.3090709@nod.at>
Date: Sat, 25 Jun 2016 22:33:51 +0200
MIME-Version: 1.0
In-Reply-To: <aedd029f-858b-97f8-7fc7-f224999ed24c@hauke-m.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 25.06.2016 um 22:20 schrieb Hauke Mehrtens:
>> There's another option: use an initramfs, where you can do whatever you want
>> to find your UBI and mount it.
> 
> An initramfs probably needs some 10 to 100 KBytes of additional memory
> on the flash chip and we only have 4 MBytes on some devices for the
> bootloader, kernel and rootfs, adding 100 KBytes there is a significant
> amount of memory. Instead of adding a initramfs I would like to be able
> to define the rootfs somewhere in device tree and not by adding a
> bootargs line into device tree. These particular patches are probably
> the wrong way, but nobody told me how to do this in a better way.

I think it is time to bring this discussion to a end.
It has been stated multiple times why DT is not the right thing for the
job and how all you need can be solved without an UBI DT binding.

Consider both patches as rejected.

Thanks,
//richard
