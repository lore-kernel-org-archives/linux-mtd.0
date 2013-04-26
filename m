Received: from eusmtp01.atmel.com ([212.144.249.243])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVgPr-00006X-M6
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2013 11:02:12 +0000
Message-ID: <517A5EA6.3010207@atmel.com>
Date: Fri, 26 Apr 2013 19:01:58 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: PMECC capability
References: <CACQ1gAhY5TbH3JUYMtRk9ETOLn-ZFNbwKQ_5=j_hnPpZ-1fj_w@mail.gmail.com>
In-Reply-To: <CACQ1gAhY5TbH3JUYMtRk9ETOLn-ZFNbwKQ_5=j_hnPpZ-1fj_w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Richard

On 4/26/2013 6:17 PM, Richard Genoud wrote:
> Hi,
>
> I've got a (dumb?) question about the error correct capability of atmel PMECC:
> Do we have to use the exact error capability required by the nand
> chipset or we can use a bigger one ?

I think it is a very good question and I don't have answer yet.
And it bring up another question: Can the nand flash will got much error 
bits than the ONFI minimum require?
Or the filesystem will make sure this situation rarely happen?

>
> use case:
> I'm working on at91sam9g35-cm board which require 1 bit per 512bytes
> correction and also on a at91sam9g35-cm+phy which require 4bits per
> 512bytes correction.
>
> If I use for both a 4b/512B correction, this won't hurt ?
> There won't be any strange side effect ?

I think it will not hurt. And since PMECC is hardware calculation, 
performance should have no big impaction (I am not test that)

>
> Moreover, as I don't use the OOB data, I could set a 8b/512B correction.
> Will it be completely useless ?

I've seen one of mtd/nand driver (I don't remember the exact name), the 
ECC capability is set as the max one base on the OOB valid size (exclude 
the some used by filesystem).

Just in the moment, I think use the max error correct capability base on 
valid OOB is safer for long time using.

Best Regards,
Josh Wu

>
>
> Regards,
>
> Richard.
>
