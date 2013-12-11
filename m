Message-ID: <52A881CF.4020001@ti.com>
Date: Wed, 11 Dec 2013 20:46:31 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V2 0/4] mtd: spi-nor: add a new framework for SPI NOR
References: <1386318764-15882-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1386318764-15882-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: marex@denx.de, angus.clark@st.com, broonie@linaro.org, dwmw2@infradead.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, pekon@ti.com,
 computersforpeace@gmail.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,
On Friday 06 December 2013 02:02 PM, Huang Shijie wrote:
> 1.) Why add a new framework for SPI NOR?
>    The SPI-NOR controller such as Freescale's Quadspi controller is working
>    in a different way from the SPI bus. It should knows the NOR commands to
>    find the right LUT sequence. Unfortunately, the current code can not meet
>    this requirement.
>
> 2.) How does this patch set do?
>     This patch set adds a new spi-nor layer.
>     Before this patch, the layer is like:
>
>                     MTD
>           ------------------------
>                    m25p80
>           ------------------------
> 	       spi bus driver
>           ------------------------
> 	        SPI NOR chip
>
>     After this patch, the layer is like:
>                     MTD
>           ------------------------
>                    spi-nor
>           ------------------------
>                    m25p80
>           ------------------------
> 	       spi bus driver
>           ------------------------
> 	       SPI NOR chip
>
>    With the spi-nor controller driver(Freescale Quadspi), it looks like:
>                     MTD
>           ------------------------
>                    spi-nor
>           ------------------------
>                  fsl-quadspi
>           ------------------------
> 	       SPI NOR chip
>
> 3.) more details
>      This patch set adds a new data structrue spi_nor{}, clones most the common
>    code to spi-nor.c. Add spi_nor_xfer_cfg {} for the fundamental primitives:
>    read_xfer/write_xfer.
>
>      Make the m25p80.c use the new APIs.
>
>      Let's discuss the SPI nor framework in the new thread. :)
>
>
> 4.) TODO list:
>     3.1) add the new spi_nor_device{} for the spi-nor controller's device.
>     3.2) add the Freescale Quadspi driver.
>
> v1 -->  v2:
> 	[1] follow Angus's advice, add more hooks and data structrures.
> 	[2] others.
>
> Huang Shijie (4):
>    mtd: spi-nor: copy the SPI NOR commands to a new header file
>    mtd: spi-nor: add the basic data structures
>    mtd: spi-nor: add the framework for SPI NOR
>    mtd: m25p80: use the SPI nor framework
>
>   drivers/mtd/Kconfig           |    2 +
>   drivers/mtd/Makefile          |    1 +
>   drivers/mtd/devices/Kconfig   |    2 +-
>   drivers/mtd/devices/m25p80.c  | 1261 +++--------------------------------------
>   drivers/mtd/spi-nor/Kconfig   |    6 +
>   drivers/mtd/spi-nor/Makefile  |    1 +
>   drivers/mtd/spi-nor/spi-nor.c | 1042 ++++++++++++++++++++++++++++++++++
>   include/linux/mtd/spi-nor.h   |  132 +++++
>   8 files changed, 1277 insertions(+), 1170 deletions(-)
>   create mode 100644 drivers/mtd/spi-nor/Kconfig
>   create mode 100644 drivers/mtd/spi-nor/Makefile
>   create mode 100644 drivers/mtd/spi-nor/spi-nor.c
>   create mode 100644 include/linux/mtd/spi-nor.h
>
I have a requirement for a memory mapped operation for my spi flash driver.

A brief explanation about the requirement is here..

ti qspi supports two modes of operation, one is SPI mode(normal), other is
the memory mapped read mode.

For SPI mode, the state machine remains the same as it is with other spi 
controller
available.

For memory mapped, there is something more which we need to do around ..

1. There is a qspi "set up" register available, which needs to be filled 
with
      information like flash opcode, dummy bytes etc. In short, flash 
specific
      details.
2   if the above register is configured with the required opcodes, then 
whenever
      we need to use memory mapped operations, we need to do is to 
switch our
      qspi controller to memory mapped mode.
     Switching of this mode to memory mapped needs
      a )  write to a particular qspi register
      b)   write to control module(optional based on SOC).

3. Once the above steps are configured, then the flash data will be 
mapped to a
     particular memory address(SOC specific) from where the flash data  
can be read.

The series 
https://www.mail-archive.com/linux-omap@vger.kernel.org/msg98691.html
tries to work on the above features, and tries to add a support for the 
same in the
spi framework and m25p80 code.

As you see in my patches, once we take care of the above points and add 
support
for memory mapped in m25p80 and qspi, then while doing a read in m25p80 
we can
do memcpy at the beginning of m25p80_read and can bypass the entire SPI
framework for memory mapped read operation. Throughput almost gets 
doubles with this,
as compared to normal SPI operations.

So, my intention of reviving this here is to add one more feature set, 
which I suppose
spi nor framework should handle and to see what needs to be added more 
for this feature.


Please get back, if you need more info on this concept.
