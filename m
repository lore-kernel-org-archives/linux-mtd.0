Received: from mail-bk0-f45.google.com ([209.85.214.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VXLTv-0006a8-55
 for linux-mtd@lists.infradead.org; Sat, 19 Oct 2013 01:37:31 +0000
Received: by mail-bk0-f45.google.com with SMTP id mx11so15899bkb.32
 for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2013 18:37:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20131018193211.GA30464@localhost>
References: <1382120072-30057-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAN8TOE-hxcaj79hTxDMzP1On69n=3QdBy45fjePLrQuzSvnnyw@mail.gmail.com>
 <20131018193211.GA30464@localhost>
Date: Fri, 18 Oct 2013 18:37:06 -0700
Message-ID: <CAN8TOE8L2jQ3nFxf5hxSw8qnFK3m4NuexbZ=yuwoS=uoFiVAnw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: nand: pxa3xx: Fix registered MTD name
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Daniel Mack <zonque@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 18, 2013 at 12:32 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> On Fri, Oct 18, 2013 at 12:15:39PM -0700, Brian Norris wrote:
>> On Fri, Oct 18, 2013 at 11:14 AM, Ezequiel Garcia
>> <ezequiel.garcia@free-electrons.com> wrote:
[...]
>> >  drivers/mtd/nand/pxa3xx_nand.c | 6 ++++--
>> >  1 file changed, 4 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
>> > index aa75adf..4d53e8e 100644
>> > --- a/drivers/mtd/nand/pxa3xx_nand.c
>> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> > @@ -46,6 +46,8 @@
>> >   */
>> >  #define INIT_BUFFER_SIZE       256
>> >
>> > +#define DRIVER_NAME            "pxa3xx_nand-0"
>> > +
>> >  /* registers and bit definitions */
>> >  #define NDCR           (0x00) /* Control register */
>> >  #define NDTR0CS0       (0x04) /* Timing Parameter 0 for CS0 */
>> > @@ -1339,7 +1341,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
>> >         for (cs = 0; cs < pdata->num_cs; cs++) {
>> >                 struct mtd_info *mtd = info->host[cs]->mtd;
>> >
>> > -               mtd->name = pdev->name;
>> > +               mtd->name = DRIVER_NAME;
>> >                 info->cs = cs;
>> >                 ret = pxa3xx_nand_scan(mtd);
>> >                 if (ret) {
>> > @@ -1425,7 +1427,7 @@ static int pxa3xx_nand_resume(struct platform_device *pdev)
>> >
>> >  static struct platform_driver pxa3xx_nand_driver = {
>> >         .driver = {
>> > -               .name   = "pxa3xx-nand",
>> > +               .name   = DRIVER_NAME,
>> >                 .of_match_table = pxa3xx_nand_dt_ids,
>> >         },
>> >         .probe          = pxa3xx_nand_probe,
>>
>> For mtdparts' sake, do we need both the driver name and the MTD name
>> to be the same? Or could we just stick the  "pxa3xx_nand-0" directly
>> in mtd->name only, where it's needed for compatibility, and allow the
>> driver name to be cleaner? Or is that a silly idea?
>>
>
> Hm... What's the impact of the driver's name?

I meant to ask you the exact same question, because I'm lazy :)

I'm not sure exactly. I thought it affected the device name (which is
important to users; it's exposed in sysfs in potentially important
ways), but that actually comes from the platform-device allocation or
from device tree. The most visible way I know of is that it prefixes
the messages seen via the dev_{printk,err,info,warn,..}() print
functions. This could be annoying, but not horrible.

The driver name does show up in /sys/bus/platform/drivers, but I'm not
sure if that's ever expected to be stable.

> I know it's just a small bloat, but still I don't like to see two stupid
> strings "pxa3xx-nand" and "pxa3xx_nand-0" bloating our kernels, so
> that's why I chose a common macro :-)

That's fine.

> What do you think?

I'm fine with just making both use DRIVER_NAME. So I'd take this patch as-is.

One possible consequence: it makes things a little more fragile if
people want to change one or both in the future, not noticing that
while the driver name may (?) be changed harmlessly, it can cause
mtdparts=... breakage.

Brian
