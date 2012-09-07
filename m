Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TA3Sg-00043O-He
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2012 18:39:27 +0000
From: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
To: "Karicheri, Muralidharan" <m-karicheri2@ti.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "artem.bityutskiy@linux.intel.com"
 <artem.bityutskiy@linux.intel.com>, "dbaryshkov@gmail.com"
 <dbaryshkov@gmail.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mturquette@linaro.org"
 <mturquette@linaro.org>, "davinci-linux-open-source@linux.davincidsp.com"
 <davinci-linux-open-source@linux.davincidsp.com>
Subject: RE: [PATCH] mtd:nand:clk: preparation for switch to common clock
 framework
Date: Fri, 7 Sep 2012 18:39:16 +0000
Message-ID: <3E54258959B69E4282D79E01AB1F32B7041B6EDA@DFLE12.ent.ti.com>
References: <1346350624-27291-1-git-send-email-m-karicheri2@ti.com>
In-Reply-To: <1346350624-27291-1-git-send-email-m-karicheri2@ti.com>
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
>> Sent: Thursday, August 30, 2012 2:17 PM
>> To: dwmw2@infradead.org; artem.bityutskiy@linux.intel.com; dbaryshkov@gm=
ail.com;
>> computersforpeace@gmail.com; linux-mtd@lists.infradead.org; linux-
>> kernel@vger.kernel.org; mturquette@linaro.org
>> Cc: Karicheri, Muralidharan
>> Subject: [PATCH] mtd:nand:clk: preparation for switch to common clock fr=
amework
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
>> ---
>>  drivers/mtd/nand/davinci_nand.c |    6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_=
nand.c
>> index d94b03c..6b8cf27 100644
>> --- a/drivers/mtd/nand/davinci_nand.c
>> +++ b/drivers/mtd/nand/davinci_nand.c
>> @@ -656,7 +656,7 @@ static int __init nand_davinci_probe(struct platform=
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
>> @@ -767,7 +767,7 @@ syndrome_done:
>>=20
>>  err_scan:
>>  err_timing:
>> -	clk_disable(info->clk);
>> +	clk_disable_unprepare(info->clk);
>>=20
>>  err_clk_enable:
>>  	clk_put(info->clk);
>> @@ -804,7 +804,7 @@ static int __exit nand_davinci_remove(struct platfor=
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

subsystem owner,

Could you please review and apply this patch as needed? We need to get this=
 upstream before submitting the patch for Common clock framework support fo=
r mach-davinci. If I need to follow a specific procedure to get this merged=
, please direct me to a process page.

Thanks.

Murali Karicheri
Software Design Engineer
