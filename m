Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbZvJ-0002pF-Uv
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 15:09:58 +0000
Message-ID: <4E09EEA9.2040307@parrot.com>
Date: Tue, 28 Jun 2011 17:09:29 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH 1/6] nand_wait_ready timeout fix
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
	<1309247324.23597.37.camel@sauron>
In-Reply-To: <1309247324.23597.37.camel@sauron>
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
> On Sun, 2011-06-26 at 18:26 +0200, Matthieu CASTET wrote:
>> nand_wait_ready timeout should not assume HZ=1000.
>> Make it independent of HZ value.
>>
>> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
>> ---
>>  drivers/mtd/nand/nand_base.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index a46e9bb..a3c7fd3 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -512,7 +512,7 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
>>  void nand_wait_ready(struct mtd_info *mtd)
>>  {
>>  	struct nand_chip *chip = mtd->priv;
>> -	unsigned long timeo = jiffies + 2;
>> +	unsigned long timeo = jiffies + (2 * HZ) / 1000;
> 
> I agree that the code is buggy, but your fix is strange: if HZ = 100, (2
> * HZ) / 1000 will be zero?
> 
> I think you should instead know for how many msecs you want to wait, and
> use msecs_to_jiffies().
> 
Your right, I assume the code was written for HZ=100, and the code should wait
for 20 ms :
unsigned long timeo = jiffies + (20 * HZ) / 1000;

this will match with the
static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
{

    unsigned long timeo = jiffies;
    int status, state = chip->state;

    if (state == FL_ERASING)
        timeo += (HZ * 400) / 1000;
    else
        timeo += (HZ * 20) / 1000;
[...]
}

Matthieu
