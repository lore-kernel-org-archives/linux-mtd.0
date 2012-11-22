Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbaEH-00074Q-72
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 17:06:23 +0000
Message-ID: <50AE5B85.9010108@parrot.com>
Date: Thu, 22 Nov 2012 18:06:13 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH] nand_wait_ready timeout fix
References: <1352123511-31538-1-git-send-email-matthieu.castet@parrot.com>
 <1352987717.2221.54.camel@sauron.fi.intel.com>
In-Reply-To: <1352987717.2221.54.camel@sauron.fi.intel.com>
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
> On Mon, 2012-11-05 at 14:51 +0100, Matthieu CASTET wrote:
>> nand_wait_ready timeout should not assume HZ=1000.
>> Make it independent of HZ value like it is done in nand_wait.
>>
>> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
>> ---
>>  drivers/mtd/nand/nand_base.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index d5ece6e..ee49fe2 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -492,7 +492,7 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
>>  void nand_wait_ready(struct mtd_info *mtd)
>>  {
>>  	struct nand_chip *chip = mtd->priv;
>> -	unsigned long timeo = jiffies + 2;
>> +	unsigned long timeo = jiffies + (2 * HZ) / 1000;
> 
> I HZ=100, (2 * HZ) / 1000 will be 0, which is probably wrong.
> 
> Instead, this cruft should be re-worked and should use milliseconds for
> time-outs, and use things like 'msecs_to_jiffies()' instead.
> 
> 

Ok,

Should I also update nand_wait [1] ?


Matthieu

[1]
static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
{

    unsigned long timeo = jiffies;
    int status, state = chip->state;

    if (state == FL_ERASING)
        timeo += (HZ * 400) / 1000;
    else
        timeo += (HZ * 20) / 1000;
