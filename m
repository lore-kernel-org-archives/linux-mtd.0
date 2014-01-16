Message-ID: <52D7A237.8@freescale.com>
Date: Thu, 16 Jan 2014 17:11:19 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Jagan Teki <jagannadh.teki@gmail.com>
Subject: Re: [PATCH v4 0/7] mtd: spi-nor: add a new framework for SPI NOR
References: <1387950629-27448-1-git-send-email-b32955@freescale.com>
 <CAD6G_RTnNQgeJM8Tc16Sc1_n29d=V9sJN1ePrOAn5YzM+GujMQ@mail.gmail.com>
In-Reply-To: <CAD6G_RTnNQgeJM8Tc16Sc1_n29d=V9sJN1ePrOAn5YzM+GujMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: angus.clark@st.com, Brian Norris <computersforpeace@gmail.com>,
 b44548@freescale.com, linux-doc@vger.kernel.org, lee.jones@linaro.org,
 broonie@linaro.org, b18965@freescale.com, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, "Gupta,
 Pekon" <pekon@ti.com>, Sourav Poddar <sourav.poddar@ti.com>,
 shawn.guo@linaro.org, David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2014=E5=B9=B401=E6=9C=8816=E6=97=A5 03:15, Jagan Teki =E5=86=99=
=E9=81=93:
> Hi,
>
> On Wed, Dec 25, 2013 at 11:20 AM, Huang Shijie<b32955@freescale.com>  w=
rote:
>> 1.) Why add a new framework for SPI NOR?
>>    The SPI-NOR controller such as Freescale's Quadspi controller is wo=
rking
>>    in a different way from the SPI bus. It should knows the NOR comman=
ds to
>>    find the right LUT sequence. Unfortunately, the current code can no=
t meet
>>    this requirement.
>>
>> 2.) How does this patch set do?
>>     This patch set adds a new spi-nor layer.
>>     Before this patch, the layer is like:
>>
>>                     MTD
>>           ------------------------
>>                    m25p80
>>           ------------------------
>>                 spi bus driver
>>           ------------------------
>>                  SPI NOR chip
>>
>>     After this patch, the layer is like:
>>                     MTD
>>           ------------------------
>>                    spi-nor
>>           ------------------------
>>                    m25p80
>>           ------------------------
>>                 spi bus driver
>>           ------------------------
>>                 SPI NOR chip
>>
>>    With the spi-nor controller driver(Freescale Quadspi), it looks lik=
e:
>>                     MTD
>>           ------------------------
>>                    spi-nor
>>           ------------------------
>>                  fsl-quadspi
>>           ------------------------
>>                 SPI NOR chip
> I'm new to this thread, may be I'll ask basic questions.
> 1) what does m25p80 contains with your new framework - will excludes
> quad stuff if they add
sorry, i do not understand your meaning.

do you think the m25p80 can not support the quad read after this patch se=
t?


> 2) I didn't understand why the controller driver fsl-quadspi will be
> in mtd becuase as it's (q)spi driver
> may does flash or non-flash functionalities if ie, the case should be
> part of drivers/spi/*
Please read this thread, Mark though it should be spi nor driver:

http://marc.info/?l=3Dlinux-arm-kernel&m=3D137782885415953&w=3D2
> 3) Can you explain your framework precisely take an example of like
> spi_controller_A with spi_flash_A
> and qspi_controller_B and qspi_flash_B - how will this new framework op=
erates.
>
The framework is just cloned from the m25p80.c, and extract the common=20
code, and provides more
hooks such as

@prepare/unpreare: used to do some work before or after the
              read/write/erase/lock/unlock.
     @read_xfer/write_xfer: We can use these two hooks to code all
              the following hooks if the driver tries to implement them
              by itself.
     @read_reg: used to read the registers, such as read status register,
              read configure register.
     @write_reg: used to write the registers, such as write enable,
              erase sector.
     @read_id: read out the ID info.
     @wait_till_ready: wait till the NOR becomes ready.
     @read: read out the data from the NOR.
     @write: write data to the NOR.
     @erase: erase a sector of the NOR.



The drivers can implement these hooks.

thanks
Huang Shijie
