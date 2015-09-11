MIME-Version: 1.0
In-Reply-To: <20150911123644.GU12027@sirena.org.uk>
References: <1440570367-22569-1-git-send-email-ranjit.waghmode@xilinx.com>
 <1440570367-22569-2-git-send-email-ranjit.waghmode@xilinx.com>
 <20150903121232.GW12027@sirena.org.uk>
 <7CFCFE83B8145347A1D424EC939F1C3C014B0D67@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20150911123644.GU12027@sirena.org.uk>
Date: Fri, 11 Sep 2015 21:54:29 +0530
Message-ID: <CAFcVECJ_sF6Sav4NffMkwS5iQnPk2x7SE=qji5ByF17ejX0n=g@mail.gmail.com>
Subject: Re: [LINUX RFC v2 1/4] spi: add support of two chip selects & data
 stripe
From: Harini Katakam <harinikatakamlinux@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Ranjit Abhimanyu Waghmode <ranjit.waghmode@xilinx.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 Michal Simek <michals@xilinx.com>,
 Soren Brinkmann <sorenb@xilinx.com>, "zajec5@gmail.com" <zajec5@gmail.com>,
 "ben@decadent.org.uk" <ben@decadent.org.uk>, "marex@denx.de" <marex@denx.de>,
 "b32955@freescale.com" <b32955@freescale.com>,
 "knut.wohlrab@de.bosch.com" <knut.wohlrab@de.bosch.com>,
 "juhosg@openwrt.org" <juhosg@openwrt.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mark,

On Fri, Sep 11, 2015 at 6:06 PM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Sep 04, 2015 at 12:02:21PM +0000, Ranjit Abhimanyu Waghmode wrote:
>
> Please fix your mail client to word wrap within paragraphs and to quote
> text without reflowing it - your messages are very hard to read.
>
>> > > + /* Controller may support more than one chip.
>> > > +  * This flag will enable that feature.
>> > > +  */
>> > > +#define SPI_MASTER_BOTH_CS               BIT(8)          /* enable both
>> > chips */
>
>> Now we can consider following use cases:
>
>> Suppose we need to send the same data to multiple slaves of same kind:
>> Here the application need not to do individual slave access for writing, instead it can send data to all the devices in one go.
>
> That's a *very* specific application which will only work for write only
> devices - I'd be surprised if such systems actually had distinct chip
> select lines at the CPU level.
>

Agreed that it is very specific but here are a few ways it is used
when communicating with two flash devices in parallel configuration:
- Write enable is sent to both devices using a single operation.
- Writing to any configuration registers in the flash is done in one go
- Some application that want to mirror important data to both devices.
Even with reading, the assertion of multiple cs combined with stripe
will mean:
- Two status bytes, one form each will be obtained in one operation
- Similarly data that was written using stripe is read back and combined.

Such systems could still maintain separate chip selects to perform
individual operations such as reading flash ID, debugging failures or
locking specific sectors.

Regards,
Harini
