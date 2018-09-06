Received: from scopuli.esotechnik.de ([2a02:c205:3001:6788::1]
 helo=mail.esotechnik.net)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy3AP-0003eY-Pb
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 22:54:52 +0000
Subject: Re: [PATCH 3/3] mtd: mtdconcat: add dt driver for concat devices
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
References: <20180906161413.6335-1-kernel@nospam.obeliks.de>
 <20180906161413.6335-4-kernel@nospam.obeliks.de>
 <20180906204717.7cc4a6a3@xps13>
From: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Message-ID: <345a1f1e-23e8-d7b5-02f5-5b2ae0ec7209@nospam.obeliks.de>
Date: Fri, 7 Sep 2018 00:54:01 +0200
MIME-Version: 1.0
In-Reply-To: <20180906204717.7cc4a6a3@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

thanks for your review, I've applied most of your suggested changes, 
except:

On 06/09/18 20:47, Miquel Raynal wrote:
>
>> +static int virt_concat_remove(struct platform_device *pdev)
>> +{
>> +	struct of_virt_concat *info;
>> +	int i;
>> +
>> +	info = platform_get_drvdata(pdev);
>> +	if (!info)
>> +		return 0;
>> +	platform_set_drvdata(pdev, NULL);
> Is this really useful?
I believe this is indeed useful, as `virt_concat_remove()` is also 
called as cleanup in error cases of `virt_concat_probe()`. Then it seems 
to be common practice to unset the driver data from the device.

Am I mistaken here?

Best regards
Bernhard
