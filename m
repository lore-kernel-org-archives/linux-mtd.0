Received: from mail-wi0-f181.google.com ([209.85.212.181])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFmDZ-00085o-Vt
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 15:04:19 +0000
Received: by mail-wi0-f181.google.com with SMTP id hi5so3576186wib.8
 for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2014 07:03:56 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/35] mtd: st_spi_fsm: Add new driver
Date: Tue, 18 Feb 2014 14:55:27 +0000
Message-Id: <1392735362-1245-1-git-send-email-lee.jones@linaro.org>
Cc: Angus.Clark@st.com, lee.jones@linaro.org,
 DCG_UPD_stlinux_kernel@list.st.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This should be the final version.

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
 arch/arm/boot/dts/stih416-b2105.dts              |   14 +
 arch/arm/boot/dts/stih416-pinctrl.dtsi           |   12 +
 drivers/mtd/devices/Kconfig                      |    8 +
 drivers/mtd/devices/Makefile                     |    1 +
 drivers/mtd/devices/serial_flash_cmds.h          |   81 +++++
 drivers/mtd/devices/st_spi_fsm.c                 | 2122 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 2264 insertions(+)
