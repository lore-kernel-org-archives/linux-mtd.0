Received: from yw-out-1718.google.com ([74.125.46.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVCgs-0002hy-0D
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2009 22:27:22 +0000
Received: by yw-out-1718.google.com with SMTP id 5so222052ywm.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Feb 2009 14:27:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20090205140255.b711b929.akpm@linux-foundation.org>
References: <1233822411-10210-1-git-send-email-cooloney@kernel.org>
	<1233822411-10210-3-git-send-email-cooloney@kernel.org>
	<20090205140255.b711b929.akpm@linux-foundation.org>
Date: Thu, 5 Feb 2009 17:27:21 -0500
Message-ID: <8bd0f97a0902051427m2513bd07hddf4611696658b42@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd/maps: blackfin async flash maps: bfin-async mtd
	driver needs complex mappings
From: Mike Frysinger <vapier.adi@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Bryan Wu <cooloney@kernel.org>,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 5, 2009 at 17:02, Andrew Morton wrote:
> On Thu,  5 Feb 2009 16:26:50 +0800 Bryan Wu wrote:
>> From: Mike Frysinger <vapier.adi@gmail.com>
>>
>> Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
>> Signed-off-by: Bryan Wu <cooloney@kernel.org>
>
> This is an underwhelming changelog.
>
>>  drivers/mtd/maps/Kconfig |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
>> index 0225cbb..043d50f 100644
>> --- a/drivers/mtd/maps/Kconfig
>> +++ b/drivers/mtd/maps/Kconfig
>> @@ -491,7 +491,7 @@ config MTD_PCMCIA_ANONYMOUS
>>
>>  config MTD_BFIN_ASYNC
>>       tristate "Blackfin BF533-STAMP Flash Chip Support"
>> -     depends on BFIN533_STAMP && MTD_CFI
>> +     depends on BFIN533_STAMP && MTD_CFI && MTD_COMPLEX_MAPPINGS
>>       select MTD_PARTITIONS
>>       default y
>>       help
>
> I assume this corrects a build error?

yes ... bfin-async uses complex mappings and so needs it
-mike
