Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbS9Z-0001WM-Ut
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 09:33:30 +0000
Message-ID: <5270D24B.5020800@ti.com>
Date: Wed, 30 Oct 2013 15:02:59 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [Rebase/PATCHv2] drivers: mtd: m25p80: Add quad read support.
References: <1383124802-25079-1-git-send-email-sourav.poddar@ti.com>
 <5270D16C.6030802@freescale.com>
In-Reply-To: <5270D16C.6030802@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: marex@denx.de, computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 balbi@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,
On Wednesday 30 October 2013 02:59 PM, Huang Shijie wrote:
> 于 2013年10月30日 17:20, Sourav Poddar 写道:
>> @@ -1077,6 +1221,12 @@ static int m25p_probe(struct spi_device *spi)
>>           flash->addr_width = 4;
>>           if (JEDEC_MFR(info->jedec_id) == CFI_MFR_AMD) {
>>               /* Dedicated 4-byte command set */
>> +            if (flash->quad_read)
>> +                flash->read_opcode = OPCODE_QUAD_READ_4B;
>> +            else
>> +                flash->read_opcode = flash->fast_read ?
>> +                    OPCODE_FAST_READ_4B :
>> +                    OPCODE_NORM_READ_4B;
>>               flash->read_opcode = flash->fast_read ?
>>                   OPCODE_FAST_READ_4B :
>>                   OPCODE_NORM_READ_4B;
> you missed to remove these three lines above?
My bad. its removed in my internal testing branch. While rebasing,
I made some error. I will update the patch and send v3.

Thanks Huang for your review. if you have any other comments, it will be 
great to
know, so that I can consolidate all in v3 and send.

Thanks!
>
> thanks
> Huang Shijie
>
