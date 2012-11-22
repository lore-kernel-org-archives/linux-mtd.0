Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbaS1-0007pw-LW
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 17:20:34 +0000
Message-ID: <50AE5EDF.8050105@parrot.com>
Date: Thu, 22 Nov 2012 18:20:31 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd nand : print flash size during detection
References: <1352199836-4516-1-git-send-email-matthieu.castet@parrot.com>
 <1353054248.3618.3.camel@sauron.fi.intel.com>
In-Reply-To: <1353054248.3618.3.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> On Tue, 2012-11-06 at 12:03 +0100, Matthieu CASTET wrote:
>> This help to detect bad flash identification in case the size is not present
>> on the name (ONFI).
>>
>> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
>> ---
>>  drivers/mtd/nand/nand_base.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index c90ef66..8916bc6 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -3292,10 +3292,10 @@ ident_done:
>>  		chip->cmdfunc = nand_command_lp;
>>  
>>  	pr_info("NAND device: Manufacturer ID: 0x%02x, Chip ID: 0x%02x (%s %s),"
>> -		" page size: %d, OOB size: %d\n",
>> +		" %dMiB page size: %d, OOB size: %d\n",
> 
> Is this readable? No comma after the size. I guess it is better to add
> "size %dMiB," instead?
> 
ok
