Message-ID: <51B93EBF.5050207@atmel.com>
Date: Thu, 13 Jun 2013 11:38:39 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 6/6] mtd: ofpart: add compatible check for child nodes
References: <1370860014-1770-1-git-send-email-josh.wu@atmel.com>
 <1370860014-1770-7-git-send-email-josh.wu@atmel.com>
 <CAN8TOE-JuVAAKBR84cbs9Hge+bQ6hQpFyoSDywKvCMe7h+Lc4g@mail.gmail.com>
In-Reply-To: <CAN8TOE-JuVAAKBR84cbs9Hge+bQ6hQpFyoSDywKvCMe7h+Lc4g@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Brian

On 6/12/2013 7:34 AM, Brian Norris wrote:
> Hi Josh,
>
> On Mon, Jun 10, 2013 at 3:26 AM, Josh Wu <josh.wu@atmel.com> wrote:
>> If the child node has compatible property then it is a driver not partition.
>>
>> Signed-off-by: Josh Wu <josh.wu@atmel.com>
>> ---
>>   drivers/mtd/ofpart.c |   14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
>> index 553d6d6..61ce1f8 100644
>> --- a/drivers/mtd/ofpart.c
>> +++ b/drivers/mtd/ofpart.c
>> @@ -20,6 +20,10 @@
>>   #include <linux/slab.h>
>>   #include <linux/mtd/partitions.h>
>>
>> +static bool node_has_compatible(struct device_node *pp, int *len)
>> +{
>> +       return of_get_property(pp, "compatible", len);
>> +}
> The way the interface is named, it seems like a user only would ever
> need the bool return value, not the implicit 'len' return value. So I
> would write it like this:
>
> static bool node_has_compatible(struct device_node *pp)
> {
>         return of_get_property(pp, "compatible", NULL);
> }

yes, this is exactly is what I want. I didn't check the *len can be NULL 
or not. thanks.

>
>>   static int parse_ofpart_partitions(struct mtd_info *master,
>>                                     struct mtd_partition **pparts,
>>                                     struct mtd_part_parser_data *data)
>> @@ -40,8 +44,13 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>>          /* First count the subnodes */
>>          pp = NULL;
>>          nr_parts = 0;
>> -       while ((pp = of_get_next_child(node, pp)))
>> +       while ((pp = of_get_next_child(node, pp))) {
>> +               int len;
>> +               if (node_has_compatible(pp, &len))
> Then this would just be:
>
> if (node_has_compatible(pp))
> ...
> etc. (rest snipped)
>
> On a more important question, why does a NAND device node have
> sub-nodes that are not partitions? And if such devices exist, wouldn't
> it be more foolproof to establish a "compatible" property for ofpart
> partitions?

In my case, we have a Atmel NAND flash driver/device which is work for 
all series of SAM9/SAMA5D3 chip.
And since in the new chip SAMA5D3 which has a NAND Flash Controller support.

So to enable NAND flash controller, I should either write a compatible 
driver like atmel,sama5-nand, which is
just old device property plus NFC regs and NFC properties, that became 
too big. Or add a NFC sub-node for the NFC support.

IMHO, to make the NFC device as a sub-node is the simplest way to make 
nand driver is back-compatible and easy to enable/disable NFC feature.
Since all NFC related property are grouped it is more readable.

But to implement this, I need to add this patch, otherwise this NFC sub 
node will be recognized as a partition.

> Of course, we'd still have to retain
> backward-compatibility and allow partitions without a "compatible"
> prop. But this question probably should be addressed in the commit log
> and documented in Documentation/devicetree/bindings/mtd/partition.txt
> ; either specifying that all sub-nodes without a compatible property
> must be partitions, or else some other explanation.

yes, sure. I will add an explanation in commit log and 
Documentation/devicetree/bindings/mtd/partition.txt in next version.

>
> Brian

Best Regards,
Josh Wu
