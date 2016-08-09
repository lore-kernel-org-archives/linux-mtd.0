Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bXClN-0003uJ-4n
 for linux-mtd@lists.infradead.org; Tue, 09 Aug 2016 19:32:34 +0000
Received: by mail-wm0-x244.google.com with SMTP id o80so5200695wme.0
 for <linux-mtd@lists.infradead.org>; Tue, 09 Aug 2016 12:32:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1466609565-113251-2-git-send-email-mika.westerberg@linux.intel.com>
References: <1466609565-113251-1-git-send-email-mika.westerberg@linux.intel.com>
 <1466609565-113251-2-git-send-email-mika.westerberg@linux.intel.com>
From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Wed, 10 Aug 2016 01:02:09 +0530
Message-ID: <CAD6G_RQEBy_-eY_ZnF44J3iemq+ZVazziiPmdRHqqxaieEyAKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] spi-nor: Add support for Intel SPI serial flash
 controller
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Lee Jones <lee.jones@linaro.org>, Peter Tyser <ptyser@xes-inc.com>,
 key.seong.lim@intel.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22 June 2016 at 21:02, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Add support for the SPI serial flash host controller found on many Intel
> CPUs including Baytrail and Braswell. The SPI serial flash controller is
> used to access BIOS and other platform specific information. By default the
> driver exposes a single read-only MTD device but with a module parameter
> "writeable=1" the MTD device can be made read-write which makes it possible
> to upgrade BIOS directly from Linux.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  Documentation/mtd/intel-spi.txt          |  88 ++++
>  drivers/mtd/spi-nor/Kconfig              |  20 +
>  drivers/mtd/spi-nor/Makefile             |   2 +
>  drivers/mtd/spi-nor/intel-spi-platform.c |  57 +++
>  drivers/mtd/spi-nor/intel-spi.c          | 773 +++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/intel-spi.h          |  24 +
>  include/linux/platform_data/intel-spi.h  |  31 ++
>  7 files changed, 995 insertions(+)
>  create mode 100644 Documentation/mtd/intel-spi.txt
>  create mode 100644 drivers/mtd/spi-nor/intel-spi-platform.c
>  create mode 100644 drivers/mtd/spi-nor/intel-spi.c
>  create mode 100644 drivers/mtd/spi-nor/intel-spi.h
>  create mode 100644 include/linux/platform_data/intel-spi.h
>
> diff --git a/Documentation/mtd/intel-spi.txt b/Documentation/mtd/intel-spi.txt
> new file mode 100644
> index 000000000000..bc357729c2cb
> --- /dev/null
> +++ b/Documentation/mtd/intel-spi.txt
> @@ -0,0 +1,88 @@
> +Upgrading BIOS using intel-spi
> +------------------------------
> +
> +Many Intel CPUs like Baytrail and Braswell include SPI serial flash host
> +controller which is used to hold BIOS and other platform specific data.
> +Since contents of the SPI serial flash is crucial for machine to function,
> +it is typically protected by different hardware protection mechanisms to
> +avoid accidental (or on purpose) overwrite of the content.
> +
> +Not all manufacturers protect the SPI serial flash, mainly because it
> +allows upgrading the BIOS image directly from an OS.
> +
> +The intel-spi driver makes it possible to read and write the SPI serial
> +flash, if certain protection bits are not set and locked. If it finds
> +any of them set, the whole MTD device is made read-only to prevent
> +partial overwrites. By default the driver exposes SPI serial flash
> +contents as read-only but it can be changed from kernel command line,
> +passing "intel-spi.writeable=1".
> +
> +Please keep in mind that overwriting the BIOS image on SPI serial flash
> +might render the machine unbootable and requires special equipment like
> +Dediprog to revive. You have been warned!
> +
> +Below are the steps how to upgrade MinnowBoard MAX BIOS directly from
> +Linux.
> +
> + 1) Download and extract the latest Minnowboard MAX BIOS SPI image
> +    [1]. At the time writing this the latest image is v92.
> +
> + 2) Install mtd-utils package [2]. We need this in order to erase the SPI
> +    serial flash. Distros like Debian and Fedora have this prepackaged with
> +    name "mtd-utils".
> +
> + 3) Add "intel-spi.writeable=1" to the kernel command line and reboot
> +    the board (you can also reload the driver passing "writeable=1" as
> +    module parameter to modprobe).
> +
> + 4) Once the board is up and running again, find the right MTD partition
> +    (it is named as "BIOS"):
> +
> +    # cat /proc/mtd
> +    dev:    size   erasesize  name
> +    mtd0: 00800000 00001000 "BIOS"
> +
> +    So here it will be /dev/mtd0 but it may vary.
> +
> + 5) Make backup of the existing image first:
> +
> +    # dd if=/dev/mtd0ro of=bios.bak
> +    16384+0 records in
> +    16384+0 records out
> +    8388608 bytes (8.4 MB) copied, 10.0269 s, 837 kB/s
> +
> + 6) Verify the backup
> +
> +    # sha1sum /dev/mtd0ro bios.bak
> +    fdbb011920572ca6c991377c4b418a0502668b73  /dev/mtd0ro
> +    fdbb011920572ca6c991377c4b418a0502668b73  bios.bak
> +
> +    The SHA1 sums must match. Otherwise do not continue any further!
> +
> + 7) Erase the SPI serial flash. After this step, do not reboot the
> +    board! Otherwise it will not start anymore.
> +
> +    # flash_erase /dev/mtd0 0 0
> +    Erasing 4 Kibyte @ 7ff000 -- 100 % complete
> +
> + 8) Once completed without errors you can write the new BIOS image:
> +
> +    # dd if=MNW2MAX1.X64.0092.R01.1605221712.bin of=/dev/mtd0
> +
> + 9) Verify that the new content of the SPI serial flash matches the new
> +    BIOS image:
> +
> +    # sha1sum /dev/mtd0ro MNW2MAX1.X64.0092.R01.1605221712.bin
> +    9b4df9e4be2057fceec3a5529ec3d950836c87a2  /dev/mtd0ro
> +    9b4df9e4be2057fceec3a5529ec3d950836c87a2 MNW2MAX1.X64.0092.R01.1605221712.bin
> +
> +    The SHA1 sums should match.
> +
> + 10) Now you can reboot your board and observe the new BIOS starting up
> +     properly.
> +
> +References
> +----------
> +
> +[1] https://firmware.intel.com/sites/default/files/MinnowBoard.MAX_.X64.92.R01.zip
> +[2] http://www.linux-mtd.infradead.org/
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index d42c98e1f581..119712b6ae3b 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -49,4 +49,24 @@ config SPI_NXP_SPIFI
>           Flash. Enable this option if you have a device with a SPIFI
>           controller and want to access the Flash as a mtd device.
>
> +config SPI_INTEL_SPI
> +       tristate
> +
> +config SPI_INTEL_SPI_PLATFORM
> +       tristate "Intel PCH/PCU SPI flash platform driver" if EXPERT
> +       depends on X86
> +       select SPI_INTEL_SPI
> +       help
> +         This enables platform support for the Intel PCH/PCU SPI
> +         controller in master mode. This controller is present in modern
> +         Intel hardware and is used to hold BIOS and other persistent
> +         settings. Using this driver it is possible to upgrade BIOS
> +         directly from Linux.
> +
> +         Say N here unless you know what you are doing. Overwriting the
> +         SPI flash may render the system unbootable.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called intel-spi-platform.
> +
>  endif # MTD_SPI_NOR
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 0bf3a7f81675..60c0b1bb8264 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -2,3 +2,5 @@ obj-$(CONFIG_MTD_SPI_NOR)       += spi-nor.o
>  obj-$(CONFIG_SPI_FSL_QUADSPI)  += fsl-quadspi.o
>  obj-$(CONFIG_MTD_MT81xx_NOR)    += mtk-quadspi.o
>  obj-$(CONFIG_SPI_NXP_SPIFI)    += nxp-spifi.o
> +obj-$(CONFIG_SPI_INTEL_SPI)    += intel-spi.o
> +obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)   += intel-spi-platform.o

Why is this separate platform driver, can't we combine with single
spi-nor controller driver, any specific reason?

-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream contributor/maintainer
Hyderabad, India.
