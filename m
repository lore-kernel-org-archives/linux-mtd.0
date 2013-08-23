Message-ID: <52170094.2030608@freescale.com>
Date: Fri, 23 Aug 2013 14:26:28 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V1 3/5] mtd: m25p80: add the quad-read support
References: <1376885403-12156-1-git-send-email-b32955@freescale.com>
 <1376885403-12156-4-git-send-email-b32955@freescale.com>
 <20130822193453.GB10038@ld-irv-0074.broadcom.com>
 <20130822195559.GU26118@sirena.org.uk>
In-Reply-To: <20130822195559.GU26118@sirena.org.uk>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 shawn.guo@linaro.org, b44548@freescale.com, dedekind1@gmail.com,
 b18965@freescale.com, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Brian Norris <computersforpeace@gmail.com>,
 dwmw2@infradead.org, wangyuhang <wangyuhang2014@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA08=D4=C223=C8=D5 03:55, Mark Brown =D0=B4=B5=C0:
> On Thu, Aug 22, 2013 at 12:34:53PM -0700, Brian Norris wrote:
>> On Mon, Aug 19, 2013 at 12:10:01PM +0800, Huang Shijie wrote:
>
>> Why can't this be detected at runtime? We added a "no fast read" flag =
to
>> the device table, so why not "dual/quad mode supported"? And believe i=
t
>> or not, not all m25p80 users have device tree. So it isn't very logica=
l
>> to tie this support to device-tree only.
>
Hi Brian:
My only question here is do we need to add some flags , such as "quad
read", to
the device table? If you think we need to, i will add a patch for it.

(Just as Brown said, when the DTS configurates the "m25p,quad-read"
property, it
means : Both the board and the NOR support the Quad read.)


>> What you're really missing from device-tree (and the SPI subystem in
>> general) is how to detect those SPI controllers which support dual and
>> quad mode transfers, and how to communicate that a particular SPI
>> transaction should be performed on 1 or 4 IO lines. We shouldn't have
>> this just hacked in via assumptions.
> That bit does need to be fixed in this driver, yes.  The SPI core now
> has quad mode support.
yes, i do not need these bits in this driver.


thanks
Huang Shijie
