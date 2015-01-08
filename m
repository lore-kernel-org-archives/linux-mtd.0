Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y93mw-0006y1-AE
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 03:29:35 +0000
Message-ID: <54ADF90B.1070800@imgtec.com>
Date: Thu, 8 Jan 2015 00:27:07 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: =?UTF-8?B?IlFpIFdhbmcg546L6LW3IChxaXdhbmcpIg==?= <qiwang@micron.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/3] An alternative to SPI NAND
References: <87F60714EC601C4C83DFF1D2E3D390A04AB3F3@NTXXIAMBX02.xacn.micron.com>
 <20150108010257.GP9759@ld-irv-0074>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7714DD2A@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A7714DD2A@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?IkZyYW5rIExpdSDliJjnvqQgKGZyYW5rbGl1KSI=?= <frankliu@micron.com>,
 =?UTF-8?B?Ik1lbGFuaWUgWmhhbmcg5byg54eVIChtZWxhbmll?= =?UTF-8?B?emhhbmcpIg==?=
 <melaniezhang@micron.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 =?UTF-8?B?IlBldGVyIFA=?= =?UTF-8?B?YW4g5r2Y5qCLIChwZXRlcnBhbmRvbmcpIg==?=
 <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Qi Wang,

On 01/07/2015 11:45 PM, Qi Wang 王起 (qiwang) wrote:
> Hi Brian,
> 
> On Thu, Jan 08, 2015 at 9:03:24AM +0000, Brian Norris wrote:
>>
>> On Thu, Jan 08, 2015 at 12:47:24AM +0000, Peter Pan 潘栋 (peterpandong)
>> wrote:
>>> Documentation/devicetree/bindings/mtd/spi-nand.txt |   22 +
>>> drivers/mtd/Kconfig                                |    2 +
>>> drivers/mtd/Makefile                               |    1 +
>>> drivers/mtd/spi-nand/Kconfig                       |    7 +
>>> drivers/mtd/spi-nand/Makefile                      |    3 +
>>> drivers/mtd/spi-nand/spi-nand-base.c               | 2034
>> ++++++++++++++++++++
>>> drivers/mtd/spi-nand/spi-nand-bbt.c                | 1279 ++++++++++++
>>
>> I can already tell by the diffstat that I don't like this. We probably
>> don't need 3000 new lines of code for this, but we especially don't want
>> to duplicate nand_bbt.c. It won't take a lot of work to augment
>> nand_bbt.c to make it shareable. (I can whip that patch up if needed.)
> 
> Yes, I agree with you, Nand_bbt.c do can be shared by Parallel NAND and
> SPI NAND. Actually, we are working at this now. Will send patches to you
> Once we finished it.
> 

Thanks for the quick submission!

However, Brian is right, this code duplication is a no go.

Perhaps a more valid approach would be to first identify the code that
needs to be shared in nand_bbt.c and nand_base.c, and export those
symbols (or maybe do the required refactor).

Then, separate the SPI NAND upper and lower logic (in a similar to my
proposal, which I still consider turned out to be clean).

These two things would lead to a simpler and smaller patchset. I also
suggest to cut off everything that we don't utterly need on a first
submission, so it's easier to review.
-- 
Ezequiel
