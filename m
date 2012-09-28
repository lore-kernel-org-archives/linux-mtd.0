From: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
To: "Karicheri, Muralidharan" <m-karicheri2@ti.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "artem.bityutskiy@linux.intel.com"
 <artem.bityutskiy@linux.intel.com>, "hs@denx.de" <hs@denx.de>,
 "mikedunn@newsguy.com" <mikedunn@newsguy.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "davinci-linux-open-source@linux.davincidsp.com"
 <davinci-linux-open-source@linux.davincidsp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [REMINDER: PATCH 1/1] mtd:nand:clk: preparation for switch to
 common clock framework
Date: Fri, 28 Sep 2012 16:10:32 +0000
Message-ID: <3E54258959B69E4282D79E01AB1F32B7041EF679@DFLE12.ent.ti.com>
References: <1347899860-24358-1-git-send-email-m-karicheri2@ti.com>
 <1347899860-24358-2-git-send-email-m-karicheri2@ti.com>
In-Reply-To: <1347899860-24358-2-git-send-email-m-karicheri2@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> -----Original Message-----
>> From: Karicheri, Muralidharan
>> Sent: Monday, September 17, 2012 12:38 PM
>> To: dwmw2@infradead.org; artem.bityutskiy@linux.intel.com; hs@denx.de;
>> mikedunn@newsguy.com; linux-mtd@lists.infradead.org; linux-kernel@vger.k=
ernel.org;
>> davinci-linux-open-source@linux.davincidsp.com; linux-arm-kernel@lists.i=
nfradead.org
>> Cc: Karicheri, Muralidharan
>> Subject: [PATCH 1/1] mtd:nand:clk: preparation for switch to common cloc=
k framework
>>=20
>> As a first step towards migrating davinci platforms to use common clock
>> framework, replace all instances of clk_enable() with clk_prepare_enable=
()
>> and clk_disable() with clk_disable_unprepare(). Until the platform is
>> switched to use the CONFIG_HAVE_CLK_PREPARE Kconfig variable, this just
>> adds a might_sleep() call and would work without any issues.
>>=20
>> This will make it easy later to switch to common clk based implementatio=
n
>> of clk driver from DaVinci specific driver.
>>=20
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> Reviewed-by: Mike Turquette <mturquette@linaro.org>
>>=20
>> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_=
nand.c
>> index f386b3c..df1ab7d 100644
>> --- a/drivers/mtd/nand/davinci_nand.c
>> +++ b/drivers/mtd/nand/davinci_nand.c
>> @@ -724,7 +724,7 @@ static int __init nand_davinci_probe(struct platform=
_device
>> *pdev)
>>  		goto err_clk;
>>  	}
>>=20
>> -	ret =3D clk_enable(info->clk);
>> +	ret =3D clk_prepare_enable(info->clk);
>>  	if (ret < 0) {
>>  		dev_dbg(&pdev->dev, "unable to enable AEMIF clock, err %d\n",
>>  			ret);
>> @@ -835,7 +835,7 @@ syndrome_done:
>>=20
>>  err_scan:
>>  err_timing:
>> -	clk_disable(info->clk);
>> +	clk_disable_unprepare(info->clk);
>>=20
>>  err_clk_enable:
>>  	clk_put(info->clk);
>> @@ -872,7 +872,7 @@ static int __exit nand_davinci_remove(struct platfor=
m_device
>> *pdev)
>>=20
>>  	nand_release(&info->mtd);
>>=20
>> -	clk_disable(info->clk);
>> +	clk_disable_unprepare(info->clk);
>>  	clk_put(info->clk);
>>=20
>>  	kfree(info);
>> --
>> 1.7.9.5

Could you please review and apply this patch to mtd subsystem tree for linu=
x-next?

Murali Karicheri
Software Design Engineer
