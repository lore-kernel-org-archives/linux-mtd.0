Date: Thu, 20 Mar 2014 04:19:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 00/36] mtd: st_spi_fsm: Add new driver
Message-ID: <20140320111921.GR31517@norris-Latitude-E6410>
References: <1395307268-12721-1-git-send-email-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395307268-12721-1-git-send-email-lee.jones@linaro.org>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Angus.Clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 20, 2014 at 09:20:32AM +0000, Lee Jones wrote:
> This should be the final version (again) :)
> 
> Version 6:
>   Serviced 3 nits picked up by Brian during final review.
>   
[...]
>  Documentation/devicetree/bindings/mtd/st-fsm.txt |   26 ++
>  arch/arm/boot/dts/stih416-pinctrl.dtsi           |   13 +
>  arch/arm/boot/dts/stih416.dtsi                   |   13 +
>  arch/arm/boot/dts/stih41x-b2020.dtsi             |    1 +
>  arch/arm/boot/dts/stih41x-b2020x.dtsi            |   28 ++
>  drivers/mtd/devices/Kconfig                      |    8 +
>  drivers/mtd/devices/Makefile                     |    1 +
>  drivers/mtd/devices/serial_flash_cmds.h          |   81 +++++
>  drivers/mtd/devices/st_spi_fsm.c                 | 2122 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  9 files changed, 2293 insertions(+)

Pushed patches 1 to 35 to l2-mtd.git. Patch 36 should go via arm-soc, I
believe.

Thanks,
Brian
