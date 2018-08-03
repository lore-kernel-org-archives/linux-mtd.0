Subject: Re: [RFC PATCH 6/8] gpio: omap: Add get/set_multiple() callbacks
To: Linus Walleij <linus.walleij@linaro.org>, Janusz Krzysztofik
 <jmkrzyszt@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, ext Tony
 Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
CC: Boris Brezillon <boris.brezillon@bootlin.com>,
 =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Mark Vasut
 <marek.vasut@gmail.com>, <linux-mtd@lists.infradead.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Linux-OMAP
 <linux-omap@vger.kernel.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
 <20180718235710.18242-7-jmkrzyszt@gmail.com>
 <CACRpkdbH9Vu12RckQPKhGgyJnyxaQ04d5qa9srHwneP3SS6FAA@mail.gmail.com>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <7a28e14e-8bdc-1408-2464-ad3a0d2f3116@ti.com>
Date: Thu, 2 Aug 2018 20:52:35 -0500
MIME-Version: 1.0
In-Reply-To: <CACRpkdbH9Vu12RckQPKhGgyJnyxaQ04d5qa9srHwneP3SS6FAA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 07/29/2018 03:29 PM, Linus Walleij wrote:
> On Thu, Jul 19, 2018 at 1:56 AM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> 
>> This should make applications utilizing whole banks work faster.
>>
>> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> 
> This patch looks good to me and I have an urge to just apply it.
> 
> Can we get some feedback from the maintainers?
> 

Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>
-- 
regards,
-grygorii
