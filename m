Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byfvI-0006Kr-JP
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 14:08:24 +0000
Subject: Re: [PATCH v2 0/9] mtd: spi-nor: parse SFDP tables to setup (Q)SPI
 memories
To: Jagan Teki <jagan@openedev.com>, Marek Vasut <marex@denx.de>
References: <cover.1475668319.git.cyrille.pitchen@atmel.com>
 <CAD6G_RR4Av8+szo9v2oucCFvwnow86gMVC-Ku_-Qfy18TVMGgA@mail.gmail.com>
 <c022e6fc-6bd7-d124-7233-e1e742049657@denx.de>
 <CAD6G_RQ2BjtF2cmPUJvYNk7KZZ6eTVAQsEqWs26xn710A4Dz-w@mail.gmail.com>
 <558d668a-69b0-8066-b7da-090517d3161d@atmel.com>
CC: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <1181d557-c149-8dfd-7fd1-bc83056541cf@atmel.com>
Date: Mon, 24 Oct 2016 16:07:57 +0200
MIME-Version: 1.0
In-Reply-To: <558d668a-69b0-8066-b7da-090517d3161d@atmel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 24/10/2016 à 14:09, Cyrille Pitchen a écrit :
> Hi Jagan,
> 
> Le 24/10/2016 à 09:41, Jagan Teki a écrit :
>> On Sun, Oct 23, 2016 at 2:03 AM, Marek Vasut <marex@denx.de> wrote:
>>> On 10/22/2016 01:00 PM, Jagan Teki wrote:
>>>> On Wed, Oct 5, 2016 at 5:30 PM, Cyrille Pitchen
>>>> <cyrille.pitchen@atmel.com> wrote:
>>>>> Hi all,
>>>>>
>>>>> This series extends support of SPI protocols to new protocols such as
>>>>> SPI x-2-2 and SPI x-4-4. Also spi_nor_scan() tries now to select the right
>>>>> op codes, timing parameters (number of mode and dummy cycles) and erase
>>>>> sector size by parsing the Serial Flash Discoverable Parameter (SFDP)
>>>>> tables, when available, as defined in the JEDEC JESD216 specifications.
>>>>>
>>>>> When SFDP tables are not available, legacy settings are still used for
>>>>> backward compatibility (SPI and earlier QSPI memories).
>>>>>
>>>>> Support of SPI memories >128Mbits is also improved by using the 4byte
>>>>> address instruction set, when available. Using those dedicated op codes
>>>>> is stateless as opposed to enter the 4byte address mode, hence a better
>>>>> compatibility with some boot loaders which expect to use 3byte address
>>>>> op codes.
>>>>
>>>> The memories which are > 128Mbits should have 4-bytes addressing
>>>> support based on my experience, do you think BAR is also required
>>>> atleast from spi-nor side?
>>>
>>> Yes, I believe BAR is still required for broken/dumb flash chips.
>>> Not all chips > 16 MiB support dedicated 4-byte addressing opcodes :-(
>>
>> Do you have list for those broken chips? because I never find any
>> chips which has > 16 MiB with not support of 4-byte address opcodes
>> and I've seen the controller has dependable with BAR though it can
>> access > 16MiB ex: zynq qspi/
>>
>> thanks!
>>
> 
> Let's take the case of Micron n25q256* memories. Depending of the part number,
> the 12h op code is associated with either 4-byte address Page Program 1-1-1
> or 3-byte address Page Program 1-4-4.
> Then considering parts where the 12h op code is used for 3-byte address Page
> Program 1-4-4, there is no op code for a 4-byte address Page Program 1-1-1.
> 
> Note 15, extracted from the Micron n25q_256mb_3v_65nm.pdf datasheet, about
> the 3-byte address Page Program 1-4-4 (Extended Quad Input Fast Program):
> The code 38h is valid only for part numbers N25Q256A83ESF40x, N25Q256A83E1240x
> and N25Q256A83ESFA0F; the code 12h is valid for the other part numbers.
> 
> Hence most of the Micron n25q256* memories has no op code for 4-byte address
> Page Program 1-1-1.
> Then we could use the 34h op code instead to perform 4-byte address Page
> Program 1-1-4 but some SPI controllers might not support the SPI 1-1-4 protocol
> for Page Program operations. Sp entering the 4-byte address mode or using
> the BAR might still be the only solutions in those cases.
> 
> Also, I'm pretty sure some other SPI NOR memories support 4-byte address Fast
> Read op codes but only 3-byte address op codes for Page Program and Sector
> Erase. I will look at the datasheets I have to find and provide an example.
> 
>

Even worse, let's take the example for Macronix MX25L25635* and MX25L25673*:
they both share the very same JEDEC ID. The older part (35) doesn't support
the 4-byte address instruction set at all whereas the newer part (73) does.

> Best regards,
> 
> Cyrille
> 
