Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1by4xQ-00076h-A9
 for linux-mtd@lists.infradead.org; Sat, 22 Oct 2016 22:40:05 +0000
Subject: Re: [PATCH v2 0/9] mtd: spi-nor: parse SFDP tables to setup (Q)SPI
 memories
To: Jagan Teki <jagan@openedev.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <cover.1475668319.git.cyrille.pitchen@atmel.com>
 <CAD6G_RR4Av8+szo9v2oucCFvwnow86gMVC-Ku_-Qfy18TVMGgA@mail.gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <c022e6fc-6bd7-d124-7233-e1e742049657@denx.de>
Date: Sat, 22 Oct 2016 22:33:29 +0200
MIME-Version: 1.0
In-Reply-To: <CAD6G_RR4Av8+szo9v2oucCFvwnow86gMVC-Ku_-Qfy18TVMGgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/22/2016 01:00 PM, Jagan Teki wrote:
> On Wed, Oct 5, 2016 at 5:30 PM, Cyrille Pitchen
> <cyrille.pitchen@atmel.com> wrote:
>> Hi all,
>>
>> This series extends support of SPI protocols to new protocols such as
>> SPI x-2-2 and SPI x-4-4. Also spi_nor_scan() tries now to select the right
>> op codes, timing parameters (number of mode and dummy cycles) and erase
>> sector size by parsing the Serial Flash Discoverable Parameter (SFDP)
>> tables, when available, as defined in the JEDEC JESD216 specifications.
>>
>> When SFDP tables are not available, legacy settings are still used for
>> backward compatibility (SPI and earlier QSPI memories).
>>
>> Support of SPI memories >128Mbits is also improved by using the 4byte
>> address instruction set, when available. Using those dedicated op codes
>> is stateless as opposed to enter the 4byte address mode, hence a better
>> compatibility with some boot loaders which expect to use 3byte address
>> op codes.
> 
> The memories which are > 128Mbits should have 4-bytes addressing
> support based on my experience, do you think BAR is also required
> atleast from spi-nor side?

Yes, I believe BAR is still required for broken/dumb flash chips.
Not all chips > 16 MiB support dedicated 4-byte addressing opcodes :-(

-- 
Best regards,
Marek Vasut
