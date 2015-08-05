MIME-Version: 1.0
In-Reply-To: <20150805115013.GJ20873@sirena.org.uk>
References: <1438072876-16338-1-git-send-email-vigneshr@ti.com>
 <1438072876-16338-2-git-send-email-vigneshr@ti.com>
 <20150731181745.GM20873@sirena.org.uk>
 <55BEF4AF.5090704@ti.com> <20150804155148.GR20873@sirena.org.uk>
 <55C0FD98.1090107@ti.com> <20150805115013.GJ20873@sirena.org.uk>
From: Michal Suchanek <hramrach@gmail.com>
Date: Wed, 5 Aug 2015 14:40:01 +0200
Message-ID: <CAOMqctQXwcHyiWBwtugSDSE_k65qrNfrwnhjQMDJkLoJMmGzUw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] spi: introduce flag for memory mapped read
To: Mark Brown <broonie@kernel.org>
Cc: "R, Vignesh" <vigneshr@ti.com>, devicetree <devicetree@vger.kernel.org>,
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

On 5 August 2015 at 13:50, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Aug 04, 2015 at 11:29:52PM +0530, R, Vignesh wrote:
>> On 8/4/2015 9:21 PM, Mark Brown wrote:
>> > On Mon, Aug 03, 2015 at 10:27:19AM +0530, Vignesh R wrote:
>
>> > I still can't tell from the above what this interface is supposed to do.
>> > It sounds like the use of memory mapped mode is supposed to be
>> > transparent to users, it should just affect how the controller interacts
>> > with the hardware, but if that's the case why do we need to expose it to
>> > users at all?  Shouldn't the driver just use memory mapped mode if it's
>> > faster?
>
>> 2. SFI_MM_IF(SPI memory mapped interface): The SFI_MM_IF block only
>> allows reading and writing to an SPI flash device only. Used to speed up
>> flash reads. It _cannot_ be used to communicate with non flash devices.
>> Now, the spi_message that ti-qspi receives in transfer_one() callback
>> can be from mtd device(in which case SFI_MM_IF can be used) or from any
>> other non flash SPI device (in which case SFI_MM_IF must not be used
>> instead SPI_CORE is to be used) but there is no way(is there?) to
>> distinguish where spi_message is from. Therefore I introduced flag
>> (use_mmap_mode) to struct spi_message. mtd driver will set flag to true,
>> this helps the ti-qspi driver to determine that the user is flash device
>> and thus can do read via SFI_MM_IF. If this flag is not set then the
>> user is assumed to be non flash SPI driver and will use SPI_CORE block
>> to communicate.
>
> So if you're trying to do this you need to document it adequately so
> that other people can understand what it is supposed to do and how to
> use and implement it.  People can't really tell how the interface is
> supposed to work based on what was in the patch and the above isn't
> really helping.  For example, how does this change or restrict what the
> contents of the spi_message are?
>
>> On the whole, I just need a way to determine that the user is a flash
>> device in order to switch to memory mapped interface.
>
> As far as I can tell you want to set a per spi_message flag saying that
> the message is a flash read command?  If that's what this is trying to
> do then why do you need to set the flag at all?  If the message is in a
> clearly defined format and it's more efficient to use this mmap mode
> then surely the driver can just recognise that the format is approprate
> and switch into mmap mode without being explicitly told - I'm not clear
> what the flag adds here.

ehm, the read command is just one byte.

I don't think sending 03 or other random byte as the first byte of a
SPI transfer can be used as reliable detection that we are talking to
a SPI flash memory.

Thanks

Michal
