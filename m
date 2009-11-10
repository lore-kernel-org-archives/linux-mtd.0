Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N7n3S-0006kL-D8
	for linux-mtd@lists.infradead.org; Tue, 10 Nov 2009 09:30:31 +0000
Message-ID: <4AF93236.5090905@nokia.com>
Date: Tue, 10 Nov 2009 11:28:22 +0200
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
MIME-Version: 1.0
To: ext Vimal Singh <vimal.newwork@gmail.com>
Subject: Re: [PATCH] MTD OneNAND OMAP2/3: allow giving partition layout as
	module parameter
References: <1251976558-13463-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<ce9ab5790910290625u9baaf14le5ab14fe4d6ba783@mail.gmail.com>
	<4AF905B8.4070704@nokia.com>
	<ce9ab5790911100102q64c5cb6an371ff7f1b7699a4f@mail.gmail.com>
In-Reply-To: <ce9ab5790911100102q64c5cb6an371ff7f1b7699a4f@mail.gmail.com>
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
> On Tue, Nov 10, 2009 at 11:48 AM, Mika Korhonen
> <ext-mika.2.korhonen@nokia.com> wrote:
>   
>> ext Vimal Singh wrote:
>>     
>>> On Thu, Sep 3, 2009 at 4:45 PM, Mika Korhonen
>>> <ext-mika.2.korhonen@nokia.com> wrote:
>>>
>>>       
>>>> Add module parameter "parts" to omap2-onenand driver. Parameter format is
>>>> the same as for cmdlinepart except mtd-id must not be specified - it
>>>> gets prepended by the driver, i.e.: parts=<partdef>[,<partdef>]*
>>>>
>>>> This allows one to repartition the OneNAND chip and is useful for
>>>> flashing
>>>> applications that do the partitioning from scratch or want to backup and
>>>> update the partitioning.
>>>>
>>>> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
>>>> ---
>>>>  drivers/mtd/cmdlinepart.c   |   35 +++++++++++++++++++++++++++++------
>>>>  drivers/mtd/onenand/omap2.c |   29 +++++++++++++++++++++++++++++
>>>>  2 files changed, 58 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
>>>> index 1479da6..77fa7b7 100644
>>>> --- a/drivers/mtd/cmdlinepart.c
>>>> +++ b/drivers/mtd/cmdlinepart.c
>>>> @@ -5,7 +5,7 @@
>>>>  *
>>>>  * The format for the command line is as follows:
>>>>  *
>>>> - * mtdparts=<mtddef>[;<mtddef]
>>>> + * mtdparts=<mtddef>[;<mtddef>]
>>>>  * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
>>>>  *              where <mtd-id> is the name from the "cat /proc/mtd"
>>>> command
>>>>  * <partdef> := <size>[@offset][<name>][ro][lk]
>>>> @@ -54,7 +54,7 @@ struct cmdline_mtd_partition {
>>>>  /* mtdpart_setup() parses into here */
>>>>  static struct cmdline_mtd_partition *partitions;
>>>>
>>>> -/* the command line passed to mtdpart_setupd() */
>>>> +/* the command line passed to mtdpart_setup() */
>>>>  static char *cmdline;
>>>>  static int cmdline_parsed = 0;
>>>>
>>>> @@ -219,9 +219,8 @@ static int mtdpart_setup_real(char *s)
>>>>  {
>>>>       cmdline_parsed = 1;
>>>>
>>>> -       for( ; s != NULL; )
>>>> -       {
>>>> -               struct cmdline_mtd_partition *this_mtd;
>>>> +       for ( ; s != NULL; ) {
>>>> +               struct cmdline_mtd_partition *this_mtd, *mtd, *mtd_prev;
>>>>               struct mtd_partition *parts;
>>>>               int mtd_id_len;
>>>>               int num_parts;
>>>> @@ -270,6 +269,27 @@ static int mtdpart_setup_real(char *s)
>>>>               this_mtd->mtd_id = (char*)(this_mtd + 1);
>>>>               strlcpy(this_mtd->mtd_id, mtd_id, mtd_id_len + 1);
>>>>
>>>> +               /* remove existing ones with the same id */
>>>> +               mtd_prev = NULL;
>>>> +               for (mtd = partitions; mtd;)    {
>>>>
>>>>         
>>> Space instead of tab.
>>>
>>>
>>>       
>>>> +                       if (strcmp(this_mtd->mtd_id, mtd->mtd_id) == 0) {
>>>>
>>>>         
>>> Hmm... I guess you won't get your device id matched here. Since the
>>> string you are passing from omap onenand driver is something like
>>> this:
>>> omap2-onenand:.....
>>>
>>> while mtd registers device ids in different format, something like:
>>> 'omap2-onenand.0'
>>>
>>>
>>>       
>> It's been tested, and it matches. In parse_cmdline_partitions() mtd_id is
>> set from mtd_info.name of the chip. Could be that cmdlinepart.c is outdated,
>> though.
>>     
>
> I am still not convinced. I use to get below prints when I boot up
> (this is for NAND and should be same for OneNAND too):
> ...
> omap2-nand driver initializing
> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xbc (Micron NAND 512MiB
> 1,8V 16-bit)
> Creating 7 MTD partitions on "omap2-nand.0":
> ...
> This print comes from 'add_mtd_partitions' (drivers/mtd/mtdpart.c):
> printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts,
> master->name);
>
> And I use to give cmdline like this:
> "mtdparts=omap2-nand.0:512k@0(p1),1280k@512k(p2),768k@1792k(p3),5m@2560k(p4),123392k@7680k(p5)"
>
> and this works for me.
>
>   
It does not seem to be the same for OneNAND:

Creating 5 MTD partitions on 
"omap2-onenand":                                  
0x00000000-0x00020000 : "p1"                                           
0x00020000-0x00080000 : "p2"                                               
...

Another question is, if it should be.

br,
Mika
