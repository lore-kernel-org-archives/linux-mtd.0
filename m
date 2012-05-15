Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUBHL-0002OR-MS
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 06:30:41 +0000
Received: by bkwj4 with SMTP id j4so5837557bkw.36
 for <linux-mtd@lists.infradead.org>; Mon, 14 May 2012 23:30:34 -0700 (PDT)
Message-ID: <4FB1F808.9080500@gmail.com>
Date: Tue, 15 May 2012 08:30:32 +0200
From: Thomas Weber <thomas.weber.linux@googlemail.com>
MIME-Version: 1.0
To: "Mohammed, Afzal" <afzal@ti.com>
Subject: Re: [PATCH v4 04/39] ARM: OMAP2+: gpmc: Acquire NAND CS value
References: <cover.1335874494.git.afzal@ti.com>
 <10220de398d22fad5de783d8f58fc55ebac85338.1335874494.git.afzal@ti.com>
 <4FA05292.7030902@ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E9829B0@DBDE01.ent.ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E98BD5A@DBDE01.ent.ti.com>
In-Reply-To: <C8443D0743D26F4388EA172BF4E2A7A93E98BD5A@DBDE01.ent.ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Afzal,

On 05/14/12 12:33, Mohammed, Afzal wrote:
> Hi All,
>
> On Thu, May 03, 2012 at 14:12:11, Mohammed, Afzal wrote:
>
>>>> Some boards depend on bootloader to update chip select value for NAND.
>>>> It is felt that Kernel should not depend on bootloader to get CS, as
>>>> for a particular board CS is hardwired and is fixed, hence this can
>>>> directly be updated in Kernel. But as CS value for boards that depend
>>>> on this behaviour is not available, educate gpmc driver to acquire
>>>> chip select value for NAND. this ideally should be removed once CS
>>>> for those boards are available.
>>> Do you know how many boards require this? If so which are those boards?
>> devkit8000, beagle board, omap3touchbook, overo.
>>
>> Beagle board, found out to be zero.
> I need a help.
>
> Can someone familiar with boards - devkit8000, omap3touchbook, overo boards,
> let me know GPMC CS on which NAND is connected.
On Devkit8000 the NAND is connected to CS0.
I thought that all NAND devices for booting are connected to CS0, 
because of ROM code?

According to spruf98w.pdf:

25.4.7.4 NAND
...
  * The device is connected to CS0.
...

Regards,
Thomas

> Hi Tony,
>
> I am planning to provide actual CS # used for NAND on above boards instead of
> finding the value at runtime. Is there any reason that NAND CS# is found out
> at runtime ? (hence remove necessity of omap_nand_flash_init()).
>
> Presence of this also causes an additional dependency of bootloader.
>
> As CS # depends on wiring on the board, my understanding is that it will be
> fixed for a given board. Are you ok if acquiring NAND CS # is removed ?
>
> Removal of this helps in simplifying gpmc driver (undergoing conversion).
>
> Regards
> Afzal
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
