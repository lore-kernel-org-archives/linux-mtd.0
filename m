Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTUxm-00065D-9e
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 08:15:08 +0000
Received: by wyb28 with SMTP id 28so3642592wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 01:15:04 -0700 (PDT)
Message-ID: <4DEC8C85.6090904@gmail.com>
Date: Mon, 06 Jun 2011 12:15:01 +0400
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 041/104] mtd: prepare to convert of_mtd_parse_partitions
	to partition parser
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>	
	<1307026293-8535-7-git-send-email-dbaryshkov@gmail.com>
	<1307347054.3135.28.camel@localhost>
In-Reply-To: <1307347054.3135.28.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06.06.2011 11:57, Artem Bityutskiy wrote:
> On Thu, 2011-06-02 at 18:51 +0400, Dmitry Eremin-Solenikov wrote:
>> Prepare to convert of_mtd_parse_partitions() to usual partitions parser:
>> 1) Register ofpart parser
>> 2) Internally don't use passed device for error printing
>> 3) Add device_node to mtd_info struct
>> 4) Move of_mtd_parse_partitions from __devinit to common text section
>> 5) add ofpart to the default list of partition parsers
>>
>> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
>
> Good idea, but
>
>>   #include<linux/mtd/mtd.h>
>>   #include<linux/mtd/partitions.h>
>> @@ -446,6 +447,10 @@ int mtd_device_register(struct mtd_info *master,
>>   			const struct mtd_partition *parts,
>>   			int nr_parts)
>>   {
>> +#ifdef CONFIG_OF
>> +	if (master->node)
>> +		of_node_get(master->node);
>> +#endif
>
> Could all the OF-specific things be done in the ofpart.c ?

Answering both of your questions here:
My idea is to have an of node connected to mtd device, if there is any.
It can be used by ofpart.c, ofoldpart.c (extract from physmap_of),
maybe some other parsers/drivers/etc.

The field is populated by the creator of mtd_info. Then the function
dedicated to registration of the mtd should get the node and other 
functions can just use it. Maybe this should be moved to add_mtd_device,
but this shouldn't be handled in ofpart.c

Another way can be to populate ->node pointer before parsing,
then drop it at the end of parsing/registration. Thus we won't have to
handle getting/putting the of node, but it won't be available during
mtd lifecycle.

>> --- a/include/linux/mtd/mtd.h
>> +++ b/include/linux/mtd/mtd.h
>> @@ -171,6 +171,9 @@ struct mtd_info {
>>   	// Kernel-only stuff starts here.
>>   	const char *name;
>>   	int index;
>> +#ifdef CONFIG_OF
>> +	struct device_node *node;
>> +#endif
>
> And designe-wise this does not look like a good idea to have such fields
> in mtd_info ... Who initializes this "node" field?
>


-- 
With best wishes
Dmitry
