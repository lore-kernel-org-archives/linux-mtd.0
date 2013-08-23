Message-ID: <52174722.7010604@ti.com>
Date: Fri, 23 Aug 2013 16:57:30 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V1 3/5] mtd: m25p80: add the quad-read support
References: <1376885403-12156-1-git-send-email-b32955@freescale.com>
 <1376885403-12156-4-git-send-email-b32955@freescale.com>
 <20130822193453.GB10038@ld-irv-0074.broadcom.com>
 <20130822195559.GU26118@sirena.org.uk> <52174640.701@gmail.com>
In-Reply-To: <52174640.701@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 b44548@freescale.com, dedekind1@gmail.com, b18965@freescale.com,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, shawn.guo@linaro.org, dwmw2@infradead.org,
 wangyuhang <wangyuhang2014@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
On Friday 23 August 2013 04:53 PM, Brian Norris wrote:
> On 08/22/2013 12:55 PM, Mark Brown wrote:
>> On Thu, Aug 22, 2013 at 12:34:53PM -0700, Brian Norris wrote:
>>> What you're really missing from device-tree (and the SPI subystem in
>>> general) is how to detect those SPI controllers which support dual and
>>> quad mode transfers, and how to communicate that a particular SPI
>>> transaction should be performed on 1 or 4 IO lines. We shouldn't have
>>> this just hacked in via assumptions.
>>
>> That bit does need to be fixed in this driver, yes.  The SPI core now
>> has quad mode support.
>
> Where? Perhaps I'm missing the obvious, but I don't see SPI core quad 
> support in linux-next or in Linus' tree.
>
You can find it here in Mark's tree:
git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
branch: remotes/brownspi/spi-next
> Brian
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
