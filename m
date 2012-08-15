Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1ZL8-00014Q-Cs
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 08:52:35 +0000
Message-ID: <502B63AD.4000604@freescale.com>
Date: Wed, 15 Aug 2012 16:54:05 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH] mtd: kill MTD_NAND_VERIFY_WRITE
References: <1344998325-3279-1-git-send-email-shijie8@gmail.com>
 <20120815100655.479e2c39@pixies.home.jungo.com>
In-Reply-To: <20120815100655.479e2c39@pixies.home.jungo.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com,
 Huang Shijie <shijie8@gmail.com>, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B408=E6=9C=8815=E6=97=A5 15:06, Shmulik Ladkani =E5=86=
=99=E9=81=93:
> Hi Huang,
>
> On Tue, 14 Aug 2012 22:38:45 -0400 Huang Shijie<shijie8@gmail.com>  wro=
te:
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index 588e989..0ca7257 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -22,15 +22,6 @@ menuconfig MTD_NAND
>>
>>   if MTD_NAND
>>
>> -config MTD_NAND_VERIFY_WRITE
>> -	bool "Verify NAND page writes"
>> -	help
>> -	  This adds an extra check when data is written to the flash. The
>> -	  NAND flash device internally checks only bits transitioning
>> -	  from 1 to 0. There is a rare possibility that even though the
>> -	  device thinks the write was successful, a bit could have been
>> -	  flipped accidentally due to device wear or something else.
>> -
> There are some defconfig files which set CONFIG_MTD_NAND_VERIFY_WRITE.
>
> I guess you should submit an accompanying patch that removes
> CONFIG_MTD_NAND_VERIFY_WRITE from all defconfig files.
>
thanks a lot.

I will send out a separate patch to fix it.

Huang Shijie
> (also, trimmed the CC list for this specific discussion, seems unrelate=
d
> to all of the parties)
>
> Regards,
> Shmulik
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
