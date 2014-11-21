Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XrkSn-0003Ow-1m
 for linux-mtd@lists.infradead.org; Fri, 21 Nov 2014 09:25:17 +0000
Received: by mail-wi0-f181.google.com with SMTP id r20so8123809wiv.8
 for <linux-mtd@lists.infradead.org>; Fri, 21 Nov 2014 01:24:49 -0800 (PST)
Received: from [172.16.46.1] ([94.228.188.198])
 by mx.google.com with ESMTPSA id wl1sm7257330wjb.4.2014.11.21.01.24.48
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Nov 2014 01:24:48 -0800 (PST)
Message-ID: <546F04DF.4010501@gmail.com>
Date: Fri, 21 Nov 2014 10:24:47 +0100
From: "arnaud.mouiche@gmail.com" <arnaud.mouiche@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/2] staging: mtd: Support for GigaDevice SPI NAND flash
References: <mailman.22397.1416508326.22890.linux-mtd@lists.infradead.org>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7713225E@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A7713225E@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Le 21/11/2014 02:16, Qi Wang 王起 (qiwang) a écrit :
>> On 11/20/2014 10:18 AM, Ezequiel Garcia wrote:
>> Hm, perhaps it's better to rely in the NAND core code and avoid that BBT
>> and ECC code handling duplication?
If it means using the framework from drivers/mtd/nand directory, no, 
definitely not.
This framework rely on common things that every raw nand devices are 
sharing, and on nand controllers from the SOC side.
That was my first attempt when looking for a spinand driver, but I 
quickly switch to
>>
>> Ionela and I are preparing an SPI NAND framework, but it's far from
>> ready yet, so if you have something to submit, please do so :)
> Yes, duplicate BBT and ECC code from nand code do is not a good idea.
> But SPI NAND framework should be a standalone module in MTD, might cause
> chaos if it still rely on NAND core code, that is my only concern.
> How do you think?
The ideal way to do should be to factorize the BBT for nand / onenand / 
spinand, or to provide helpers than are common.

Concerning ECC, we can even decide to drop software ECC for spinand. 
Current spinand device embed the required ecc hardware, correctly 
designed for the target nand (required ecc strength).
(may be I'm wrong on this point)

Arnaud

>
> Thanks
>
> Qi Wang
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
