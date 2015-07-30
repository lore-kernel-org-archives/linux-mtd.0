Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKmlj-0004Al-K5
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 12:17:04 +0000
Subject: Re: [linux-sunxi] Re: [PATCH 3/4] mtd: nand: nand_get_flash_type:
 Print detected ECC strength and size
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
 <1438192434-18363-3-git-send-email-hdegoede@redhat.com>
 <20150730092333.59705873@bbrezillon>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-sunxi@googlegroups.com
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <55BA15A8.1040309@redhat.com>
Date: Thu, 30 Jul 2015 14:16:40 +0200
MIME-Version: 1.0
In-Reply-To: <20150730092333.59705873@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 30-07-15 09:23, Boris Brezillon wrote:
> Hi Hans,
>
> On Wed, 29 Jul 2015 19:53:53 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
>
>> Print the detected ECC strength and size from nand_get_flash_type().
>
> Indeed, that's an interesting information.
>
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/mtd/nand/nand_base.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index f3fefbf..e2e2690 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -4433,9 +4433,10 @@ ident_done:
>>   		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
>>   				type->name);
>>
>> -	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\n",
>> +	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d, ECC strength %d size %d\n",
>
> How about the follwing formalism ?
>
> 	pr_info("%d MiB, type: %s, erase size: %d KiB, page size: %d, OOB size: %d, ECC: %dbits/%dbytes\n",
>
> or just
>
> 	pr_info("%d MiB, type: %s, erase size: %d KiB, page size: %d, OOB size: %d, ECC: %d/%d\n",

Both works for me too, Brian can you let us know which version you
prefer and/or just adjust this when you merge it ?

Regards,

Hans
