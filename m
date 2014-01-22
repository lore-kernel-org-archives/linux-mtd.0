Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5xH4-0004p7-Vh
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2014 12:51:19 +0000
Received: by mail-wg0-f41.google.com with SMTP id n12so5972453wgh.2
 for <linux-mtd@lists.infradead.org>; Wed, 22 Jan 2014 04:50:56 -0800 (PST)
Date: Wed, 22 Jan 2014 12:50:49 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/36] mtd: st_spi_fsm: Add new driver
Message-ID: <20140122125049.GA8586@lee--X1>
References: <1389188840-14306-1-git-send-email-lee.jones@linaro.org>
 <20140108143316.GA14575@lee--X1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140108143316.GA14575@lee--X1>
Cc: angus.clark@st.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

> Version 4:
>   Tended to Brian's previous review comments
>     - Checkpatch acceptance
>     - MODULE_DEVICE_TABLE() name slip correction
>     - Timeout issue(s) resolved
>     - Potential infinite loop mitigated
>     - Code clarity suggests heeded
>     - Duplication with MTD core code removed
>     - Upgraded to using ROUND_UP() helper
>     - Moved non-shared header code into main driver
>     - Relocated dynamic msg sequence stores into main struct
>     - Averted adaption of static (table) data
>     - Basic whitespace/spelling/data type/dev_err suggestions accepted
> 
> Version 3:
>   Okay, this thing should be fully functional now. Identify a chip
>   based on it's JEDEC ID, Read, Write, Erase (all or by sector).
>   Support for various chip quirks added too.
>  
> Version 2:
>   The first bunch of these patches have been on the MLs before, but
>   didn't receive a great deal of attention for the most part. We are
>   a little more featureful this time however. We can now successfully
>   setup and configure the N25Q256. We still can't read/write/erase
>   it though. I'll start work on that next week and will provide it in
>   the next instalment.
>  
> Version 1:
>   First stab at getting this thing Mainlined. It doesn't do a great deal
>   yet, but we are able to initialise the device and dynamically set it up
>   correctly based on an extracted JEDEC ID.
> 
>  Documentation/devicetree/bindings/mtd/st-fsm.txt |   26 ++
>  arch/arm/boot/dts/stih416-b2105.dts              |   14 +
>  arch/arm/boot/dts/stih416-pinctrl.dtsi           |   12 +
>  drivers/mtd/devices/Kconfig                      |    8 +
>  drivers/mtd/devices/Makefile                     |    1 +
>  drivers/mtd/devices/serial_flash_cmds.h          |   81 ++++
>  drivers/mtd/devices/st_spi_fsm.c                 | 2124 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 2266 insertions(+)

Can you confirm receipt of this set, or would you like me to resend?

Kind regards,
Lee

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
