Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N7k5f-00050b-Ft
	for linux-mtd@lists.infradead.org; Tue, 10 Nov 2009 06:20:36 +0000
Message-ID: <4AF905B8.4070704@nokia.com>
Date: Tue, 10 Nov 2009 08:18:32 +0200
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
MIME-Version: 1.0
To: ext Vimal Singh <vimal.newwork@gmail.com>
Subject: Re: [PATCH] MTD OneNAND OMAP2/3: allow giving partition layout as
	module parameter
References: <1251976558-13463-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<ce9ab5790910290625u9baaf14le5ab14fe4d6ba783@mail.gmail.com>
In-Reply-To: <ce9ab5790910290625u9baaf14le5ab14fe4d6ba783@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Vimal Singh wrote:
> On Thu, Sep 3, 2009 at 4:45 PM, Mika Korhonen
> <ext-mika.2.korhonen@nokia.com> wrote:
>   
>> Add module parameter "parts" to omap2-onenand driver. Parameter format is
>> the same as for cmdlinepart except mtd-id must not be specified - it
>> gets prepended by the driver, i.e.: parts=<partdef>[,<partdef>]*
>>
>> This allows one to repartition the OneNAND chip and is useful for flashing
>> applications that do the partitioning from scratch or want to backup and
>> update the partitioning.
>>
>> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
>> ---
>>  drivers/mtd/cmdlinepart.c   |   35 +++++++++++++++++++++++++++++------
>>  drivers/mtd/onenand/omap2.c |   29 +++++++++++++++++++++++++++++
>>  2 files changed, 58 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
>> index 1479da6..77fa7b7 100644
>> --- a/drivers/mtd/cmdlinepart.c
>> +++ b/drivers/mtd/cmdlinepart.c
>> @@ -5,7 +5,7 @@
>>  *
>>  * The format for the command line is as follows:
>>  *
>> - * mtdparts=<mtddef>[;<mtddef]
>> + * mtdparts=<mtddef>[;<mtddef>]
>>  * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
>>  *              where <mtd-id> is the name from the "cat /proc/mtd" command
>>  * <partdef> := <size>[@offset][<name>][ro][lk]
>> @@ -54,7 +54,7 @@ struct cmdline_mtd_partition {
>>  /* mtdpart_setup() parses into here */
>>  static struct cmdline_mtd_partition *partitions;
>>
>> -/* the command line passed to mtdpart_setupd() */
>> +/* the command line passed to mtdpart_setup() */
>>  static char *cmdline;
>>  static int cmdline_parsed = 0;
>>
>> @@ -219,9 +219,8 @@ static int mtdpart_setup_real(char *s)
>>  {
>>        cmdline_parsed = 1;
>>
>> -       for( ; s != NULL; )
>> -       {
>> -               struct cmdline_mtd_partition *this_mtd;
>> +       for ( ; s != NULL; ) {
>> +               struct cmdline_mtd_partition *this_mtd, *mtd, *mtd_prev;
>>                struct mtd_partition *parts;
>>                int mtd_id_len;
>>                int num_parts;
>> @@ -270,6 +269,27 @@ static int mtdpart_setup_real(char *s)
>>                this_mtd->mtd_id = (char*)(this_mtd + 1);
>>                strlcpy(this_mtd->mtd_id, mtd_id, mtd_id_len + 1);
>>
>> +               /* remove existing ones with the same id */
>> +               mtd_prev = NULL;
>> +               for (mtd = partitions; mtd;)    {
>>     
> Space instead of tab.
>
>   
>> +                       if (strcmp(this_mtd->mtd_id, mtd->mtd_id) == 0) {
>>     
> Hmm... I guess you won't get your device id matched here. Since the
> string you are passing from omap onenand driver is something like
> this:
> omap2-onenand:.....
>
> while mtd registers device ids in different format, something like:
> 'omap2-onenand.0'
>
>   
It's been tested, and it matches. In parse_cmdline_partitions() mtd_id 
is set from mtd_info.name of the chip. Could be that cmdlinepart.c is 
outdated, though.

-- 
Mika
