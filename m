Message-ID: <521786E7.3070201@ti.com>
Date: Fri, 23 Aug 2013 21:29:35 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH V1 3/5] mtd: m25p80: add the quad-read support
References: <1376885403-12156-1-git-send-email-b32955@freescale.com>
 <1376885403-12156-4-git-send-email-b32955@freescale.com>
 <CAHSAbzN166J=DFi+1koPUpnFpJVHwtbC1AP21ywhAAissQxPxg@mail.gmail.com>
 <52172A81.5090501@freescale.com> <52173217.70505@ti.com>
 <20130824024512.GA2528@gmail.com>
In-Reply-To: <20130824024512.GA2528@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: shawn.guo@linaro.org, b44548@freescale.com, dedekind1@gmail.com,
 b18965@freescale.com, linux-spi@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 kernel@pengutronix.de, computersforpeace@gmail.com, dwmw2@infradead.org,
 yuhang wang <wangyuhang2014@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 24 August 2013 08:15 AM, Huang Shijie wrote:
> On Fri, Aug 23, 2013 at 03:27:43PM +0530, Sourav Poddar wrote:
>> On Friday 23 August 2013 02:55 PM, Huang Shijie wrote:
>>> 于 2013年08月23日 17:05, yuhang wang 写道:
>>>
>> You should add QOR opcodes also in your patch, so we have the complete set.
> yes, i have already supported the QIOR opcode in my driver.
>
I meant opcode 0x6b Quad output read which spansion flash supports.
> thanks
> Huang Shijie
