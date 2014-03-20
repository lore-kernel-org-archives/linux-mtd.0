Received: from mail-we0-f173.google.com ([74.125.82.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQZAT-0007Sl-Pv
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 09:21:43 +0000
Received: by mail-we0-f173.google.com with SMTP id w61so368605wes.32
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 02:21:17 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com
Subject: [PATCH v6 00/36] mtd: st_spi_fsm: Add new driver
Date: Thu, 20 Mar 2014 09:20:32 +0000
Message-Id: <1395307268-12721-1-git-send-email-lee.jones@linaro.org>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, Angus.Clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This should be the final version (again) :)

Version 6:
  Serviced 3 nits picked up by Brian during final review.
  
Version 5:
  Tended to Christophe, Ludovic and Angus' comments.
  
Version 4:
  Tended to Brian's review comments
    - Checkpatch acceptance
    - MODULE_DEVICE_TABLE() name slip correction
    - Timeout issue(s) resolved
    - Potential infinite loop mitigated
    - Code clarity suggests heeded
    - Duplication with MTD core code removed
    - Upgraded to using ROUND_UP() helper
    - Moved non-shared header code into main driver
    - Relocated dynamic msg sequence stores into main struct
    - Averted adaption of static (table) data
    - Basic whitespace/spelling/data type/dev_err suggestions applied
  
Version 3:
  Okay, this thing should be fully functional now. Identify a chip
  based on it's JEDEC ID, Read, Write, Erase (all or by sector).
  Support for various chip quirks added too.
  
Version 2:
  The first bunch of these patches have been on the MLs before, but
  didn't receive a great deal of attention for the most part. We are
  a little more featureful this time however. We can now successfully
  setup and configure the N25Q256. We still can't read/write/erase
  it though. I'll start work on that next week and will provide it in
  the next instalment.

Version 1:
  First stab at getting this thing Mainlined. It doesn't do a great deal
  yet, but we are able to initialise the device and dynamically set it up
  correctly based on an extracted JEDEC ID.

 Documentation/devicetree/bindings/mtd/st-fsm.txt |   26 ++
 arch/arm/boot/dts/stih416-pinctrl.dtsi           |   13 +
 arch/arm/boot/dts/stih416.dtsi                   |   13 +
 arch/arm/boot/dts/stih41x-b2020.dtsi             |    1 +
 arch/arm/boot/dts/stih41x-b2020x.dtsi            |   28 ++
 drivers/mtd/devices/Kconfig                      |    8 +
 drivers/mtd/devices/Makefile                     |    1 +
 drivers/mtd/devices/serial_flash_cmds.h          |   81 +++++
 drivers/mtd/devices/st_spi_fsm.c                 | 2122 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 2293 insertions(+)
