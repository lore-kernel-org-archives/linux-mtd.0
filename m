Received: from mail-qg0-x22f.google.com ([2607:f8b0:400d:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aguxI-00030J-BA
 for linux-mtd@lists.infradead.org; Fri, 18 Mar 2016 14:00:46 +0000
Received: by mail-qg0-x22f.google.com with SMTP id w104so100311040qge.1
 for <linux-mtd@lists.infradead.org>; Fri, 18 Mar 2016 07:00:23 -0700 (PDT)
Subject: Re: [PATCH 2/3] mtd: mediatek: driver for MTK Smart Device Gen1 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160308172437.6eccce05@bbrezillon> <56E08112.7040201@linaro.org>
 <20160309214348.5aa78af5@bbrezillon>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, matthias.bgg@gmail.com,
 robh@kernel.org, daniel.thompson@linaro.org, xiaolei.li@mediatek.com,
 linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Message-ID: <56EC09F5.5020704@linaro.org>
Date: Fri, 18 Mar 2016 10:00:21 -0400
MIME-Version: 1.0
In-Reply-To: <20160309214348.5aa78af5@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/09/2016 03:43 PM, Boris Brezillon wrote:
> On Wed, 9 Mar 2016 15:01:22 -0500
> Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:
>
>> On 03/08/2016 11:24 AM, Boris Brezillon wrote:
>>>> +	switch (mtd->writesize) {
>>>>> +	case KB(2):
>>>>> +		fmt = PAGEFMT_512_2K;
>>>>> +		chip->ecc.layout = &nand_2k_64;
>>>>> +		break;
>>>>> +	case KB(4):
>>>>> +		fmt = PAGEFMT_2K_4K;
>>>>> +		chip->ecc.layout = &nand_4k_128;
>>>>> +		break;
>>>>> +	case KB(8):
>>>>> +		fmt = PAGEFMT_4K_8K;
>>>>> +		break;
>>>>> +	default:
>>>>> +		dev_err(dev, "invalid page size: %d\n", mtd->writesize);
>>>>> +		return -EINVAL;
>>>>> +	}
>>> ecclayout info should be exposed through mtd_ooblayout_ops now.
>>>
>> do you have an approximate date for when this interface will be merged in
>> git://git.infradead.org/l2-mtd.git?
>>
> Should be ready for 4.7, in the meantime you can base your work on my
> branch [1] (which is based on l2-mtd/master).
>
> [1]https://github.com/bbrezillon/linux-0day/tree/nand/ecclayout


hi Boris, just a quick one, please could you confirm that you would like to see
the RFC v2 patch-set for this driver based on this branch? or should we rebase
on some other tree?
