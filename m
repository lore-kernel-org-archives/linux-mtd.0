Message-ID: <4E57118E.90100@freescale.com>
Date: Fri, 26 Aug 2011 11:22:54 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v10 0/3] add the GPMI controller driver for IMX23/IMX28
References: <1314171204-25458-1-git-send-email-b32955@freescale.com>
	<1314272091.18988.53.camel@sauron>
In-Reply-To: <1314272091.18988.53.camel@sauron>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: koen.beel.barco@gmail.com, w.sang@pengutronix.de,
	linux-mtd@lists.infradead.org, shijie8@gmail.com,
	s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem:
> On Wed, 2011-08-24 at 15:33 +0800, Huang Shijie wrote:
>> The patch set is based on Artem's tree:
>> 	http://git.infradead.org/users/dedekind/l2-mtd-2.6.git
>>
>> The general-purpose media interface(GPMI) controller is a flexible interface
>> to up to several NAND flashs.
>>
>> The Bose Ray-Choudhury Hocquenghem(BCH) module is a hardware ECC accelerator.
>>
>> With the help of BCH, the GPMI controller can choose to do the hardware ECC or
>> not.
>>
>> This driver is a _pure_ MTD NAND controller driver now.
> I've pushed these patches to my l2-mtd-2.6.git tree. I assume they are
> independent of the other patches of yours: "[PATCH v8 0/4] add the
> GPMI-NAND support for imx23/imx28".
>
thanks very much :)

Huang Shijie
> I did not really review the driver carefully, but the code looks neat at
> the first glance. My tree is in linux-next, so you should see your
> driver there.
>
> Also, if someone gives it more review, and you send a new version, I can
> always pick it up.
>
> Thanks.
>
