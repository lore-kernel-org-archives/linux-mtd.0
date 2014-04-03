Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVZqn-0007LI-R9
 for linux-mtd@lists.infradead.org; Thu, 03 Apr 2014 05:06:06 +0000
Received: by mail-lb0-f177.google.com with SMTP id z11so893379lbi.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2014 22:05:41 -0700 (PDT)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <53396C95.3030005@monstr.eu>
References: <1395944467-26291-1-git-send-email-punnaia@xilinx.com>
 <04cb5d02-db4c-4a4c-ba3c-3a5958e42324@VA3EHSMHS036.ehs.local>
 <533963AE.30405@monstr.eu> <53396C95.3030005@monstr.eu>
Date: Thu, 3 Apr 2014 10:35:41 +0530
Message-ID: <CAGnW=BYkoi3MzfbzWU67C+e_CY+YL8m7zGL8D5Cd61SjkrQpXg@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] nand: pl353: Add driver for arm pl353 smc nand
 interface
From: punnaiah choudary kalluri <punnaia@xilinx.com>
To: monstr@monstr.eu
Content-Type: text/plain; charset=ISO-8859-1
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "grant.likely@linaro.org" <grant.likely@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "pawel.moll@arm.com" <pawel.moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "joern@logfs.org" <joern@logfs.org>,
 Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "acourbot@nvidia.com" <acourbot@nvidia.com>, "Gupta, Pekon" <pekon@ti.com>,
 Punnaiah Choudary <kpc528@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rob@landley.net" <rob@landley.net>,
 "galak@codeaurora.org" <galak@codeaurora.org>, "Khoronzhuk,
 Ivan" <ivan.khoronzhuk@ti.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 31, 2014 at 6:54 PM, Michal Simek <monstr@monstr.eu> wrote:
> On 03/31/2014 02:46 PM, Michal Simek wrote:
>> On 03/27/2014 07:21 PM, Punnaiah Choudary Kalluri wrote:
>>> Add driver for arm pl353 static memory controller nand interface.
>>> This controller is used in xilinx zynq soc for interfacing the nand
>>> flash memory.
>>>
>>> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
>>> ---
>>>  drivers/mtd/nand/Kconfig      |    8 +
>>>  drivers/mtd/nand/Makefile     |    1 +
>>>  drivers/mtd/nand/pl353_nand.c | 1122 +++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 1131 insertions(+), 0 deletions(-)
>>>  create mode 100644 drivers/mtd/nand/pl353_nand.c
>>>
>>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>>> index 90ff447..31c1d0c 100644
>>> --- a/drivers/mtd/nand/Kconfig
>>> +++ b/drivers/mtd/nand/Kconfig
>>> @@ -510,4 +510,12 @@ config MTD_NAND_XWAY
>>>        Enables support for NAND Flash chips on Lantiq XWAY SoCs. NAND is attached
>>>        to the External Bus Unit (EBU).
>>>
>>> +config MTD_NAND_PL353
>>> +    tristate "ARM Pl353 NAND flash driver"
>>> +    depends on MTD_NAND && ARM
>>> +    select PL353_SMC
>>
>> Here should be probably depends on PL353_SMC.
>> I just found it.
>
> Just to be accurate.
> When MEMORY=n with select PL353_SMC you are not able select PL353_SMC
> and compile it.

OK. I will check this one and fix it in v2.

Punnaiah

>
> Thanks,
> Michal
>
> --
> Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
> Maintainer of Linux kernel - Xilinx Zynq ARM architecture
> Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform
>
>
