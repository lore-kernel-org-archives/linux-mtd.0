Subject: Re: [PATCH v2 2/2] mtd: spi-nor: add rockchip serial flash controller
 driver
To: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
References: <1479437945-27918-1-git-send-email-shawn.lin@rock-chips.com>
 <1479437945-27918-3-git-send-email-shawn.lin@rock-chips.com>
 <020fe898-8476-42cd-9591-d2bc97263457@gmail.com>
Cc: shawn.lin@rock-chips.com, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <71919aa3-8f28-65f4-de27-3e0d8ea165bb@rock-chips.com>
Date: Wed, 30 Nov 2016 08:58:18 +0800
MIME-Version: 1.0
In-Reply-To: <020fe898-8476-42cd-9591-d2bc97263457@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

在 2016/11/25 21:55, Marek Vasut 写道:
> On 11/18/2016 03:59 AM, Shawn Lin wrote:
>> Add rockchip serial flash controller driver
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>
> [...]
>
>> +static void rockchip_sfc_unregister_all(struct rockchip_sfc *sfc)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < sfc->num_chip; i++)
>> +		mtd_device_unregister(&(sfc->flash[sfc->num_chip].nor.mtd));
>                                                    ^^^^^^^^^^^^^
> This will always unregister the same flash, no ? This cannot work.

Ah, yup, I will fix this. :)

>
>> +}
>
> [...]
>


-- 
Best Regards
Shawn Lin
