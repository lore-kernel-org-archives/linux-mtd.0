Message-ID: <5293736A.2060108@ti.com>
Date: Mon, 25 Nov 2013 17:57:30 +0200
From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] mtd: nand: davinci: reuse driver for Keystone arch
References: <1384964699-15134-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1384964699-15134-2-git-send-email-ivan.khoronzhuk@ti.com>
 <201311231915.29643.arnd@arndb.de>
In-Reply-To: <201311231915.29643.arnd@arndb.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 grygorii.strashko@ti.com, Russell King <linux@arm.linux.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>,
 Rob Landley <rob@landley.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/23/2013 08:15 PM, Arnd Bergmann wrote:
> On Wednesday 20 November 2013, Ivan Khoronzhuk wrote:
>> --- a/drivers/mtd/nand/davinci_nand.c
>> +++ b/drivers/mtd/nand/davinci_nand.c
>> @@ -523,6 +523,7 @@ static struct nand_ecclayout hwecc4_2048 __initconst = {
>>   #if defined(CONFIG_OF)
>>   static const struct of_device_id davinci_nand_of_match[] = {
>>          {.compatible = "ti,davinci-nand", },
>> +       {.compatible = "ti,keystone-nand", },
>>          {},
>>   };
>>   MODULE_DEVICE_TABLE(of, davinci_nand_of_match);
>
> Same comment as for the watchdog driver: when the devices are actually compatible,
> the driver does not need to know the new string, the preferred method is to
> set both strings from the .dts file.
>
> 	Arnd
>

Thanks. I'll correct it.

-- 
Regards,
Ivan Khoronzhuk
