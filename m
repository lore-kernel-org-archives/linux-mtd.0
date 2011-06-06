Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTUsi-0005qE-55
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 08:09:52 +0000
Received: by wwb39 with SMTP id 39so2757584wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 01:09:48 -0700 (PDT)
Message-ID: <4DEC8B45.1020900@gmail.com>
Date: Mon, 06 Jun 2011 12:09:41 +0400
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 050/104] physmap_of: separate parse_obsolete_partitions
	to separate parser
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>	
	<1307026293-8535-16-git-send-email-dbaryshkov@gmail.com>
	<1307347330.3135.29.camel@localhost>
In-Reply-To: <1307347330.3135.29.camel@localhost>
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

On 06.06.2011 12:02, Artem Bityutskiy wrote:
> On Thu, 2011-06-02 at 18:51 +0400, Dmitry Eremin-Solenikov wrote:
>> Separate parse_obsolete_partitions() to external ofoldpart partitions parser.
>>
>> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
>> ---
>>   drivers/mtd/Kconfig           |   10 +++++
>>   drivers/mtd/Makefile          |    1 +
>>   drivers/mtd/maps/physmap_of.c |   53 +------------------------
>>   drivers/mtd/ofoldpart.c       |   89 +++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 101 insertions(+), 52 deletions(-)
>>   create mode 100644 drivers/mtd/ofoldpart.c
>>
>> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
>> index 4be8373..2aa8afb 100644
>> --- a/drivers/mtd/Kconfig
>> +++ b/drivers/mtd/Kconfig
>> @@ -144,6 +144,16 @@ config MTD_OF_PARTS
>>   	  the partition map from the children of the flash node,
>>   	  as described in Documentation/powerpc/booting-without-of.txt.
>>
>> +config MTD_OF_OLD_PARTS
>> +	bool "Obsolete OF tree partition info"
>> +	depends on OF
>> +	help
>> +	  This provides a partition parsing function which derives
>> +	  the partition map from the the flash node, being an obsolete
>> +	  way to describe physmap_of partitioning info.
>> +
>> +	  If you aren't sure you need this, you can say N.
>
> I think this tiny piece of code does not deserve to be a separate
> module...

I'd really like to strip it out of physmap_of to simplify things.

It parses the mtd partitions, it's a separate functional part. I can 
argue if it should be a module or just in-kernel part, if it should be 
visible to users (or just autoselected by physmap_of), but I'd 
definitely prefer to have this as a separate source file hooking into
generic mtd_parse subsystem.

-- 
With best wishes
Dmitry
