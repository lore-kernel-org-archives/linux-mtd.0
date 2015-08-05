MIME-Version: 1.0
In-Reply-To: <55C1A095.8000509@ti.com>
References: <1438072876-16338-1-git-send-email-vigneshr@ti.com>
 <1438072876-16338-2-git-send-email-vigneshr@ti.com>
 <20150731181745.GM20873@sirena.org.uk>
 <55BEF4AF.5090704@ti.com> <20150804155148.GR20873@sirena.org.uk>
 <55C0FD98.1090107@ti.com>
 <CAOMqctThys1C3vw7u8UU6iX8c9EDCWowaWg5F1O3i3X-w7KQhA@mail.gmail.com>
 <55C1A095.8000509@ti.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Wed, 5 Aug 2015 07:57:40 +0200
Message-ID: <CAOMqctS=E-MgPYC_eHSFM0FVtbKufs4LthpMGOeAGQ4k1MvT3Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] spi: introduce flag for memory mapped read
To: Vignesh R <vigneshr@ti.com>
Cc: Mark Brown <broonie@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>, linux-omap@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5 August 2015 at 07:35, Vignesh R <vigneshr@ti.com> wrote:
>
>
> On 08/05/2015 10:51 AM, Michal Suchanek wrote:
>> Hello,
>>
>> On 4 August 2015 at 19:59, R, Vignesh <vigneshr@ti.com> wrote:
>>>
>>>
>>> On 8/4/2015 9:21 PM, Mark Brown wrote:
>>>> On Mon, Aug 03, 2015 at 10:27:19AM +0530, Vignesh R wrote:
>>>>

>>>
>>> TI QSPI controller has two blocks:
>>> 1. SPI_CORE: This is generic(normal) spi mode. This can be used to
>>> communicate with any SPI devices (serial flashes as well as non-flash
>>> devices like touchscreen).
>>> 2. SFI_MM_IF(SPI memory mapped interface): The SFI_MM_IF block only
>>> allows reading and writing to an SPI flash device only. Used to speed up
>>> flash reads. It _cannot_ be used to communicate with non flash devices.
>>> Now, the spi_message that ti-qspi receives in transfer_one() callback
>>> can be from mtd device(in which case SFI_MM_IF can be used) or from any
>>> other non flash SPI device (in which case SFI_MM_IF must not be used
>>> instead SPI_CORE is to be used) but there is no way(is there?) to
>>> distinguish where spi_message is from. Therefore I introduced flag
>>> (use_mmap_mode) to struct spi_message. mtd driver will set flag to true,
>>> this helps the ti-qspi driver to determine that the user is flash device
>>> and thus can do read via SFI_MM_IF. If this flag is not set then the
>>> user is assumed to be non flash SPI driver and will use SPI_CORE block
>>> to communicate.
>>>
>>> On the whole, I just need a way to determine that the user is a flash
>>> device in order to switch to memory mapped interface.
>>>
>>
>> Maybe it can be set on the SPI slave rather than each message.
>
> You mean to add flag to spi_device struct? That's ok for me.
>

There are already mode flags so you can just add one more.

Thanks

Michal
