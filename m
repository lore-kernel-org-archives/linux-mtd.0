Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::8])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g0A4V-0007Kp-4l
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2018 18:41:17 +0000
Subject: Re: Questions about the Freescale/NXP QuadSPI controller
To: Han Xu <han.xu@nxp.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 David Wolfe <david.wolfe@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "richard@nod.at" <richard@nod.at>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "broonie@kernel.org" <broonie@kernel.org>
References: <1530789310-16254-1-git-send-email-frieder.schrempf@exceet.de>
 <1530789310-16254-4-git-send-email-frieder.schrempf@exceet.de>
 <7e95c72c-2cd1-f138-a687-6cca362c95b7@exceet.de>
 <63462dd2-b61b-6522-0619-0cdc89148193@exceet.de>
 <VI1PR0401MB2221D006E89A06B7D343A5E5972C0@VI1PR0401MB2221.eurprd04.prod.outlook.com>
 <20180804153728.0a99d28f@bbrezillon>
 <121b89ad-712f-166b-83d2-6b0f1bdc750e@exceet.de>
 <AM6PR04MB4967E918792A1C0D7D3D5C18971B0@AM6PR04MB4967.eurprd04.prod.outlook.com>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <b2a29f52-f658-d92c-7b42-3096af6449f1@exceet.de>
Date: Wed, 12 Sep 2018 20:40:39 +0200
MIME-Version: 1.0
In-Reply-To: <AM6PR04MB4967E918792A1C0D7D3D5C18971B0@AM6PR04MB4967.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Han,

On 12.09.2018 19:04, Han Xu wrote:
> 
> 
>> -----Original Message-----
>> From: Frieder Schrempf [mailto:frieder.schrempf@exceet.de]
>> Sent: Monday, September 3, 2018 4:02 AM
>> To: Han Xu <han.xu@nxp.com>
>> Cc: Boris Brezillon <boris.brezillon@bootlin.com>; David Wolfe
>> <david.wolfe@nxp.com>; Fabio Estevam <fabio.estevam@nxp.com>;
>> Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>; Yogesh Narayan
>> Gaur <yogeshnarayan.gaur@nxp.com>; shawnguo@kernel.org; linux-
>> mtd@lists.infradead.org; linux-spi@vger.kernel.org; dwmw2@infradead.org;
>> computersforpeace@gmail.com; marek.vasut@gmail.com; richard@nod.at;
>> miquel.raynal@bootlin.com; broonie@kernel.org
>> Subject: Re: Questions about the Freescale/NXP QuadSPI controller
>>
>> Hi Han,
>>
>> On 04.08.2018 15:37, Boris Brezillon wrote:
>>> Hi Han,
>>>
>>> On Thu, 2 Aug 2018 21:58:48 +0000
>>> Han Xu <han.xu@nxp.com> wrote:
>>>
>>>>> -----Original Message-----
>>>>> From: Frieder Schrempf [mailto:frieder.schrempf@exceet.de]
>>>>> Sent: Thursday, August 2, 2018 8:09 AM
>>>>> To: David Wolfe <david.wolfe@nxp.com>; Fabio Estevam
>>>>> <fabio.estevam@nxp.com>; Prabhakar Kushwaha
>>>>> <prabhakar.kushwaha@nxp.com>; Yogesh Narayan Gaur
>>>>> <yogeshnarayan.gaur@nxp.com>; Han Xu <han.xu@nxp.com>;
>>>>> shawnguo@kernel.org
>>>>> Cc: linux-mtd@lists.infradead.org; boris.brezillon@bootlin.com;
>>>>> linux- spi@vger.kernel.org; dwmw2@infradead.org;
>>>>> computersforpeace@gmail.com; marek.vasut@gmail.com;
>> richard@nod.at;
>>>>> miquel.raynal@bootlin.com; broonie@kernel.org
>>>>> Subject: Re: Questions about the Freescale/NXP QuadSPI controller
>>>>>
>>>>> Ping.
>>>>>
>>>>> I'm not sure if my message below went out to you at all. At least I
>>>>> can't find it in the ML archive.
>>>>>
>>>>> I still hope someone can help with the questions below.
>>>>>
>>>>> Meanwhile for the second point I did some tests myself with one chip
>>>>> on each of the two buses and it worked fine with my latest v2 patches.
>>>>> So I'm not sure at all why Yogesh has problems with his setup (two
>>>>> chips on the first bus).
>>>>
>>>> Tried to test the v2 patch set on i.MX6SX SDB board but get the memory
>> map failure.
>>>>
>>>> [    1.298633] fsl-quadspi 21e4000.qspi: ioremap failed for resource [mem
>> 0x70000000-0x7fffffff]
>>>> [    1.307330] fsl-quadspi 21e4000.qspi: Freescale QuadSPI probe failed
>>>> [    1.313922] fsl-quadspi: probe of 21e4000.qspi failed with error -12
>>>>
>>>> This is the reason why dynamic ioremap added in previous driver, please
>> refer to
>>>>
>>>>
>> https://smex12-5-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2femea01.safelinks.protection.outlook.com%2f%3furl%3dhttps%253A%252F%252Fpa&umid=d6cc1014-1848-42fb-92fd-9626d45c8050&auth=541e45255b6517100d80c2b1b80b6933b203c492-5aa8e1977a9db94300a9f61f5446e7a21b175f56
>>>>
>> tchwork.ozlabs.org%2Fpatch%2F503655%2F&amp;data=02%7C01%7Chan.xu
>> %40nx
>>>>
>> p.com%7C9f45a8b666d3478f065408d6117bf524%7C686ea1d3bc2b4c6fa92cd9
>> 9c5c
>>>>
>> 301635%7C0%7C0%7C636715621426190473&amp;sdata=XWPfWe%2Fu2ePW
>> mNPe179D0
>>>> vjTp6eLp0%2FJRF2vRayDwug%3D&amp;reserved=0
>>>
>>> We can reduce the size of the iomap to 2k * 4, since this is all we
>>> use currently. Can you try to change the size of the ioremap call to
>>> 16k and tell us if it works.
>>
>> Were you able to test with the reduced iomap size?
>> It would be great to know if it works on your board.
>>
>> Thanks,
>> Frieder
> 
> Test the code on i.MX6SX sabreauto board with two micron n25q256a chips on two CS.
> First issue found is __div0 kernel dump with these code
> /* Max 64 dummy clock cycles supported */
> if (op->dummy.nbytes * 8 / op->dummy.buswidth > 64)
> dummy.buswidth was not set during read id.

