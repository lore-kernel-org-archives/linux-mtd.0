Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MtjAA-0000Ur-3r
	for linux-mtd@lists.infradead.org; Fri, 02 Oct 2009 14:31:18 +0000
Message-ID: <4AC60E9B.8060704@nokia.com>
Date: Fri, 02 Oct 2009 17:30:51 +0300
From: Aaro Koskinen <aaro.koskinen@nokia.com>
MIME-Version: 1.0
To: ext Simon Kagstrom <simon.kagstrom@netinsight.net>
Subject: Re: [PATCH 1/2] mtdoops: do not schedule work if we are going to die
References: <1254410216-24444-1-git-send-email-aaro.koskinen@nokia.com>
	<20091002161837.18a5ac94@marrow.netinsight.se>
In-Reply-To: <20091002161837.18a5ac94@marrow.netinsight.se>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Simon Kagstrom wrote:
> I was working on the same fix :-)
> 
> On Thu,  1 Oct 2009 18:16:55 +0300
> Aaro Koskinen <aaro.koskinen@nokia.com> wrote:
> 
>> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
>> index 1060337..ac67833 100644
>> --- a/drivers/mtd/mtdoops.c
>> +++ b/drivers/mtd/mtdoops.c
>> @@ -335,7 +335,7 @@ static void mtdoops_console_sync(void)
>>  	cxt->ready = 0;
>>  	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
>>  
>> -	if (mtd->panic_write && in_interrupt())
>> +	if (mtd->panic_write && (in_interrupt() || panic_on_oops))
>>  		/* Interrupt context, we're going to panic so try and log */
>>  		mtdoops_write(cxt, 1);
> 
> I believe we'll also need to make this module in-kernel with this
> change, since panic_on_oops is not exported. I've sent another patch
> that does these two things together.

Yes, I think you are right.

> I also get problems when mtd->read is called from mtdoops_inc_counter,
> so my patch also skips this if we have panic_on_oops set (there is also
> no point since the board will hang / be restarted after that).

I think you need to call it, otherwise the ready flag does not get set and
you may loose some messages? Which driver you are using? The second patch
I sent for OMAP addressed this problem, basically the driver should know we
are in oops and rely on very minimal functionality in read/write.

A.
