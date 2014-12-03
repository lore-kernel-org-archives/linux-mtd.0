Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwGPM-0006w2-1k
 for linux-mtd@lists.infradead.org; Wed, 03 Dec 2014 20:20:21 +0000
Message-ID: <547F6FFE.6070000@imgtec.com>
Date: Wed, 3 Dec 2014 17:18:06 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: =?gbk?Q?=22Qi_Wang_=CD=F5=C6=F0_=28qiwang=29=22?= <qiwang@micron.com>,
 Brian Norris <computersforpeace@gmail.com>, "abrestic@chromium.org"
 <abrestic@chromium.org>, "ionela.voinescu@imgtec.com"
 <ionela.voinescu@imgtec.com>, James Hartley <james.hartley@imgtec.com>,
 "arnaud.mouiche@invoxia.com" <arnaud.mouiche@invoxia.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 6/6] mtd: spi-nand: Support common SPI NAND devices
References: <71CF8D7F32C5C24C9CD1D0E02D52498A77136EBD@NTXXIAMBX02.xacn.micron.com>
 <547EF06A.4020706@imgtec.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A77136F67@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A77136F67@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
Cc: =?gbk?Q?=22Frank_Liu_=C1=F5=C8=BA_=28frankliu=29=22?=
 <frankliu@micron.com>,
 =?gbk?Q?=22Peter_Pan_=C5=CB=B6=B0_=28peterp?= =?gbk?Q?andong=29=22?=
 <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 12/03/2014 09:08 AM, Qi Wang ÍõÆð (qiwang) wrote:
[..]
>>> For example, Jffs2 program clean marker data to oob first when format
>>> operation, then will program main data into NAND flash main area when
>> normal write operation.
>>> That mean JFFS2 can only store clean marker into unprotect area of oob.
>>
>> Yeah, but are these devices capable of writing to the OOB region only
>> (without messing with the data) ?
> 
> Yes, SPI NAND have this capability. SPI NAND also have definition for NOP,
> just similar with Parallel NAND, fill 0xFF to the area that don't want to 
> write anything is ok.
> 

Which SPI NAND command allows to do this?

AFAICS, you need to issue the following sequence to be able to write to
only the main area, or only the OOB area:

1. Read page to cache
2. Write to cache
3. Write page from cache

So it doesn't seem to support it natively, but through a workaround.
Doesn't this hurt JFFS2 performance a lot?

[..]
>>
>> Do you have any reason for *not* using a UBI-based FS?
> 
> I agree with you, I just considered some legacy users customer still using JFFS2.
> 

Hm.. right. It's important to support legacy users, but I'd say it's not
our primary goal.

-- 
Ezequiel