First, thank you for coming back to this and doing the test.
I'm currently not sure about the reason for this, but I guess Boris will 
figure it out easily ;)

> 
> Second issue is the second part failed to be probed, tried both buswidth 4 and buswidth 1.
> 
> [    1.364979] m25p80 spi5.0: found n25q256a, expected m25p80
> [    1.370986] m25p80 spi5.0: n25q256a (32768 Kbytes)
> [    1.381020] m25p80 spi5.1: unrecognized JEDEC id bytes: ff, ff, ff
> 
> These are the DT settings:
> &qspi1 {
>          pinctrl-names = "default";
>          pinctrl-0 = <&pinctrl_qspi1_1>;
>          status = "okay";
> 
>          flash0: n25q256a@0 {
>          ¦       #address-cells = <1>;
>          ¦       #size-cells = <1>;
>          ¦       compatible = "micron,m25p80";
>          ¦       spi-max-frequency = <29000000>;
>                  spi-rx-bus-width = <4>;
>                  spi-tx-bus-width = <4>;
>          ¦       reg = <0>;
>          };
> 
>          flash1: n25q256a@1 {
>          ¦       #address-cells = <1>;
>          ¦       #size-cells = <1>;
>          ¦       compatible = "micron,m25p80";
>          ¦       spi-max-frequency = <29000000>;
>                  spi-rx-bus-width = <4>;
>                  spi-tx-bus-width = <4>;
>          ¦       reg = <1>;
>          };
> };

First, I think you should add "jedec,spi-nor" to your compatible properties.

Second, are you sure, that the two chips are both on QSPIA using the two 
chip selects?
I have no schematics of the board, but if I look at the devicetree in 
the linux-imx kernel [1] it seems to me that one chip is on QSPIA CS0 
and the other on QSPIB CS0.
If this is the case, then you have to set reg = <2> for the second chip.

Thanks,
Frieder

[1] 
http://git.freescale.com/git/cgit.cgi/imx/linux-imx.git/tree/arch/arm/boot/dts/imx6sx-sabreauto.dts?h=imx_4.9.11_1.0.0_ga#n771

>>>
>>> Unrelated to this issue, we still have 2 questions left unanswered:
>>>
>>> 1/ is there an easy way to invalidate AHB buffers? I mean, not
>>>      something that implies a full reset + several milliseconds of delay
>>>      after the reset. Right now we trick the caching logic by mapping a
>>>      portion that is twice the size of the buffer and switching from one
>>>      sub-portion to this other to trigger a real read on each read
>>>      access, but that's hack-ish, and I'd be surprised if HW
>>>      engineers hadn't planned for this "manual AHB buffer flush" case.
>>>
>>> 2/ if we use DMA, do you know what happens when the TX FIFO runs out
>>>      of data while the TX request is not finished yet. In PIO mode, it
>>>      seems the engine sends garbage on the bus when that happens, and we
>>>      definitely don't want that.
>>>
>>> While #1 is not blocking us, #2 is if we don't have those patches
>>> [1][2] applied, and Marek wanted to be sure there was no other ways to
>>> solve the "TX FIFO starvation" issue before considering these changes.
>>> So that'd be great if someone from NXP could have a look/ask around
>>> and give us answers to those 2 questions.
>>>
>>> Thanks,
>>>
>>> Boris
