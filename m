Received: from mail1.bemta8.messagelabs.com ([216.82.243.199])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFPdz-0000en-EJ
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2013 14:25:48 +0000
Message-ID: <5220AB35.9080409@digi.com>
Date: Fri, 30 Aug 2013 16:24:53 +0200
From: Hector Palacios <hector.palacios@digi.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <52206C05.8020701@freescale.com>
In-Reply-To: <52206C05.8020701@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang,

On 08/30/2013 11:55 AM, Huang Shijie wrote:
> 于 2013年08月30日 17:15, Hector Palacios 写道:
>> Hello,
>>
>> Working on my custom platform based on i.MX28 (and also with the
>> MX28EVK) I checked that I cannot mount JFFS2 nand partitions because
>> I'm getting this error:
>>
>> jffs2: inconsistent device description
>>
>> which seems to have to do with the OOB area of the NAND.
>> I saw patchset [1] from Huang Shijie which seems to be related to the
>> issue. I just wanted to confirm if other people has the same problem
>> and if the patchset really aims to solve this, or mine is a different
>> issue.
>>
> yes, this patch set aims to solve this.
>
> You can try the SLC on the imx28.
>
> I only tested the SLC On the imx6q.

I applied the patchset but I still get the same error when trying to mount a JFFS2 
filesystem. My nand is:

[    0.819654] ONFI param page 0 valid
[    0.823179] ONFI flash detected
[    0.826344] NAND device: Manufacturer ID: 0x2c,Chip ID: 0xaa (Micron MT29F2G08ABBEAH4)
[    0.834455] NAND device: 256MiB, SLC, page size: 2048, OOB size: 64

The same happens on the MX28EVK where I use nand:

[    0.894127] NAND device: Manufacturer ID: 0xec,Chip ID: 0xdc (Samsung NAND 512MiB 
3,3V 8-bit)
[    0.902876] NAND device: 512MiB, SLC, page size: 2048, OOB size: 64

~# mount -t jffs2 /dev/mtdblock4 /media/nand/
[   26.821947] jffs2: inconsistent device description
mount: mounting /dev/mtdblock4 on /media/nand/ failed: Invalid argument

Am I missing anything?

Best regards,
--
Hector Palacios
