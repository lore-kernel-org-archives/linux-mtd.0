Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPeKS-0007ly-Pj
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 23:53:50 +0000
Received: by mail-wm0-x241.google.com with SMTP id m203so8318798wma.3
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jan 2017 15:53:27 -0800 (PST)
Subject: Re: [PATCH v4 07/15] mtd: nand: move Samsung specific init/detection
 logic in nand_samsung.c
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
 <1483448495-31607-8-git-send-email-boris.brezillon@free-electrons.com>
 <09da7377-1323-0794-fe61-34fd06e35404@gmail.com>
 <20170104180813.700823eb@bbrezillon>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Icenowy Zheng
 <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4982cf88-ff7e-20c9-a158-e1e3826c0762@gmail.com>
Date: Sat, 7 Jan 2017 00:53:24 +0100
MIME-Version: 1.0
In-Reply-To: <20170104180813.700823eb@bbrezillon>
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

On 01/04/2017 06:08 PM, Boris Brezillon wrote:
> On Wed, 4 Jan 2017 16:14:07 +0100
> Marek Vasut <marek.vasut@gmail.com> wrote:
> 
>> On 01/03/2017 02:01 PM, Boris Brezillon wrote:
>>> Move Samsung specific initialization and detection logic into
>>> nand_samsung.c. This is part of the "separate vendor specific code from
>>> core" cleanup process.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>  
>>
>> [...]
>>
>>> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
>>> index b3a332f37e14..05e9366696c9 100644
>>> --- a/drivers/mtd/nand/nand_ids.c
>>> +++ b/drivers/mtd/nand/nand_ids.c
>>> @@ -10,7 +10,7 @@
>>>  #include <linux/mtd/nand.h>
>>>  #include <linux/sizes.h>
>>>  
>>> -#define LP_OPTIONS NAND_SAMSUNG_LP_OPTIONS
>>> +#define LP_OPTIONS 0
>>>  #define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
>>>  
>>>  #define SP_OPTIONS NAND_NEED_READRDY
>>> @@ -169,10 +169,12 @@ struct nand_flash_dev nand_flash_ids[] = {
>>>  };
>>>  
>>>  /* Manufacturer IDs */
>>> +extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;  
>>
>> Is the extern needed ?
> 
> Yes, unless you have another solution. If you remove the extern keyword
> you just redeclare samsung_nand_manuf_ops here, which is not what we
> want.

Maybe some accessor function can help ?

-- 
Best regards,
Marek Vasut
