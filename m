Received: from s159.web-hosting.com ([68.65.120.118])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byZtK-0007uq-Rp
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 07:41:55 +0000
Received: from mail-lf0-f49.google.com ([209.85.215.49]:36084)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.86_1) (envelope-from <jagan@openedev.com>)
 id 1byZsy-000W7S-07
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 03:41:34 -0400
Received: by mail-lf0-f49.google.com with SMTP id b75so186697962lfg.3
 for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2016 00:41:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c022e6fc-6bd7-d124-7233-e1e742049657@denx.de>
References: <cover.1475668319.git.cyrille.pitchen@atmel.com>
 <CAD6G_RR4Av8+szo9v2oucCFvwnow86gMVC-Ku_-Qfy18TVMGgA@mail.gmail.com>
 <c022e6fc-6bd7-d124-7233-e1e742049657@denx.de>
From: Jagan Teki <jagan@openedev.com>
Date: Mon, 24 Oct 2016 13:11:29 +0530
Message-ID: <CAD6G_RQ2BjtF2cmPUJvYNk7KZZ6eTVAQsEqWs26xn710A4Dz-w@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] mtd: spi-nor: parse SFDP tables to setup (Q)SPI
 memories
To: Marek Vasut <marex@denx.de>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com,
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

On Sun, Oct 23, 2016 at 2:03 AM, Marek Vasut <marex@denx.de> wrote:
> On 10/22/2016 01:00 PM, Jagan Teki wrote:
>> On Wed, Oct 5, 2016 at 5:30 PM, Cyrille Pitchen
>> <cyrille.pitchen@atmel.com> wrote:
>>> Hi all,
>>>
>>> This series extends support of SPI protocols to new protocols such as
>>> SPI x-2-2 and SPI x-4-4. Also spi_nor_scan() tries now to select the right
>>> op codes, timing parameters (number of mode and dummy cycles) and erase
>>> sector size by parsing the Serial Flash Discoverable Parameter (SFDP)
>>> tables, when available, as defined in the JEDEC JESD216 specifications.
>>>
>>> When SFDP tables are not available, legacy settings are still used for
>>> backward compatibility (SPI and earlier QSPI memories).
>>>
>>> Support of SPI memories >128Mbits is also improved by using the 4byte
>>> address instruction set, when available. Using those dedicated op codes
>>> is stateless as opposed to enter the 4byte address mode, hence a better
>>> compatibility with some boot loaders which expect to use 3byte address
>>> op codes.
>>
>> The memories which are > 128Mbits should have 4-bytes addressing
>> support based on my experience, do you think BAR is also required
>> atleast from spi-nor side?
>
> Yes, I believe BAR is still required for broken/dumb flash chips.
> Not all chips > 16 MiB support dedicated 4-byte addressing opcodes :-(

Do you have list for those broken chips? because I never find any
chips which has > 16 MiB with not support of 4-byte address opcodes
and I've seen the controller has dependable with BAR though it can
access > 16MiB ex: zynq qspi/

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
