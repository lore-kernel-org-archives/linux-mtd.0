Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLE3c-0004LM-UU
 for linux-mtd@lists.infradead.org; Thu, 07 Jul 2016 18:29:54 +0000
Subject: Re: [PATCH 2/5] mtd: nand: Propagate mtd_device_unregister() return
 value in tear down
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1467669983-12105-1-git-send-email-richard@nod.at>
 <1467669983-12105-3-git-send-email-richard@nod.at>
 <20160706153406.64822eb4@bbrezillon>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <577E9F84.3000108@nod.at>
Date: Thu, 7 Jul 2016 20:29:24 +0200
MIME-Version: 1.0
In-Reply-To: <20160706153406.64822eb4@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

Am 06.07.2016 um 15:34 schrieb Boris Brezillon:
>>  /**
>> - * nand_release - [NAND Interface] Free resources held by the NAND device
>> + * __nand_release - [NAND Interface] Free resources held by the NAND device
>>   * @mtd: MTD device structure
>>   */
>> -void nand_release(struct mtd_info *mtd)
>> +int __nand_release(struct mtd_info *mtd)
> 
> Can we find a better name? nand_release_safe()?

Sure. Let's pick nand_release_safe().

>>  {
>> +	int ret;
>>  	struct nand_chip *chip = mtd_to_nand(mtd);
>>  
>> +	ret = mtd_device_unregister(mtd);
>> +	if (ret)
>> +		return ret;
>> +
> 
> The question is, should we unregister the MTD device in nand_release().
> It feels a bit odd to have nand_scan_xxx() functions only doing the
> nand_chip initialization and letting the NAND controller driver
> register the MTD device, and have nand_release() unregister the MTD
> device for us.
> 
> Maybe we should export a nand_cleanup() function that would just
> release nand_chip resources and let NAND controller drivers that
> really care about mtd_device_unregister() return code call it
> themselves before calling nand_cleanup() (instead of calling
> nand_release()).

You mean renaming nand_release() to nand_cleanup() and the driver
has to issue mtd_device_unregister() itself before it is allowed to
do nand_cleanup(). Yes, that is also an option.
The only downside is that we have to touch a lot of drivers then.
But the conversion should be almost trivial.

Thanks,
//richard
