Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbkOG-0006s3-Pf
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2013 05:01:53 +0000
Message-ID: <5271E423.9030506@ti.com>
Date: Thu, 31 Oct 2013 10:31:23 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [Rebase/PATCHv2] drivers: mtd: m25p80: Add quad read support.
References: <1383124802-25079-1-git-send-email-sourav.poddar@ti.com>
 <20131030231930.GD20059@norris.computersforpeace.net>
In-Reply-To: <20131030231930.GD20059@norris.computersforpeace.net>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: marex@denx.de, linux-mtd@lists.infradead.org, balbi@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 31 October 2013 04:49 AM, Brian Norris wrote:
> On Wed, Oct 30, 2013 at 02:50:02PM +0530, Sourav Poddar wrote:
>> Some flash also support quad read mode.
>> Adding support for adding quad mode in m25p80
>> for spansion and macronix flash.
>>
>> Signed-off-by: Sourav Poddar<sourav.poddar@ti.com>
>> ---
>> Rebase this on latest l2mtd.
>> v1->v2:
>> Small dev_err message fix to make it
>> mode appropriate.
>> v1: http://patchwork.ozlabs.org/patch/286109/
>>
>> There is one cleanup suggestion from Marek Vasut on read_sr
>> value. I will take that up as a seperate patch, once this
>> patch gets done.
>>
>>
>>   drivers/mtd/devices/m25p80.c |  160 ++++++++++++++++++++++++++++++++++++++++--
>>   1 files changed, 155 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 5897889..ba4dd8b 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
> [...]
>
>> @@ -76,6 +79,10 @@
>>   #define	SR_BP2			0x10	/* Block protect 2 */
>>   #define	SR_SRWD			0x80	/* SR write protect */
>>
>> +/* Configuration Register bits. */
>> +#define CR_QUAD_EN_SPAN		0x2     /* Spansion Quad I/O */
>> +#define SR_QUAD_EN_MX		0x40    /* Macronix Quad I/O */
> Two little bits of style here:
>   - The other bitfields have a tab after #define (although this comes out
>     to 1 character-width of whitespace, so it looks like a space)
>   - We already have a listing for several Status Register (SR_*)
>     bitfields; I think it makes some sense to group the SR_QUAD_EN_MX
>     with the other SR_* bits and keep the CR_* macro separate. That could
>     help with keeping the difference between CR and SR clearer.
>
Ok. Will change.
>> +
>>   /* Define max times to check status register before we give up. */
>>   #define	MAX_READY_WAIT_JIFFIES	(40 * HZ)	/* M25P16 specs 40s max chip erase */
>>   #define	MAX_CMD_SIZE		6
>> @@ -95,6 +102,7 @@ struct m25p {
>>   	u8			program_opcode;
>>   	u8			*command;
>>   	bool			fast_read;
>> +	bool                    quad_read;
> Did you have a response to my earlier suggestion that the fast_read and
> quad_read fields be combined to a single field? This could easily be an
> enum, and I think it could help some of the other code. It also wouldn't
> require us to remember that quad_read takes precedence over fast_read
> (which you do implicitly in this patch). And we can already foresee
> additional switches needed if we add the DDR command types (Huang was
> looking at this?), so we should just get it right now.
>
> You could, perhaps, make this two patches: one for converting the bool
> to an enum, and the other for supporting quad-read.
>
I read that, and I was planning to take that as a seperate excercise, 
but yes I
will cook this into two independent patches.
> Or if you're having trouble, I could cook the first patch up.
>
>>   };
>>
>>   static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
> [...]
>
>> @@ -1077,6 +1221,12 @@ static int m25p_probe(struct spi_device *spi)
>>   		flash->addr_width = 4;
>>   		if (JEDEC_MFR(info->jedec_id) == CFI_MFR_AMD) {
>>   			/* Dedicated 4-byte command set */
>> +			if (flash->quad_read)
>> +				flash->read_opcode = OPCODE_QUAD_READ_4B;
>> +			else
>> +				flash->read_opcode = flash->fast_read ?
>> +					OPCODE_FAST_READ_4B :
>> +					OPCODE_NORM_READ_4B;
> Besides the repetition below (already mentioned by Huang), the above
> assignment is kind of ugly again, mixing ?: and if/else. If we're
> keeping the fast_read/quad_read bools, it should be:
>
> 	if (flash->quad_read)
> 		flash->read_opcode = OPCODE_QUAD_READ_4B;
> 	else if (flash->fast_read)
> 		flash->read_opcode = OPCODE_FAST_READ_4B;
> 	else
> 		flash->read_opcode = OPCODE_NORM_READ_4B;
>
> (or if we use an enum, it's just a switch statement...)
>
Ok.
>>   			flash->read_opcode = flash->fast_read ?
>>   				OPCODE_FAST_READ_4B :
>>   				OPCODE_NORM_READ_4B;
> Brian
